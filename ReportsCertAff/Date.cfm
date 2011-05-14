<cfif not isdefined("SearchMonth")>
<cfquery name="getCurMonth" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curMonth=Month(GETDATE())
</cfquery>
<cfquery name="getCurYear" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curYear=Year(GetDate())
</cfquery>

<cfset SearchMonth=getCurMonth.curMonth>
<cfset SearchYear=getCurYear.curYear>

</cfif>
<cfset FromYear=1998>
<cfset ToYear=SearchYear>



<table width="350" border="0" cellspacing="1" cellpadding="1" align="center">
<cfoutput>
<form action="#SCRIPT_NAME#" method="POST" enctype="application/x-www-form-urlencoded">
</cfoutput>
<tr>
	<td colspan="3" align="center">
	<b><font face="arial" size="-1">View Prior Certificates</font></b>
	</td>
</tr>

<tr>
	<td>
	<font face="Arial" size="-1">Month:</font>&nbsp;&nbsp;
	<select name="searchmonth">
<cfloop from=1 to=12 index=Month>
<cfoutput>
<option value=#Month# <cfif Month is SearchMonth>selected</cfif>>#MonthAsString(Month)#</option>
</cfoutput>
</cfloop>
	</select></font>
	</td>
	<td>
		<font face="Arial" size="-1">Year:</font>
		&nbsp;<select name="SearchYear">
		<cfloop from=#FromYear# To=#ToYear# index=Year>
		<cfoutput>
		<option value=#Year# <cfif Year is SearchYear>selected</cfif>>#Year#</option>
		</cfoutput>
		</cfloop>
		</select>
	</td>

	<td align="center">
	<cfif IsDefined("Only")>
	<cfoutput><input type=hidden name="Only" value="#Only#"></cfoutput>
	</cfif>
		<input type="submit" value="View">
	</td>
</tr>

</form>
</table>
