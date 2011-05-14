<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


<cfquery name="getUsedMakes" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Make, Year=CarYear
 from ChromeUsedMake
 order by Make,CarYear
</cfquery>


<cfquery name="getMakes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Make=DivisionName,Year=ModelYear 
from ChromeNewMakes A, ChromeNewModels B
where A.DivisionID=B.DivisionID
order by DivisionName,ModelYear
</cfquery>

<cffile action="WRITE" file="G:\CFUSION\CustomTags\JSIncludeWr.cfm" 
output='
<script language="javascript">
<!-- Hide from non JS browsers
var UsedVehicles = new Array();
var UsedTrims = new Array();
// -->
</script>

<cfif not IsDefined("attributes.no_year")>
<script language="javascript">

' addnewline="No">
<cfset MakeCount=0>
<cfloop query="getUsedMakes">
<cfset MyMake=getUsedMakes.Make>
<cfset MyYear=getUsedMakes.Year>
<cfquery name="getUsedModels" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Model, ModelID 
from ChromeUsedModel where MakeID
in (SELECT MakeID from ChromeUsedMake 
where Make='#MyMake#'
and CarYear=#MyYear#)
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output='
UsedVehicles[#MakeCount#]=new Array();
UsedTrims[#MakeCount#]=new Array();
' addnewline="No">

<cfset MyCount=0>
<cfloop query="getUsedModels">
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="
UsedVehicles[#MakeCount#][#MyCount#]='#Replace(Model,"'","`","ALL")#';
" addnewline="No">
<cfset MyModel=Model>
<cfset MyModelID=ModelID>
<cfquery name="getTrims" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT StyleName from ChromeNewStyles
where ModelID=#MyModelID#
order by StyleName
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="UsedTrims[#MakeCount#][#MyCount#]=new Array();
" addnewline="No">
<cfset MyTrimCount=0>
<cfloop query="getTrims">
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="UsedTrims[#MakeCount#][#MyCount#][#MyTrimCount#]='#Replace(StyleName,"'","`","ALL")#';
" addnewline="No">
<cfset MyTrimCount=MyTrimCount+1>
</cfloop>
<cfset MyCount=MyCount+1>
</cfloop>
<cfset MakeCount=MakeCount+1>
</cfloop>

<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="
// Stop Hiding -->
</script>
</cfif>
" addnewline="Yes">



<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output='
<script language="javascript">
<!-- Hide from non JS browsers
var Vehicles = new Array();
var Trims = new Array();
//-->
</script>

<cfif not IsDefined("attributes.no_year")>
<script language="javascript">

' addnewline="No">

<cfset MakeCount=0>
<cfloop query="getMakes">
<cfset MyMake=getMakes.Make>
<cfset MyYear=getMakes.Year>
<cfquery name="getModels" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Model=ModelName, ModelID 
from ChromeNewModels where DivisionID 
in (SELECT DivisionID from ChromeNewMakes where DivisionName='#MyMake#'
and ModelYear=#MyYear#)
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output='
Vehicles[#MakeCount#]=new Array();
Trims[#MakeCount#]=new Array();
' addnewline="No">

<cfset MyCount=0>
<cfloop query="getModels">
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="
Vehicles[#MakeCount#][#MyCount#]='#Replace(Model,"'","`","ALL")#';
" addnewline="No">
<cfset MyModel=Model>
<cfset MyModelID=ModelID>
<cfquery name="getTrims" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT StyleName from ChromeNewStyles
where ModelID=#MyModelID#
order by StyleName
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="Trims[#MakeCount#][#MyCount#]=new Array();
" addnewline="No">
<cfset MyTrimCount=0>
<cfloop query="getTrims">
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="Trims[#MakeCount#][#MyCount#][#MyTrimCount#]='#Replace(StyleName,"'","`","ALL")#';
" addnewline="No">
<cfset MyTrimCount=MyTrimCount+1>
</cfloop>
<cfset MyCount=MyCount+1>
</cfloop>
<cfset MakeCount=MakeCount+1>
</cfloop>

<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="
// Stop Hiding -->
</script>
</cfif>
" addnewline="Yes">

<cfquery name="getNoYearMakes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Make=DivisionName
from ChromeNewMakes A, ChromeNewModels B
where A.DivisionID=B.DivisionID
order by DivisionName
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="<cfif isDefined('attributes.no_year')>
<script language='javascript'>
<!-- Hide from non JS browsers
" addnewline="No">

<cfset MakeCount=0>
<cfloop query="getNoYearMakes">
<cfset MyMake=getNoYearMakes.Make>
<cfquery name="getModels" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Model=ModelName, ModelID 
from ChromeNewModels A where DivisionID in 
(SELECT DivisionID from ChromeNewMakes where DivisionName='#MyMake#')
and ModelID=(SELECT Min(ModelID) from ChromeNewModels B
			where DivisionID in 
			(SELECT DivisionID from ChromeNewMakes where DivisionName='#MyMake#')
			and A.ModelName=B.ModelName)
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output='
Vehicles[#MakeCount#]=new Array();
Trims[#MakeCount#]=new Array();
' addnewline="No">

<cfset MyCount=0>
<cfloop query="getModels">
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="
Vehicles[#MakeCount#][#MyCount#]='#Replace(Model,"'","`","ALL")#';
" addnewline="No">
<cfset MyModel=Model>
<cfset MyModelID=ModelID>
<cfquery name="getTrims" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT StyleName from ChromeNewStyles
where ModelID=#MyModelID#
order by StyleName
</cfquery>
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="Trims[#MakeCount#][#MyCount#]=new Array();
" addnewline="No">
<cfset MyTrimCount=0>
<cfloop query="getTrims">
<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="Trims[#MakeCount#][#MyCount#][#MyTrimCount#]='#Replace(StyleName,"'","`","ALL")#';
" addnewline="No">
<cfset MyTrimCount=MyTrimCount+1>
</cfloop>
<cfset MyCount=MyCount+1>
</cfloop>
<cfset MakeCount=MakeCount+1>
</cfloop>

<cffile action="APPEND" file="g:\CFUSION\CustomTags\JSIncludeWr.cfm"
output="
// Stop Hiding -->
</script>
</cfif>
" addnewline="Yes">




</body>
</html>
