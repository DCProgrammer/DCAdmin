<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->

<cfparam name="FORM.toScreen" Default="YES">


<cfif isdefined("doSearch")>
	<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT Organizati, Name, Addr1, City, State, Zip, Email, Name2, Addr2, Division,Contact,Contact2,ContactEmail,
	Bill_Org, Fax_1Phone, NumEmployees, Website, Intranet=internalSite, BenifitDate=nextBenifitDate,distribution=distributionMethod,
	B_Phone, BP_EXT, Join_Date, Annual_Fee, Month_Fee, Quart_Fee, Mem_Number, Sales_Rep, Status,
	Follow_Dat, Follow_Com, Unappl_Cas, Org_Type, Book_Order, Book_AR, Book_Sent, SH_Name, SH_Addr1,
	SH_Addr2, SH_City, SH_State, SH_Zip, LoanAgt, ShipTo, Determ from Organiza A, OrgsAddit B
	where A.Organizati*=B.Org
	<cfif srchBy is "Name">
	and name like "%#Pattern#%"
	</cfif>
	<cfif srchBy is "ID">
	and ORGANIZATI LIKE "%#PATTERN#%"
	</cfif>
	<cfif srchBy is "OnlyID">
	and ORGANIZATI="#Pattern#"
	</cfif>
	</cfquery>
</cfif>


<!--- check for csv output --->
<cfif (isdefined("doSearch")) AND (FORM.toScreen EQ "NO")>

	<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=output.csv">
	<CFCONTENT type="text/csv">

	<!--- Set Column Headers --->
	<cfset sLabelRow = "id,Name,Address,City,State,Zip,Email" />

	<!--- build data rows --->
	<cfset sDataRows = "" />
	<cfloop query="getOrgs">
		<cfset sDataRows = sDataRows & getOrgs.ORGANIZATI & chr(delim) />
		<cfset sDataRows = sDataRows & getOrgs.Name & chr(delim) />
		<cfset sDataRows = sDataRows & getOrgs.Addr1 & chr(delim) />
		<cfset sDataRows = sDataRows & getOrgs.City & chr(delim) />
		<cfset sDataRows = sDataRows & getOrgs.State & chr(delim) />
		<cfset sDataRows = sDataRows & getOrgs.Zip & chr(delim) />
		<cfset sDataRows = sDataRows & getOrgs.Email & chr(13) />
	</cfloop>
	<!--- build csv --->
	<cfset sCSV = sLabelRow & chr(13) & sDataRows />

	<cfoutput>#sCSV#</cfoutput><cfabort>
<cfelse>

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

	<html>
	<head>
		<title>Search Organizations</title>
	</head>

	<body>


	<form method=post action="orgSearch.cfm">
	Enter Search Pattern
	<cfif not isDefined("Pattern")>
	<cfset Pattern="">
	</cfif>
	<input type=text name=Pattern value="#Pattern#"><br>
	<cfif isDefined("Session.searchBy")>
	<cfif not isDefined("srchBy")>
	<cfset srchBy=Session.searchBy>
	</cfif>
	</cfif>
	<cfif not isdefined("srchBy")><cfset srchBy="Name"></cfif>
	<cfset Session.searchBy=srchBy>
	<input type=radio name=srchBy value=Name <cfif srchBy is "Name">checked</cfif>>Search By Name<br>
	<input type=radio name=srchBy value=ID <cfif (srchBy is "ID") or (srchBy is "OnlyID")>checked</cfif>>Search By ID<br>
	<input type=hidden name="doSearch" value="1">
	<input type=submit value="Search">
	&nbsp;&nbsp;&nbsp; <input type="checkbox" name="toScreen" value="NO"> Output to CSV
	</form>




	<cfif isdefined("doSearch")>

	<cfif getOrgs.recordCount gt 1>
		<table border=1>
		<tr><td>ID</td><td>Name</td><td>Address</td><td>Email</td></tr>
		<cfloop query="getOrgs">
		<tr><td><a href="orgSearch.cfm?Pattern=#ORGANIZATI#&srchBy=OnlyID&doSearch=1">#ORGANIZATI#</a></td>
		<td>#Name#</td>
		<td>#Addr1#<br>#City#, #State#  #Zip#</td>
		<td>#Email#</td>
		</tr>
		</cfloop>
		</table>
	<cfelse>
		<cfif getOrgs.recordCount is 0>
			No Records Found(<a href="addOrg.cfm?Name=#URLEncodedFormat(Pattern)#">add #Pattern#</a>)
		<cfelse>
	<cfloop query="getOrgs">
	<form method=post action="updateOrg.cfm">
	<input type=hidden name=Org value="#Organizati#">
	<table>
	<tr><td>Name: <input type=text name="NAME" size=80 value="#NAME#"> (#ORGANIZATI#)</td></tr>
	<tr><td>Name2 : <input type=text name="Name2" size=80 value="#NAME2#"></td></tr>
	<tr><td></td></tr>
	<tr><td>Address:<input type=text name="Addr1" size=80 value="#Addr1#"></td></tr>
	<tr><td>Address:<input type=text name="Addr2" size=80 value="#ADDR2#"></td></tr>
	<tr><td>City: <input type=text name="City" size=80 value="#City#"></td></tr>
	<tr><td>State: <input type=text name="State" size=2 value="#State#"></td></tr>
	<tr><td>Zip: <input type=text name="Zip" size=10 value="#Zip#"></td></tr>
	<tr><td>Division : <input type=text name="Division" size=80 value="#DIVISION#"></td></tr>
	<tr><td>Contact : <input type=text name="Contact" size=80 value="#CONTACT#"></td></tr>
	<tr><td>Contact2 : <input type=text name="Contact2" size=80 value="#CONTACT2#"></td></tr>
	<tr><td>Contact Email: <input type=text name="ContactEmail" size="255" value="#ContactEmail#"></td></tr>
	<tr><td>Bill_Org : <input type=text name="Bill_Org" size=80 value="#BILL_ORG#"></td></tr>
	<tr><td>Fax : <input type=text name="Fax_1Phone" value="#FAX_1PHONE#"></td></tr>
	<tr><td>Business Phone : <input type=text name="B_Phone" value="#B_PHONE#"></td></tr>
	<tr><td>BP EXT : <input type=text name="BP_EXT" value="#BP_EXT#"></td></tr>
	<tr><td>How many Employees at the organization? <input type=text name="NumEmployees" value="#NumEmployees#"></td></tr>
	<tr><td>Website: <input type=text name="Website" value="#WebSite#"></td></tr>
	<tr><td>Internal site available?  <input type=checkbox name="Intranet" <cfif Intranet is 1>checked</cfif>></td></tr>
	<tr><td>Method(s) of benefit information distribution: <input type=text name="distribution" value="#distribution#"></td></tr>
	<tr><td>Date of next Benefit fair: <input type=text name="BenefitDate" value="#BenifitDate#"></td></tr>
	<tr><td>Sales Rep : <input type=text name="Sales_Rep" value="#SALES_REP#"></td></tr>
	<tr><td>Status : <input type=text name="Status" value="#STATUS#"></td></tr>
	<!--
	<tr><td>Member Number : <input type=text name="Mem_Number" value="#MEM_NUMBER#"></td></tr>
	<tr><td>Join Date : <input type=text name="Join_Date" value="#JOIN_DATE#"></td></tr>
	<tr><td>Follow Up Date : <input type=text name="Follow_Dat" value="#FOLLOW_DAT#"></td></tr>
	<tr><td>Follow Up Com : <input type=text name="Follow_Com" value="#FOLLOW_COM#"></td></tr>
	<tr><td>Annual Fee : <input type=text name="Annual_Fee" value="#ANNUAL_FEE#"></td></tr>
	<tr><td>Month Fee : <input type=text name="Month_Fee" value="#MONTH_FEE#"></td></tr>
	<tr><td>Quartarly Fee : <input type=text name="Quart_Fee" value="#QUART_FEE#"></td></tr>
	<tr><td>Unnapl Cas : <input type=text name="Unnapl_Cas" value="#UNAPPL_CAS#"></td></tr>
	<tr><td>Book Order : <input type=text name="Book_Order" value="#BOOK_ORDER#"></td></tr>
	<tr><td>Book Ar : <input type=text name="Book_Ar" value="#BOOK_AR#"></td></tr>
	<tr><td>Book Sent : <input type=text name="Book_Sent" value="#BOOK_SENT#"></td></tr>
	-->
	<tr><td>Org Type : <input type=text name="Org_Type" value="#ORG_TYPE#"></td></tr>
	<tr><td>SH Name : <input type=text name="SH_Name" size=80 value="#SH_NAME#"></td></tr>
	<tr><td>SH Addr1 : <input type=text name="SH_Addr1" size=80 value="#SH_ADDR1#"></td></tr>
	<tr><td>SH Addr2 : <input type=text name="SH_Addr2" size=80 value="#SH_ADDR2#"></td></tr>
	<tr><td>SH City : <input type=text name="SH_City" size=80 value="#SH_CITY#"></td></tr>
	<tr><td>SH State : <input type=text name="SH_State" size=80 value="#SH_STATE#"></td></tr>
	<tr><td>SH Zip : <input type=text name="SH_ZIP" value="#SH_ZIP#"></td></tr>
	<tr><td>Email : <input type=text name="Email" size="100" value="#EMAIL#"></td></tr>
	<tr><td>Loan Agent : <input type=text name="LOANAGT" value="#LOANAGT#"></td></tr>
	<tr><td>Ship To : <input type=text name="SHIPTO" value="#SHIPTO#"></td></tr>
	<tr><td>Determ : <input type=text name="DETERM" value="#DETERM#"></td></tr>
	<tr><td><input type=submit value="Update Org"></td></tr>
	<cfset MailBody="Text Link: <a href=http://www.ubschicago.com/index.cfm?Org=">
	<cfset MailBody=Insert(ORGANIZATI, MailBody, Len(MailBody))>
	<cfset MailBody=Insert(">Consumer Buying and Finance Service</a>",MailBody,Len(MailBody))>
	<cfset MailBody2="Logo Link: <a href=http://www.ubschicago.com/index.cfm?Org=">
	<cfset MailBody2=Insert(ORGANIZATI, MailBody2, Len(MailBody2))>
	<cfset MailBody2=Insert("><img src=http://www.ubschicago.com/images/ubslogo_50_white.jpg></a>",MailBody2,Len(MailBody2))>
	<cfif Trim(Email) is not "">
	<tr><td><a href="mailto:#Email#&Subject=Link Codes&Content-Type=text/html&Body=#URLEncodedFormat(MailBody)##Chr(13)#
	#URLEncodedFormat(MailBody2)#">Send Link To :#Email#</a></td></tr>
	</cfif>
	<cfif Trim(ContactEmail) is not "">
	<tr><td><a href="mailto:#ContactEmail#&Subject=Link Codes&Content-Type=text/html&Body=#URLEncodedFormat(MailBody)##Chr(13)#
	#URLEncodedFormat(MailBody2)#">Send Link to :#ContactEmail#</a></td></tr>
	</cfif>
	<cfif Trim(ContactEmail) is "" and Trim(Email) is "">
	<tr><td><a href="mailto:&Subject=Link Codes&Content-Type=text/html&Body=#URLEncodedFormat(MailBody)##Chr(13)#
	#URLEncodedFormat(MailBody2)#">Send Link to: Specify Email</a></td></tr>
	</cfif>

	</table>
	</form>
	</cfloop>
	</cfif>

	</cfif>

	</cfif>

	</body>
	</html>
	</cfoutput>
</cfif>
