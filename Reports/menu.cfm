<!---
DESCRIPTION:

ENTERING
EXITING:

DEPENDENCIES:
EXPECTING:

MODIFICATION HISTORY
DATE		MODIFIER		MODIFICATION
*******************************************************************

--->

<cfquery name="getStates" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT State from DCDealers order by State
</cfquery>

<html>
<head>
	<title>Untitled</title>
</head>

<body>
 <table>
<tr>
<td valign=center></td>
<td><form method=post action="YesterdaysActivity.cfm" target="MAIN"><input type=hidden name="Show" value="Members">
<input type=submit value="NEW MBRS">
<select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<td valign=center></td>
<td><form method=post action="YesterdaysActivity.cfm" target="MAIN"><input type=hidden name="Show" value="GoodLeads">
<input type=submit value="DLR LEADS">
<select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<td valign=center></td>
<td><form action="YesterdaysActivity.cfm" method="POST" target="MAIN"><input type=hidden name="Show" value="BadLeads">
<input type=submit value="NO DLR">
<select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<td valign=center></td>
<td><form action="YesterdaysActivity.cfm" method="POST" target="MAIN"><input type=hidden name="Show" value="Dealers">
<input type=submit value="DLR GROUP"><select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<cfquery name="getReps" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT SalesRep from DCDealers
where Status='A'
order by SalesRep

</cfquery>
<cfif not IsDefined("Session.Rep")>
<cfset Session.Rep="">
</cfif>
<td valign=center></td>
<td><form action="SetRep.cfm" method=post>
<input type=submit value="SET REP"><select name="Rep">
<option value="" <cfif Session.Rep is "">selected</cfif>>All</option>
<cfoutput query="getReps">
<option value="#SalesRep#" <cfif Session.Rep is SalesRep>selected</cfif>>#SalesRep#</option>
</cfoutput>
</select>
</form></td>
</tr>
<!---
<tr>
<td valign=center></td>
<td>
<form action="WSWYesterdaysActivity.cfm" method="POST" target="MAIN">
<input type=hidden name="Show" value="Members">
<input type=submit value="WSW Member Signups">
<select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<td valign=center></td>
<td><form method=post action="WSWYesterdaysActivity.cfm" target="MAIN"><input type=hidden name="Show" value="GoodLeads">
<input type=submit value="WSW Dealer Found">
<select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<td valign=center></td>
<td><form action="WSWYesterdaysActivity.cfm" method="POST" target="MAIN"><input type=hidden name="Show" value="BadLeads">
<input type=submit value="WSW Not Found">
<select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
<tr>
<td valign=center></td>
<td><form action="WSWYesterdaysActivity.cfm" method="POST" target="MAIN"><input type=hidden name="Show" value="Dealers">
<input type=submit value="WSW Dealer To Member"><select name=State>
<option value="" selected>All</option>
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
</form></td>
</tr>
--->


</table>


</body>
</html>
