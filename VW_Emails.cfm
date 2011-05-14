<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!---
Retrieves all emails from table where duplicates have been removed and emails are not
associated to a certificate.

Emails have not been sent to email address
Email has not been returned as undeliverable
Email is not associated with a certificate
Email has not had Lead Generated Marked

--->


<cfquery name="getEmails" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from VisitedWeb d
where
sentPromo = 0 AND returnedemail = 0 AND LEADGENERATED=0 and AffiliateID=38 
and 
email not in (select email from Members a join certificat b on a.memberid=b.member join affiliate_table c on b.organizati = c.orgid
where ID=38 and d.email=a.email)

order by email
</cfquery>

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfinclude template="_header_email.cfm">


<cfparam default="25" name="rowlimit">
<cfset MaxRows=rowlimit>

<table border="1" width="100%">
<tr>
<td colspan="8">
<cf_Page Query="getEmails" Criteria="Email">
<cfoutput>
<form action="#SCRIPT_NAME#" method="POST" enctype="application/x-www-form-urlencoded">
</cfoutput>
</td>
</tr>
<Tr>
	<td>EMAIL</td>
	<TD>DATE</TD>
	<TD>IP</TD>
	<TD>AFFILIATE ID</TD>
	<TD>SENT PROMO</TD>
	<TD>EMAIL RETURNED</TD>
	<TD>LEAD GENERATED</TD>
	<TD>&nbsp;</TD>
</TR>

<CFSET RowColor="##F7F3C9">
<cfset PageTotal=0>
<cfset MyEndRow=MyStartRow+MaxRows>
<cfloop query="getEmails" startrow="#MyStartRow#" endRow="#MyEndRow#">
<cfset PageTotal=PageTotal+1>

<cfset ShowRow=1>




<cfif ShowRow is 1>
<cfoutput>
<tr bgcolor=#RowColor#>
	<td><cfif email eq ''>DELETE<cfelse><a href="mailto:#Trim(Email)#">#Trim(Email)#</a></cfif></td>
	<td>#DateFormat(VisitDate)#</td>	
	<td>#IP#</td>
	<td align="center">#AFFILIATEID#</td>
	<td align="center">#SENTPROMO#</td>
	<td align="center">#RETURNEDEMAIL#</td>
	<td align="center">#LEADGENERATED#</td>
	<td align="center"><form><font size="-1"><input type="Submit" value="SEND"></font></form></td>
</tr>
</cfoutput>
</cfif>






<CFIF RowColor  IS "##F7F3C9">
	<CFSET RowColor="##f8f8f8">
<CFELSE>
	<CFSET RowColor="##F7F3C9">
</cfif>
</cfloop>
</table>

</body>
</html>
