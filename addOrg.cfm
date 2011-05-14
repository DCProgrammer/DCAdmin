<html>
<head>
<title>
Add An Organization
</title>
</head>
<body>
<cfif not isDefined("ID")>
<cfset ID="">
</cfif>
<cfif not isDefined("Name")>
<cfset Name="">
</cfif>
<cfoutput>
<cfif not isDefined("doAdd")>
<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT ID=Left(Max(Organizati),5) from Organiza
where Organizati LIKE '%B'
</cfquery>
<cfif getOrgs.ID is not "">
<cfset ID=getOrgs.ID+1>
<cfset NewID=ToString(ID)>
<cfset NewID=Insert(NewID,"B",0)>
<cfloop condition="Len(NewID) lt 6"><cfset NewID=Insert("0",NewID,0)></cfloop>
<cfset ID=NewID>
<cfelse>
<cfset ID='00000B'>
</cfif>

<form method=post action="addOrg.cfm">
<input type=hidden name="doAdd" value="tryAdd">
ID: <input type=text name="ID" value="#ID#"><br>
Name: <input type=text name="Name" value="#Name#"><br>
<input type=submit value="Add Organization">
</cfif>
</form>
</cfoutput>
<cfif isDefined("doAdd")>
<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Organizati from Organiza
where Organizati="#ID#"
</cfquery>
<cfif getOrgs.recordCount gt 0>
<font color="Red">That ID is already assigned, please choose another</font>
<cfelse>
<cfquery name="getOrgsByName" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Organizati from Organiza
where Name="#Name#"
</cfquery>
<cfif getOrgsByName.recordCount gt 0>
<font color="Red">That name has already been assigned, please edit the existing record, or choose a different name<br>
<cfelse>
<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO Organiza (Organizati, Name)
VALUES ("#ID#","#Name#")
</cfquery>
<cflocation url="OrgSearch.cfm?srchBy=ID&Pattern=#ID#&doSearch=1">
</cfif>
</cfif>
</cfif>
</body>
</html>
