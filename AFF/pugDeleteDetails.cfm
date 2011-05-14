
<cfset Caller.cfg_MainDB="MainSQL"> 



<cfinclude template = "_header.cfm"> 
<cfquery name="getStates"
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#" >
UPDATE  Affiliate_Table
SET active='#Act#'
WHERE ID=#intAffiliateID#
</cfquery>


<center>
<h5><font face='Verdana'>Affliate <cfif #Act# eq '1'>Activated<cfelse>DeActivated</cfif> Successfully</font></h5>
</center>

<META HTTP-EQUIV="Refresh" CONTENT="3;URL=<cfoutput>#CGI.HTTP_REFERER#</cfoutput>">
 