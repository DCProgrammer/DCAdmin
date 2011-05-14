

<cfset Caller.cfg_MainDB="MainSQL"> 

<cfinclude template = "_header.cfm"> 
<!--- <CFUPDATE tableName="pug_Affliates" datasource="cfg_MainDB" username="digitalcars" password="cars">
</CFUPDATE> --->




<cfquery 
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#" >
UPDATE  Affiliate_Table set

Name = '#vchName#',
Address = '#nvchAddress#',
City = '#nvchCity#',
State = '#vchState#',
Zip = '#vchZip#',
Phone = '#vchPhone#',
Fax = '#vchFax#',
TollFree = '#TollFree#',
Assett_Size = '#AssetSize#',
Member_Size = '#Member_Size#',
President = '#President#',
GeneralEmail = '#vchGeneralEmail#',
URL = '#vchSiteURL#',
ContactName = '#vchContactName#',
ContactTitle = '#vchContactTitle#',
ContactEmail = '#affContactEmail#',
ContactPhone = '#vchContactPhone#',
ContactFax = '#vchContactFax#',

Marketing_Contact='#Marketing_Contact#',
Marketing_Title='#Marketing_Title#',
Marketing_Email='#Marketing_Email#',
Marketing_Phone='#Marketing_Phone#',
Marketing_Fax='#Marketing_Fax#',

DEV_Contact = '#vchLendMgrName#',
DEV_Title = '#vchLendMgrTitle#',
DEV_Email = '#vchLendMgrEmail#',
DEV_Phone = '#vchLendMgrPhone#',
DEV_Fax = '#DEV_Fax#',
BannerName = '#BannerName#',


LoanApp = <CFIF IsDefined("form.chLoanApp") is True>
'#chLoanApp#',
<CFELSE>
'0',
</CFIF>

LoanApp_URL = '#vchLoanURL#',

FAQ = <CFIF IsDefined("form.chFAQ") is True>
'#chFAQ#',
<CFELSE>
'0',
</CFIF>

FAQ_URL = '#vchFAQ_URL#',


Insurance = <CFIF IsDefined("form.chInsurance") is True>
'#chInsurance#',
<CFELSE>
'0',
</CFIF>

Insurance_URL = '#vchInsurance_URL#',

Services = <CFIF IsDefined("form.chServices") is True>
'#chServices#',
<CFELSE>
'0',
</CFIF>

Services_URL = '#vchServices_URL#',

Rebates = <CFIF IsDefined("form.chRebates") is True>
'#chRebates#',
<CFELSE>
'0',
</CFIF>

Calculators = <CFIF IsDefined("form.chCalculators") is True>
'#chCalculators#',
<CFELSE>
'0',
</CFIF>


Advertise = <CFIF IsDefined("form.chAdvertise") is True>
'#chAdvertise#',
<CFELSE>
'0',
</CFIF>

OrgID = '#OrgID#',

mailLeads = <CFIF IsDefined("form.chmailLeads") is True>
'#chmailLeads#',
<CFELSE>
'0',
</CFIF>

AffTypeID = '#AffType#',
DateUpdated = getdate()


WHERE ID='#intAffliateID#'
</cfquery>


<center>
<h5><font face='Verdana'>Affliate Details Updated Successfully</font></h5>
</center>

<META HTTP-EQUIV="Refresh" CONTENT="3; URL=pugModifyAffiliate.cfm">





