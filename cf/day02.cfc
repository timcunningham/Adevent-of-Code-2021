component  extends="cf.common"  {
	
	/* Part 1 */
	public function solve(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		var position = parsePosition(inputs=inputs,useAim=false);
		var returnData = position.horizontal * position.vertical;
		return returnData;
	}
	
	/*Part 2*/
	public function solvePart2(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		var position = parsePosition(inputs=inputs,useAim=true);
		var returnData = position.horizontal * position.vertical;
		return returnData;
	}
	
	private function parsePosition(required array inputs, required boolean useAim) {
		var position = {"horizontal": 0, "vertical": 0, "aim":0};
		var veritcalPosition = 0;
		cfloop(from=1, to=arrayLen(inputs), index="i") {	
			direction = listFirst(inputs[i], " ");
			distance = listLast(inputs[i], " ");
			position = updatePositions(direction, distance, position, useAim);
		}
		return position;
	}
	
	private function  updatePositions(required string direction, required numeric distance, required struct positions, required boolean useAim) {
		if (arguments.direction=="forward") {
			positions.horizontal = positions.horizontal + distance;
			if (useAim) {
				positions.vertical = positions.vertical + calculateForwardAim(positions.vertical, positions.aim,  distance, useAim);
			}
		}
		else if (direction=="down") {
			positions.vertical = calculateVerticalDistance(positions.vertical, distance, useAim, direction);
			positions.aim = positions.aim + distance;
		}
		else if (direction=="up") {
			positions.vertical = calculateVerticalDistance(positions.vertical, distance, useAim, direction);
			positions.aim = positions.aim - distance;
		}
		return positions;
	}
	
	private function calculateVerticalDistance(required numeric vertical, required numeric distance, required useAim, required direction) {
		if (useAim){
			return vertical;
		}
		if (direction=="down") {
			return (vertical + distance);
		}
		if (direction=="up") {
			return (vertical - distance);
		}
	}
	
	private function calculateForwardAim(required numeric vertical, required numeric aim, required numeric distance, required boolean useAim) {;
		if (!useAim){
			return distance;
		}
		distanceWithAim = distance * aim;
		return distanceWithAim;
	}
	
	
	
	
 	
}