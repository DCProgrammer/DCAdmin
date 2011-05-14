<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<!cfset testing=1>
<cfset onlyme=1>
<cfset numrows=1000>
<cfset MyFile="Tip022404.cfm">

<body>
<cfquery name="getEmails" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Email from EmailableMembers
where State!="MD"
and State!="VA"
and State!="DC"
<cfif isDefined("testing")>
and 
<cfif not isDefined("onlyme")>
(
</cfif>
(Email="jdhilts@ameritech.net")
<cfif not isDefined("onlyme")>
	or (Email="mary@ubsi.com")
	or (Email="neal@ubsi.com")
)
</cfif>
</cfif>
</cfquery>

<cfif isDefined("Sending")>

<cfif not isDefined("StartRecord")>
<cfset StartRecord=1>
<cfset endrow=getEmails.recordCount>
<cfelse>
<cfif not isDefined("endrow")><cfset endrow=startrecord+numrows>
</cfif>
</cfif>

<cfloop query="getEmails" startrow=#startrecord# endrow=#endrow#>
<cfmail from="mary@ubschicago.com" to="#Email#" subject="United Buying Service Tip Of The Day" type="HTML">
<table>
<tr><td>
<img src="http://www.ubschicago.com/images/ubschi.jpg"></td>
<td><h1>UNITED BUYING SERVICE CHICAGO</h1><br><center>NORTHBROOK, IL  60062</center></td></tr>
</table>

<pre>
#MailBody#
</pre>
<pre>
Mary Okolowicz
Benefits Coordinator
847-215-7000

<a href=mailto:mary@ubsi.com>mary@ubsi.com</a>
</pre>

<pre>
*Interest rates are estimated that change on a daily basis. Qualification must be met to received stated interest rate.

We do not operate as United Buying Service or UBS within Maryland, Virginia or the District of Columbia an are not affiliated with United Buying Service of Maryland, Virginia or the District of Columbia which is an independently owned and operated business.
 
·   847/215.7000  ·  Fax 847/215-1958  ·
</pre>
<a href="http://www.ubschicago.com">www.ubschicago.com</a> · email: <a href="mailto:mary@ubsi.com">mary@ubsi.com</a>

</cfmail>
<!--a href="http://www.ubschicago.com"><img src="http://www.ubschicago.com/images/email.jpg" width="700" height="500"><!--/a>
<!--/cfmail-->

</cfloop>
<cfif endrow lt getEmails.recordCount>
<cfset startrecord=endrow+1>
<cfset endrow=startrecord+numrows-1>
<cfif endrow gte getEmails.recordCount><cfset endrow=getEmails.recordCount></cfif>
<cfoutput>
<form method=post action="EmailToMembers.cfm">
<input type=hidden name=Sending value=1>
<input type=hidden name=RequestTimeout value=3000>
<input type=hidden name=MailBody value="<cfinclude template="#MyFile#">">
<input type=submit value="Send Emails #startrecord# to #endrow#">
<input type=hidden name=StartRecord value=#startrecord#>
<input type=hidden name=endrow value=#endrow#>
<!--a href="EmailToMembers.cfm?Sending=1&RequestTimeout=3000">Send #getEmails.recordCount# Emails<-/a-->
</cfoutput><br>
<pre>
<cfinclude template="#MyFile#">
</pre>
</cfif>
<cfelse>
<cfoutput>
<cfif not isDefined("startrecord")>
<cfset startrecord=1>
</cfif>
<cfif not isDefined("endrow")>
<cfset endrow=startrecord+numrows-1>
</cfif>
<cfif endrow gte getEmails.recordCount><cfset endrow=getEmails.recordCount></cfif>

<form method=post action="EmailToMembers.cfm?RequestTimeout=5000">
<input type=hidden name=Sending value=1>
<input type=hidden name=RequestTimeout value=5000>
<input type=hidden name=MailBody value="<cfinclude template="#MyFile#">">
<input type=submit value="Send Emails #startrecord# to #endrow#">
<input type=hidden name=StartRecord value=#startrecord#>
<input type=hidden name=endrow value=#endrow#>
<!--a href="EmailToMembers.cfm?Sending=1&RequestTimeout=3000">Send #getEmails.recordCount# Emails<-/a-->
</cfoutput><br>
<pre>
<cfinclude template="#MyFile#">
</pre>
</cfif>
</body>
</html>
