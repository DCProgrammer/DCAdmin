<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Member, FirstName, LastName FROM CERTIFICAT A, MEMBERS B
WHERE A.ORGANIZATI IN ('00295F','00295H','00295X','00296F','00297F','00298F','00299F','00321F')
AND A.ADD_DATE >'2003-01-01'
AND A.MEMBER=B.MEMBERID
and FirstName!='DIGITAL'
and LastName!='CARS'
and LastName!='TEST'
order by LastName, FirstName
</cfquery>

<table>
<cfloop query="getMembers">
<tr><td>
<cfquery name="getMemberInfo" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Members A, Organiza B where MemberID=#Member# and A.Org=B.Organizati
</cfquery>
<cfquery name="getCertInfo" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Certificat, B.Product, Add_Date from Certificat A, Product B
where Member=#Member#
and A.Product=B.ProductID
and Add_Date>'2003-01-01'
</cfquery>
<cfquery name="getLeadsRelInfo" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from LeadsRel where MemberID=#Member# and GoodLead=1
</cfquery>
<cfoutput query="getMemberInfo">
#MemberID#
</td><td>
#FirstName# #LastName#
</td><td>
#Addr1# #City# #State# #Zip# 
</td><td>
#HomePhone# #BPhone#
</td><td>
#Org# #Name#
</td><td>


</cfoutput>
<table>
<cfoutput query="getCertInfo">
<tr><td>#Certificat#</td>
<td>#Product#</td>
<td>#Add_Date#</td>
</tr>
</cfoutput>
<cfoutput query="getLeadsRelInfo">
<tr><td>
<cfif GoodLead is 1>Lead<cfelse>No Lead</cfif></td><td colspan=2> #NewOrUsed# #Year# #Make# #Model#</td></tr>
</cfoutput>
</table>
</td></tr>
</cfloop>
</table>
</body>
</html>
