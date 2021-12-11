component {
	
	public function solve(required string day, required boolean testData) {
		var obj = createObject("component","cf.day#arguments.day#");
		var result = obj.solve(day,testData);
		return result;
	}
	
	public function solvePart2(required string day, required boolean testData) {
		var obj = createObject("component","cf.day#arguments.day#");
		var result = obj.solvePart2(day,testData);
		return result;
	}
	

	public function isNumber(required answer){
		if (isNumeric(arguments.answer)) {
			return true;
		}
		return false;
	}	
	public function equality(required numeric answer, required numeric expectedAnswer) {
		if (answer==expectedAnswer){
			return true;
		}
		return false;
	} 
}