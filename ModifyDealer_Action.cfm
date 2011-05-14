<cfinclude template="_header.cfm">

<cfif (Address is not '') and (Phone is not '') and (GM is not '') and (Zip is not '')>
<cfif Len(Zip) gte 5>
<cfquery name="checkZip" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from ZipsToCoords where ZipCode='#Left(Zip,5)#'
</cfquery>
<cfif checkZip.recordCount gt 0>
<table border="0" width="600">
<tr>
	<td align="center" valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td align="center" bgcolor="#D6D7E2"><strong>Manage Dealer Accounts</strong></td></tr>
	<tr>
		<td height="120">
		Your change requests have been submitted to DigitalCars.com, Inc. for 
		<cfoutput><a href="ModifyDealerMain.cfm?DL_Index=#DL_Index#">#oldName#</a></cfoutput>
		<br><br> Changes should take effect within 24 hours
		on weekday business days between the hours of 8:00 AM - 6:00 PM.  If you do not see your modification
		updated, contact DigitalCars.com, Inc. at 847.215.7000 or by e-mail "info@digitalcars.com".
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	</table>
	</td>
</tr>
</table>
<!----
<cfquery name="getEmail" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT FirstName,LastName, Email from CSR_Table where AgentID='#Session.XtranetAgent#'
</cfquery>
---->
<cfset Session.XtranetAgent='Siren'>
<cfmail from="<!---getEmail.Email--->info@digitalcars.com" to="info@digitalcars.com" Subject="Dealer Update">
Agent Making Request: #Session.XtranetAgent#
On DL_Index: #DL_Index#
<cfif oldName is not Name>Old Name: #oldName#</cfif>
Name: #Name#
Address: #Address#
City: #checkZip.City#
State: #checkZip.State#
Zip: #Zip#

Dealer Principal: #Owner#
General Manager: #GM#
Main Contact: #Contact#

Main Phone: #Phone#
Toll Free: #TollFree#
Main Fax: #Fax#
General Email: #Email#
Web Site URL: #WebSiteURL#
</cfmail>

<cfset DateUpdated=#CreateODBCDateTime(Now())#>
<cfquery name="MODIFY" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
Update IndexedNWDealers
Set Owner='#UCase(Owner)#',
    GM='#GM#',
	Contact='#Contact#',
	Phone='#Phone#',
	Fax='#Fax#',
	Email='#Email#',
	WebSiteURL='#WebSiteURL#',
	DateUpdated = #DateUpdated#

where DL_Index= #DL_Index#

</cfquery>



<cfelse>
<cflocation url="ModifyDealerMain.cfm?DL_Index=#DL_Index#&Error=Invalid+Zip">
</cfif>
<cfelse>
<cflocation url="ModifyDealerMain.cfm?DL_Index=#DL_Index#&Error=Invalid+Zip">
</cfif>
<cfelse>
<cfset MyError=''>
<cfif Address is ''>
<cfset MyError=MyError & 'Address+may+not+be+blank<br>'>
</cfif>
<cfif Phone is ''>
<cfset MyError=MyError & 'Main+Phone+may+not+be+blank<br>'>
</cfif>
<cfif GM is ''>
<cfset MyError=MyError & 'General+Manager+may+not+be+blank<br>'>
</cfif>
<cfif Zip is ''>
<cfset MyError=MyError & 'Zip+Code+may+not+be+blank<br>'>
</cfif>
<cflocation url="ModifyDealerMain.cfm?DL_Index=#DL_Index#&Error=#MyError#">
</cfif>


<cfinclude template="_footer.cfm">
