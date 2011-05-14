<html>
<head>
<cfquery name="getTask" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT ID, Name, Description, creation_date, completion_date ,Priority,Person from toDoList
where ID=#ID#
order by Priority DESC
</cfquery>
<cfoutput query="getTask">
<title>#Name#</title>
</cfoutput>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<a href="toDoList.cfm">Back to List</a><br>
<cfoutput query="getTask">
Name: <b>#Name#</b><br>
For:  #Person#<br>
Desc: #Description#<br>
Created: #creation_date#<br>
Priority: #Priority#<br>
</cfoutput>
<cfquery name="getTaskTimes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT begin_time, end_time, Narrative
 from toDoTimes
where ID=#ID#
order by begin_time
</cfquery>
<table border=1>
<tr><td>Begin</td><td>End</td><td>Comment</td></tr>
<cfoutput query="getTaskTimes">
<tr><td>#begin_time#</td>
<td><cfif end_time is not "">#end_time#<cfelse>IN PROGRESS</cfif></td>
<td>#Narrative#</td>
</tr>
</cfoutput>
</table>
<form method=post action="toDoDetailsAction.cfm">
<cfoutput>
<input type=hidden name="ID" value="#ID#">
<table>
<tr>
<td>
Comment:
</td>
<td> <textarea name="Comment" rows=5></textarea>
</td>
</tr>
</table>
<input type=submit value="Make Comment">
</cfoutput>
</form>


</body>
</html>
