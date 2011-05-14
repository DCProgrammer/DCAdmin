<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfif not isDefined("Session.MemberID")>
<cfset Session.MemberID="">
</cfif>

<cfif Session.MemberID is not "">
<cfquery name="updateMemToOrg" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
update MemberToOrg 
set Org='#NewOrg#'
where MemberID=#Session.MemberID#
and Org='#Application.Org#'
</cfquery>
</cfif>

<cflocation url="complete.cfm">
</body>
</html>
