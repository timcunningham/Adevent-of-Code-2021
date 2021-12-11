component  extends="cf.common"  {
	
	/* Part 1 */
	public function solve(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		var ratesInBinary = buildBinaryBits(inputs);
		var gammaDecimalNumber = convertBinaryToDecimal(ratesInBinary.gammaRate);
		var epsilonDecimalNumber = convertBinaryToDecimal(ratesInBinary.epsilonRate);
		var powerConsumption = epsilonDecimalNumber * gammaDecimalNumber;
		return powerConsumption;
		
	}
	
	public function buildBinaryBits(required array inputs) {
		var ratesInBinary = {"gammaRate":"", "epsilonRate":""};
		cfloop(from=1, to="#len(inputs[1])#", index="index") {
			bitCounts = getBinaryBit(index, arguments.inputs);
			bitCounts = getMostAndLeastCommonBit(bitCounts.zeroCount, bitCounts.oneCount, "gamma");
			ratesInBinary.gammaRate = ratesInBinary.gammaRate & bitCounts.mostCommonBit;
			ratesInBinary.epsilonRate = ratesInBinary.epsilonRate & bitCounts.leastCommonBit;
		}
		return ratesInBinary;
	}
	
	public function getBinaryBit(required numeric columnNumber, required array inputs) {
		 var columnData = getColumnPositionFromDataArray(inputs, arguments.columnNumber);
		 var zeroCount =0;
		 var oneCount = 0;
		 cfloop(from=1, to=arrayLen(columnData), index=i) {
		 	if (columnData[i]==0) {
		 		zeroCount = zeroCount + 1;
		 	}
		 	else {
		 		oneCount = oneCount + 1;
		 	}
		 }
		 return {"zeroCount": zeroCount, "oneCount": oneCount};
	}
	
	public function getMostAndLeastCommonBit(required numeric zeroCount, required oneCount, required string typeOfMeasurement) {
		if (typeOfMeasurement=="gamma" && zeroCount == oneCount) {
			return {"mostCommonBit":1, "leastCommonBit":1};
		} 
		if (typeOfMeasurement=="epsilon" && zeroCount == oneCount) {
			return {"mostCommonBit":0, "leastCommonBit":0};
		}
		if (oneCount > zeroCount) {
			return {"mostCommonBit":1, "leastCommonBit":0};
		}
		else {
			return {"mostCommonBit":0, "leastCommonBit":1};
		}
	}
	
	public function getColumnPositionFromDataArray(required array bits, required numeric position) {
		var positionArray = arrayNew(1);	
		cfloop(from=1, to=arrayLen(bits), index="i") {	
		 	positionData=mid(arguments.bits[i], position, 1);
		 	arrayAppend(positionArray, positionData);
		}
		return positionArray;
	}
	
	public function convertBinaryToDecimal(required string binaryNumber) {
		return inputBaseN(binaryNumber,2);
	}
	
	
	
	/*Part 2*/
	public function solvePart2(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		var oxygenRating = getOxygenRating(inputs);
		var co2Rating = getCORating(inputs);
		return (oxygenRating * co2Rating);
	}
	
	public function getOxygenRating(required array inputs){
		return convertBinaryToDecimal(getRating(arguments.inputs, "gamma")[1]);
	}
	
	public function getCORating(required array inputs){
		return convertBinaryToDecimal(getRating(arguments.inputs, "epsilon")[1]);
	}
	
	private function getRating(required array inputs, required string ratingType) {
		copyOfInputs = duplicate(inputs);
		var bitChoice = "mostCommonBit";
		if (ratingType=="epsilon") {
			bitChoice = "leastCommonBit";
		}
		cfloop(from=1, to="#len(inputs[1])#", index="index") {
			bitCounts = getBinaryBit(index, copyOfInputs);
			bitCounts = getMostAndLeastCommonBit(bitCounts.zeroCount, bitCounts.oneCount, arguments.ratingType);
			copyOfInputs = keepNumbersWithValueAtPosition(copyOfInputs, bitCounts[bitChoice],index);
		}
		return copyOfInputs;
	}
	
	public function keepNumbersWithValueAtPosition(required array inputs, required numeric value, required numeric columnNumber) {
		var keptInputs = arrayNew(1);
		if (arrayLen(inputs)==1) {
			return inputs;
		}

		cfloop(from=1, to=arrayLen(inputs), index="i"){
			if (mid(inputs[i],  columnNumber, 1)==arguments.value) {
				arrayAppend(keptInputs, inputs[i]);
			}
		}
		return keptInputs;
	}
	
	
	
	
	
 	
}