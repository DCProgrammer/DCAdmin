<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	update Members
	set state = 'IL'
	where state = 'Illinois'
</cfquery>	
	
	