<cfquery name="GoodLead" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT B.FirstName, B.LastName, B.Addr1, B.City, B.State, B.Zip,
       B.HomePhone, B.BPhone, B.Org
FROM   Members B
WHERE 
	   B.MemberID=#MemberID#

</cfquery>

<!cfquery name="GoodLead" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT LeadsRel.MemberID, Members.LastName, 
    Members.FirstName, Members.Org, Members.Addr1, 
    Members.City, Members.State, Members.Zip, 
    Members.HomePhone, Members.JoinDate, Members.email, 
    LeadsRel.WhenBuy, LeadsRel.Year, LeadsRel.Make, LeadsRel.LRrecID,
    LeadsRel.Model, LeadsRel.GoodLead, LeadsRel.SentTo,LeadsRel.timestamp
FROM Members, LeadsRel
WHERE LeadsRel.LRrecID=#LRrecID#
ORDER BY Members.Org, Members.State, Members.LastName
<!/cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Send Mail</title>

</head>

<body bgcolor="#ffffff">
<table border="0" width="100%">
<cfoutput query="GoodLead">
<tr align="center" bgcolor="##D6D7AA"><td colspan="2" class="bold">#GoodLead.FirstName# #GoodLead.LastName#</td></tr>
<cfif GoodLead.Org contains 'H'>
<tr>
	<td class="bold">H ACCOUNT:</td>
	<td></td>
</tr>
</cfif>

<tr>
	<td class="bold">CERTIFICATE:</td>
	<td></td>
</tr>
<tr>
	<td class="bold">ADDRESS:</td>
	<td>#GoodLead.Addr1#<br>
	    #GoodLead.City# #GoodLead.State# #GoodLead.Zip#
	</td>
</tr>
<tr>
	<td class="bold">PHONE:</td>
	<td>
	HM: #GoodLead.HomePhone#<br>
	BS: #GoodLead.BPhone#
	</td>
</tr>
<tr>
	<td class="bold">CONTACT:</td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
</tr>

</cfoutput>
</table>



</body>
</html>
