<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfparam name="FORM.State" Default="">
<cfparam name="FORM.Zip" Default="">
<cfparam name="FORM.JoinDate" Default="">
<cfparam name="FORM.Search" Default="NO">
<cfparam name="FORM.hasEmail" Default="Yes">

<!--- perform query if form was submitted --->
<cfif FORM.Search EQ "Yes">
	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		SELECT     Zip, COUNT(*) AS zipcount
		FROM         Members
		WHERE 1 = 1
		<cfif FORM.hasEmail EQ "Yes">
			AND (Email <> '')
		<cfelseif FORM.hasEmail EQ "No">
			AND (Email = '')
		</cfif>
		AND (Org NOT IN (SELECT org FROM  tempOrgsExclusion))
		<cfif FORM.State NEQ "">
			AND (State = '#FORM.State#')
		</cfif>
		<cfif FORM.JoinDate NEQ "">
			AND (JoinDate > '#FORM.JoinDate#')
		</cfif>
		<cfif FORM.Zip NEQ "">
			AND (Zip like '#FORM.Zip#%')
		</cfif>
		GROUP BY Zip
		ORDER BY Zip
	</cfquery>

</cfif>



<!--- HTML begin --->
<!--- display results if the form was submitted --->
<cfif FORM.Search EQ "Yes">

<!---
	<cfcontent type="application/msexcel">
	<cfheader name="Content-Disposition" value="filename=zipcount.csv">
--->
<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=zipcount.csv">
<CFCONTENT type="text/csv">

	<!--- Output Column Headers --->
	<cfoutput>Zip#chr(delim)#Count</cfoutput>

	<cfoutput>#chr(13)#</cfoutput> <!--- line break after column header --->

	<!--- Spill out data from a query --->
	<cfoutput query="getmembers">#Zip##chr(delim)##zipcount##chr(13)#</cfoutput>

<cfelse>

	<cfoutput>
	<form action="GetMembers_zipcount.cfm" name="getmembers" method="post">
		State:<input type="text" name="state">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Zip:<input type="text" name="zip">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Start Join Date (MM/DD/YYYY):<input type="text" name="joindate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Has an email Yes-<input type="Radio" name="hasEmail" value="Yes" checked>&nbsp;&nbsp;&nbsp;&nbsp;
		No-<input type="Radio" name="hasEmail" value="No">&nbsp;&nbsp;&nbsp;&nbsp;
		Both-<input type="Radio" name="hasEmail" value="Both">
	<br><br>
	<input type="hidden" name="Search" value="Yes">
		<a href="##" onclick="javascript:document.getmembers.submit() ;">Click Here to Get Member List</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="getMembers.cfm">Rest Form</a>
	</form>
	</cfoutput>
</cfif>



