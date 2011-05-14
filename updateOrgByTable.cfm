<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<cfif not isDefined("num")>
<cfset num=1>
</cfif>

<cfquery name="getOrgs" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT 
ORG,
NAME,
NAME2,
ADDR1,
CITY,
STATE,
ZIP,
CONTACT,
CONTACT2,
FAX_1PHONE,
B_PHONE,
EMAIL,
JOINDATE from OrgsToUpdate
order by Org
</cfquery>

<cfloop query="getOrgs" startrow="#num#" endrow="#num#">
<table border=1>
<tr><td>
<cfoutput>
#ORG#<br>
#NAME#<br>
#NAME2#<br>
#ADDR1#<br>
#CITY#<br>
#STATE#<br>
#ZIP#<br>
#CONTACT#<br>
#CONTACT2#<br>
#FAX_1PHONE#<br>
#B_PHONE#<br>
#EMAIL#<br>
#JOINDATE#<br>
</cfoutput>
<cfif isDefined("Update")>
<cfquery name="updateOrg" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE Organiza
SET
NAME="#NAME#",
NAME2="#NAME2#",
ADDR1="#ADDR1#",
CITY="#CITY#",
STATE="#STATE#",
ZIP="#ZIP#",
CONTACT="#CONTACT#",
CONTACT2="#CONTACT2#",
FAX_1PHONE="#FAX_1PHONE#",
B_PHONE="#B_PHONE#",
EMAIL="#EMAIL#",
JOIN_DATE="#JOINDATE#"
where ORGANIZATI="#ORG#"
</cfquery>

</cfif>
</td>
<td>
<cfquery name="getOrg" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT 
ORGANIZATI,
NAME,
NAME2,
ADDR1,
CITY,
STATE,
ZIP,
CONTACT,
CONTACT2,
FAX_1PHONE,
B_PHONE,
EMAIL,
JOIN_DATE from Organiza
where ORGANIZATI="#ORG#"
</cfquery>
<cfoutput query="getOrg">
#ORGANIZATI#<br>
#NAME#<br>
#NAME2#<br>
#ADDR1#<br>
#CITY#<br>
#STATE#<br>
#ZIP#<br>
#CONTACT#<br>
#CONTACT2#<br>
#FAX_1PHONE#<br>
#B_PHONE#<br>
#EMAIL#<br>
#JOIN_DATE#<br>
</cfoutput>
</td>
</tr>
</cfloop>
</table>
<cfif getOrgs.recordCount gt num>
<cfset nextNum=num+1>
<cfoutput>
<a href="updateOrgByTable.cfm?num=#nextNum#">Next</a> <a href="updateOrgByTable.cfm?num=#Num#&update=1">Update</a> #num# of #getOrgs.recordCount#
</cfoutput>
</cfif>

</body>
</html>
