<cfset InputedGoodEmail=0>
<cfset InputedSameEmail=0>
<cfset InputedGoodHomePhone=0>
<cfset InputedValidZip=0>
<cf_mailTest email='#Email#'>
<cfif Email_Level is 0>
<cfset InputedGoodEmail=1>
</cfif>
<cfif Email is Session.Email>
<cfset InputedSameEmail=1>
</cfif>
<cfif isDefined("ConfirmEmail")>
<cfif ConfirmEmail is Email>
<cfset InputedSameEmail=1>
</cfif>
</cfif>
<cfset digitCount=0>
<cfloop from=1 to=#Len(HomePhone)# index=foo>
<cfif IsNumeric(Mid(HomePhone,foo,1))><cfset digitCount=digitcount+1></cfif>
</cfloop>
<cfif digitCount is 10>
<cfset InputedGoodHomePhone=1>
</cfif>
<cfquery name="checkZip" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT City,State from ZipsToCoords where ZipCode='#Zip#'
</cfquery>
<cfif checkZip.recordCount gt 0>
<cfset InputedValidZip=1>
<cfset City=checkZip.City>
<cfset State=checkZip.State>
</cfif>
<cfset Error="">
<cfif InputedGoodEmail is 0>
<cfset Error="You have entered a bad email address">
</cfif>
<cfif InputedGoodHomePhone is 0>
<cfif Error is not "">
<cfset Error=Error & "<br>">
</cfif>
<cfset Error=Error & "You have entered a bad phone number.">
</cfif>
<cfif Error is not "">
<cflocation url="processPwd.cfm?Error=#URLEncodedFormat(Error)#&MemberID=#Session.MemberID#">
</cfif>
<cfif InputedValidZip is 0>
<cfif Error is not "">
<cfset Error=Error & "<br>">
</cfif>
<cfset Error=Error & "You have entered an invalid zip">
</cfif>
<cfif InputedSameEmail is 0>
<cfquery name="checkEmail" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT MemberID from Members where Email="#Email#"
</cfquery>
<cfinclude template="_header.cfm">
<table width="750" border="0" cellspacing="0" cellpadding="10">
<tr><td bgcolor="#ffffff">
<cfoutput>
	<form method=post action="processUpdate.cfm">
<cfif checkEmail.recordCount gt 0>
	We have detected that you entered an address already in our system.  Please contact us at 800.610.CARS for assistance.<br>
	<input type=hidden name=Email value="#Session.Email#">	
<cfelse>
	We detected that you entered a new email address.  Please re-enter this address to verify.<br>
	<input type=text name=ConfirmEmail>
</cfif>
	<input type=hidden name="Email" value="#Email#">
	<input type=hidden name="FirstName" value="#FirstName#">
	<input type=hidden name="LastName" value="#LastName#">
	<input type=hidden name="Addr1" value="#Addr1#">
	<input type=hidden name="Addr2" value="#Addr2#">
	<input type=hidden name="Zip" value="#Zip#">
	<input type=hidden name="HomePhone" value="#HomePhone#">
	<input type=hidden name="BPhone" value="#BPhone#">
	<input type=hidden name="Fax" value="#Fax#">
	<input type=hidden name="CellPhone" value="#CellPhone#">
	<input type=hidden name="Birthday" value="#Birthday#">
	<input type=submit value="Confirm Email">
	</form>
</cfoutput>
</td></tr>
</table>
<cfinclude template="_footer.cfm">
<cfabort>
</cfif>

<cfquery name="updateMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE Members
set FirstName="#FirstName#",
LastName="#LastName#",
Addr1="#Addr1#",
Addr2="#Addr2#",
Email="#Email#",
HomePhone="#HomePhone#",
BPhone="#BPhone#",
Fax="#Fax#",
Zip="#Zip#",
City="#City#",
State="#State#",
CellPhone="#CellPhone#",
Birthday="#Birthday#"
where MemberID=#Session.MemberID#
</cfquery>

<cfmail from="info@ubschicago.com" to="mary@digitalcars.com" bcc="info@UBSChicago.com" subject="Member Update">
User visited update page.

Update member: #Session.MemberID#

Email: #Email#
First Name: #FirstName#
Last Name: #LastName#
Addr1: #Addr1#
Addr2: #Addr2#
City: #City#
State: #State#
Zip: #Zip#
Home Phone: #HomePhone#
Work Phone: #BPhone#
Cell Phone: #CellPhone#
Fax: #Fax#
</cfmail>

<cflocation url="process_2.cfm">

