component  extends="cf.common"  {
	
	/* Part 1 */
	public function solve(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		var column1 = getColumnPositionFromDataArray(inputs, 1);
		var column2 = getColumnPositionFromDataArray(inputs, 2);
		var column3 = getColumnPositionFromDataArray(inputs, 3);
		var column4 = getColumnPositionFromDataArray(inputs, 4);
		var column5 = getColumnPositionFromDataArray(inputs, 5);
		
		var arrayCount1 = arrayCount(column1);
		writedump(arrayCount1);
		var arrayCount2 = arrayCount(column2);
	writedump(arrayCount2);
		var arrayCount3 = arrayCount(column3);
		writedump(arrayCount3);
		var arrayCount4 = arrayCount(column4);
		writedump(arrayCount4);
		var arrayCount5 = arrayCount(column5);
		writedump(arrayCount5);
		
		var gammaRate1 = getGammaRate(arrayCount1.zeros, arraycount1.ones);
		var epsilonRate1 = getEpsilonRate(arrayCount1.zeros, arraycount1.ones);
		
		var gammaRate2 = getGammaRate(arrayCount2.zeros, arraycount2.ones);
		var epsilonRate2 = getEpsilonRate(arrayCount2.zeros, arraycount2.ones);
		
		var gammaRate3 = getGammaRate(arrayCount3.zeros, arraycount3.ones);
		var epsilonRate3 = getEpsilonRate(arrayCount3.zeros, arraycount3.ones);
		
		var gammaRate4 = getGammaRate(arrayCount4.zeros, arraycount4.ones);
		var epsilonRate4 = getEpsilonRate(arrayCount4.zeros, arraycount4.ones);
		
		var gammaRate5 = getGammaRate(arrayCount5.zeros, arraycount5.ones);
		var epsilonRate5 = getEpsilonRate(arrayCount5.zeros, arraycount5.ones);
		
		var gammaBinaryNumber = "#gammaRate1##gammaRate2##gammaRate3##gammaRate4##gammaRate5#";
		writedump("gammaBinaryNumber: #gammaBinaryNumber#");
		var gammaDecimalNumber = convertBinaryToDecimal(gammaBinaryNumber);
		writedump("gammaDecimalNumber: #gammaDecimalNumber#");
		
		var epsilonBinaryNumber = "#epsilonRate1##epsilonRate2##epsilonRate3##epsilonRate4##epsilonRate5#";
		writedump("epsilonBinaryNumber: #epsilonBinaryNumber#");
		var epsilonDecimalNumber = convertBinaryToDecimal(epsilonBinaryNumber);
		writedump("epsilonDecimalNumber: #epsilonDecimalNumber#");
		
	
		var powerConsumption = epsilonDecimalNumber * gammaDecimalNumber;
		return powerConsumption;
	}
	
	/*Part 2*/
	public function solvePart2(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		return 0;
	}
	
	public function getColumnPositionFromDataArray(required array bits, required numeric position) {
		var positionArray = arrayNew(1);	
		cfloop(from=1, to=arrayLen(bits), index="i") {	
		 	positionData=mid(arguments.bits[i], position, 1);
		 	arrayAppend(positionArray, positionData);
		}
		return positionArray;
	}
	
	public function arrayCount(required array columnArray) {
		var columnData = {"zeros" : 0, "ones": 0};

		arrayEach(columnArray, function(element,index) {
			if (element==0){
				columnData["zeros"] = columnData.zeros + 1;
			}
			else {
				columnData["ones"] = columnData.ones + 1;
			}
		});
		return columnData;		
	}
	
	public function getGammaRate(required numeric zeroCount, required numeric oneCount) {
		if (zeroCount > oneCount ) {
			return 0;
		}
		else if (oneCount > zeroCount) {
			return 1;
		}
		else if (zeroCount == oneCount) {
			writedump("ERRR");
			abort;
			return 1;
		}
		return;
	}
	
	public function getEpsilonRate(required numeric zeroCount, required numeric oneCount) {
		if (zeroCount < oneCount ) {
			return 0;
		}
		else if (oneCount < zeroCount) {
			return 1;
		}
		else if (zeroCount == oneCount) {
			return 1;
		}
		return;
	}
	
	public function convertBinaryToDecimal(required string binaryNumber) {
		return inputBaseN(binaryNumber,2);
	}
	
	public function spaceBetweenEach(required string data) {
		arguments.data = toString(arguments.data);
	  	var characters = arguments.data.getBytes();
	  	var character = "";
	  	var returns = "";
	  	for (i=1; i<=arrayLen(characters);i++) {
	  		returns = returns & "<s>" & chr(characters[i]) & "</s>";
	  	}
	  	return returns;
  }
	
	
 	
}