<!--- retrieve the latest few dealer records to help with generating new IDs --->
<cfquery name="qLatestDealers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT top 5 DealerID,Name,datemodified
from DCDealers
order by datemodified desc
</cfquery>

<html>
<head><title>Add New Dealer</title></head>
<body>
<cfif isDefined("Error")>
	<font color=red>
	<cfoutput>
	#Error#
	</cfoutput>
	</font>
</cfif>

<b>Recently-modifed Dealers:</b> (Note: Dealers added before datestamping will appear as '01/01/2001')<br>
<table border="1">
	<tr>
		<th>DealerID</th>
		<th>Name</th>
		<th>Date Last Modified</th>
	</tr>
<cfoutput query="qLatestDealers">
	<tr>
		<td>#qLatestDealers.DealerID#</td>
		<td>#qLatestDealers.Name#</td>
		<td>#DateFormat(qLatestDealers.DateModified, "mm/dd/yyyy")#</td>
	</tr>	
</cfoutput>
</table>
<br>
<cfif not isDefined("DealerID")><cfset DealerID=""></cfif>
<cfif not isDefined("Name")><cfset Name=""></cfif>
<form method=post action="addDealerAction.cfm">
<cfoutput>
New Dealer ID: <input type=text name="dealerID" value="#dealerID#"><br>
New Dealer Name: <input type=text name="Name" value="#Name#"><br>
</cfoutput>
<input type=submit value="Add Dealer">
</form>
</body>
</html>
