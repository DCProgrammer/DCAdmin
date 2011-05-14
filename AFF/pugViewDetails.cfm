<cfset Caller.cfg_MainDB="MainSQL"> 


<cfinclude template = "_header.cfm"> 


<cfquery name="getDetails"
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#">
SELECT *
FROM Affiliate_Table
WHERE ID = #intAffiliateID#
</cfquery>
<!--- pug_Affliates --->
<cfset vchSiteURL = "#GetDetails.URL#">

<script language='javascript' src='CreatedBy.js'></script>
<style type='text/css'>
td { font-family:Verdana;font-size:10pt}
</style>


<body bgcolor="#ffffff">
<CFOUTPUT QUERY="getDetails">
<table width="600"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
  <tr bgcolor="##ECEDDE"> 
    <td colspan="2" align="right"> 
      <center>
        <p><font face="Arial" size="+1">View Affiliate Details</font></p>
      </center>
    </td>
  </tr>
  <td width="199">


  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Organization 
      Information</b></font></strong> </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"> <font face="Arial" size="-1">Organization 
      Name:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #Name#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Address:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #Address#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">City:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #City#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">State:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
    #State#
	 
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Zip:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
     #Zip#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Main 
      Phone:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
    #Phone#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Main 
      FAX:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #Fax#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">General 
      E-Mail:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
    <a href='mailto:#GeneralEmail#'>#GeneralEmail#</a>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Web 
      Site URL:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
    <a href='#vchSiteURL#' target="_blank">#vchSiteURL#</a>
    </td>
  </tr>
  <!---- Web / Lead Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE"> <font face="Arial" size=""> <strong><font face="Arial, Helvetica, sans-serif" size="-1"><b>Primary 
      Contact Information</b></font></strong> </font> <b><font face="Arial, Helvetica, sans-serif" size="-1"><br>
      </font></b> <font face="arial" size="-2"> (Web/Lead Contact Information) 
      </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact Name:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
  #ContactName#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact Title:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
     #ContactTitle#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact  E-Mail:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
  <a href='mailto:#ContactEmail#'>#ContactEmail#</a>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Contact Phone:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
    #ContactPhone#
    </td>
  </tr>
  <tr>
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Contact 
      Fax:</font></td>
    <td bgcolor="##ECEDDE" width="240">
     #ContactFax#
    </td>
  </tr>

  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Toll 
      Free</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #TollFree#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Asset Size</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #Assett_Size#
    </td>
  </tr>
   <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Member Size</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #Member_Size#
    </td>
  </tr> 
  
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">President</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #President#
    </td>
  </tr>


  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial, Helvetica, sans-serif" size="-1">Do 
      you wish to recieve buyer announcments:</font></td>
    <td bgcolor="##ECEDDE" width="240">
      <CFIF #mailLeads# EQ 1 > Yes </CFIF>
    </td>
  </tr>
  <!---- Web / Lead Contact Information End  ---->
  <!---- Marketing  Contact Information End ---->
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE">
    <b><font face="Arial, Helvetica, sans-serif" size="-1">Lending Contact Information</font></b>
	<br>
	<font face="arial" size="-2"> (VP of Lending or Lending Manager) </font>
	</td>
  </tr>

  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DEV Contact 
      Name:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #DEV_Contact#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DEV Contact 
      Title:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #DEV_Title#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DEV Contact 
      E-Mail:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #DEV_Email#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DEV Contact 
      Phone:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #DEV_Phone#
    </td>
  </tr>
 <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DEV 
      Fax:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      #DEV_Fax#
    </td>
  </tr>

  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial, Helvetica, sans-serif" size="-1">Banner 
      Name</font></td>
    <td bgcolor="##ECEDDE">
      #BannerName#
    </td>
  </tr>

  <!---- Marketing Contact Information End  ---->
  <tr> 
    <td colspan="2" bgcolor="##ECEDDE">
	<strong><font face="Arial, Helvetica, sans-serif" size="-1">Program  Options</font></strong><br>
      <font face="arial" size="-2"> (Select the options you want to appear on 
      your configured DigitalCars CAReports Web Site. By Default Buying Service,
	  New Car Pricing, and Used Car Pricing are required for the Affiliate Program) </font> </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application Return:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      <CFIF #LoanApp# EQ 1 > Yes </CFIF>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Loan 
      Application URL:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
    <a href='#LoanApp_URL#'>#LoanApp_URL#</a>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">FAQ's:</font></td>
    <td bgcolor="##ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <CFIF #FAQ# EQ 1 > Yes </CFIF>
<BR>
          <a href='#FAQ_URL#'>#FAQ_URL#</a>
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Insurance:</font></td>
    <td bgcolor="##ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
      <CFIF #Insurance# EQ 1 > Yes </CFIF>
<BR>
    <a href='#Insurance_URL#'>#Insurance_URL#</a>
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Other 
      Services:</font></td>
    <td bgcolor="##ECEDDE" width="240"><font face="Arial"
                              size="-1"> 
     <CFIF #Services# EQ 1 > Yes </CFIF>
    <BR>
          <a href='http://#Services_URL#'>#Services_URL#</a>
      </font></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Rebates 
      and Incentives:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      <CFIF #Rebates# EQ 1 > Yes </CFIF>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">Calculators:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      <CFIF #Calculators# EQ 1 > Yes </CFIF>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE" width="199"><font face="Arial" size="-1">DigitalCars 
      Advertisement Banners:</font></td>
    <td bgcolor="##ECEDDE" width="240"> 
      <CFIF #Advertise# EQ 1 > Yes </CFIF>
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Org ID</font></td>
    <td align="left" bgcolor="##ECEDDE"> 
	#OrgID#
    </td>
  </tr>
  <tr> 
    <td align="right" bgcolor="##ECEDDE"><font face="Arial" size="-1">Affiliate 
      Type</font></td>
    <td align="left" bgcolor="##ECEDDE"> 
   #AffTypeID#
    </td>
  </tr>

</table>



</body>
</CFOUTPUT>
</html>
