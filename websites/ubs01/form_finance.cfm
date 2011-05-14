<cfinclude template="_header.cfm">

<cfset FinanceList="Refinance,Home Equity,Debt Consolidation,Home Improvement,Home Purchase Loans">
<form method=post action="process_finance_one.cfm">
<table width="750" border="0" cellspacing="0" cellpadding="10">
  <tr>
  <td bgcolor="#ffffff">
<table>
<cfif isDefined("Error")>
<tr><td colspan=2 class=warning><cfoutput>#Error#</cfoutput></td></tr>
</cfif>
<tr><td>
Type of Financing: </td>
<td><select name="financeType">
<cfloop list=#FinanceList# index=foo>
<cfoutput>
<option value="#foo#" <cfif isDefined("financeType")><cfif financeType is foo>selected</cfif></cfif>>#foo#</option>
</cfoutput>
</cfloop>
</select></td></tr>
<tr><td>
Birthday: 
</td><td>
<input type=text name="Birthday" <cfif isDefined("Birthday")><cfoutput>value='#Birthday#'</cfoutput></cfif> >
</td></tr>
<tr><td>
Occupancy Status: 
</td><td>
<cfset occupancyList="Primary Residence,Second Home,Investment Property">
<select name="occupancy">
<cfloop list=#occupancyList# index=foo>
<cfoutput>
<option <cfif isDefined("occupancy")><cfif occupancy is foo>selected</cfif></cfif>>#foo#</option>
</cfoutput>
</cfloop>
</select>
</td></tr>
<CFOUTPUT>
<tr><td>
Loan Amount:
</td><td>
<input name="LoanAmount" type=text value="0" <cfif isDefined("LoanAmount")>value="#LoanAmount#"</cfif>>
</td></tr>
<tr><td>
Current Mortgage Balance:
</td><td>
<input name="CurrentMortgage" type=text value="0" <cfif isDefined("CurrentMortgage")>value="#CurrentMortgage#"</cfif>>
</td></tr>
<input type="hidden" value="0" name="GrossIncome">
<!---
<tr><td>
Gross Monthly Income:
</td><td>
<input name="GrossIncome" type=text value="0" <cfif isDefined("GrossIncome")>value="#GrossIncome#"</cfif>>
</td></tr>
--->
</CFOUTPUT>
<tr><td colspan=2 align=right>
<input type=submit value="Continue">
</td></tr>
</table>
</td>
</tr>
</table>

</form>

<cfinclude template="_footer.cfm">