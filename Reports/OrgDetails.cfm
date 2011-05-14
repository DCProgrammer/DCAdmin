
<cfparam name="ORGANIZATI" default="90014D">

<cfquery name="GetOrg" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select * from ORGANIZA
where ORGANIZATI='#ORGANIZATI#'
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Organization</title>

</head>

<body bgcolor="#ffffff">
<table border="0" width="100%">
<cfoutput query="GetOrg">
<tr align="center" bgcolor="##D6D7AA"><td colspan="2" class="bold">#GetOrg.Name#</td></tr>
<tr>
	<td class="bold">ADDRESS:</td>
	<td>#GetOrg.ADDR1#<br>
		#GetOrg.City# #GetOrg.State# #GetOrg.Zip#
	</td>
</tr>
<tr>
	<td class="bold">PHONE:</td>
	<td>#GetOrg.B_Phone#</td>
</tr>
<tr>
	<td class="bold">CONTACT:</td>
	<td>#GetOrg.Contact#</td>
</tr>
<tr>
	<td></td>
	<td></td>
</tr>

</cfoutput>
</table>



</body>
</html>
