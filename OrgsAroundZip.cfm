<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->

<cfparam name="FORM.toScreen" Default="YES">

<cfif not isDefined("maxDistance")>
	<cfset maxDistance="15">
</cfif>

<cfif not isDefined("Sales_Rep")><cfset Sales_Rep="All"></cfif>

<cfquery name="getReps" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Sales_Rep from Organiza order by Sales_Rep
</cfquery>

<!--- check for csv output --->
<cfif (isdefined("doSearch")) AND (FORM.toScreen EQ "NO")>
	<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->


	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=output.csv">
	<CFCONTENT type="text/csv">


	<!--- Set Column Headers --->
	<cfset sLabelRow = "Name,Contact,Contact2,B_Phone,Address,City,State,Zip,Email" />

	<cfset OldZipList="0">
	<cfset sDataRows = "" />

	<cfloop from=5 to=#maxDistance# step=5 index=distance>
		<cfif distance gt 5>
			<cfset olddistance=distance-5>
			<cf_CreateZipList zipCode=#myZip# distance=#olddistance#>
			<cfset OldZipList=ZipList>
		<cfelse>
			<cfset OldZipList="">
		</cfif>
		<cf_CreateZipList zipCode=#myZip# distance=#distance#>

		<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		select org=Organizati,name,Addr1,City,State,Zip,Contact,Contact2,B_Phone,Email from Organiza
			where SubString(Zip,1,5) in (#ZipList#)
			<cfif OldZipList is not "">
			AND SubString(Zip,1,5) not in (#OldZipList#)
			</cfif>
			<cfif isDefined("IKnowWhy")>
			and SubString(organizati,1,1)!="2"
			and SubString(organizati,1,1)!="0"
			</cfif>
			and Status!="I"
			<cfif Sales_Rep is not 'All'>
			and Sales_Rep='#SALES_REP#'
			</cfif>
			order by City
		</cfquery>


		<cfloop query="getOrgs">
			<cfset sDataRows = sDataRows & getOrgs.Name & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.Contact & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.Contact2 & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.B_Phone & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.Addr1 & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.City & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.State & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.Zip & chr(delim) />
			<cfset sDataRows = sDataRows & getOrgs.Email & chr(13) />
		</cfloop>

	</cfloop>

	<cfset sCSV = sLabelRow & chr(13) & sDataRows />

	<cfoutput>#sCSV#</cfoutput>
</cfif>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>





<form method=post action=OrgsAroundZip.cfm>
	<input type=hidden name="doSearch" value="1">

Zip: <input type=text name="myZip"><br>

Distance: <input type=text name="maxDistance" value="#maxDistance#"> (must be multiple of 5)

Sales Rep: <select name="Sales_Rep">
<option value='All'>All</option>
<cfloop query="getReps">
	<option value='#SALES_REP#'>#SALES_REP#</option>
</cfloop>
</select>
<br>
<input type=submit value="Search">
  Press enter to run

  <br><br><input type=submit value="Search">
	&nbsp;&nbsp;&nbsp; <input type="checkbox" name="toScreen" value="NO"> Output to CSV

</form>

<cfif isDefined("myZip")>
	ZipCode: #myZip#<br>

	<cfset OldZipList="0">
	<cfloop from=5 to=#maxDistance# step=5 index=distance>
		<cfif distance gt 5>
			<cfset olddistance=distance-5>
			<cf_CreateZipList zipCode=#myZip# distance=#olddistance#>
			<cfset OldZipList=ZipList>
		<cfelse>
			<cfset OldZipList="">
		</cfif>
		<cf_CreateZipList zipCode=#myZip# distance=#distance#>
		<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		select org=Organizati,name,Addr1,City,State,Zip,Contact,Contact2,B_Phone,Email from Organiza
			where SubString(Zip,1,5) in (#ZipList#)
			<cfif OldZipList is not "">
			AND SubString(Zip,1,5) not in (#OldZipList#)
			</cfif>
			<cfif isDefined("IKnowWhy")>
			and SubString(organizati,1,1)!="2"
			and SubString(organizati,1,1)!="0"
			</cfif>
			and Status!="I"
			<cfif Sales_Rep is not 'All'>
			and Sales_Rep='#SALES_REP#'
			</cfif>
			order by City
		</cfquery>

	<table>

	<tr><td colspan=4>
	<font size=-2>
	Distance: #distance# miles
	</td></tr>

	<hr>
	<cfif getOrgs.recordCount gt 0>


	<form method=post action="mailMergeList.cfm">
	<input type=submit value="Mail Merge List">
	<cfloop query="getOrgs">
	<tr><td><input type=checkbox name=Org value="#Org#"></td><td>
	<font size=-2>
	<a href="orgSearch.cfm?Pattern=#Org#&srchBy=OnlyID&doSearch=1">#Name#</a></td>
	<td>
	<font size=-2>
	#Contact#<cfif (Contact2 is not "") and (Contact2 is not Contact)>,#Contact2#</cfif> - #B_Phone#</td>
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
	</form>
</cfif>
</table>
</cfloop>
</cfif>


</body>
</html>
</cfoutput>