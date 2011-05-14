<cfinclude template="../_header.cfm">

<cfif isDefined("Zip")>
	<cfif Zip is not "">
	<cf_CreateZipList zipCode=#trim(Zip)# distance=50>
	<cfquery name="getDealers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT DL_Index, Name, City, State from IndexedNWDealers
	where Zip in (#ZipList#)
	order by Name
	</cfquery>
	
	<cfelse>
		<cflocation url="IndexDealerSearch.cfm">
	</cfif>
<cfelse>
<cfquery name="getDealers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DL_Index, Name, City, State from IndexedNWDealers
where Name LIKE '%#Name#%'
	<cfif State is not ''>
	and State='#State#'
	</cfif>
order by Name
</cfquery>
</cfif>

<table width="768" border="0" align="center" cellpadding="0" cellspacing="0">
<Tr><td>
<br><br>
	Select from returned dealers.  Each dealer relationship required contact and associated manufacturer in order to be 
	utilized by the referral process.  You can assign more than one manufacturer per dealership.
	<p>
	If you do not find the dealer you are searching, please contact us at <b class="td_header">info@digitalcars.com</b> and submit
	in the e-Mail, the dealer name, location, phone number and any other information that will allow us to
	validate the dealer and add it to the directory.
	<hr size="1">
</td></TR>
</table>

<form method=post action="DealerDetail.cfm">
<table width="768" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="2">
	<select name="DL_Index">
	<cfoutput query="getDealers">
	<option value="#DL_Index#">#Name# (#City#, #State#)</option>
	</cfoutput>
	</select>
	</td>
</tr>

<tr>
	<td colspan="2"><input type=submit value="Select Dealer"></td>
</tr>


</table>
</form>



<cfinclude template="../_footer.cfm">