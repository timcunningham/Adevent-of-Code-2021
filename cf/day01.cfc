component  extends="cf.common"  {
	
	/* Puzzle Day 01 */
	/* Part 1 */
	public function solve(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		return compareEachMeasurement(inputs);
	}
	
	/*Part 2*/
	public function solvePart2(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		inputs = slidingWindow(inputs,3);
		return compareEachMeasurement(inputs);
	}
	
	
	
	private function compareEachMeasurement(required array inputs) {
		var increaseCount = 0;
		cfloop(from=1, to=arrayLen(inputs), index="i") {
			if (i>1) {
				currentMeasurement = inputs[i];
				increaseCount = increaseCount + currentMeasurementIsGreaterThanPrior(currentMeasurement, priorMeasurement);
			}
			priorMeasurement = inputs[i];
		}
		return increaseCount;
		
	}
	
	private function currentMeasurementIsGreaterThanPrior(required numeric currentMeasurement, required numeric priorMeasurement) {
		if (currentMeasurement > priorMeasurement) {
			return 1;
		}
		return 0;
	}
		
	
	function slidingWindow(required array measurements, required numeric numberOfWindows)
	{
		var summedArray = arrayNew(1);	
		for (i = 1; i <= arrayLen(arguments.measurements); i++) {
	    	if (i >= numberOfWindows) {
	   			x = arguments.measurements[i] + arguments.measurements[i-1] + arguments.measurements[i-2];
	   			arrayAppend(summedArray, x); 
	    	}
    
    	}	
    	return summedArray;
	}  
	
 	
}