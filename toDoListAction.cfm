<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif isDefined("SetPerson")>
<cfset Session.Person=Person>
</cfif>
<cfif isDefined("raisePri")>
<cfquery name="raisePriority" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE toDoList set Priority=Priority+1
where ID=#ID#
</cfquery>
</cfif>
<cfif isDefined("lowerPri")>
<cfquery name="lowerPriority" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE toDoList set Priority=Priority-1
where ID=#ID#
</cfquery>
</cfif>
<cfif isDefined("addTask")>
<cfquery name="addTask" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO toDoList (Name, Description, creation_date, Priority, Person)
values ("#Name#","#Description#",getDate(),#Priority#,"#Person#")
</cfquery>
<cfmail from="info@ubsi.com" to="neal.halperin@gmail.com" cc="j.hiltscher@gmail.com,adam@adambielawski.com,rickarick@gmail.com" subject="New Task added">
Name: #Name#
For: #Person#
Description: #Description#
Priority: #Priority#
</cfmail>
</cfif>
<cfif isDefined("start")>
<cfquery name="addTask" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO toDoTimes (ID,begin_time)
values (#ID#,getDate())
</cfquery>
<cfquery name="getName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from toDoList where ID=#ID#
</cfquery>
<cfset Name=getName.Name>
<cfmail from="info@ubsi.com" to="neal.halperin@gmail.com" cc="j.hiltscher@gmail.com,adam@adambielawski.com,rickarick@gmail.com" subject="Began Work on #Name#">
Began Work on #Name#
</cfmail>
</cfif>
<cfif isDefined("stop")>
<cfquery name="addTask" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE toDoTimes
set end_time=getDate()
where end_time is NULL
 and ID=#ID#
</cfquery>
<cfquery name="getName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from toDoList where ID=#ID#
</cfquery>
<cfset Name=getName.Name>
<cfmail from="info@ubsi.com" to="neal.halperin@gmail.com" cc="j.hiltscher@gmail.com,adam@adambielawski.com,rickarick@gmail.com" subject="Stopped Work on #Name#">
Stopped Work on #Name#
</cfmail>
</cfif>
<cfif isDefined("close")>
<cfquery name="addTask" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE toDoList set completion_date=getDate() where ID=#ID#
</cfquery>
<cfquery name="getName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from toDoList where ID=#ID#
</cfquery>
<cfset Name=getName.Name>
<cfmail from="info@ubsi.com" to="neal.halperin@gmail.com" cc="j.hiltscher@gmail.com,adam@adambielawski.com,rickarick@gmail.com" subject="Closed Task: #Name#">
#Name# closed.
Details found at http://dcadmin.digitalcars.com/dcadmin/toDoDetails.cfm?ID=#ID#
</cfmail>
</cfif>

<cflocation url="toDoList.cfm">
</body>
</html>
