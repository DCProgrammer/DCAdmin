<cfinclude template="_header.cfm">

<cfif isDefined("Form.email")>
	<cfset email=Form.email>
<cfelse>
	<cfset email="No Email Submitted">
</cfif>
<cfif isDefined("Form.Zip")>
	<cfset Zip=Form.Zip>
</cfif>
<cfif isDefined("Form.IsAuto")>
	<cfset isAuto="YES">
<cfelse>
	<cfset isAuto="NO">
</cfif>
<cfif isDefined("Form.isInsurance")>
	<cfset isInsurance="YES">
<cfelse>
	<cfset isInsurance="NO">
</cfif>
<cfif isDefined("Form.IsFurniture")>	
	<cfset isFurniture="YES">
<cfelse>
	<cfset IsFurniture="NO">
</cfif>
<cfif isDefined("Form.isAppliance")>
	<cfset isAppliance="YES">
<cfelse>
	<cfset isAppliance="NO">
</cfif>
<cfif isDefined("Form.FinanceInfo")>
	<cfset FinanceInfo="YES">
<cfelse>
	<cfset FinanceInfo="NO">
</cfif>

<form action="Form_man_Complete.cfm" method="post">
<cfoutput>
<input type="hidden" name="email" value="#email#">
<input type="hidden" name="isAuto" value="#isAuto#">
<input type="hidden" name="isInsurance" value="#isInsurance#">
<input type="hidden" name="isFurniture" value="#isFurniture#">
<input type="hidden" name="isAppliance" value="#isAppliance#">
<input type="hidden" name="FinanceInfo" value="#FinanceInfo#">
</cfoutput>

  <table width="750" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
    <tr valign="top"> 
      <td><p><img src="images/headers/requestinfo.gif" alt="Request Information" width="400" height="25"></p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td align="right">Email:</td>
            <td><input name="email" type="text" class="inputBox" value="<cfoutput>#email#</cfoutput>"></td>
          </tr>		
          <tr valign="top"> 
            <td align="right">First Name:</td>
            <td><input name="FirstName" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Last Name:</td>
            <td><input name="LastName" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Address:</td>
            <td><input name="Addr1" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">City:</td>
            <td><input name="City" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">State:</td>
            <td><input name="State" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Zip Code:</td>
            <td><input name="Zip" type="text" class="inputBox" value="<cfoutput>#Zip#</cfoutput>"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Day Phone:</td>
            <td><input name="BPhone" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Eve Phone:</td>
            <td><input name="HomePhone" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Mobile Phone:</td>
            <td><input name="CellPhone" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">FAX:</td>
            <td><input name="Fax" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">Home Fax:</td>
            <td><input name="HomeFax" type="text" class="inputBox"></td>
          </tr>
          <tr valign="top"> 
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td align="right">Send other offers and promotions?</td>
            <td> <input name="OptIn" type="checkbox" class="inputCheckBox" value="checkbox">
              Yes</td>
          </tr>
        </table>
        <p>&nbsp;</p></td>
      <td>&nbsp;</td>
    </tr>
    <tr valign="top"> 
      <td colspan="2"><hr size=</td> </tr>
    <tr valign="top"> 
      <td> <cfif not isDefined("FinanceInfo")>
          <cfset FinanceInfo = "">
        </cfif> <cfif (FinanceInfo eq 1) or (FinanceInfo is 'on')>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr valign="top"> 
              <td colspan="2"> <p>Please fill out the additional information, 
                  you will contact by us with a competitive loan quote without 
                  any hassles and the initial quote is FREE.</p></td>
            </tr>
            <tr valign="top"> 
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="top"> 
              <td align="right">Employer Name:</td>
              <td> <input name="EmpName" type="text" class="inputBox"></td>
            </tr>
            <tr valign="top"> 
              <td align="right">Birth Date:</td>
              <td> <input name="Birth" type="text" class="inputBox"></td>
            </tr>
            <tr valign="top"> 
              <td align="right">:</td>
              <td>&nbsp; </td>
            </tr>
            <tr valign="top"> 
              <td align="right">Occupation:</td>
              <td> <input name="Occupation" type="text" class="inputBox"></td>
            </tr>
            <tr valign="top"> 
              <td align="right">Time on Job:</td>
              <td> <input name="OnJob" type="text" class="inputBox"></td>
            </tr>
            <tr valign="top"> 
              <td align="right">Rent/Mortgage Amt:</td>
              <td> <input name="ResAMT" type="text" class="inputBox"></td>
            </tr>
            <tr valign="top"> 
              <td align="right">Time at Residence:</td>
              <td> <input name="ResTime" type="text" class="inputBox"></td>
            </tr>
            <tr valign="top"> 
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="top"> 
              <td align="right">Are you over 18 ?</td>
              <td> <input name="Over18" type="checkbox" class="inputCheckBox" value="checkbox">
                Yes</td>
            </tr>
          </table>
        </cfif> </td>
      <td>&nbsp;</td>
    </tr>
    <tr valign="top">
      <td><div align="center">
          <input type="submit" name="Submit" value="Submit">
        </div></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

<cfinclude template="_footer.cfm">
