<cfinclude template="_header.cfm">
<cfif not IsDefined("Session.PWAttempts")>
<cfset Session.PWAttempts=0>
</cfif>

<cfif not isDefined("Session.MemberID")>
<cfset Session.MemberID="">
</cfif>

<cfset IsGood=0>
<cfif Session.MemberID is "">
<cfset Session.PWAttempts=Session.PWAttempts+1>
<cfquery name="checkPass" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from EmailPwds where Email="#Session.Email#"
and Password="#Password#"
</cfquery>
<cfif checkPass.recordCount gt 0>
<cfset IsGood=1>
</cfif>
<cfelse>
<cfset IsGood=1>
</cfif>

<cfif IsGood is 1>
<cfquery name="getMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT FirstName, LastName, Addr1, Addr2, HomePhone, BPhone, CellPhone, Fax, Birthday,Zip
from Members
where MemberID=#MemberID#
</cfquery>
<cfquery name="getCityAndState" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
select City, State from ZipsToCoords where ZipCode='#getMember.Zip#'
</cfquery>
<cfset City=getCityAndState.City>
<cfset State=getCityAndState.State>
<cfoutput query="getMember">
<cfset Session.MemberID=MemberID>
<table width="750" border="0" cellspacing="0" cellpadding="10">
<tr>
	<td bgcolor="##ffffff">
<table>
<tr><td colspan="2">
Please update your information then click "UPDATE".
<br>  If you have any question email us at info@ubschicago.com or contact us at 800-YES-COST.</td></tr>
<cfif isDefined("Error")>
<tr><td class=warning>#Error#</td></tr>
</cfif>
<form method=post action="processUpdate.cfm">
<tr><td>
First Name:</td>
<td>
<input name=FirstName type=text value="#FirstName#" size="30">
</td></tr>
<tr>
<td>Last Name:</td>
<td><input name=LastName type=text value="#LastName#" size="30"></td>
</tr>
<tr>
<td>Email:</td>
<td><input name=Email type=text value="#Session.Email#" size="30"></td>
</tr>
<tr>
<td>Address 1:</td>
<td><input name=Addr1 type=text value="#Addr1#" size="30"></td>
</tr>
<tr>
<td>Address 2:</td>
<td><input name=Addr2 type=text value="#Addr2#" size="30"></td>
</tr>
<tr>
<td></td>
<td>#City# #State#</td>
</tr>
<tr><td>Zip</td>
<td>
<input name=Zip type=text value="#Zip#" size="5">
</td>
</tr>
<tr>
<td>Home Phone:</td>
<td><input name=HomePhone type=text value="#HomePhone#" size="30"></td>
</tr>
<tr>
<td>Work Phone:</td>
<td><input name=BPhone type=text value="#BPhone#" size="30"></td>
</tr>
<tr>
<td>Cell Phone:</td>
<td><input name=CellPhone type=text value="#CellPhone#" size="30"></td>
</tr>
<tr>
<td>Fax:</td>
<td><input name=Fax type=text value="#Fax#" size="30"></td>
</tr>
<tr>
<td>Birthday:</td>
<td><input name=Birthday type=text value="#DateFormat(Birthday)#" size="30"></td>
</tr>

<tr><td colspan=2>
<input type=submit value=Update>
</td></tr>
</form>
</table>
</td></tr></table>
</cfoutput>
<cfelse>
<cfif Session.PWAttempts lt 3>
<cflocation url="getUpdatePwd.cfm?MemberID=#MemberID#">
</cfif>
<table width="750" border="0" cellspacing="0" cellpadding="10">
<tr>
	<td bgcolor="#ffffff">
You have exceeded password attempts.  Please contact us at info@UBSChicago.com,
or at 800.YES.COST, or submit your information <a href="form_man.cfm">here</a>.
</td></tr></table>
</cfif>

<cfinclude template="_footer.cfm">