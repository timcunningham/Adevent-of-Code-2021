component extends="tests.common" {
	
	public function tests(required string day){
		var testArray=arrayNew(1);
		/* Day 02 - Part 1 */
		var answer = solve(arguments.day, true);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(answer, 150)#  #answer# equals 150");
		
		
		/*Day 02 - Part 2 */
		testArray=arrayNew(1);
		answer = solvePart2(arguments.day, true);
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #isNumber(answer)# isNumeric");
		arrayAppend(testArray, "Day #arguments.day# Part 2 Test: #equality(answer, 0)# #answer# equals 900");
		
		/*Day 03 - Part 1 */
		testArray=arrayNew(1);
		var obj = createObject("component", "cf.day03");
		testData = obj.getInputsAsArray("03", true);
		columnData = obj.getColumnPositionFromDataArray(testData, 1);
		arrayCount = obj.arrayCount(columnData);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(arrayCount.ones, 7)# #arrayCount.ones# equals 7");
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(arrayCount.zeros, 5)# #arrayCount.zeros# equals 5");
		gammaRate1 = obj.getGammaRate(arrayCount.zeros, arraycount.ones);
		epsilonRate1 = obj.getEpsilonRate(arrayCount.zeros, arraycount.ones);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(gammaRate1, 1)# #gammaRate1# equals 1");
		
		columnData = obj.getColumnPositionFromDataArray(testData, 2);
		arrayCount = obj.arrayCount(columnData);
		gammaRate2 = obj.getGammaRate(arrayCount.zeros, arraycount.ones);
		epsilonRate2 = obj.getEpsilonRate(arrayCount.zeros, arraycount.ones);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(gammaRate2, 0)# #gammaRate2# equals 0");
		
		columnData = obj.getColumnPositionFromDataArray(testData, 3);
		arrayCount = obj.arrayCount(columnData);
		gammaRate3 = obj.getGammaRate(arrayCount.zeros, arraycount.ones);
		epsilonRate3 = obj.getEpsilonRate(arrayCount.zeros, arraycount.ones);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(gammaRate3, 1)# #gammaRate3# equals 1");
		
		columnData = obj.getColumnPositionFromDataArray(testData, 4);
		arrayCount = obj.arrayCount(columnData);
		gammaRate4 = obj.getGammaRate(arrayCount.zeros, arraycount.ones);
		epsilonRate4 = obj.getEpsilonRate(arrayCount.zeros, arraycount.ones);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(gammaRate4, 1)# #gammaRate4# equals 1");
		
		columnData = obj.getColumnPositionFromDataArray(testData, 5);
		arrayCount = obj.arrayCount(columnData);
		gammaRate5 = obj.getGammaRate(arrayCount.zeros, arraycount.ones);
		epsilonRate5 = obj.getEpsilonRate(arrayCount.zeros, arraycount.ones);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(gammaRate5, 0)# #gammaRate5# equals 0");
		
		gammaBinaryNumber = "#gammaRate1##gammaRate2##gammaRate3##gammaRate4##gammaRate5#";
		gammaDecimalNumber = obj.convertBinaryToDecimal(gammaBinaryNumber);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(gammaDecimalNumber, 22)# #gammaDecimalNumber# equals 22");
		
		epsilonBinaryNumber = "#epsilonRate1##epsilonRate2##epsilonRate3##epsilonRate4##epsilonRate5#";
		epsilonDecimalNumber = obj.convertBinaryToDecimal(epsilonBinaryNumber);
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(epsilonDecimalNumber, 9)# #epsilonDecimalNumber# equals 9");
		
		powerConsumption = epsilonDecimalNumber * gammaDecimalNumber;
		arrayAppend(testArray, "Day #arguments.day# Part 1 Test: #equality(powerConsumption, 198)# #powerConsumption# equals 198");
		
		
		//writedump(arrayCount);
		
		return testArray;		
	}
	
}  