<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfparam name="FORM.toScreen" Default="YES">



<!--- check for csv --->
<cfif (isDefined("myZip")) AND (FORM.toScreen EQ "NO")>


	<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=output.csv">
	<CFCONTENT type="text/csv">


	<!--- Set Column Headers --->
	<cfset sLabelRow = "Miles,Count,Name,Home Phone,Work Phone,Address,City,State,Zip,Email" />

	<!--- build data rows --->
	<cfset sDataRows = "" />

	<cfloop index=zipIndex from=#distance# to=3 step="-3">
		<cfset OldZipList="0">
		<cfif zipIndex gt 3>
			<cfset olddistance=distance-3>
			<cf_CreateZipList zipCode=#myZip# distance=#olddistance#>
			<cfset OldZipList=ZipList>
		</cfif>
		<cf_CreateZipList zipCode=#myZip# distance=#distance#>
		<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		select org,FirstName,LastName,Addr1,City,State,Zip,HomePhone,BPhone,Email from Members
			where SubString(Zip,1,5) in (#ZipList#)
			AND SubString(Zip,1,5) not in (#OldZipList#)
			and org not in (select org from tempOrgsExclusion)
			<cfif not isDefined("fullList")>
			and email!=""
			</cfif>
			order by City
		</cfquery>


		<cfloop query="getmembers">
			<cfset sDataRows = sDataRows & zipIndex & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.recordcount & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.ORG & " " & getMembers.FirstName & " " & getMembers.LastName & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.HomePhone & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.BPhone & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.Addr1 & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.City & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.State & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.Zip & chr(delim) />
			<cfset sDataRows = sDataRows & getMembers.Email & chr(13) />
		</cfloop>

	</cfloop>

	<!--- build csv --->
	<cfset sCSV = sLabelRow & chr(13) & sDataRows />

	<cfoutput>#sCSV#</cfoutput>


<cfelse>
	<!--- output to screen --->

<cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>List Members</title>

<SCRIPT LANGUAGE="javascript">

function open_digital(page) { var msie=false; var appName=navigator.appName;
if(appName.indexOf("Microsoft")==0) msie=true;
DC_window=window.open(page, "DC_window",
"width=390,height=300,status=0, resizable=no,menubar=no,scrollbars=yes,toolbar=no,location=0,menubar=no");
if(!msie) DC_window.focus(); }

</SCRIPT>
</head>

<body>
<table border="0">
<tr><td>
OUTPUT DOES NOT INCLUDE ANY ORGANIZATION IN EXCLUSION LIST.
<A href="javascript:open_digital('OrgExclustionList.cfm');">VIEW</a>
</td></tr>
</table>

<cfif not isDefined("myZip")>
	<form method=post action=MembersAroundZip.cfm>
	Zip: <input type=text name="myZip"><br>
	Include Members without email: <input type=checkbox name="fullList">
	distance: <br>
	<input type=radio name=distance value=3 checked> 0-3 miles <br>
	<input type=radio name=distance value=6> 3-6 miles <br>
	<input type=radio name=distance value=9> 6-9 miles<br>
	<input type=radio name=distance value=12> 9-12 miles <br>

	<input type=submit> &nbsp;&nbsp;&nbsp; <input type="checkbox" name="toScreen" value="NO"> Output to CSV
	</form>
</cfif>

<cfif isDefined("myZip")>
	ZipCode: #myZip#<br>
	<cfif isDefined("fullList")>
		(Including members without emails)<br>
	</cfif>
	<cfloop index=zipIndex from=#distance# to=3 step="-3">
		<cfset OldZipList="0">
		<cfif zipIndex gt 3>
			<cfset olddistance=distance-3>
			<cf_CreateZipList zipCode=#myZip# distance=#olddistance#>
			<cfset OldZipList=ZipList>
		</cfif>
		<cf_CreateZipList zipCode=#myZip# distance=#distance#>
		<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		select org,FirstName,LastName,Addr1,City,State,Zip,HomePhone,BPhone,Email from Members
			where SubString(Zip,1,5) in (#ZipList#)
			AND SubString(Zip,1,5) not in (#OldZipList#)
			and org not in (select org from tempOrgsExclusion)
			<cfif not isDefined("fullList")>
			and email!=""
			</cfif>
			order by City
		</cfquery>
		<table>

		<tr><td colspan=4>
		<font size=-2>
		Distance: #zipIndex# miles<br>
		Count: #getmembers.recordCount#<br>
		</td></tr>

		<tr><td>Name</td><td>HomePhone</td><td>Work Phone<td>Address</td><td>City, State Zip</td><td>Email</td></tr>
		<hr>
		<cfloop query="getMembers">
		<tr><td>
		<font size=-2>#ORG#&nbsp;
		#FirstName# #LastName#</td>
		<td>
		<font size=-2>
		 #HomePhone#</td>
		<td>
		<font size=-2>
		 #BPhone#</td>
		<td>
		<font size=-2>
		#Addr1#</td>
		<td>
		<font size=-2>
		#City#, #State# #Zip#</td>
		<td>
		<font size=-2>
		#Email#
		</td>
		</tr>
		</cfloop>
		</table>
	</cfloop>
</cfif>

</body>
</html>
</cfoutput>

</cfif>
