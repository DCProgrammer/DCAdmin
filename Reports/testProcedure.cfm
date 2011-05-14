<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Web Certificate Report</title>
</head>

<body>
<cfquery name="getCertReport" datasource="MainSQL" username="Justin" Password="SouthPark">
exec runCertReport
</cfquery>

<cfset MyName=''>
<cfloop query="getCertReport">
<cfif Name is not MyName>
<cfif MyName is not ''>
</table>
<hr>
</cfif>
<cfset Myname=Name>
<cfoutput>
<h1>Organization: #Name#</h1>
</cfoutput>
<table border>
<tr>
<th>Date</th><th>Signups</th><th>Certificates</th><th>Out Of Area (Web)</th></tr>
</cfif>
<cfoutput>
<tr>
<td>#MonthAsString(Month)# #Year#</td>
<td>#Signups#</td>
<td>#GoodLeads#</td>
<td>#BadLeads#</td>
</tr>
</cfoutput>
</cfloop>
</table>


</body>
</html>
