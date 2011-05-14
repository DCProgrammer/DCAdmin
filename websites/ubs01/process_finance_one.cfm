<!-- hardcoded product below -->

<cfif IsDate(Birthday)>
<cfset Session.Birthday=Birthday>
<cfelse>
<cfset Error="You must enter a valid birthday">
</cfif>

<cfif IsNumeric(LoanAmount)>
<cfset Session.LoanAmount=LoanAmount>
<cfelse>
<cfset Error="You must enter a valid number for a loan amount">
</cfif>

<cfif IsNumeric(CurrentMortgage)>
<cfset Session.CurrentMortgage=CurrentMortgage>
<cfelse>
<cfif CurrentMortgage is "">
<cfset CurrentMortgage=0>
<cfset Session.CurrentMortgage=0>
</cfif>
</cfif>

<cfif IsNumeric(GrossIncome)>
<cfset Session.GrossIncome=GrossIncome>
<cfelse>
<cfset Error="You must enter a valid number for a gross income">
</cfif>

<cfif isDefined("Error")>
<cflocation url="form_finance.cfm?Error=#URLEncodedFormat(Error)#&Birthday=#URLEncodedFormat(Birthday)#&financeType=#URLEncodedFormat(financeType)#&occupancy=#URLEncodedFormat(occupancy)#&LoanAmount=#URLEncodedFormat(LoanAmount)#&CurrentMortgage=#URLEncodedFormat(CurrentMortgage)#&GrossIncome=#URLEncodedFormat(GrossIncome)#">
</cfif>

<cfset Session.financeType=financeType>
<cfset Session.occupancy=occupancy>
<cfset Session.Product='29445M'> <!-- Hardcoded, change later -->

<cflocation url="form_temp_info.cfm?isFinance=1">