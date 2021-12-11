component extends="tests.common" {
	
	public function tests(required string day){
		var testArray=arrayNew(1);
		/* Day 02 - Part 1 */
		var answer = solve(arguments.day, true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 150)#  #answer# equals 150");
		
		
		/*Day 02 - Part 2 */
		
		answer = solvePart2(arguments.day, true);
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #equality(answer, 900)# #answer# equals 900");
		
		
		return testArray;		
	}
	
}  