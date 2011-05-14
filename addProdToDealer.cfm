<html>
<body>
<cfquery name="addDealerProducts" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
INSERT INTO DealerToProduct (DL_ID,Product_ID)
values ("#DealerID#","#ProductID#")
</cfquery>
<cflocation url="manageDlrProduct.cfm?DealerID=#DealerID#">
