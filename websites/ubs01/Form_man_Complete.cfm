<cfmail to="info@ubschicago.com"
 		from="info@ubschicago.com" 
		subject="UBS Chicago Request">

The following user requested information from UBS Chicago.
Service member.
-------------------------
PERSONAL INFORMATION
-------------------------
Email:     #email#
Name:      #FirstName# #LastName#
Address:   #Addr1#
           #City#, #State# #Zip#
Day Phone: #BPhone#
Eve Phone: #HomePhone#
Mobile:    #CellPhone#
Fax:       #Fax#
Home Fax:  #HomeFax#
-------------------------
INTEREST IN SERVICES
-------------------------
Auto:      #isAuto#
Insurance: #isInsurance#
Furniture: #isFurniture#
Appliance: #isAppliance#
-------------------------
INTEREST IN FINANCE
-------------------------
Finance:   #FinanceInfo#
		
</cfmail>



<cfinclude template="_header.cfm">
<table width="750" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td colspan="2"> <p><img src="images/headers/complete-goodlead.gif" alt="Complete" width="400" height="25"></p>
            <p>Thank you for using UBS Chicago. We will be contacting you shortly 
              with your request, if you need immediate attention please contact 
              us at 800.610.2277 or by email at info@ubschicago.com.</p>
            <p>Thank you.<br>
            </p></td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p></td>
    <td><img src="images/spacers/1.gif" alt="Spacer" width="300" height="1" border="0"> 
    </td>
  </tr>
</table>


<cfinclude template="_footer.cfm">
