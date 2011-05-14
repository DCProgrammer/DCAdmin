<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<CFQUERY NAME="getRebates" DATASOURCE="DigitalCars_DB">
SELECT YR,MAKE,MODEL,LIMITS,COMM1,COMM2,EFFECTIVE from RBTSNEW
</CFQUERY>
<HTML>
<HEAD>
	<TITLE>Untitled</TITLE>
</HEAD>

<BODY>
<cfquery name="clearRebates" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
DELETE FROM NewRebates
</cfquery>

<cfloop query="getRebates">
<cfquery name="insertRebate" datasource="MainSQL" username="sa" password="SouthPark"> 
INSERT INTO NewRebates (Year,Make,Model,ModelDescription,LimitsDescription,Description1,Description2,EffectiveDate)
values
(#YR#,'#MAKE#','#MODEL#','#MODEL#','#LIMITS#','#COMM1#','#COMM2#','#EFFECTIVE#')
</cfquery>
</cfloop>


</BODY>
</HTML>
