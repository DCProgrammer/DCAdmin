<cfinclude template="_header.cfm">

<cfquery name="getCityInfo" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT City,State from ZipsToCoords
where ZipCode="#Session.Zip#"
</cfquery>

<cfset City=getCityInfo.City>
<cfset State=getCityInfo.State>

<cfif not IsDefined("Session.MemberID")>
<cfset Session.MemberID="">
</cfif>

<cfif Session.MemberID is not "" and not isDefined("isAuto") and not IsDefined("isAppliance")>
<cfset Submit=1>
</cfif>

<cfif Isdefined("Submit")>
<cfset Fields="Fields=1">
<cfloop index=foo list=#fieldnames#>
<cfset Fields=Fields & "&" & #foo# & "=" & #Evaluate(foo)#>
</cfloop>
<cflocation url="Process_2.cfm?#Fields#">
</cfif>

<table width="750" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	<form method=post action="form_temp_info.cfm">
	<cfif isDefined("isAuto")>
	<input type=hidden name="isAuto" value="1">
	</cfif>
	<cfif isDefined("isAppliance")>
	<input type=hidden name="isAppliance" value="1">
	</cfif>
	<cfif isDefined("isFinance")>
	<input type=hidden name="isFinance" value="1">
	</cfif>
<cfif not IsDefined("Session.MemberID")>
<cfset Session.MemberID="">
</cfif>
<cfif Session.MemberID is "">
        <tr valign="top"> 
          <td height="50" colspan="2"> <p>Please 
                provide us your information so we can begin the process, then 
                click the &quot;SUBMIT&quot; button on the right hand of the page.</p>
            </p>
          </td>
        </tr>
		<cfoutput>
		<cfif isDefined("Error")>
		<tr><td class=warning colspan=2>
		#Error#
		</td></tr>
		</cfif>
        <tr valign="top"> 
          <td colspan="2" align="right"><hr size="1" width="100%"></td>
        </tr>
		<!cfif isDefined("Session.foundBadEmail")>
        <tr valign="top"> 
          <td align="right">E-mail:</td>
          <td><input name="email" type="text" class="inputBox" <cfif isdefined("email")>value="#email#"</cfif>></td>
        </tr>
		<!/cfif>
        <tr valign="top"> 
          <td align="right">First Name:</td>
          <td><input name="firstName" type="text" class="inputBox" <cfif isDefined("firstName")>value="#Firstname#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">Last Name:</td>
          <td><input name="lastName" type="text" class="inputBox" <cfif isDefined("lastName")>value="#lastName#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">Address:</td>
          <td><input name="addr1" type="text" class="inputBox" <cfif isDefined("addr1")>value="#addr1#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>#City#, #State# #Session.Zip#</td>
        </tr>
        <tr valign="top"> 
          <td align="right">Day Phone:</td>
          <td><input name="BPhone" type="text" class="inputBox" <cfif isDefined("BPhone")>value="#BPhone#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">Eve Phone:</td>
          <td><input name="homePhone" type="text" class="inputBox" <cfif isDefined("homePhone")>value="#homePhone#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">Mobile Phone:</td>
          <td><input name="CellPhone" type="text" class="inputBox" <cfif isDefined("CellPhone")>value="#CellPhone#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">Fax:</td>
          <td><input name="Fax" type="text" class="inputBox" <cfif isDefined("Fax")>value="#Fax#"</cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right">Home Fax:</td>
          <td> <input name="HomeFax" type="text" class="inputBox" <cfif isDefined("HomeFax")>value="#HomeFax#"</cfif>></td>
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
          <td> <input name="OptIn" type="checkbox" class="inputCheckBox" value="1" <cfif isDefined("OptIn")>checked</cfif>>
            Yes</td>
        </tr>
	  </cfoutput>
	  <cfelse>
	  <tr>
	<cfquery name="getMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	  SELECT FirstName, LastName, Addr1, City, State from Members where MemberID=#Session.MemberID#
	</cfquery>
	<cfoutput query="getMember">
	  <td><img src="images/spacers/1.gif" alt="Spacer" width="300" height="1" border="0"><br>
	  <B>ACCOUNT MEMBER INFORMATION</b>
	  <br><hr size="1"><br>
	  #FirstName# #LastName#<br>
	  #Addr1#<br>
	  #City#, #State#  #Session.Zip#<br></td>
	  </cfoutput>
	  </tr>
	  </cfif>		
      </table>
	  </td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td height="50" colspan="2"> <p>Additional Information.</p></td>
        </tr>
        <tr valign="top"> 
          <td colspan="2" align="right"> <hr size="1" width="100%"></td>
        </tr>
        <tr valign="top"> 
          <td align="right" colspan="2"><input type="submit" name="Submit" value="Submit"></td>
        </tr>
		<cfif isDefined("isAuto")>
		<cf_JSModels4 included>
		</cfif>
		<cfif isDefined("isAppliance")>
			<cfquery name="getProduct" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
			SELECT Name, ProductID from ProductItem
			where type='product'
			and Category='Appliance'
			order by Name	
			</cfquery>
		<cfoutput query="getProduct">
		
		<tr><td colspan=2><input type=checkbox class=inputcheckbox2 name="productName" value="#Name# [#ProductID#]">#Name#</td></tr>	
		</cfoutput>		
		</cfif>
		<cfif isDefined("productName")>
		<cfoutput>
		<input type=hidden name="productName" value="#productName#">
		</cfoutput>
		</cfif>
		<cfif Session.MemberID is "">
        <tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">Best Contact Time:</td>
          <td bgcolor="f0f0f0">
		  	<select name="ContactTime" class="inputBox">
			<option <cfif isDefined("ContactTime")><cfif contactTime is 'Morning'>selected</cfif></cfif>>Morning</option>
			<option <cfif isDefined("ContactTime")><cfif contactTime is 'Afternoon'>selected</cfif></cfif>>Afternoon</option>
			<option <cfif isDefined("ContactTime")><cfif contactTime is 'Evening'>selected</cfif></cfif>>Evening</option>
			<option <cfif isDefined("ContactTime")><cfif contactTime is 'Anytime'>selected</cfif></cfif>>Anytime</option>
			</select> 
        </tr>
		<tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">Were you referred from your Organization::</td>
          <td bgcolor="f0f0f0"> 
            <input name="referredFlag" type="checkbox" class="inputCheckBox2" value="1" <cfif isDefined("referredFlag")>checked</cfif>>
            Yes</td>
        </tr>
        <tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">Name of Organization:</td>
          <td bgcolor="f0f0f0"> 
            <input name="NameOfOrg" type="text" class="inputBox" <cfif isDefined("NameOfOrg")><cfoutput>value="#NameOfOrg#"</cfoutput></cfif>></td>
        </tr>
        <tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">&nbsp;</td>
          <td bgcolor="f0f0f0">&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">Yes - I am at least 18 years of age?</td>
          <td bgcolor="f0f0f0"> 
            <input name="DriversLicence" type="checkbox" class="inputCheckBox2" value="1" <cfif isDefined("DriversLicence")>checked</cfif>>
            Yes</td>
        </tr>
		</cfif>
        <tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">&nbsp;</td>
          <td bgcolor="f0f0f0">&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td align="right" bgcolor="f0f0f0">&nbsp;</td>
          <td bgcolor="f0f0f0">&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td colspan="2"> <p>We will process your auto or mortgage loan request 
              through our network of participating lenders. Contact us at 800.YES.COST 
              today for more information to start saving.</p>
            <p>You will be contact by us with a competitive loan quote without 
              any hassles and the initial quote is FREE. </td>
        </tr>
      </table>
	  </td>
</table>
<cfinclude template="_footer.cfm">