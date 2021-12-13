component extends="tests.common" {
	
	public function tests(required string day){
		var testArray=arrayNew(1);
	
		/*Day 04 - Part 1 */
		testArray=arrayNew(1);
		var answer = solve("04", true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 4512)#  #answer# equals 4512");
		
		/*Day 04 - Part 2*/
		
		
		return testArray;		
	}
	
}  