<html>
<body>
<cfquery name="addDealerProducts" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
DELETE FROM DealerToProduct
where DL_ID="#DealerID#"
and Product_ID="#Product#"
</cfquery>
<cflocation url="manageDlrProduct.cfm?DealerID=#DealerID#">
