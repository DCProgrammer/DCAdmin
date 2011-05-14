<cfinclude template="_header.cfm">
<table width="750" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td bgcolor="#FFFFFF"><p><img src="images/headers/requestinfo.gif" alt="Online Purchase" width="400" height="25"></p>
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr valign="top"> 
          <td><p><span class="join">Congratulations! </span><br>
              You're ready to buy.<br>
              Enter the requested information, then click CONTINUE,<br>
              and you will be provided via email, the name and contact for the 
              closest participating dealer in our networkfor your chosen product.
            <hr size="1" width="80%">
            Through the network of participating dealers, you'll be able to buy 
            your vehicle, furniture, major appliances or use many of our other 
            services with a competitive price. Once you receive your referral 
            via email, simply call the phone number provided and make an appointment 
            with the contact person listed.<br>
              That's all there is to it. </p>
            </td>
          <td bgcolor="f0f0f0">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
<cfif IsDefined("Error")>
<cfoutput>
<tr><td colspan=2 class="warning">#Error#<br>
                      If you do not have an email click <a href="Form_man_1.cfm?email=None&Zip=Zip">here</a>.</td>
                  </tr>
</cfoutput>
</cfif>
<cfif not isDefined("Error") and isDefined("noFlags") and isDefined("Session.Email") and isDefined("Session.Zip") and isDefined("Session.validEmail")>
<cfif Session.validEmail is 'yes'>
<cfset Flags="Flags">
<cfloop list=#ArrayToList(Session.FlagArray)# index=foo>
<cfif isDefined(foo)>
<!--- <cfif Product is foo> --->
<cfset Flags=Flags & "&" & foo & "=1">
</cfif>
</cfloop>
<cflocation url="process_1.cfm?#flags#&Zip=#Session.Zip#&Email=#Session.Email#">
</cfif>
</cfif>
<form method=post action="Process_1.cfm">
<cfif isDefined("noFlags")>
<input type=hidden name="noFlags" value=1>
</cfif>
<!--              <tr valign="top"> 
                <td align="right">E-mail:</td>
                <td><input name="email" type="text" class="inputBox"></td>
              </tr>
		-->
              <tr valign="top"> 
                <td align="right">Zip&nbsp;Code:</td>
                <td><input name="zip" type="text" class="inputBox"></td>
              </tr>
<!---
			  <tr valign="top">
			  	<td align="right">Product:</td>
				<td><select name="Product">
					<cfloop index=foo from=1 to=#ArrayLen(Session.flagArray)#>
					<cfoutput>
						<option value="#Session.flagArray[foo]#" <cfif isDefined(Session.flagArray[foo]) selected>#Session.flagLabelArray[foo]#</option>
						</cfoutput>
					</cfloop>
				</select></td>
			  </tr>
--->
<cfloop index=foo from=1 to=#ArrayLen(Session.flagArray)#>
	<cfoutput>
	<cfif not isDefined("noFlags")>
	<tr valign="top">
	<td align=right>#Session.flagLabelArray[foo]#</td>
	<td>
	</cfif>
	<cfif isDefined("noFlags")>
		<cfif isDefined(Session.flagArray[foo])>
			<input type="hidden" class="inputCheckbox2" value=1 name="#Session.flagArray[foo]#">
		</cfif>
	<cfelse>
	<input type="checkbox" class="inputCheckbox2" value=1 <cfif isDefined(Session.flagArray[foo])>checked</cfif> name="#Session.flagArray[foo]#">
	</cfif>
	<cfif not isDefined("noFlags")>
	</td>
	</tr>	
	</cfif>
	</cfoutput>
</cfloop>

<!--			  
              <tr valign="top"> 
                <td align="right">Would you be interested in financing or re-financing 
                  your auto or home.</td>
                <td> <input name="isFinance" type="checkbox" class="inputCheckBox2" value="1" <cfif isDefined("isFinance")>checked</cfif>>
                  Yes</td>
              </tr>
              <tr valign="top"> 
                <td align="right">Auto</td>
                <td> <input name="isAuto" type="checkbox" class="inputCheckBox2" value="1" <cfif isDefined("isAuto")>checked</cfif>>
                  Yes</td>
              </tr>
              <tr valign="top"> 
                <td align="right">Furniture:</td>
                <td> <input name="isFurniture" type="checkbox" class="inputCheckBox2" value="1" <cfif isDefined("isFurniture")>checked</cfif>>
                  Yes</td>
              </tr>
              <tr valign="top">
                <td align="right">Major Appliance:</td>
                <td> <input name="isAppliance" type="checkbox" class="inputCheckBox2" value="1" <cfif isDefined("isAppliance")>checked</cfif>>
                  Yes</td>
              </tr>
-->
			  <tr valign="top"><td colspan=2 align=right>
			  
			  <input type="submit" value="Submit">
			  </td> </tr>
</form>			  
            </table>
          </td>
        </tr>
      </table>
<hr size="1" width="90%">
        <b><font size="-1" face="Arial">How a dealer referral is provided</font></b> 
      </p>
      <p><font size="-1" face="Arial"> After researching and choosing a vehicle, 
        furniture, major appliance or other product, and then entering other required 
        information, you will be directed through the United Buying Service Chicago 
        selection process. In order receive the referral, through the guided selection 
        criteria, please follow the listed steps. </font> 
      <p><font size="-1" face="Arial"> You will be required to fill out a form 
        with personal information, such as: name, address, phone number, the preferred 
        method to be contacted, and time frame before visiting the dealership. 
        You must also provide a valid email address in order for you to receive 
        your referral. The referral information will not be shown on the web page. 
        </font> 
      <p><font size="-1" face="Arial"> You will be asked to rate the level of 
        importance regarding each selected option and package. A comments section 
        allows you to inform the participating dealer of any questions and concerns. 
        </font>
      <p><font size="-1" face="Arial"> We also ask for information regarding your 
        trade-in, and again allow you to note any information regarding your trade-in.</font>
      <p><font size="-1" face="Arial">We also ask for information about your home 
        and interest in finacing or refinancing your home.</font>
      <p><font size="-1" face="Arial"> After you have submitted your information, 
        you will see a note notifying you to check your email for the referral 
        information. </font> 
      <p> <font size="-1" face="Arial"><b>How a dealer is chosen</b> </font>
      <p><font size="-1" face="Arial"> Customers interested in purchasing will 
        be referred to the participating United Buying Service Chicago dealer 
        closest to customer’s provided zip code within a selected United Buying 
        Service Chicago radius. </font> 
      <p><font size="-1" face="Arial"> Such referral will be by way of issuance 
        of a Purchase Certificate directing the customer to make an appointment 
        with the participating dealer for the purpose of purchasing a product 
        such as a car or furniture at a competitive price. The emailed referral 
        does not state any monetary value with regards to the selling price of 
        the vehicle. The final selling price will only be determined at the time 
        of signing the purchase agreement, between the customer and participating 
        dealer. </font> 
      <p> <font size="-1" face="Arial"><b>Why you need to provide personal information</b> 
        </font>
      <p><font size="-1" face="Arial"> We provide the information you supplied 
        on the request for a dealer referral form to the participating dealer, 
        who will use this information for following up on the purchase. The supplied 
        customer information is also maintained in a database by United Buying 
        Service Chicago for the purpose of following up on the service our customers 
        receive. Customers maybe contacted either by the phone number supplied 
        and/or email. We ask your age to be sure you are 18 (eighteen) years of 
        age or older. We also use our database for additional marketing promotions. 
        You will be sent an email asking for your permission to receive future 
        promotional emails from United Buying Service Chicago. </font><font face="Arial" size="-1">&nbsp;</font></td>
  </tr>
</table>
<cfinclude template="_footer.cfm">