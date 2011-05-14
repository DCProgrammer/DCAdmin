
<cfset Caller.cfg_MainDB="MainSQL"> 

<cfinclude template = "_header.cfm"> 

<cfquery name="getStates"
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#" >
SELECT      DISTINCT State
FROM         ContinentalZipsToCoords
ORDER By State
</cfquery>

<cfquery name="getOrg"
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#" >
SELECT ORGANIZATI 
FROM ORGANIZA WHERE ORGANIZATI like '%H' or ORGANIZATI like '%F' or ORGANIZATI like '%%'
ORDER By ORGANIZATI
</cfquery>

<cfquery name="getAff"
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#" >
SELECT TypeID,TypeDescription
FROM         Affiliate_Types
ORDER By TypeDescription
</cfquery>


<cfquery name="getDetails"

	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#">
SELECT *
FROM Affiliate_Table
WHERE ID = #intAffiliateID#
</cfquery>
<cfset vchSiteURL = "#getDetails.URL#">

<script language='javascript' src='CreatedBy.js'></script>

<SCRIPT LANGUAGE="javascript">

function open_digital(page) { var msie=false; var appName=navigator.appName; 
if(appName.indexOf("Microsoft")==0) msie=true; 
DC_window=window.open(page, "DC_window", 
"width=390,height=300,status=0, resizable=no,menubar=no,scrollbars=yes,toolbar=no,location=0,menubar=no"); 
if(!msie) DC_window.focus(); }

</SCRIPT>

</head>


<body bgcolor="#ffffff">
<CFOUTPUT QUERY="getDetails">
<table width="450"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
  <tr bgcolor="##ECEDDE"> 
    <td colspan="2" align="right"> <center>
        <p><font face="Arial" size="+1">Modify Affiliate</font></p>
      </center></td>
  </tr>
  <td width="199"> <cfform action="pugUpdateAffliate.cfm" method="POST" enablecab="Yes"  name="UserForm" onSubmit="return CheckForm(this)"> 
    <input type='hidden' name='intAffliateID' value='#intAffiliateID#'> 
    <input type='hidden' name='vchName' value='#Name#'> 
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <font face="Arial" size="">&nbsp; </font> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><font face="Arial" size=""><strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Organization 
            Information</b></font></strong> </font></td>
          <td align="right"><A href="javascript:open_digital('ModifyAffNotes.cfm?ID=#intAffiliateID#');"><img src="Images/btn_edit_file_over.gif" alt="View Notes" width="22" height="22" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"> <font face="Arial" size="-1">Name:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <font face="Arial" size="-1"> <A href="javascript:open_digital('ModifyAffName.cfm?ID=#intAffiliateID#');">#Name#</a></font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Address:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="nvchAddress" value='#Address#'> 
      <font color="##FF0000">*</font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">City:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="nvchCity" value='#City#'> 
      <font color="##FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">State:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <cfselect name="vchState" 
	 size="1"
	 query="getStates"
	 value="State"
	 display="State"
	 selected=#State#
	 >
      </cfselect> <font color="##FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Zip:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchZip" value='#Zip#'> 
      <font color="##FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Phone:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchPhone" value='#Phone#'> 
      <font color="##FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Toll 
      Free</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="TollFree" value='#TollFree#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Main 
      FAX:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchFax" value='#Fax#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">General 
      E-Mail:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <cfinput type="Text" name="vchGeneralEmail"  value='#GeneralEmail#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1"> 
      <a href="#vchSiteURL#" target="_blank">Web 
      Site URL:</a> </font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchSiteURL" value='#vchSiteURL#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial, Helvetica, sans-serif" size="-1">Banner 
      Name</font></td>
    <td bgcolor="##ECEDDE"> <input type="text" name="BannerName" value='#BannerName#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">President</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="President" value='#President#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Asset 
      Size</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="AssetSize" value='#Assett_Size#'> 
      <font color="##FF0000">*</font> </td>
  </tr>
  <tr>
    <td align="right" bgcolor="##ECEDDE"><font face="Arial, Helvetica, sans-serif" size="-1">Member 
      Base</font></td>
    <td bgcolor="##ECEDDE"><input name="Member_Size" type="text" value='#Member_Size#'></td>
  </tr>
  <!---- Web / Lead Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Lead 
      Contact Information</b></font></strong> </font> <b><font face="Arial, Helvetica, sans-serif" size="-1"><br>
      </font></b> <font face="arial" size="-2"> (Lead Contact Information - The 
      Individual that will receive the Lead Fax and Email) </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Name:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchContactName" value='#ContactName#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Title:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchContactTitle" value='#ContactTitle#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      E-Mail:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <cfinput type="Text" name="affContactEmail" value='#ContactEmail#'> 
      <!--- removed because checking for email verification, require by dc multiple emails --->
      <!---td bgcolor="##ECEDDE" width="240"> <cfinput type="Text" name="vchContactEmail" value='#ContactEmail#'--->
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Phone:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchContactPhone" value='#ContactPhone#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Contact 
      Fax:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchContactFax" value='#ContactFax#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Do 
      you wish to recieve lead announcments:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type=checkbox name="chmailLeads" value=1 <CFIF #mailLeads# EQ 1 > CHECKED </CFIF>> 
    </td>
  </tr>
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Marketing 
      Contact Information</b></font></strong> </font> <b><font face="Arial, Helvetica, sans-serif" size="-1"><br>
      </font></b> <font face="arial" size="-2"> (Marketing Contact Information 
      - The Individual that will receive the Lead Fax and Email) </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Marketing 
      Name:</font></td>
    <td bgcolor="##ECEDDE"> <input name="Marketing_Contact" type="text" id="Marketing_Contact" value='#Marketing_Contact#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Marketing 
      Title:</font></td>
    <td bgcolor="##ECEDDE"> <input name="Marketing_Title" type="text" id="Marketing_Title" value='#Marketing_Title#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Marketing 
      E-Mail:</font></td>
    <td bgcolor="##ECEDDE"> <cfinput type="Text" name="Marketing_Email" value='#Marketing_Email#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Marketing 
      Phone:</font></td>
    <td bgcolor="##ECEDDE"> <input type="text" name="Marketing_Phone" value='#Marketing_Phone#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Marketing</font><font face="Arial, Helvetica, sans-serif" size="-1"> 
      Fax:</font></td>
    <td bgcolor="##ECEDDE"> <input type="text" name="Marketing_Fax" value='#Marketing_Fax#'></td>
  </tr>
  <!---- Web / Lead Contact Information End  ---->
  <!---- Marketing  Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <b><font face="Arial, Helvetica, sans-serif" size="-1">Web 
      Site Contact Information</font></b> <br> <font face="arial" size="-2"> (Web 
      Site or IT Managerr) </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Dev 
      Contact:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchLendMgrName" value='#DEV_Contact#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Dev 
      Title:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchLendMgrTitle" value='#DEV_Title#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Dev 
      E-Mail:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="Text" name="vchLendMgrEmail" value='#DEV_Email#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Dev 
      Phone:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="vchLendMgrPhone" value='#DEV_Phone#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1"> 
      Dev Fax:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type="text" name="DEV_Fax" value='#DEV_Fax#'> 
    </td>
  </tr>
  <!---- Marketing Contact Information End  ---->
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <strong><font face="Arial, Helvetica, sans-serif" size="-1">Program 
      Options</font></strong><br> <font face="arial" size="-2"> (Select the options 
      you want to appear on your configured DigitalCars CAReports Web Site. By 
      Default Buying Service, New Car Pricing, and Used Car Pricing are required 
      for the Affiliate Program) </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application Return:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type=checkbox name="chLoanApp" value=1 <CFIF #LoanApp# EQ 1 > CHECKED </CFIF>> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application URL:</font></td>
    <td bgcolor="##ECEDDE" width="240"> http:// 
      <input type="text" name="vchLoanURL" value='#LoanApp_URL#'> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">FAQ's:</font></td>
    <td bgcolor="##ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox name="chFAQ" value=1 <CFIF #FAQ# EQ 1 > CHECKED </CFIF>>
      URL (if different from default) <BR>
      http:// 
      <input type=text name="vchFAQ_URL" value='#FAQ_URL#'>
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Insurance:</font></td>
    <td bgcolor="##ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox name="chInsurance" value=1 <CFIF #Insurance# EQ 1 > CHECKED </CFIF>>
      URL (if different from default) <BR>
      http:// 
      <input type=text name="vchInsurance_URL" value='#Insurance_URL#'>
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Other 
      Services:</font></td>
    <td bgcolor="##ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox name="chServices" value=1 <CFIF #Services# EQ 1 > CHECKED </CFIF>>
      URL (if different from default) <BR>
      http:// 
      <input type=text name="vchServices_URL" value='#Services_URL#'>
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Rebates 
      and Incentives:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type=checkbox name="chRebates" value=1 <CFIF #Rebates# EQ 1 > CHECKED </CFIF>> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Calculators:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type=checkbox name="chCalculators" value=1 <CFIF #Calculators# EQ 1 > CHECKED </CFIF>> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DigitalCars 
      Advertisement Banners:</font></td>
    <td bgcolor="##ECEDDE" width="240"> <input type=checkbox name="chAdvertise" DEFAULT = "no" value=1 <CFIF #Advertise# EQ 1 > CHECKED </CFIF>> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Org ID</font></td>
    <td align="left" bgcolor="##ECEDDE"> <cfselect name="OrgID" 
	 size="1"
	 query="getOrg"
	 value="ORGANIZATI"
	 display="ORGANIZATI"
	 selected='#OrgID#'
	 >
      </cfselect> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Affiliate 
      Type</font></td>
    <td align="left" bgcolor="##ECEDDE"> <cfselect name="AffType" 
	 size="1"
	 query="getAff"
	 value="TypeID"
	 display="TypeDescription"
	 selected="#AffTypeID#"
	 >
      </cfselect> </td>
  </tr>
  <tr> 
    <td align="left" colspan="2" bgcolor="##ECEDDE"> <b><font face="Verdana, Arial, Helvetica, sans-serif" size='1'> 
      Fields marked</font></b><font face="Arial" size="-1">&nbsp; </font><font color="##FF0000">*</font> 
      <b><font face="Verdana, Arial, Helvetica, sans-serif" size='1'>are mandatory</font></b> 
    </td>
  </tr>
  <tr> 
    <td colspan="2"> <center>
        <input type='submit' value='Update Details' style='background-color:##51627C ;color:##ffffff;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: ##072044 1px solid; BORDER-TOP: ##072044 1px solid; BORDER-LEFT: ##072044 1px solid; BORDER-BOTTOM: ##072044 1px solid;' >
      </center></td>
  </tr>
</table>

</cfform>

</body>
</CFOUTPUT>
</html>
