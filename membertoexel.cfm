<cfoutput>		

<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT     Org, FirstName, LastName, Addr1, City, State, Zip, HomePhone, BPhone, Email, JoinDate
FROM         Members
WHERE     (Email <> '') AND (Org NOT IN
                          (SELECT     org
                            FROM          tempOrgsExclusion)) 
<cfif isDefined("FORM.State") AND FORM.State NEQ "">AND (State = '#FORM.State#')</cfif>
<cfif isDefined("FORM.JoinDate") AND FORM.JoinDate NEQ "">AND (JoinDate > '#FORM.JoinDate#')</cfif>
<cfif isDefined("FORM.Zip") AND FORM.Zip NEQ "">AND (Zip like '#FORM.Zip#%')</cfif>
ORDER BY JoinDate
</cfquery>






		<cfset data = queryNew("count,Org,FirstName,LastName,Addr1,City,State,Zip,HomePhone,BPhone,Email,JoinDate")>
		<cfloop query="getMembers">
				<cfset queryAddRow(data)>
				<cfset querySetCell(data,"count","#getMembers.CurrentRow#")>
				<cfset querySetCell(data,"Org","#getMembers.Org#")>
				<cfset querySetCell(data,"FirstName","#getMembers.FirstName#")>
				<cfset querySetCell(data,"LastName","#getMembers.LastName#")>
				<cfset querySetCell(data,"Addr1","#getMembers.Addr1#")>
				<cfset querySetCell(data,"City","#getMembers.City#")>
				<cfset querySetCell(data,"State","#getMembers.State#")>
				<cfset querySetCell(data,"Zip","#getMembers.Zip#")>
				<cfset querySetCell(data,"HomePhone","#getMembers.HomePhone#")>				
				<cfset querySetCell(data,"BPhone","#getMembers.BPhone#")>
				<cfset querySetCell(data,"Email","#getMembers.Email#")>
				<cfset querySetCell(data,"JoinDate","#getMembers.JoinDate#")>
		</cfloop>
		
		<CF_exportToXLS query="#data#" titles="count,Org,FirstName,LastName,Addr1,City,State,Zip,HomePhone,BPhone,Email,JoinDate">


</cfoutput>