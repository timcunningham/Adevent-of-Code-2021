component extends="tests.common" {
	
	public function tests(required string day){
		var testArray=arrayNew(1);
		/* Day 01 - Part 1 */
		var answer = solve(arguments.day, true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 7)# equals 7");
		
		
		/*Day 01 - Part 2 */
		
		answer = solvePart2(arguments.day, true);
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #equality(answer, 5)# #answer# equals 5");
		
		
		
		//var answer = solve(arguments.day, false);	
		//arrayAppend(testArray, "#isNumber(answer)# isNumeric");
		//arrayAppend(testArray, "#equality(answer, 1715)# equals 1715");
		return testArray;		
	}
	
}  