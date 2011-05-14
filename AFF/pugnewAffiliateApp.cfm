
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
SELECT ORGANIZATI, NAME 
FROM ORGANIZA WHERE ORGANIZATI like '%H'
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

<script language='javascript' src='CreatedBy.js'></script>



<body bgcolor="#ffffff">

<table width="600"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
  <tr bgcolor="#ECEDDE"> 
    <td colspan="2" align="right"> 
      <center>
        <p><font face="Arial" size="+1">Add Affiliate</font></p>
      </center>
    </td>
  </tr>
  <td width="199"> <cfform action="pugnewAffiliateApp_Request.cfm" method="POST" enablecab="Yes"  name="UserForm" onSubmit="return CheckForm(this)"> 
    <!--- <input type="hidden" name="CarBuying" value="1"> --->
    <!--- <input type="hidden" name="NewCar" value="1"> --->
  <tr> 
    <td colspan="2" bgcolor="#ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Organization 
      Information</b></font></strong> </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"> <font face="Arial" size="-1">Organization 
      Name:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchName">
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Address:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="nvchAddress">
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">City:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="nvchCity">
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">State:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfselect name="vchState" 
	 size="1"
	 query="getStates"
	 value="State"
	 display="State"
	 selected="FL"
	 >
	  </cfselect>
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Zip:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchZip">
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Phone:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchPhone">
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Main 
      FAX:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchFax">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">General 
      E-Mail:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfinput type="Text" name="vchGeneralEmail" >
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Web 
      Site URL: </font></td>
    <td bgcolor="#ECEDDE" width="240">
      <input type="text" name="vchSiteURL" value="http://">
    </td>
  </tr>
  <!---- Web / Lead Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="#ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Primary 
      Contact Information</b></font></strong> </font> <b><font face="Arial, Helvetica, sans-serif" size="-1"><br>
      </font></b> <font face="arial" size="-2"> (Web/Lead Contact Information) 
      </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Name:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchContactName">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Title:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchContactTitle">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      E-Mail:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfinput type="Text" name="vchContactEmail" >
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Phone:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchContactPhone">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Contact 
      Fax:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchContactFax">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Toll 
      Free</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="TollFree">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Asset 
      Size</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="AssetSize">
      <font color="#FF0000">*</font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">President</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="President">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Do 
      you wish to recieve buyer announcments:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="chmailLeads" value=1>
    </td>
  </tr>
  <!---- Web / Lead Contact Information End  ---->
  <!---- Marketing  Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="#ECEDDE"> <b><font face="Arial, Helvetica, sans-serif" size="-1">Lending 
      Contact Information</font></b> <br>
      <font face="arial" size="-2"> (VP of Lending or Lending Manager) </font> 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1"> 
      Contact Name:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchLendMgrName">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1"> 
      Contact Title:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchLendMgrTitle">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1"> 
      Contact E-Mail:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="Text" name="vchLendMgrEmail">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1"> 
      Contact Phone</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="vchLendMgrPhone">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1"> 
      Fax:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="DEV_Fax">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE"><font face="Arial, Helvetica, sans-serif" size="-1">Banner 
      Name</font></td>
    <td bgcolor="#ECEDDE">
      <input type="text" name="BannerName">
    </td>
  </tr>
  <!---- Marketing Contact Information End  ---->
  <tr> 
    <td colspan="2" bgcolor="#ECEDDE"> <strong><font face="Arial, Helvetica, sans-serif" size="-1">Program 
      Options</font></strong><br>
      <font face="arial" size="-2"> (Select the options you want to appear on 
      your configured DigitalCars CAReports Web Site. By Default Buying Service, 
      New Car Pricing, and Used Car Pricing are required for the Affiliate Program) 
      </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application Return:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="chLoanApp" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application URL: </font></td>
    <td bgcolor="#ECEDDE" width="240">
	<input type="text" name="vchLoanURL">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">FAQ's:</font></td>
    <td bgcolor="#ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox checked name="chFAQ" value=1>
      URL (if different from default) <BR>
      <input type=text name="vchFAQ_URL">
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Insurance:</font></td>
    <td bgcolor="#ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox checked name="chInsurance" value=1>
      URL (if different from default) <BR>
      <input type=text name="vchInsurance_URL">
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Other 
      Services:</font></td>
    <td bgcolor="#ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox checked name="chServices" value=1>
      URL (if different from default)<BR>
      <input type=text name="vchServices_URL">
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Rebates 
      and Incentives:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="chRebates" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Calculators:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="chCalculators" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">DigitalCars 
      Advertisement Banners:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input name="chAdvertise" type=checkbox disabled="true" value=0>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE"><font face="Arial" size="-1">Org ID</font></td>
    <td align="left" bgcolor="#ECEDDE"> 
      <cfselect name="OrgID" size="1" query="getOrg" value="ORGANIZATI" display="NAME" selected="99999H">
	  </cfselect>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE"><font face="Arial" size="-1">Affiliate 
      Type</font></td>
    <td align="left" bgcolor="#ECEDDE"> 
      <cfselect name="AffType" 
	 size="1"
	 query="getAff"
	 value="TypeID"
	 display="TypeDescription"
	 selected="1"
	 >
	  </cfselect>
    </td>
  </tr>
  <tr align="left"> 
    <td colspan="2" bgcolor="#ECEDDE"><font face="Arial" size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Fields 
      marked</font></b></font><font face="Arial" size="-1">&nbsp; </font><font color="#FF0000">*</font> 
      <font face="Arial, Helvetica, sans-serif" size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">are 
      mandatory</font></b></font><font face="Arial" size="-1">&nbsp;</font></td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <center>
        <input type="submit" value="Submit Information">
      </center>
    </td>
  </tr>
</table>

</cfform>

<cfinclude template="_footer.cfm">
