<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->
<!--- use pipe instead for text file --->
<cfset delim = 124>
<!---
<cfquery name="qMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT count(*)
	FROM         Members
	where lastname <> '' and firstname <> ''
</cfquery>
<cfdump var=#qMember#>
<cfabort>
--->

<!--- split into two --->
<cfquery name="qMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT LastName,FirstName,addr1,addr2,city,state,zip,homephone,bphone,email
	FROM         Members
	where lastname <> '' and firstname <> ''
	and lastname < 'n'
	group by LastName,FirstName,addr1,addr2,city,state,zip,homephone,bphone,email
	order by lastname, firstname
</cfquery>

<!---<cfdump var=#qMember#><cfabort>--->

<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=member.txt">
<CFCONTENT type="text/csv">


<!--- Output Column Headers --->
<cfset colHeaders = "LastName,FirstName,addr1,addr2,city,state,zip,homephone,bphone,email" />

<cfset colHeaders = Replace(colHeaders, ",", chr(delim), "All") />

<cfoutput>#colHeaders##chr(13)#</cfoutput> <!--- line break after column header --->

<!--- Spill out data from a query --->
<cfoutput query="qMember">#LastName##chr(delim)##FirstName##chr(delim)##addr1##chr(delim)##addr2##chr(delim)##city##chr(delim)##state##chr(delim)##zip##chr(delim)##homephone##chr(delim)##bphone##chr(delim)##email##chr(13)##chr(10)#</cfoutput>

</cfcontent>