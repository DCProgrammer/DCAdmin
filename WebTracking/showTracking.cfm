<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="getReport" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT B.Code, CodeName, count(A.Code) as myCount
from reportTrackingLog A
RIGHT OUTER JOIN reportCodeNames B
ON A.Code=B.Code
group by B.Code, CodeName
order by B.Code
</cfquery>

<table border=1>
<tr><td>Type (code)</td><td>Amount</td></tr>
<cfoutput query="getReport">
<tr><td>#CodeName# (#Code#)</td><td>#myCount#</td></tr>
</cfoutput>
</table>

</body>
</html>
