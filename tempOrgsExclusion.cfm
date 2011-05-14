
<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT top 500 * from Organiza
where ORGANIZATI IN (select org from tempOrgsExclusion)

</cfquery>

<cfquery name="qExc" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT * FROM  tempOrgsExclusion
</cfquery>

<cfdump var=#getOrgs#>

