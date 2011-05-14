<html>
<head>
<title>Edit Dealer</title>
</head>
<body>

<cfquery name="checkDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from DCDealers where DealerID="#dealerID#"
</cfquery>

<cfif checkDealer.recordCount gt 0>
<cflocation url="addDealer.cfm?Error=Dealer+ID+Exists&dealerID=#DealerID#&Name=#Name#">
</cfif>

<cfquery name="addDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO DCDealers (Name,DealerID) values ("#Name#","#DealerID#")
</cfquery>
<cflocation url="editDealer.cfm?dlrID=#DealerID#">

</body>
</html>