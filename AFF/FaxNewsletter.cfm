<cfset Caller.cfg_MainDB="MainSQL"> 
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
<cfif (vchSiteURL contains "creditunions.com") or (vchSiteURL contains "##")>
	<cfset SiteSite = "http://www.CAReports.com/default.cfm?affid=#intAffiliateID#">
	<cfset PhoneNumber = "847-291-7900">
<cfelse>
	<cfset SiteSite = "#vchSiteURL#">
	<cfset PhoneNumber = "#GetDetails.Phone#">
</cfif>

<script language='javascript' src='CreatedBy.js'></script>
 <style type='text/css'>
td { font-family:Verdana;font-size:10pt}
</style>

<CFOUTPUT QUERY="getDetails">
  <table width="640" border="0" align="center" cellpadding="1" cellspacing="2" bgcolor="##FFFFFF">
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif">&nbsp;</font> <table width="100%" border="0" cellspacing="2" cellpadding="1">
          <tr valign="top"> 
            <td><font size="4" face="Arial, Helvetica, sans-serif"><strong>NEWS 
              RELEASE #DateFormat(Now(),"mm/dd/yy")#<br>
              Contact: Mary Okolowicz<br>
              800.610.2277 x30</strong></font></td>
            <td align="right"><font size="3" face="Arial, Helvetica, sans-serif">#Name#<br>
              #Marketing_Contact#<br>
              #Marketing_Fax#<br>
              #Marketing_Email#</font></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif">&nbsp;</font> </td>
    </tr>
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif">&nbsp;</font> </td>
    </tr>
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif"><strong>Credit Union 
        Vehicle Buying and Finance Service</strong></font></td>
    </tr>
    <tr> 
      <td><p><font face="Arial, Helvetica, sans-serif"><font size="4"></font></font></p></td>
    </tr>
    <tr> 
      <td><font size="5" face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"> 
        <p>&nbsp;</p>
        </font></font></td>
    </tr>
    <tr> 
      <td align="left"><div align="justify"><font size="3" face="Arial, Helvetica, sans-serif"><strong><font size="3" face="Arial, Helvetica, sans-serif">Try 
          our Vehicle Buying Service- in order to get the best price and a great 
          loan on the car, truck or van you want! Don't waste time spending hours 
          negotiating with a dealer. Let our credit union vehicle buying and finance 
          service work for you. Make the vehicle buying and financing process 
          easy. Just log on to the credit union web site address <u>#SiteSite#</U> or call #PhoneNumber# today! </font></div>
        <font size="3" face="Arial, Helvetica, sans-serif"></strong></font> </div> </font> 
        <p align="justify"><font size="3" face="Arial, Helvetica, sans-serif"><strong> 
          You get the car, truck or van you want at a price that you can afford. 
          It's that easy! </strong></font> </td>
    </tr>
    <tr> 
      <td align="left">&nbsp;</td>
    </tr>
    <tr> 
      <td align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td>&nbsp;</td>
            <td align="right" valign="top"><img src="../images/dc.jpg" width="191" height="40"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="200" align="left">&nbsp;</td>
    </tr>
    <tr> 
      <td align="left" bgcolor="##000000"><table width="100%" border="0" cellpadding="1" cellspacing="2" bgcolor="##FFFFFF">
          <tr>
            <td>NOTE: If you would like a PDF FILE please send your e-mail address 
              to mary@digitalcars.com</td>
          </tr>
        </table></td>
    </tr>
  </table>
</cfoutput>


</body>
</html>
