component extends="tests.common" {
	
	public function tests(required string day){
		var testArray=arrayNew(1);
	
		/*Day 03 - Part 1 */
		testArray=arrayNew(1);
		var answer = solve("03", true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 738234)#  #answer# equals 738234");
		
		/*Day 03 - Part 2*/
		var obj = createObject("component","cf.day03");
		var inputs = obj.getInputsAsArray(day, true);
		
		var ratings = obj.getOxygenRating(inputs);
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #equality(ratings, "23")#  #ratings# equals 23");
		
		var ratings=obj.getCORating(inputs);
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #equality(ratings, "10")#  #ratings# equals 10");
		
		var answer = solvePart2("03", true);
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #equality(answer, "230")#  #answer# equals 230");
		
		return testArray;		
	}
	
}  