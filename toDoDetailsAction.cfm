<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfquery name="getTaskTimes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT begin_time, end_time, Narrative from toDoTimes
where ID=#ID#
and end_time is NULL
</cfquery>

<cfif getTaskTimes.recordCount is 1>
<cfquery name="setTaskComment" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE toDoTimes
set Narrative="#Comment#",
end_time=getdate()
where ID=#ID#
and end_time is NULL
</cfquery>
<cfquery name="startNextRow" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT into toDoTimes (ID, begin_time) values (#ID#,getdate())
</cfquery>
<cfelse>
<cfquery name="setTaskComment" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO toDoTimes (ID, begin_time, end_time, Narrative) values (#ID#,getdate(),getdate(),"#Comment#")
</cfquery>
</cfif>
<cfquery name="getTaskName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from toDoList where ID=#ID#
</cfquery>
<cfmail from="info@ubsi.com" to="neal.halperin@gmail.com" cc="j.hiltscher@gmail.com,adam@adambielawski.com,maryptp@gmail.com" subject="Re: #getTaskName.Name#">
#Comment#
</cfmail>
<body>
<cflocation url="toDoDetails.cfm?ID=#ID#">
</body>
</html>
