<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<cfquery name="getDealerDetails" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from IndexedNWDealersTable
 where DL_Index = '#DL_Index#'
</cfquery>

<cfset DCDealerState='#Trim(GetDealerDetails.State)#'>


<cfquery name="getDCDealerID" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, DealerID, State from DCDealers
where State = '#DCDealerState#'
and DealerID not IN (SELECT DISTINCT DCDealerID from IndexedNWDealers where State='#DCDealerState#' AND DCDealerID is not NULL)
</cfquery>

<cfquery name="checkDCDealerID" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT myCount=count(*) from IndexedNWDealers 
where DCDealerID in (SELECT DCDealerID from IndexedNWDealers where
	DL_Index='#DL_Index#')
</cfquery>

<cfif checkDCDealerID.myCount gt 1><cfset Error='Dealer+exists.++Contact+support'></cfif>


<cfquery name="getDealerType" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select * from IndexDealers_Type
order by TypeID
</cfquery>


<cfinclude template="../_header.cfm">
<table width="768" border="0" align="center">

<tr>
	<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000FF">
	<TR>
		<td valign="bottom">&nbsp;</td>
		<td height="21" nowrap>Edit Dealer</td>
		<TD valign='bottom'>&nbsp;</TD>
	    <TD valign='bottom' WIDTH="100%" align=right><a href="IndexDealerSearch.cfm">Search Again</a></TD>
	</TR>
    <TR>
		<td width="100%" height="1" colspan="4" align="right" valign="top"
		bgcolor="#000000"><IMG height=1 src="/CommonImages/Headers/black.gif" width="100%"></td>
	</TR>
	</TABLE>	
	</td>
</tr>

<form method=post action="ModifyDealer_Action.cfm">
<tr>
	<td align="right"><input type="Submit" Value="Request Change"></td>
</tr>

<tr>
	<td>
	<table border="0" width="100%" align="center">
          <cfif IsDefined("Error")>
            <tr>
              <td colspan=2 align=center><font color="red"><cfoutput>#Error#</cfoutput></font></td>
            </tr>
          </cfif>
          <cfoutput query="getDealerDetails">	
            <input type=hidden name="DL_Index" value="#DL_Index#">
            <input type="hidden" name="oldname" value="#name#">
            <tr> 
              <td class="td_header"><strong>#Name#</strong></td>
              <td align="right"> 
                <b>DC Dealer:</b> <cfif getDealerDetails.DCDealer eq 1>
                  <b>#getDealerDetails.DCDealerID#</b> 
                  <cfelse>
                  <font color="red">NO</font> </cfif> </td>
            </tr>
            <tr>
              <td colspan="2">#Address#</td>
            </tr>
            <tr>
              <td colspan="2">#City#, #State# #Zip#"</td>
            </tr>
            <cfif DCDealer eq 0>
              <tr> 
                <td colspan="2"><hr size="1"></td>
              </tr>
              <tr> 
                <td colspan="2"> 
                  Will this dealer be on the DigitalCars Dealer Network Program. 
                  <br>
                  If yes enter Choose DC Dealer ID. 
                  <input type="radio" name="DCDealer" value="1" <cfif DCDealer eq 1>checked</cfif>>
                  Yes 
                  <input type="radio" name="DCDealer" value="0" <cfif DCDealer eq 0>checked</cfif>>
                  No 
                  <p> 
                    <select name="DCDealerID">
                      <option value="1">N/A</option>
                      <cfloop query="GetDCDealerID">
                        <option value="#GetDCDealerID.DealerID#">#GetDCDealerID.DealerID# 
                        --- #GetDCDealerID.Name#</option>
                      </cfloop>
                    </select>
                </td>
              </tr>
			  
            </cfif>
			
            <tr>
              <td colspan="2"><hr size="1"></td>
            </tr>			
			<tr>
				<td>Dealer Type:</td>
				<td>
				<select name="Dealer_TypeID">
					<option value="0">NONE</option>	
					<cfloop query="getDealerType">
					<option value="#getDealerType.TypeID#" <cfif #getDealerType.TypeID# eq #getDealerDetails.Dealer_TypeID#>selected="yes"</cfif>>#TypeDescription#</option>
					</cfloop>
				</select>
				
				</td>
			</tr>
			
			
            <tr>
              <td colspan="2"><hr size="1"></td>
            </tr>
            <!--- COMMENTED OUT: NOT SURE IF WE SHOULD ALLOW DEALER NAME UPDATE OR CREATE NEW DEALER--->
            <!---	
	<tr>
		<td>Name:</td>
		<td><input type="text" name="Name" value="#Name#" size=40></td>
	</tr>
	--->
            <input  type="hidden" name="Name" value="#Name#">
            <tr> 
              <td>Address:</td>
              <td><input type="text" name="Address" value="#Address#" size="40"></td>
            </tr>
            <tr> 
              <td>#City#, #State#</td>
              <td><input type="text" name="Zip" value="#Zip#"></td>
            </tr>
            <tr> 
              <td>Main Phone:</td>
              <td><input type="text" name="Phone" value="#Phone#"></td>
            </tr>
            <tr> 
              <td>Toll Free:</td>
              <td><input type="text" name="TollFree" value="#TollFree#"></td>
            </tr>
            <tr> 
              <td>Main Fax:</td>
              <td><input type="text" name="Fax" value="#Fax#"></td>
            </tr>
            <tr> 
              <td><a href="mailto:#Email#">General 
                E-mail:</a></td>
              <td><input type="text" name="Email" value="#Email#" size="40"></td>
            </tr>
            <tr> 
              <td>Web Site Active:</td>
              <td> <input type="radio" name="WebSite" value="1" <cfif WebSite eq 1>checked</cfif>>
                Yes 
                <input type="radio" name="WebSite" value="0" <cfif WebSite eq 0>checked</cfif>>
                No </td>
            </tr>
            <tr> 
              <td><a href="#WebSiteURL#" target="_blank">Web 
                Site URL:</a></td>
              <td><input type="text" name="WebSiteURL" value="#WebSiteURL#" size="40"></td>
            </tr>
            <tr>
              <td colspan="2"><hr size="1"></td>
            </tr>
            <tr> 
              <td>Dealer Principal:</td>
              <td><input type="text" name="Owner" value="#Owner#"></td>
            </tr>
            <tr> 
              <td>General Manager:</td>
              <td><input type="text" name="GM" value="#GM#"></td>
            </tr>
            <tr> 
              <td>Main Contact:</td>
              <td><input type="text" name="Contact" value="#Contact#"></td>
            </tr>
            <tr>
              <td>Password</td>
              <td><input type="text" name="Password" value="#Password#"></td>
            </tr>
          </cfoutput> </table>
	
	</td>
</tr>
</form>

</table>
<cfinclude template="../_footer.cfm">

