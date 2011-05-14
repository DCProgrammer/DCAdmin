<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfquery name="qMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT top 100 *
	FROM         Members
</cfquery>

<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=zipcount.csv">
<CFCONTENT type="text/csv">


<!--- Output Column Headers --->
<cfset colHeaders = "LastName,FirstName,addr1,addr2,city,state,zip,homephone,bphone,email" />

<cfset colHeaders = Replace(colHeaders, ",", chr(delim), All) />

<cfoutput>#colHeaders##chr(13)#</cfoutput> <!--- line break after column header --->

<!--- Spill out data from a query --->
<cfoutput query="getmembers">#LastName##chr(delim)##FirstName##chr(delim)##addr1##chr(delim)##addr2##chr(delim)##city##chr(delim)##state##chr(delim)##zip##chr(delim)##homephone##chr(delim)##bphone##chr(delim)##email##chr(13)#</cfoutput>