<cfif IsDefined("Query")>
<cfquery name="RunQuery" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
#Query#
</cfquery>
<cfoutput>
ran Query: <b>#Query#</b><br>
<cfif IsDefined("RunQuery.recordCount")>
Query Results: recordCount #RunQuery.recordCount#<br>
</cfif>
<cfif IsDefined("RunQuery.ColumnList")>
Columns: #RunQuery.ColumnList#<br>
</cfif>
</cfoutput>
<cfif IsDefined("RunQuery.ColumnList")>
<table border=1>
<tr>
<cfloop list="#RunQuery.ColumnList#" index=foo>
<td><cfoutput>#foo#</cfoutput></td>
</cfloop>
</tr>
<cfoutput query="RunQuery">
<tr>
<cfloop list="#RunQuery.ColumnList#" index=foo>
<td>#Evaluate(foo)#</td>
</cfloop>
</tr>
</cfoutput>
</table>
</cfif>

</cfif>
<html>
<head>
<title>Run Query</title>
</head>
<body>
<form method=post action="runQuery.cfm">
<textarea name="Query" rows=10 cols=80>
</textarea><br>
<input type=submit>
</form>
</body>
</html>
