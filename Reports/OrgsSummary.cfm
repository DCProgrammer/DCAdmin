<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfquery name="orgSummary" datasource="MainSQL" username="sa" password="SouthPark">
select Name,[Signups]=Sum(Signups),[GoodLeads]=Sum(GoodLeads),[BadLeads]=Sum(BadLeads), Month, Year, A.Org 
from StatsSummary A, OrgToName B 
where A.Org=B.Org
and Year=2000
group by Name, Month,Year,A.Org
order by Year,Month,Name
</cfquery>

<cfset MyMonth=0>
<cfset inTable=0>
<cfset TotalSignups=0>
<cfset TotalGood=0>
<cfset TotalBad=0>

<cfloop query="orgSummary">
<cfif MyMonth is not Month>
<cfif inTable is 1>
<cfoutput>
<tr><td><b>Total</b></td><td>#TotalSignups#</td><td>#TotalGood#</td><td>#TotalBad#</td></tr>
</cfoutput>
</table>
</cfif>
<cfset TotalSignups=0>
<cfset TotalGood=0>
<cfset TotalBad=0>
<hr>
Organizations for <cfoutput>#Month#/#Year#</cfoutput><br>
<table border=1>
<tr><th>Name</th><th>Signups</th><th>Good Leads</th><th>Bad Leads</th></tr>
<cfset MyMonth=Month>
<cfset inTable=1>
</cfif>
<cfquery name="getSignups" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select [MyCount]=count(*) from Members where Org='#Org#' and Month(JoinDate)=#Month# and Year(JoinDate)=#Year#
</cfquery>
<cfoutput>
<tr><td>#Name#</td><td>#getSignups.MyCount#</td><td>#GoodLeads#</td><td>#BadLeads#</td></tr>
<cfset TotalSignups=TotalSignups+getSignups.MyCount>
<cfset TotalGood=TotalGood+GoodLeads>
<cfset TotalBad=TotalBad+BadLeads>
</cfoutput>
</cfloop>
<cfoutput>
<tr><td><b>Total</b></td><td>#TotalSignups#</td><td>#TotalGood#</td><td>#TotalBad#</td></tr>
</cfoutput>
</table>
</body>
</html>
