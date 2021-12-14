component  {
	CRLF = chr(13) & chr(10);
	
 	function getInputsAsArray(required string day, required boolean testData){
 		var fileData = arrayNew(1);
 		var filePath = getInputPathFromDay(day, testData);
 		cfloop(file=filePath, index="i", charSet="UTF-8") {
 			arrayAppend(fileData,  i);
 		}
 		return fileData;
 	}
 	
 	function readFile(required string day) {
 		var fullFilePath=getInputPathFromDay(day);
 		return fileRead(fullFilePath);
 	}
 	
 	function getInputPathFromDay(required string day, required boolean testData) {
 		if (testData) {
 			return "C:\Domains\AdventOfCode2021\inputs\testInput" & day & ".txt"; 
 		}
 		return "C:\Domains\AdventOfCode2021\inputs\input" & day & ".txt"; 
 	}
 	
 	private function smallest(required numeric number1, required numeric number2) {
		if (number1 <= number2){
			return number1;
		}
		return number2;
	}
	
	private function largest(required numeric number1, required numeric number2) {
		if (number1 >= number2){
			return number1;
		}
		return number2;
	}
}