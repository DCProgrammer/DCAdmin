<cfif isDefined("Session.Zip")>
	<cfquery name="checkZip" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	select ZipCode from ZipsToCoords
where (State='MD'
or State='VA'
or State='DC')
and ZipCode='#Left(Session.Zip,5)#'
</cfquery>

<cfif checkZip.recordCount gt 0>
	<cfif (Find('Restricted_MD.cfm',SCRIPT_NAME) is 0) 
	and (Find('about.cfm',SCRIPT_NAME) is 0) 
	and (Find('disclaim.cfm',SCRIPT_NAME) is 0)>
		<cflocation url="Restricted_MD.cfm">
	</cfif>
</cfif>
</cfif>