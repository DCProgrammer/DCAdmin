<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>To Do List Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif not isDefined("Session.Person")>
<cfset Session.Person="ALL">
</cfif>

<cfquery name="getTasks" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT ID, Name,Person, Description, creation_date, completion_date ,Priority from toDoList
where completion_date is NULL
<cfif Session.Person is not "ALL">
and Person="#Session.Person#"
</cfif>
order by Priority DESC
</cfquery>

<cfquery name="getTasksCompleted" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT ID, Name, Person, Description, creation_date, completion_date ,Priority from toDoList
where completion_date is not NULL
<cfif Session.Person is not "ALL">
and Person="#Session.Person#"
</cfif>
order by Priority DESC
</cfquery>

<cfquery name="getPeople" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT PersonName from toDoPeople
</cfquery>

<form method=post action="toDoListAction.cfm">
<input type=hidden name="setPerson">
Show tasks for: <select name="person" onChange="javascript:submit()">
<option value="All" <cfif Session.Person is "All">selected</cfif>>All</option>
<cfoutput query="getPeople">
<option value="#personName#" <cfif Session.Person is personName>selected</cfif>>#PersonName#</option>
</cfoutput>
</select>
</form>

<table border="1">
<tr><td>Priority</td><td>For</td><td>Name and Description</td><td>Creation and Completion Date</td><td>Time Logged</td><td>Manage</td></tr>
<cfif getTasks.recordCount+getTasksCompleted.recordCount is 0><tr><td colspan=5>No tasks found</td></tr></cfif>
<cfloop query="getTasks">
<cfquery name="getTaskTimes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Begin_time, end_time, hours=(datediff(mi,Begin_time,IsNull(End_time,getdate()))/60),
minutes=datediff(mi,Begin_time,IsNull(End_time,getdate()))-((datediff(mi,Begin_time,IsNull(End_time,getdate()))/60)*60)
 from toDoTimes where ID=#ID#
</cfquery>
<cfset hoursLogged=0>
<cfset minutesLogged=0>
<cfset andCounting=0>
<cfset rowcolor="##FFFFFF">
<cfif getTaskTimes.recordCount gt 0>
<cfloop query="getTaskTimes">
	<cfset hoursLogged=hoursLogged+hours>
	<cfset minutesLogged=minutesLogged+minutes>
<cfif end_time is "">
	<cfset andCounting=1>
	<cfset rowcolor="##FFDDFF">
</cfif>
</cfloop>
<cfloop condition="minutesLogged gte 60">
<cfset minutesLogged=minutesLogged-60>
<cfset hoursLogged=hoursLogged+1>
</cfloop>
</cfif>
<cfoutput>
<tr><td rowspan="2" bgcolor="#rowcolor#">
<a href="toDoListAction.cfm?ID=#ID#&raisePri=1"><img src="buttons/up_arrow.gif"></a>
<br>#Priority#<br>
<a href="toDoListAction.cfm?ID=#ID#&lowerPri=1"><img src="buttons/down_arrow.gif"></a>
</td>
<td bgcolor="#rowcolor#" rowspan=2>#Person#</td>
<td bgcolor="#rowcolor#"><b><a href="toDoDetails.cfm?ID=#ID#">#Name#</a></b></td>
<td bgcolor="#rowcolor#">Created: #creation_date#</td>
<td rowspan=2 bgcolor="#rowcolor#">#hourslogged#h #NumberFormat(minuteslogged,"00")#m 
<cfif andCounting is 1>AND COUNTING</cfif></td>
<td rowspan=2 bgcolor="#rowcolor#">
<cfif completion_date is "">
<cfif andCounting is 0>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="start">
<input type=hidden name="ID" value="#ID#">
<input type=submit value="Start working">
</form>
<cfelse>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="stop">
<input type=hidden name="ID" value="#ID#">
<input type=submit value="Stop working">
</form>
</cfif>
</cfif>
<cfif completion_date is "" and andCounting is 0>
<br>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="close">
<input type=hidden name="ID" value="#ID#">
<input type=submit value="Close Task">
</form>
</cfif>
</td></tr>
<tr><td bgcolor="#rowcolor#">#Description#</td><td bgcolor="#rowcolor#">&nbsp;<cfif completion_date is not "">Completed: #completion_date#<cfelse>IN PROGRESS</cfif></td></tr>
</cfoutput>
</cfloop>
<cfloop query="getTasksCompleted">
<cfquery name="getTaskTimes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Begin_time, end_time, hours=(datediff(mi,Begin_time,IsNull(End_time,getdate()))/60),
minutes=datediff(mi,Begin_time,IsNull(End_time,getdate()))-((datediff(mi,Begin_time,IsNull(End_time,getdate()))/60)*60)
 from toDoTimes where ID=#ID#
</cfquery>
<cfset hoursLogged=0>
<cfset minutesLogged=0>
<cfset andCounting=0>
<cfset rowcolor="##FFFFFF">
<cfif getTaskTimes.recordCount gt 0>
<cfloop query="getTaskTimes">
	<cfset hoursLogged=hoursLogged+hours>
	<cfset minutesLogged=minutesLogged+minutes>
<cfif end_time is "">
	<cfset andCounting=1>
	<cfset rowcolor="##FFDDFF">
</cfif>
</cfloop>
<cfloop condition="minutesLogged gte 60">
<cfset minutesLogged=minutesLogged-60>
<cfset hoursLogged=hoursLogged+1>
</cfloop>
</cfif>
<cfoutput>
<tr><td rowspan="2" bgcolor="#rowcolor#">
<a href="toDoListAction.cfm?ID=#ID#&raisePri=1"><img src="buttons/up_arrow.gif"></a>
<br>#Priority#<br>
<a href="toDoListAction.cfm?ID=#ID#&lowerPri=1"><img src="buttons/down_arrow.gif"></a>
</td>
<td bgcolor="#rowcolor#" rowspan=2>#Person#</td>
<td bgcolor="#rowcolor#"><b><a href="toDoDetails.cfm?ID=#ID#">#Name#</a></b></td>
<td bgcolor="#rowcolor#">Created: #creation_date#</td>
<td rowspan=2 bgcolor="#rowcolor#">#hourslogged#h #NumberFormat(minuteslogged,"00")#m 
<cfif andCounting is 1>AND COUNTING</cfif></td>
<td rowspan=2 bgcolor="#rowcolor#">
<cfif completion_date is "">
<cfif andCounting is 0>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="start">
<input type=hidden name="ID" value="#ID#">
<input type=submit value="Start working">
</form>
<cfelse>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="stop">
<input type=hidden name="ID" value="#ID#">
<input type=submit value="Stop working">
</form>
</cfif>
</cfif>
<cfif completion_date is "" and andCounting is 0>
<br>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="close">
<input type=hidden name="ID" value="#ID#">
<input type=submit value="Close Task">
</form>
</cfif>
</td></tr>
<tr><td bgcolor="#rowcolor#">#Description#</td><td bgcolor="#rowcolor#">&nbsp;<cfif completion_date is not "">Completed: #completion_date#<cfelse>IN PROGRESS</cfif></td></tr>
</cfoutput>
</cfloop>
</table>
<form method=post action="toDoListAction.cfm">
<input type=hidden name="addTask" value="1">
Name: <input type=text name="Name"><br>
For: <select name="Person">
<cfoutput query="getPeople">
<option value="#PersonName#" <cfif Session.Person is PersonName>selected</cfif>>#PersonName#</option>
</cfoutput>
</select><br>
Description:
<textarea name="Description" rows="4"></textarea><br>
Priority (1 for lowest, 9 for highest) 
<select name="Priority">
<cfloop index="N" from="9" to="1" step="-1">
<cfoutput>
<option value="#N#" <cfif N is 5>selected</cfif>>#N#</option>
</cfoutput>
</cfloop>
</select><br>
<input type=submit value="Add Task">
</form>
</body>
</html>
