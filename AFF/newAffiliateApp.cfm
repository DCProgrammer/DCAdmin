<cfquery name="getStates"
         datasource="#Application.MainDB#"
         username="#Application.DBUser#"
         password="#Application.DBPwd#">
SELECT      DISTINCT State
FROM         ContinentalZipsToCoords
ORDER By State
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>New Affiliate Application </title>
</head>

<body bgcolor="#ffffff">

<table width="450"
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
  <td width="199"><cfform action="newAffiliateApp_Request.cfm" method="POST" enablecab="Yes"  name="UserForm">
<input type="hidden" name="CarBuying" value="1">
<input type="hidden" name="NewCar" value="1">



  <tr> 
    <td colspan="2" bgcolor="#ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Organization 
      Information</b></font></strong> </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"> <font face="Arial" size="-1">Organization 
      Name:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="Name">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Address:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="Address">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">City:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="City">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">State:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfselect name="State" message="You need to select a state"
	 size="1"
	 query="getStates"
	 value="State"
	 display="State"
	 selected="FL"
	 required="Yes">
	  </cfselect>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Zip:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="Zip">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Phone:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="Phone">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Main 
      FAX:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="Fax">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">General 
      E-Mail:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfinput type="Text" name="GeneralEmail" message="General Email Is Required!" required="Yes">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Web 
      Site URL:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="SiteURL">
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
      <input type="text" name="ContactName">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Title:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="ContactTitle">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      E-Mail:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfinput type="Text" name="ContactEmail" message="Contact Email Is Required!" required="Yes">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Phone:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="ContactPhone">
    </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Contact 
      Fax:</font></td>
    <td bgcolor="#ECEDDE" width="240">
      <input type="text" name="ContactFax">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Do 
      you wish to recieve buyer announcments:</font></td>
    <td bgcolor="#ECEDDE" width="240">
      <input type=checkbox checked name="mailLeads" value=1>
    </td>
  </tr>
  <!---- Web / Lead Contact Information End  ---->
  <!---- Marketing  Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="#ECEDDE">
    <b><font face="Arial, Helvetica, sans-serif" size="-1">Lending Contact Information</font></b>
	<br>
	<font face="arial" size="-2"> (VP of Lending or Lending Manager) </font>
	</td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Name:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="LendMgrName">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Title:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="LendMgrTitle">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      E-Mail:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="Text" name="LendMgrEmail">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Contact 
      Phone:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="LendMgrPhone">
    </td>
  </tr>
  <!---- Marketing Contact Information End  ---->
  <tr> 
    <td colspan="2" bgcolor="#ECEDDE">
	<strong><font face="Arial, Helvetica, sans-serif" size="-1">Program  Options</font></strong><br>
      <font face="arial" size="-2"> (Select the options you want to appear on 
      your configured DigitalCars CAReports Web Site. By Default Buying Service,
	  New Car Pricing, and Used Car Pricing are required for the Affiliate Program) </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application Return:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="LoanApp" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application URL:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type="text" name="LoanURL">
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">FAQ's:</font></td>
    <td bgcolor="#ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox checked name="FAQ" value=1>
      URL (if different from default) 
      <input type=text name="FAQ_URL">
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Insurance:</font></td>
    <td bgcolor="#ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox checked name="Insurance" value=1>
      URL (if different from default) 
      <input type=text name="Insurance_URL">
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Other 
      Services:</font></td>
    <td bgcolor="#ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <input type=checkbox checked name="Services" value=1>
      URL (if different from default) 
      <input type=text name="Services_URL">
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Rebates 
      and Incentives:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="Rebates" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Calculators:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="Calculators" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">DigitalCars 
      Advertisement Banners:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <input type=checkbox checked name="Advertise" value=1>
    </td>
  </tr>
  <tr> 
    <td align="right" colspan="2" bgcolor="#ECEDDE"><font face="Arial" size="-1">&nbsp;</font></td>
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

</body>
</html>
