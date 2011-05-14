<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif isDefined("Org")>
<cfloop list="#Org#" index="I">
<cfquery name="markAsDup" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO OrgDups
values ("#I#")
</cfquery>
</cfloop>
</cfif>
<cfquery name="OrgList" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Organizati, Name from Organiza
where Organizati not in (SELECT Org from OrgDups)
order by Name
</cfquery>

<form method=post action="removeDups.cfm">
<cfset row=0>
<cfoutput query="OrgList">
<input type=checkbox name="Org" value="#Organizati#">#Name# (#Organizati#)<br>
<cfset row=row+1>
<cfif row is 25>
<cfset row=0>
<input type=submit value="Remove"><br>
</cfif>
</cfoutput>
<input type=submit value="Remove">
</form>


</body>
</html>
