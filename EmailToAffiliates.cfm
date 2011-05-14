<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfset testing=1>

<cfquery name="getEmails" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT ContactName, ContactEmail from Affiliate_Table
where ContactEmail LIKE "%@%.%"
<cfif isDefined("Testing")>
and (ContactEmail="mary@digitalcars.com" or ContactEmail="neal@digitalcars.com" or ContactEmail="jdhilts@ameritech.net")
</cfif>
</cfquery>

<cfif isDefined("Sending")>

<cfloop query="getEmails">
<cfmail to="#ContactEmail#" from="info@ubschicago.com" subject="UBS Chicago brochure" mimeattach="G:\inetpub\wwwroot\AdminFeatures\websites\ubs01\ubsconsumerloan.doc">
United Buying Service Chicago Mortgage and Car Payment Savings Program


In today's economic climate, it is important to offer valuable services to our UBS 
member organiziations and their employees/members.

We are pleased to announce our UBS Chicago Mortgage and Car Payment Savings Program.

Your employees/members can save money on the financing and refinancing of mortgages
and their automobiles.  This program contains services and discounts not widely available
to the public.

There are no application fees and your employees/members can save thousands of dollars 
on the cost of the mortgage or car loan.

We would appreciate it if you would distribute the email to your employees/members.

Please post the attached document in the appropriate location.

Thank you,

Mary "O"

847-291-7900</cfmail>

</cfloop>

<cfelse>
<cfoutput><a href="EmailToAffiliates.cfm?Sending=1">Send #getEmails.recordCount# Emails</a></cfoutput><br>
<cfoutput query="getEmails">
#ContactEmail#<br>
</cfoutput>
</cfif>
</body>
</html>
