<cfscript>
	obj = createObject("component", "tests.day01");
	day01 = obj.tests("01");
	writedump(var=day01, label="day01");	
	
	obj = createObject("component", "tests.day02");
	day02 = obj.tests("02");
	writedump(var=day02, label="day02");	

	obj = createObject("component", "tests.day03");
	day03 = obj.tests("03");
	writedump(var=day03, label="day03");	
	
	obj = createObject("component", "tests.day04");
	day04 = obj.tests("04");
	writedump(var=day04, label="day04");	
	
</cfscript>


<cfscript>

</cfscript>