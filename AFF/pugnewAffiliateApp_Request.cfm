
<cfset Caller.cfg_MainDB="MainSQL"> 
<cfinclude template = "_header.cfm"> 

<cfquery name="CheckDuplicate" 

	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#" > 
SELECT * FROM Affiliate_Table WHERE Name='#vchName#' and State='#vchState#'
</cfquery>

<CFIF CheckDuplicate.recordCount EQ 0 >

<cfquery name="getStates" 
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#">
insert into Affiliate_Table
(
Password,
Name,
Address,
City,
State,
Zip,
Phone,
Fax,
TollFree,
Assett_Size,
President,
GeneralEmail,
URL,
ContactName,
ContactTitle,
ContactEmail,
ContactPhone,
ContactFax,
wantsFaxes,
DEV_Contact,
DEV_Title,
DEV_Email,
DEV_Phone,
DEV_Fax,
BannerName,
CarBuying,
CarBuyingPos,
NewCar,
NewCarPos,
UsedCar,
UsedCarPos,
LoanApp,
LoanAppPos,
LoanApp_URL,
FAQ,
FAQPos,
FAQ_URL,
Insurance,
InsurancePos,
Insurance_URL,
Services,
ServicesPos,
Services_URL,
showHeader,
Rebates,
Calculators,
Commision,
Advertise,
Ad_ID,
active,
HasCarsDirect,
CDRootURL,
CDLinkMethod,
CDPartnerID,
CD_ID,
CoBrandValue,
OrgID,
initiateFinancing,
CD_Phone,
HasAutoBytel,
hasNewAbt,
ABTID,
CDOnline,
optInFlag,
mailLeads,
Imotors_ID,
hasImotors,
AffTypeID,
hasCC,
hasWeb,
hasXTRA,
hasWSW,
AgentID,
tracksMembers,
certCharge,
BranchesAllowed,
AutoAdvisorsAllowed,
GapActive,
GapCost,
DateCreated

)
 values(
'password',
'#vchName#',
'#nvchAddress#',
'#nvchCity#',
'#vchState#',
'#vchZip#',
'#vchPhone#',
'#vchFax#',
'#TollFree#',
'#AssetSize#',
'#President#',
'#vchGeneralEmail#',
'#vchSiteURL#',
'#vchContactName#',
'#vchContactTitle#',
'#vchContactEmail#',
'#vchContactPhone#',
'#vchContactFax#',

'0',


'#vchLendMgrName#',
'#vchLendMgrTitle#',
'#vchLendMgrEmail#',
'#vchLendMgrPhone#',
'#DEV_Fax#',
'#BannerName#',

'1',
'1',

'1',
'2',

'1',
'3',

<CFIF IsDefined("form.chLoanApp") is True>
'#chLoanApp#',
<CFELSE>
'0',
</CFIF>
'4',
'#vchLoanURL#',

<CFIF IsDefined("form.chFAQ") is True>
'#chFAQ#',
<CFELSE>
'0',
</CFIF>
'5',
'#vchFAQ_URL#',


<CFIF IsDefined("form.chInsurance") is True>
'#chInsurance#',
<CFELSE>
'0',
</CFIF>
'6',
'#vchInsurance_URL#',

<CFIF IsDefined("form.chServices") is True>
'#chServices#',
<CFELSE>
'0',
</CFIF>
'7',
'#vchServices_URL#',

'1',

<CFIF IsDefined("form.chRebates") is True>
'#chRebates#',
<CFELSE>
'0',
</CFIF>

<CFIF IsDefined("form.chCalculators") is True>
'#chCalculators#',
<CFELSE>
'0',
</CFIF>
0,

<CFIF IsDefined("form.chAdvertise") is True>
'#chAdvertise#',
<CFELSE>
'0',
</CFIF>

'0',
'1',
'0',
NULL,
NULL,
'DIGITALCAR',
'DC',
'DCDC',
'#OrgID#',
'0',
'847-291-7900',
'0',
'0',
'8597',
'0',
'1',

<CFIF IsDefined("form.chmailLeads") is True>
'#chmailLeads#',
<CFELSE>
'0',
</CFIF>
'22028',
'0',
'#AffType#',
'1',
'1',
'1',
'0',
'DCARS',
'0',
5,
'0',
'0',
'0',
0,
getdate()
)

</cfquery>

<center>
<h5><font face='Verdana'>New Affliate Saved Successfully</font></h5>
</center>
<META HTTP-EQUIV="Refresh" CONTENT="3;URL=<cfoutput>#CGI.HTTP_REFERER#</cfoutput>">
<CFELSE>
	<center>
	<h5><font face='Verdana' color='#ff0000'>Affliate Already exists with <cfoutput>#vchName#</cfoutput> name and <cfoutput>#vchState#</cfoutput> state.<BR>No record inserted<BR><BR>
		Click <a href='javascript:void(history.back())'>here</a> to go back.</font>
	</h5>
	</center>

</CFIF>

