<cfinclude template="../_header.cfm">
<div align="center">
<table width="768" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>
	<br>
      <b>DEALER MANAGEMENT</b>
      <hr size="1">
	</td>
  </tr>
 </table>

<cfquery name="getStates" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT State from ContinentalZipsToCoords order by State
</cfquery>


<table width="768" border="0" cellspacing="0" cellpadding="0">
<Tr><td colspan="2">
	Search dealers by State and Name or by Zip Code.  Dealers are out put up to a 100 mile radius.
	<br>
	This search is designed to query all dealers in the National Yellow Pages List.  These are not associated
	to DigitalCars Dealers on the Referral Program.
	<p>
	If you do not find the dealer you are searching, please contact us at <b class="td_header">info@digitalcars.com</b> and submit
	in the e-Mail, the dealer name, location, phone number and any other information that will allow us to
	validate the dealer and add it to the directory.
	<hr size="1">
</td></TR>

<tr align="left" valign="top"> 
   	<td colspan="2" class="td_header">SEARCH DEALER BY STATE, NAME</td>
</tr>	
<form method=post action="IndexDealerSearchAction.cfm">
<tr> 
	<td>State:</td>
	<td>
	<select name="State">
	<option value=""></option>
	<cfoutput query="getStates">
	<option value="#State#">#State#</option>
	</cfoutput>
	</select>
	</td>
</tr>
<tr>
	<td>Dealer Name:</td>
	<td><input type=text name="Name"></td>	
</tr>
<tr><td>&nbsp;</td><td><input type=submit value="Search For Dealers"></td></tr>
</form>
<tr><td colspan="2"><hr size="1"></td></tr>


<tr align="left" valign="top"> 
   	  <td colspan="2" class="td_header">SEARCH DEALER BY ZIP CODE<br>
        NOTE: Need to set error handler.&nbsp; Error's out for Alpha characters</td>
</tr>	
<form method=post action="IndexDealerSearchAction.cfm">
<tr>
	<Td>Zip Code:</TD>
	<Td><input type="text" name="Zip" size="9"></TD>
</tr>
<tr><td>&nbsp;</td><td><input type=submit value="Search For Dealers"></td></tr>
</form>
<tr><td colspan="2"><hr size="1"></td></tr>
</table>

</div>

<cfinclude template="../_footer.cfm">