<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<cfinclude template="../_header.cfm">

<cfparam name="AllDealerSwitch" default=0>

<cfif not IsDefined("AgentID")>
<cfset MyAgentID=Session.XtranetAgent>
<cfelse>
<cfset MyAgentID=AgentID>
</cfif>

<cfquery name="getAffID" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT AffiliateID from CSR_Table where AgentID='#MyAgentID#'
</cfquery>

<cfset MyAffID=getAffID.AffiliateID>

<cfquery name="getDealers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT A.*, B.State, B.Name from DealerToLender A, IndexedNWDealers B 
where A.DL_Index=B.DL_Index
<cfif not IsDefined("AllDealers")>
and A.AgentID='#MyAgentID#'
</cfif>
order by State, Name
</cfquery>

<cfquery name="countLenders" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT ORG_ID, Name 
from DealerToLender A, Affiliate_Table B
where A.ORG_ID=B.ID
<cfif not IsDefined("AllDealers")>
and A.AgentID='#MyAgentID#'
</cfif>
<cfif MyAffID is not 35>
and A.ORG_ID=#MyAffID#
</cfif>
</cfquery>


<table border="0" width="600">
<tr>
	<td align="center" valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td align="center" bgcolor="#D6D7E2"><strong>Manage Dealer Accounts</strong></td></tr>
	<tr>
		<td height="50" bgcolor="#F0F0F0">
		Select the dealership that you want to view or modify by selecting from the drop down option.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		<table border="0" width="100%">
		<cfparam name=DealerTarget default="DealerDetail.cfm">
		<cfoutput>
		<form method=post action='#DealerTarget#'>
		</cfoutput>
		<tr><td>&nbsp;</td><td align="right"><input type=submit value="Choose Dealer"></td></tr>		
		<cfif countLenders.recordCount gt 1>
		<tr>
			<td align="right">&nbsp;Lender:</td>
			<td align="right">
			<select name='Org'>
			<cfoutput query="countLenders">
			<option value="#ORG_ID#">#Name#</option>
			</cfoutput>
			</select>
			</td>
		</tr>
		</cfif>
		<tr>
			<td align="right"><font face="Arial,Helvetica,sans-serif"><strong>CHOOSE DEALERSHIP:&nbsp;&nbsp;</strong></font></td>
			<td align="right">
			 <select name="Dealer">
			<cfif AllDealerSwitch is 1>
			<option value="ALL">All Dealers</option>
			</cfif>
			<cfoutput query="getDealers">
			<cfif Len(Name) gt 35>
			<cfset trimmedName=Left(Name,35)>
			<cfelse>
			<cfset trimmedName=Name>
			</cfif>
			&nbsp;&nbsp;<option value="#DealerToLenderIndex#">#State#) -- #trimmedName#</option>
			</cfoutput>
			</select>
		    </td>
		</tr>

		</form>
		  </td>
		</tr>
		</table>
		
		
		</td>
	</tr>
	</table>	
	</td>
 </tr>
</table>

<cfinclude template="../_footer.cfm">