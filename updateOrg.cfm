<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<cfif not isDefined("WebSite")>
<cfset WebSite="">
</cfif>

<cfif isDefined("City")>
<cfif isDefined("Zip")>
<cfif Len(Zip) gte 5>
<cfif Trim(City) is "">
<cfquery name="getCity" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
select City from ZipsToCoords where ZipCode="#Mid(Zip,1,5)#"
</cfquery>
<cfset City=getCity.City>
</cfif>
<cfif Trim(State) is "">
<cfquery name="getState" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
select State from ZipsToCoords where ZipCode="#Mid(Zip,1,5)#"
</cfquery>
<cfset State=getState.State>
</cfif>
</cfif>
</cfif>
</cfif>

<body>
<cfquery name="updateOrg" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE Organiza
SET
<cfif isDefined("Name2")>NAME2="#NAME2#",</cfif>
<cfif isDefined("Addr1")>ADDR1="#ADDR1#",</cfif>
<cfif isDefined("Division")>DIVISION="#DIVISION#",</cfif>
<cfif isDefined("Addr2")>ADDR2="#ADDR2#",</cfif>
<cfif isDefined("City")>CITY="#CITY#",</cfif>
<cfif isDefined("State")>STATE="#STATE#",</cfif>
<cfif isDefined("Zip")>ZIP="#ZIP#",</cfif>
<cfif isDefined("Contact")>CONTACT="#CONTACT#",</cfif>
<cfif isDefined("Contact2")>CONTACT2="#CONTACT2#",</cfif>
<cfif isDefined("Bill_Org")>BILL_ORG="#BILL_ORG#",</cfif>
<cfif isDefined("Fax_1Phone")>FAX_1PHONE="#FAX_1PHONE#",</cfif>
<cfif isDefined("B_Phone")>B_PHONE="#B_PHONE#",</cfif>
<cfif isDefined("Join_Date")>JOIN_DATE="#JOIN_DATE#",</cfif>
<cfif isDefined("Annual_Fee")>ANNUAL_FEE="#ANNUAL_FEE#",</cfif>
<cfif isDefined("Month_Fee")>MONTH_FEE="#MONTH_FEE#",</cfif>
<cfif isDefined("Quart_Fee")>QUART_FEE="#QUART_FEE#",</cfif>
<cfif isDefined("Mem_Number")>MEM_NUMBER="#MEM_NUMBER#",</cfif>
<cfif isDefined("Sales_Rep")>SALES_REP="#SALES_REP#",</cfif>
<cfif isDefined("Status")>STATUS="#STATUS#",</cfif>
<cfif isDefined("Follow_Dat")>FOLLOW_DAT="#FOLLOW_DAT#",</cfif>
<cfif isDefined("Follow_Com")>FOLLOW_COM="#FOLLOW_COM#",</cfif>
<cfif isDefined("Unappl_Cas")>UNAPPL_CAS="#UNAPPL_CAS#",</cfif>
<cfif isDefined("Org_Type")>ORG_TYPE="#ORG_TYPE#",</cfif>
<cfif isDefined("Book_Order")>BOOK_ORDER="#BOOK_ORDER#",</cfif>
<cfif isDefined("Book_Ar")>BOOK_AR="#BOOK_AR#",</cfif>
<cfif isDefined("Book_Sent")>BOOK_SENT="#BOOK_SENT#",</cfif>
<cfif isDefined("SH_Name")>SH_NAME="#SH_NAME#",</cfif>
<cfif isDefined("SH_Addr1")>SH_ADDR1="#SH_ADDR1#",</cfif>
<cfif isDefined("SH_Addr2")>SH_ADDR2="#SH_ADDR2#",</cfif>
<cfif isDefined("SH_City")>SH_CITY="#SH_CITY#",</cfif>
<cfif isDefined("SH_Zip")>SH_ZIP="#SH_ZIP#",</cfif>
<cfif isDefined("SH_State")>SH_STATE="#SH_STATE#",</cfif>
<cfif isDefined("Email")>EMAIL="#EMAIL#",</cfif>
<cfif isDefined("BP_Ext")>BP_EXT="#BP_EXT#",</cfif>
<cfif isDefined("LoanAgt")>LOANAGT="#LOANAGT#",</cfif>
<cfif isDefined("ShipTo")>SHIPTO="#SHIPTO#",</cfif>
<cfif isDefined("Determ")>DETERM="#DETERM#",</cfif>
NAME="#NAME#"

WHERE Organizati="#Org#"

</cfquery>

<cfquery name="checkAddit" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from OrgsAddit where Org="#ORG#"
</cfquery>

<cfif checkAddit.recordCount gt 0>
<cfquery name="updateAddit" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE OrgsAddit
SET
<cfif isDefined("ContactEmail")>
ContactEmail="#ContactEmail#",
</cfif>
<cfif isDefined("NumEmployees")>
<cfif NumEmployees is not "">
numEmployees=#NumEmployees#,
</cfif>
</cfif>
<cfif isDefined("Intranet")>
internalSite=1,
<cfelse>
internalSite=0,
</cfif>
<cfif isDefined("distribution")>
distributionMethod="##",
</cfif>
<cfif isDefined("BenifitDate")>
nextBenifitDate="##",
</cfif>
WebSite="#Website#"
where Org="#Org#"
</cfquery>
<cfelse>
<cfquery name="insertAddit" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO OrgsAddit (Org,
<cfif isDefined("ContactEmail")>
ContactEmail,
</cfif>
<cfif isDefined("NumEmployees")>
<cfif NumEmployees is not "">
numEmployees,
</cfif>
</cfif>
<cfif isDefined("Website")>
Website,
</cfif>
<cfif isDefined("distribution")>
distributionMethod,
</cfif>
<cfif isDefined("BenifitDate")>
nextBenifitDate,
</cfif>
internalSite)
values
("#Org#",
<cfif isDefined("ContactEmail")>
"#ContactEmail#",
</cfif>
<cfif isDefined("NumEmployees")>
<cfif NumEmployees is not "">
#numEmployees#,
</cfif>
</cfif>
<cfif isDefined("Website")>
"#Website#",
</cfif>
<cfif isDefined("distribution")>
"#distribution#",
</cfif>
<cfif isDefined("BenifitDate")>
"#BenifitDate#",
</cfif>
<cfif isDefined("Intranet")>1<cfelse>0</cfif>
)
</cfquery>
</cfif>

<cflocation url="orgSearch.cfm?pattern=#URLEncodedFormat(Org)#&srchBy=OnlyID&DoSearch=1">
</body>
</html>
