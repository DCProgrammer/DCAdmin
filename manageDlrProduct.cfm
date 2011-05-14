<html>
<head>
<title>Edit Dealer</title>
</head>
<body>
<cfquery name="getDealerProducts" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from DealerToProduct A, Product B 
where DL_ID="#dealerID#"
and A.Product_ID=B.ProductID
</cfquery>

<cfoutput query="getDealerProducts">
#Product# <a href="removeProdFromDealer.cfm?Product=#ProductID#&DealerID=#DealerID#">remove</a><br>
</cfoutput>
<form method=get action="addProdToDealer.cfm">
<cfoutput>
<input type=hidden name="DealerID" value="#DealerID#">
</cfoutput>
<cfquery name="getProducts" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Product B 
ORDER BY Product
</cfquery>
Product: <select name="ProductID">
<cfoutput query="getProducts">
<option value="#productID#">#product#</option>
</cfoutput>
</select>
<input type=submit value="Add">
</form>
<cfoutput>
<a href="editDealer.cfm?DlrID=#DealerID#">Edit Dealer</a>
</cfoutput>

</body>
</html>