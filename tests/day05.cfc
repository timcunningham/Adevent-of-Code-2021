component extends="tests.common" {
	
	public function tests(required string day){
		var testArray=arrayNew(1);
	
		/*Day 05 - Part 1 */
		var testArray=arrayNew(1);
		var answer = solve("05", true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 5)#  #answer# equals 5");
		
		var answer = solvePart2("05", true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 12)#  #answer# equals 12");
	
	
		return testArray;		
	}
	
}  