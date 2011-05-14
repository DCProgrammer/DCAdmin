<cfparam name="Show" default="Members">

<!-- 'getDates' query assigns the range of dates for this report, 'Yesterday' is the start of the range, '
Today' is the end.-->

<cfquery name="getDates" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select Yesterday=DATEADD(Minute,-DATEPART(Minute,GETDATE()-1),DATEADD(Hour,-DATEPART(Hour,GETDATE()-1),GETDATE()-1)), 
Today=DATEADD(Minute,-DATEPART(Minute,GETDATE()),DATEADD(Hour,-DATEPART(Hour,GETDATE()),GETDATE()))
</cfquery>

<cfif IsDefined("FromYear")>
<cfset Yesterday=FromMonth & " " & FromDay & ", " & FromYear>
<cfset Today=ToMonth & " " & ToDay & ", " & ToYear>
<cfelse>
<cfset Yesterday=DateFormat(getDates.Yesterday,"mmmm dd, YYYY")>
<cfset Today=DateFormat(getDates.Today,"mmmm dd, YYYY")>
</cfif>

<cfoutput>
<form method=post action="#SCRIPT_NAME#">
</cfoutput>
<cfquery name="getYears" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Year(timestamp) as Year
from LeadsRel
order by Year(timestamp) DESC
</cfquery>
From: 
<cfset Months="January, February, March, April , May, June, July, August, September, October, November, December">
<select name="FromMonth">
<cfloop list=#Months# index=Foo>
<cfoutput><option value="#Foo#">#Foo#</option></cfoutput>
</cfloop>
</select>
<select name="FromDay">
<cfloop from=1 to=31 index=Foo>
<cfoutput><option value="#foo#">#Foo#</option></cfoutput>
</cfloop>
</select>
<select name="FromYear">
<cfoutput query="getYears">
<option value="#Year#">#Year#</option>
</cfoutput>
</select>
<br>
To:
<select name="ToMonth">
<cfloop list=#Months# index=Foo>
<cfoutput><option value="#Foo#">#Foo#</option></cfoutput>
</cfloop>
</select>
<select name="ToDay">
<cfloop from=1 to=31 index=Foo>
<cfoutput><option value="#foo#">#Foo#</option></cfoutput>
</cfloop>
</select>
<select name="ToYear">
<cfoutput query="getYears">
<option value="#Year#">#Year#</option>
</cfoutput>
</select>
<cfoutput>
<input type=hidden name="Show" value="#Show#">
<input type=hidden name="State" value="#State#">
</cfoutput>
<br>
<input type=submit value="Choose New Timeframe">
</form>

<cfif Find('Dealers',Show) is not 0>
<cfquery name="getDealers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select DISTINCT SentTo, DealerID from LeadsRel A, DCDealers B
where timestamp>='#Yesterday#'
and timestamp<='#Today#'
and A.SentTo=B.Name
and GoodLead=1
	<cfif State is not ''>and State="#State#"</cfif>

Order by SentTo
</cfquery>
</cfif>

<cfif Find('Members',Show) is not 0>
<cfquery name="getMems" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT UserID, Email, JoinDate
from WSWUsers A
where JoinDate >= '#Yesterday#'
and JoinDate <= '#Today#'
<cfif State is not ''>
and exists (select * from UserResponses B where QuestionID=26 and ResponseText LIKE '#State#' and B.UserID=A.UserID)
</cfif>
</cfquery>
</cfif>

<cfif Find('GoodLeads',Show) is not 0>
<cfquery name="GoodmemQry" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT LeadsRel.MemberID, Members.LastName, 
    Members.FirstName, Members.Org, Members.Addr1, 
    Members.City, Members.State, Members.Zip, 
    Members.HomePhone, Members.JoinDate, Members.email, 
    LeadsRel.WhenBuy, LeadsRel.Year, LeadsRel.Make, 
    LeadsRel.Model, LeadsRel.GoodLead, LeadsRel.SentTo, LeadsRel.timestamp
FROM Members LEFT OUTER JOIN
    LeadsRel ON 
    Members.MemberID = LeadsRel.MemberID
WHERE (Members.JoinDate >= '#Yesterday#') AND
	  (Members.JoinDate <= '#Today#') and
    (LeadsRel.GoodLead = 1) and Org='90014W'
	<cfif State is not ''>and State="#State#"</cfif>
ORDER BY Members.Org, Members.State, Members.LastName
</cfquery>
</cfif>

<cfif Find('BadLeads',Show) is not 0>
<cfquery name="BadmemQry" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT LeadsRel.MemberID, Members.LastName, 
    Members.FirstName, Members.Org, Members.Addr1, 
    Members.City, Members.State, Members.Zip, 
    Members.HomePhone, Members.JoinDate, Members.email,
    LeadsRel.WhenBuy, LeadsRel.Year, LeadsRel.Make, 
    LeadsRel.Model, LeadsRel.GoodLead, LeadsRel.timestamp
FROM Members LEFT OUTER JOIN
    LeadsRel ON 
    Members.MemberID = LeadsRel.MemberID
WHERE (Members.JoinDate >= '#Yesterday#') AND 
	  (Members.JoinDate <= '#Today#') and
    (LeadsRel.GoodLead = 0) and Org='90014W'
	<cfif State is not ''>and State="#State#"</cfif>
ORDER BY Members.Org, Members.State, Members.LastName
</cfquery>
</cfif>

<html>
<head>
<title>Last Days Members</title>
</head>
<body>
<CFSET RowColor="##F7F3C9">

<cfoutput>
Reporting for period #Yesterday# to #Today#
</cfoutput>
<cfif Find('Members',Show)>
<h1>Member Signups</h1>
<b>Total Member Signups: <cfoutput>#getMems.recordCount#</cfoutput></b>
<table border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="#DDE4C5">
<th><font face="arial" size="-2"><b>ORG ID</b></font></th>
<th><font face="arial" size="-2"><b>NAME</b></font></th>
<th><font face="arial" size="-2"><b>ADDRESS</b></font></th>
<th><font face="arial" size="-2"><b>HOME PHONE</b></font></th>
<th><font face="arial" size="-2"><b>JOIN DATE</b></font></th>
</tr>

<cfloop query="getMems">
<cfset MyUserID=getMems.UserID>
<cfoutput>
<tr bgcolor=#RowColor#>
<td><font face="arial" size="-2">90014W</font></td>
<td><font face="arial" size="-2"><a href="mailto:#email#"><cf_showAnswer user=#MyUserID# name="First Name">
<cf_showAnswer user=#MyUserID# name="Last Name"></a></font></td>
<td><font face="arial" size="-2">
<cf_showAnswer user=#MyUserID# name="Address"> 
<cf_showAnswer user=#MyUserID# name="City"> 
<cf_showAnswer user=#MyUserID# name="State">
<cf_showAnswer user=#MyUserID# name="Zip">
</font></td>
<td><font face="arial" size="-2"><cf_showAnswer user=#MyUserID# name="Evening Phone"></font></td>
<td><font face="arial" size="-2">#DateFormat(JoinDate)#</font></td>
</cfoutput>
</tr>
<CFIF RowColor  IS "##F7F3C9">
	<CFSET RowColor="##f8f8f8">
<CFELSE>
	<CFSET RowColor="##F7F3C9">
</cfif>
</cfloop>
</table>
</cfif>



<cfif Find('GoodLeads',Show)>
<h1>Good Leads</h1>
<b>Total Members Placed To Dealer: <cfoutput>#GoodmemQry.recordCount#</cfoutput></b>
<table border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="#DDE4C5">
<th><font face="arial" size="-2"><b>ORG ID</b></font></th>
<th><font face="arial" size="-2"><b>NAME</b></font></th>
<th><font face="arial" size="-2"><b>ADDRESS</b></font></th>
<th><font face="arial" size="-2"><b>HOME PHONE</b></font></th>
<th><font face="arial" size="-2"><b>VEHICLE</b></font></th>
<th><font face="arial" size="-2"><b>BUY TIME</b></font></th>
<th><font face="arial" size="-2"><b>DEALER</b></font></th>
<th><font face="arial" size="-2"><b>DATE</b></font></th>
</tr>
<cfoutput query="GoodmemQry">
<tr bgcolor=#RowColor#>
<td><font face="arial" size="-2">#Org#</font></td>
<td><font face="arial" size="-2"><a href="mailto:#email#">#FirstName# #LastName#</a></font></td> 
<td><font face="arial" size="-2">#City# #State# #Zip#</font></td>
<td><font face="arial" size="-2">#HomePhone#</font></td>
<td><font face="arial" size="-2">#Year# #Make#<br>#Model#</font></td>
<td><font face="arial" size="-2">#UCase(WhenBuy)#</font></td>
<td><font face="arial" size="-2">#SentTo#</font></td>
<td><font face="arial" size="-2">#dateformat(timestamp)#</font></td>
</tr>
<CFIF RowColor  IS "##F7F3C9">
	<CFSET RowColor="##f8f8f8">
<CFELSE>
	<CFSET RowColor="##F7F3C9">
</cfif>
</cfoutput>
</table>
</cfif>

<cfif Find('BadLeads',Show)>
<h1>Bad Leads</h1>
<b>Total Members Not Placed To Dealer: <cfoutput>#BadmemQry.recordCount#</cfoutput></b>
<table border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="#DDE4C5">
<th><font face="arial" size="-2"><b>ORG ID</b></font></th>
<th><font face="arial" size="-2"><b>NAME</b></font></th>
<th><font face="arial" size="-2"><b>ADDRESS</b></font></th>
<th><font face="arial" size="-2"><b>HOME PHONE</b></font></th>
<th><font face="arial" size="-2"><b>VEHICLE</b></font></th>
<th><font face="arial" size="-2"><b>BUY TIME</b></font></th>
<th><font face="arial" size="-2"><b>DATE</b></font></th>
</tr>



<cfoutput query="BadmemQry">
<tr bgcolor=#RowColor#>
<td><font face="arial" size="-2">#Org#</font></td>
<td><font face="arial" size="-2"><a href="mailto:#email#">#FirstName# #LastName#</a></font></td> 
<td><font face="arial" size="-2">#City# #State# #Zip#</font></td>
<td><font face="arial" size="-2">#HomePhone#</font></td>
<td><font face="arial" size="-2">#Year# #Make# #Model#</font></td>
<td><font face="arial" size="-2">#UCase(WhenBuy)#</font></td>
<td><font face="arial" size="-2">#dateformat(timestamp)#</font></td>
</tr>
<CFIF RowColor  IS "##F7F3C9">
	<CFSET RowColor="##f8f8f8">
<CFELSE>
	<CFSET RowColor="##F7F3C9">
</cfif>
</cfoutput>
</table>
</cfif>

<cfif Find('Dealers',Show)>
<h1>By Dealer</h1>
<b>Total Dealers That Received Leads: <cfoutput>#getDealers.recordCount#</cfoutput></b>
<table border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="#DDE4C5">
<th><font face="arial" size="-2"><b>DEALER</b></font></th>
<th><font face="arial" size="-2"><b>ID</b></font></th>
<th><font face="arial" size="-2"><b>MEMBER</b></font></th>
</tr>


<cfloop query="getDealers">
<cfset MyDealer=getDealers.SentTo>
<cfquery name="getDealerMembers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT A.MemberID,FirstName, LastName, email, Org 
from Members A, LeadsRel B 
where A.MemberID=B.MemberID 
and timestamp >= '#Yesterday#' 
and timestamp <= '#Today#' 
and SentTo='#myDealer#'
</cfquery>

<tr bgcolor=<cfoutput>#RowColor#</cfoutput>>
<td><cfoutput><font face="arial" size="-2">#SentTo#</font></cfoutput></td>
<td><cfoutput><font face="arial" size="-2">#DealerID#</font></cfoutput></td>
<td><table border=0 width="100%">
<cfoutput query="getDealerMembers">
<tr><td><font face="arial" size="-2"><a href="mailto:#email#">#FirstName# #LastName#</a></font></td><td align="RIGHT"><font face="arial" size="-2">#MemberID#</font></td></tr>
</cfoutput>
</table></td>
</tr>
<CFIF RowColor  IS "##F7F3C9">
	<CFSET RowColor="##f8f8f8">
<CFELSE>
	<CFSET RowColor="##F7F3C9">
</cfif>
</cfloop>
</table>
</cfif>
</body>
</html>