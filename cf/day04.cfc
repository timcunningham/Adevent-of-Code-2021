component  extends="cf.common"  {
	
	/* Part 1 */
	public function solve(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		//writedump(inputs);
		var calledNumbers = getCalledNumbersFromData(inputs, 1);
		//writedump(calledNumbers);
		var boards = getBoardsFromData(inputs);
		//writedump(var=boards, label="boards");
		var winnerScore = getWinners(boards, calledNumbers);
		return winnerScore;
	}
	
	public function getCalledNumbersFromData(required array inputs, required numeric rowNumber) {
		var rowData = arguments.inputs[rowNumber];
		return listToArray(rowData);
	}
	
	public function getBoardsFromData(required array inputs) {
		var boards = [];
		var currentBoard = [];
		cfloop(from=3, to=arrayLen(arguments.inputs), index="row") {
			
			//Last row
			if (row==arrayLen(arguments.inputs)) {
				currentBoard.append(arguments.inputs[row]);
				boards = writeBoard(boards, currentBoard);
				}
			// an array position with and empty space is the start of a new board
			else if (arguments.inputs[row]=="") {
				boards =  writeBoard(boards, currentBoard);
				currentBoard=[];
			}
			else {
				currentBoard.append(arguments.inputs[row]);
				
			}
		}
		return boards;
	}
	
	private function writeBoard(required array boards, required array currentBoard){
		arguments.boards.append(arguments.currentBoard);
		//var verticalVersionofBoard=createVerticalBoard(currentBoard);
		//arguments.boards.append(verticalVersionofBoard);
		return arguments.boards;
	}
	
	public function createVerticalBoard(required array board){
		var verticalBoard =[];
		var currentColumn="";
		
		cfloop(from=1, to=5, index="column"){
			currentColumn="";
			cfloop(from=1, to=5, index="row"){
				colPos = listGetAt(board[row], column, " ");
				currentColumn= listAppend(currentColumn, colPos, " ");
			}
		
			verticalBoard.append(currentColumn);
		}
		
		return verticalBoard;
		
	}
	
	public function getWinners(required array boards, required array calledNumbers) {
		var winners = [];
		var winnersBoardIndex=[];
		
		cfloop(from=1, to=arrayLen(calledNumbers), index="calledNumberIndex") {
			//writedump(calledNumbers[calledNumberIndex]);
			
			
			cfloop(from=1, to=arrayLen(boards), index="boardIndex"){
				//writedump(var=boards[boardIndex], label="board");	
				
				cfloop(from=1, to=arrayLen(boards[boardIndex]), index="rowIndex") {
					thisRow = listToArray(boards[boardIndex][rowIndex], " ");
					//writedump(var=thisRow, label="thisRow");
					foundNumberPosition=arrayFind(thisRow,calledNumbers[calledNumberIndex]);
					if (foundNumberPosition){
						thisRow[foundNumberPosition] = -1;
						boards[boardIndex][rowIndex]=arrayToList(thisRow, " ");
						if (arraySum(thisRow)==-5) {
							winnersBoardIndex.append(boardIndex);
							writedump("winnerslength: #arrayLen(winnersBoardIndex)#");
							winners.append((boards[boardIndex]));
							writedump("Winner");
							writedump(var=boards[boardIndex], label="winning board: #boardIndex#");
							score = getBoardScore(boards[boardIndex],  calledNumbers[calledNumberIndex]);
							return score;
						}
					}
					
					
					
				}
				//end single board
				
			}
			//writedump(var=boards, label="newBoards");
			//end all boards
			//abort;
			
		}
		//end all numbers
		//writedump(winners);
		
	}
	
	public function getBoardScore(required array board, required numeric lastNumberCalled){
		var score =0;
		var row="";
		cfloop(from=1, to=arrayLen(board), index="rowIndex"){
			row = replace(board[rowindex], "-1", "0", "all");
			row = listToArray(row, " ");
			score = score + arraySum(row);
		}
		return (score * lastNumberCalled);
	}
	
	
	
	/*Part 2*/
	public function solvePart2(required string day, required boolean testData){
		var inputs = getInputsAsArray(day, testData);
		return 0;
	}

}
