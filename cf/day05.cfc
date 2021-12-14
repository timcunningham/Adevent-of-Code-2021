component  extends="cf.common"  {
	
	/* Part 1 */
	public function solve(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		if (testData){
		var matrix = buildEmptyMatrix(9,9);
		}
		else {
			var matrix = buildEmptyMatrix(1000,1000);
		}
		var coordinateSets  = getCoordinates(inputs);
		var populatedMatrix = populateMatrix(matrix, coordinateSets,false);
		if (testData) {
			visualizeMatrix(populatedMatrix);
		}
		var score = getScore(populatedMatrix, 2);
		return score;
		
	}
	
	public function getScore(required array matrix, required numeric dangerLevel){
		var counter = 0;
		cfloop(from=1, to=arrayLen(arguments.matrix), index="i") {
			cfloop(from=1, to=arrayLen(arguments.matrix[i]), index="z") {
				if (arguments.matrix[i][z] >= arguments.dangerLevel) {
				
					counter = counter+1;
				}
			}
		}
		return counter;
	}
	
	public function buildEmptyMatrix(required numeric maxX, required numeric maxY){
		maxX = maxX+ 1;
		maxY = maxY + 1;
		blankArray = arrayNew(2);
		cfloop (from=1, to=maxX, index=x) {
			cfloop(from=1, to=maxY, index=y){
				blankArray[x][y] = 0;
			}
		}
		return blankArray;
	}
	public function getCoordinates(required array inputs) {
		var coordinateSets =[];
		var set1 = {};
		var set2 = {};
		
		for(line in inputs) {
			set1 = getCoordinateSetOne(line);
			set2 =  getCoordinateSetTwo(line);	
			arrayAppend(coordinateSets, {"x1": set1.x1, "y1": set1.y1, "x2":set2.x2, "y2": set2.y2} );
		}
		return coordinateSets;
	}
	
	public function visualizeMatrix(required array matrix) {
		cfloop (from=1, to=arrayLen(matrix), index=y) {
			cfloop(from=1, to=arrayLen(matrix), index=x){
				writeoutput("#matrix[x][y]# ");
			}
			writeoutput("<br>");	
		}
		writeoutput("<br><br>");
		
	}
	
	public function getCoordinateSetOne(required string coordinateSet) {
		var coordinateSetOne = listFirst(coordinateSet, " ->");
		coordinateSetOne = {"x1": listFirst(coordinateSetOne), "y1": listLast(coordinateSetOne)};
		return coordinateSetOne;
	}
	
	public function getCoordinateSetTwo(required string coordinateSet) {
		var coordinateSetTwo = listLast(coordinateSet, " ->");
		coordinateSetTwo = {"x2": listFirst(coordinateSetTwo), "y2": listLast(coordinateSetTwo)};
		return coordinateSetTwo;
	}
	
	public function populateMatrix(required array matrix, required array coordinateSets, required boolean checkDiagonals) {
		for (i = 1; i <= arrayLen(coordinateSets); i++) {
			x1 = coordinateSets[i]["x1"] +1;
			y1 = coordinateSets[i]["y1"] +1;
			x2 = coordinateSets[i]["x2"] +1;
    		y2 = coordinateSets[i]["y2"] +1;
    		
    		if (y1==y2) {
    			//horizontal line
    			maxTo = largest(x1,x2);
				cfloop(from=smallest(x1,x2), to=maxTo, index="x") {
					matrix[x][y1] = matrix[x][y1] + 1;
				}
			}
			
			else if (x1==x2){
				//vertical line
				maxTo = largest(y1,y2);
				cfloop(from=smallest(y1,y2), to=maxto, index=y ) {
					matrix[x1][y] = matrix[x1][y] + 1;
				}
			}
			else if (arguments.checkDiagonals) {
				//diagonal line
				maxTo = abs(x1 - x2 );
				cfloop(from=1, to=maxTo+1, index="z") {
					matrix[x1][y1] = matrix[x1][y1] + 1;
					if (x2>x1) {
						x1=x1+1;
					}
					else {
						x1=x1-1;
					}
					
					if (y2>y1){
						y1=y1+1;
					}
					else  {
						y1=y1-1;
					}			
		
				}
				
				
			}
			
			
		}
		return matrix;
	}
	
	private function getStepDirection(required numeric position1, required numeric position2){
		if (position1 > position2) {
			return -1;
		}
		return 1;
	}
	
	/*Part 2*/
	public function solvePart2(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		if (testData){
		var matrix = buildEmptyMatrix(9,9);
		}
		else {
			var matrix = buildEmptyMatrix(1000,1000);
		}
		var coordinateSets  = getCoordinates(inputs);
		var populatedMatrix = populateMatrix(matrix, coordinateSets,true);
		if (testData) {
			visualizeMatrix(populatedMatrix);
		}
		var score = getScore(populatedMatrix, 2);
		return score;
	}
	
	
	
	
	
	
	
 	
}