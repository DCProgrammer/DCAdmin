<cfif isDefined("attributes.name")>
<cfset myName=attributes.name>
<cfelse>
<cfif isDefined("name")>
<cfset myName=name>
<cfelse>
<cfset myName="COMPLICATED TEST NAME">
</cfif>
</cfif>


<cfset conName=UCase(Mid(myName,1,1))>
<cfloop index=x from=2 to=#Len(myName)#>
<cfif (Mid(myName,x-1,1) is not ' ') and (Mid(myName,x-1,1) is not '.')><cfset conName=Insert(LCase(Mid(myName,x,1)),conName,x-1)>
<cfelse><cfset conName=Insert(UCase(Mid(myName,x,1)),conName,x-1)></cfif>
</cfloop>

<cfif isDefined("attributes.name")>
<cfset Caller.capped=conName>
<cfelse>
<cfoutput>#conName#<br></cfoutput>
</cfif>
