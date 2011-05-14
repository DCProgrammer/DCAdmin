<cfif isDefined("Password")><cfset Session.Password=Password></cfif>
<cfif not isdefined("Session.Password")>
<cfset MyVars=''>
<cfif IsDefined("FIELDNAMES")>
<cfloop list="#FIELDNAMES#" index=foo>
<cfset MyVars=MyVars & "&">
<cfset MyVars=MyVars & foo>
<cfset MyVars=MyVars & "=">
<cfset MyVars=MyVars & Evaluate(foo)>
</cfloop>
<!-- POST Detected -->
<cfoutput><!-- #MyVars# --></cfoutput>
</cfif>
<cfif IsDefined("QUERY_STRING")>
<cfif QUERY_STRING is not ''>
<cfset MyVars="&" & QUERY_STRING>
<cfoutput><!-- Query String detected: #QUERY_STRING#-->
<!-- #MyVars# --></cfoutput>
</cfif>
</cfif>
<cfif isDefined("redirectTo")>
<cfif isDefined("p_")>
<cfif p_ is "h107ubsi">
<cfset Session.Password="Accepted">
<cflocation url="#redirectTo#">
</cfif>
</cfif>
</cfif>

<html>
<head>
<title>
Password needed to access restricted site
</title>
<body><br>
<font color=red><h1>Password required for accessing restricted page</h1></font>
<form method=post action="setPassword.cfm">
<cfoutput>
<input type=hidden name="redirectTo" value="#SCRIPT_NAME#?#MyVars#">
Password: <input type=password name=p_>
</cfoutput>
</form>
</body>
</head></html>
<cfabort>
</cfif>