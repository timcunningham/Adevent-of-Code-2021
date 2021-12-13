
<cfscript>
	param name="day" default="01";
	writeoutput("<br>Day #day#-1 Answer: #solve(day, false)#");
	writeoutput("<br>Day #day#-2 Answer: #solvePart2(day, false)#");
	
	day=02;
	writeoutput("<br>Day #day#-1 Answer: #solve(day, false)#");
	writeoutput("<br>Day #day#-2 Answer: #solvePart2(day, false)#");
	
	
	day="03";
	writeoutput("<br>Day #day#-1 Answer: #solve(day, false)#");
	writeoutput("<br>Day #day#-2 Answer: #solvePart2(day, false)#");
	
	day="04";
	writeoutput("<br>Day #day#-1 Answer: #solve(day, false)#");
	writeoutput("<br>Day #day#-2 Answer: #solvePart2(day, false)#");
	
	day="05";
	writeoutput("<br>Day #day#-1 Answer: #solve(day, false)#");
	writeoutput("<br>Day #day#-2 Answer: #solvePart2(day, false)#");
	
	
	function solve(required string day) {
		obj = createObject("component","cf.day#arguments.day#");
		return obj.solve(arguments.day, false);
	}
	
	function solvePart2(required string day) {
		obj = createObject("component","cf.day#arguments.day#");
		return obj.solvePart2(arguments.day, false);
	}
</cfscript>


