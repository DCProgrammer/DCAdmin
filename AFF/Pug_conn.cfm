<cfset servername=CGI.server_name>
<!---
<cfset servername=CGI.server_name &":"&CGI.SERVER_PORT>
<cfoutput>#servername#</cfoutput>
--->

<cfif servername eq "10.10.10.105" >
	<CFSET Application.DBUser="digitalcars"> 
	<cfset Application.DBPwd="cars"> 
	<cfset Application.MainDB=cfg_MainDB> 
 <cfelse> 
	<CFSET Application.DBUser="sa"> 
	<cfset Application.DBPwd="SouthPark"> 
	<cfset Application.MainDB=cfg_MainDB> 
</cfif> 
<cfset Caller.cfg_MainDB="MainSQL">  

<!--- 
<cfquery name="getStates"
 datasource="#Application.MainDB#"  
 username="#Application.DBUser#" 
 password="#Application.DBPwd#" >
SELECT      DISTINCT State
FROM         ContinentalZipsToCoords
ORDER By State
</cfquery>
--->