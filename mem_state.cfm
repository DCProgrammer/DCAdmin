<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->
<!--- use pipe instead for text file --->
<cfset delim = 124>

<cfparam name="form.state" default="" />

<!---
<cfquery name="qMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT top 10 *
	FROM         Members
	where lastname <> '' and firstname <> ''
	and zip <> '' and zip is not null
</cfquery>
<cfdump var=#qMember#>
<cfabort>
--->

<cfif (form.state NEQ "")>
	<!--- split into two --->
	<cfquery name="qMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		SELECT
			 rtrim(ltrim(LastName)) as lastname
			,rtrim(ltrim(FirstName)) as firstname
			,rtrim(ltrim(addr1)) as addr1
			,rtrim(ltrim(addr2)) as addr2
			,rtrim(ltrim(city)) as city
			,rtrim(ltrim(state)) as state
			,rtrim(ltrim(zip)) as zip
			,rtrim(ltrim(homephone)) as homephone
			,rtrim(ltrim(bphone)) as bphone
			,rtrim(ltrim(email)) as email
		FROM         Members
		where lastname <> '' and firstname <> ''
		<cfif (form.state EQ "ALLOTHERS")>
			and rtrim(ltrim(state)) NOT IN ('FL','IN','IL','MN','PA')
		<cfelse>
			and rtrim(ltrim(state)) = '#form.state#'
		</cfif>
			group by
			 rtrim(ltrim(LastName))
			,rtrim(ltrim(FirstName))
			,rtrim(ltrim(addr1))
			,rtrim(ltrim(addr2))
			,rtrim(ltrim(city))
			,rtrim(ltrim(state))
			,rtrim(ltrim(zip))
			,rtrim(ltrim(homephone))
			,rtrim(ltrim(bphone))
			,rtrim(ltrim(email))
		order by lastname,firstname
	</cfquery>


	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=mem_#form.state#.txt">
	<CFCONTENT type="text/csv">


	<!--- Output Column Headers --->
	<cfset colHeaders = "LastName,FirstName,addr1,addr2,city,state,zip,homephone,bphone,email" />

	<cfset colHeaders = Replace(colHeaders, ",", chr(delim), "All") />

	<cfoutput>#colHeaders##chr(13)#</cfoutput> <!--- line break after column header --->

	<!--- Spill out data from a query --->
	<cfoutput query="qMember">#LastName##chr(delim)##FirstName##chr(delim)##addr1##chr(delim)##addr2##chr(delim)##city##chr(delim)##state##chr(delim)##zip##chr(delim)##homephone##chr(delim)##bphone##chr(delim)##email##chr(13)##chr(10)#</cfoutput>

	</cfcontent>
	<cfabort>
</cfif>

<cfoutput>
<form action="mem_state.cfm" name="mem" method="post">
	State:
	<select name="state">
		<option value="" selected>(Choose State)</option>
		<option value="FL">Florida</option>
		<option value="IN">Indiana</option>
		<option value="IL">Illinois</option>
		<option value="MN">Minnesota</option>
		<option value="PA">Pennsylvania</option>
		<option value="ALLOTHERS">(All others)</option>
	</select>

<br><br>
<input type="submit" value="Get Members">

</form>
</cfoutput>