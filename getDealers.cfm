<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfparam name="FORM.State" Default="">
<cfparam name="FORM.Zip" Default="">
<cfparam name="FORM.DealerName" Default="">
<cfparam name="FORM.Search" Default="NO">
<cfparam name="FORM.toScreen" Default="YES">

<cfif FORM.Search EQ "Yes">
	<cfquery name="getDealers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT     *
	FROM         DCDealers
	WHERE     1 = 1
	<cfif isDefined("FORM.State") AND FORM.State NEQ "">AND (State = '#FORM.State#')</cfif>
	<cfif isDefined("FORM.DealerName") AND FORM.DealerName NEQ "">AND Name = '#FORM.DealerName#'</cfif>
	<cfif isDefined("FORM.Zip") AND FORM.Zip NEQ "">AND (Zip like '#FORM.Zip#%')</cfif>
	ORDER BY Name, State, City
	</cfquery>
</cfif>

<!--- check for csv output --->
<cfif (FORM.Search EQ "Yes") AND (FORM.toScreen EQ "NO")>


	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=output.csv">
	<CFCONTENT type="text/csv">

	<!--- Output Column Headers --->
	<cfoutput>#chr(delim)#DealerID#chr(delim)#Name#chr(delim)#Addr1#chr(delim)#Addr2#chr(delim)#City#chr(delim)#State#chr(delim)#Zip#chr(delim)#Phone#chr(delim)#Ext#chr(delim)#Fax#chr(delim)#AnnualFee#chr(delim)#MonthFee#chr(delim)#QuartFee#chr(delim)#Contact#chr(delim)#Division#chr(delim)#Report#chr(delim)#Lead#chr(delim)#Bill#chr(delim)#GM#chr(delim)#JoinDate#chr(delim)#Bill_Deal#chr(delim)#FaxExt#chr(delim)#Owner#chr(delim)#CertFee#chr(delim)#Payment#chr(delim)#Follow_Date#chr(delim)#Follow_Comment#chr(delim)#Unappl_CAS#chr(delim)#Book_Order#chr(delim)#Contact2#chr(delim)#SalesRep#chr(delim)#Book_AR#chr(delim)#Doc_Fee#chr(delim)#Contact3#chr(delim)#BookVent#chr(delim)#Store#chr(delim)#Status#chr(delim)#Signature#chr(delim)#Program#chr(delim)#Email#chr(delim)#LoanAgent#chr(delim)#MFGCodes#chr(delim)#Banner</cfoutput>

	<cfoutput>#chr(13)#</cfoutput> <!--- line break after column header --->

	<!--- Spill out data from a query --->
	<cfoutput query="getDealers">#getDealers.DealerID##chr(delim)##getDealers.Name##chr(delim)##getDealers.Addr1##chr(delim)##getDealers.Addr2##chr(delim)##getDealers.City##chr(delim)##getDealers.State##chr(delim)##getDealers.Zip##chr(delim)##getDealers.Phone##chr(delim)##getDealers.Ext##chr(delim)##getDealers.Fax##chr(delim)##getDealers.AnnualFee##chr(delim)##getDealers.MonthFee##chr(delim)##getDealers.QuartFee##chr(delim)##getDealers.Contact##chr(delim)##getDealers.Division##chr(delim)##getDealers.Report##chr(delim)##getDealers.Lead##chr(delim)##getDealers.Bill##chr(delim)##getDealers.GM##chr(delim)##getDealers.JoinDate##chr(delim)##getDealers.Bill_Deal##chr(delim)##getDealers.FaxExt##chr(delim)##getDealers.Owner##chr(delim)##getDealers.CertFee##chr(delim)##getDealers.Payment##chr(delim)##getDealers.Follow_Date##chr(delim)##getDealers.Follow_Comment##chr(delim)##getDealers.Unappl_CAS##chr(delim)##getDealers.Book_Order##chr(delim)##getDealers.Contact2##chr(delim)##getDealers.SalesRep##chr(delim)##getDealers.Book_AR##chr(delim)##getDealers.Doc_Fee##chr(delim)##getDealers.Contact3##chr(delim)##getDealers.BookVent##chr(delim)##getDealers.Store##chr(delim)##getDealers.Status##chr(delim)##getDealers.Signature##chr(delim)##getDealers.Program##chr(delim)##getDealers.Email##chr(delim)##getDealers.LoanAgent##chr(delim)##getDealers.MFGCodes##chr(delim)##getDealers.Banner##chr(delim)##chr(13)#</cfoutput>

	<cfabort>
<cfelse>
	<cfoutput>

	<form action="GetDealers.cfm" name="GetDealers" method="post">
	<input type="hidden" name="Search" value="Yes">
	<input type="hidden" name="toScreen" value="Yes">

		State:<input type="text" name="state">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Zip:<input type="text" name="zip">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Start Join Date (MM/DD/YYYY):<input type="text" name="joindate">
	<br><br>

		<a href="##" onclick="javascript:document.GetDealers.submit() ;">Click Here to Get Dealer List</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="##" onclick="javascript:document.GetDealers.toScreen.value='NO';document.GetDealers.submit() ;">Generate CSV from results</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="getDealers.cfm">Rest Form</a>
	</form>
	<cfif FORM.Search EQ "Yes">

	#getDealers.RecordCount# Records Returned
	<table cellpadding="10" border="1">
		<tr>
				<td>DealerID</td>
				<td>Name</td>
				<td>Addr1</td>
				<td>Addr2</td>
				<td>City</td>
				<td>State</td>
				<td>Zip</td>
				<td>Phone</td>
				<td>Ext</td>
				<td>Fax</td>
				<td>AnnualFee</td>
				<td>MonthFee</td>
				<td>QuartFee</td>
				<td>Contact</td>
				<td>Division</td>
				<td>Report</td>
				<td>Lead</td>
				<td>Bill</td>
				<td>GM</td>
				<td>JoinDate</td>
				<td>Bill_Deal</td>
				<td>FaxExt</td>
				<td>Owner</td>
				<td>CertFee</td>
				<td>Payment</td>
				<td>Follow_Date</td>
				<td>Follow_Comment</td>
				<td>Unappl_CAS</td>
				<td>Book_Order</td>
				<td>Contact2</td>
				<td>SalesRep</td>
				<td>Book_AR</td>
				<td>Doc_Fee</td>
				<td>Contact3</td>
				<td>BookVent</td>
				<td>Store</td>
				<td>Status</td>
				<td>Signature</td>
				<td>Program</td>
				<td>Email</td>
				<td>LoanAgent</td>
				<td>MFGCodes</td>
				<td>Banner</td>
		</tr>
	<cfloop query="getDealers">
	<cfif getDealers.CurrentRow MOD 2>
		<cfset BGC = "F5F5F5">
	<cfelse>
		<cfset BGC = "FFFFFF">
	</cfif>
	<tr bgcolor="###BGC#">
				<td>#getDealers.DealerID#</td>
				<td>#getDealers.Name#</td>
				<td>#getDealers.Addr1#</td>
				<td>#getDealers.Addr2#</td>
				<td>#getDealers.City#</td>
				<td>#getDealers.State#</td>
				<td>#getDealers.Zip#</td>
				<td>#getDealers.Phone#</td>
				<td>#getDealers.Ext#</td>
				<td>#getDealers.Fax#</td>
				<td>#getDealers.AnnualFee#</td>
				<td>#getDealers.MonthFee#</td>
				<td>#getDealers.QuartFee#</td>
				<td>#getDealers.Contact#</td>
				<td>#getDealers.Division#</td>
				<td>#getDealers.Report#</td>
				<td>#getDealers.Lead#</td>
				<td>#getDealers.Bill#</td>
				<td>#getDealers.GM#</td>
				<td>#getDealers.JoinDate#</td>
				<td>#getDealers.Bill_Deal#</td>
				<td>#getDealers.FaxExt#</td>
				<td>#getDealers.Owner#</td>
				<td>#getDealers.CertFee#</td>
				<td>#getDealers.Payment#</td>
				<td>#getDealers.Follow_Date#</td>
				<td>#getDealers.Follow_Comment#</td>
				<td>#getDealers.Unappl_CAS#</td>
				<td>#getDealers.Book_Order#</td>
				<td>#getDealers.Contact2#</td>
				<td>#getDealers.SalesRep#</td>
				<td>#getDealers.Book_AR#</td>
				<td>#getDealers.Doc_Fee#</td>
				<td>#getDealers.Contact3#</td>
				<td>#getDealers.BookVent#</td>
				<td>#getDealers.Store#</td>
				<td>#getDealers.Status#</td>
				<td>#getDealers.Signature#</td>
				<td>#getDealers.Program#</td>
				<td>#getDealers.Email#</td>
				<td>#getDealers.LoanAgent#</td>
				<td>#getDealers.MFGCodes#</td>
				<td>#getDealers.Banner#</td>
		</tr>
	<cfflush>
	</cfloop>
	</cfif>
	<a href="index.cfm">Back to DCAdmin</a>

</cfoutput>
</cfif>