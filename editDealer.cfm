<html>
<head>
<title>Edit Dealer</title>
</head>
<body>
<cfif not isDefined("dlrName")>
<cfset dlrName="">
</cfif>
<cfif not isDefined("dlrID")>
<cfset dlrID="">
</cfif>
<cfif dlrID is not "">
<cfquery name="getDealerName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from DCDealers where DealerID="#dlrID#"
</cfquery>
<cfif getDealerName.recordCount gt 0>
<cfset dlrName=getDealerName.Name>
</cfif>
</cfif>
<form method=post action="editDealer.cfm">
<cfoutput>
Search By Name: <input type=text name="dlrName" value="#dlrName#" size=60><br>
</cfoutput>
</form>
<cfif dlrID is "" and dlrName is not "">
<cfquery name="getDealerID" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DealerID from DCDealers
where Name LIKE "%#dlrName#%"
</cfquery>
<cfif getDealerID.recordCount gt 0>
<cfset dlrID=getDealerID.DealerID>
</cfif>
</cfif>
<form method=post action="editDealer.cfm">
<cfoutput>
Search By ID: <input type=text name="dlrID" value="#dlrID#" size=10><br>
<input type=hidden name="dlrName" value="#dlrName#">
</cfoutput>
</form>

<a href="AddDealer.cfm">Add New Dealer</a>

<cfif dlrID is not "">
<cfquery name="getDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from DCDealers
where DealerID='#dlrID#'
</cfquery>

<form method=post action="updateDealer.cfm">
<table>
<cfoutput query="getDealer"><a href="manageDlrProduct.cfm?DealerID=#DealerID#">Manage Dealer-To-Product</a>
<input type=hidden name="DealerID" value="#DealerID#">
<tr><td>DealerID</td><td>#DealerID#</td></tr>
<tr><td>Name</td><td><input type=text name="Name" value="#Name#" size=60></td><tr>
<tr><td>Addr1</td><td><input type=text name="Addr1" value="#Addr1#"></td><tr>
<tr><td>Addr2</td><td><input type=text name="Addr2" value="#Addr2#"></td><tr>
<tr><td>City</td><td><input type=text name="City" value="#City#"></td><tr>
<tr><td>State</td><td><input type=text name="State" value="#State#"></td><tr>
<tr><td>Zip</td><td><input type=text name="Zip" value="#Zip#"></td><tr>
<tr><td>Phone</td><td><input type=text name="Phone" value="#Phone#"></td><tr>
<tr><td>Ext</td><td><input type=text name="Ext" value="#Ext#"></td><tr>
<tr><td>Fax</td><td><input type=text name="Fax" value="#Fax#"></td><tr>
<tr><td>AnnualFee</td><td><input type=text name="AnnualFee" value="#AnnualFee#"></td><tr>
<tr><td>MonthFee</td><td><input type=text name="MonthFee" value="#MonthFee#"></td><tr>
<tr><td>QuartFee</td><td><input type=text name="QuartFee" value="#QuartFee#"></td><tr>
<tr><td>Contact</td><td><input type=text name="Contact" value="#Contact#"></td><tr>
<tr><td>Division</td><td><input type=text name="Division" value="#Division#"></td><tr>
<tr><td>Report</td><td><input type=text name="Report" value="#Report#"></td><tr>
<tr><td>Lead</td><td><input type=text name="Lead" value="#Lead#"></td><tr>
<tr><td>Bill</td><td><input type=text name="Bill" value="#Bill#"></td><tr>
<tr><td>GM</td><td><input type=text name="GM" value="#GM#"></td><tr>
<tr><td>JoinDate</td><td><input type=text name="JoinDate" value="#JoinDate#"></td><tr>
<tr><td>Bill_Deal</td><td><input type=text name="Bill_Deal" value="#Bill_Deal#"></td><tr>
<tr><td>FaxExt</td><td><input type=text name="FaxExt" value="#FaxExt#"></td><tr>
<tr><td>Owner</td><td><input type=text name="Owner" value="#Owner#"></td><tr>
<tr><td>CertFee</td><td><input type=text name="CertFee" value="#CertFee#"></td><tr>
<tr><td>Payment</td><td><input type=text name="Payment" value="#Payment#"></td><tr>
<tr><td>Follow_Date</td><td><input type=text name="Follow_Date" value="#Follow_Date#"></td><tr>
<tr><td>Follow_Comment</td><td><input type=text name="Follow_Comment" value="#Follow_Comment#"></td><tr>
<tr><td>Unappl_CAS</td><td><input type=text name="Unappl_CAS" value="#Unappl_CAS#"></td><tr>
<tr><td>Book_Order</td><td><input type=text name="Book_Order" value="#Book_Order#"></td><tr>
<tr><td>Contact2</td><td><input type=text name="Contact2" value="#Contact2#"></td><tr>
<tr><td>SalesRep</td><td><input type=text name="SalesRep" value="#SalesRep#"></td><tr>
<tr><td>Book_AR</td><td><input type=text name="Book_AR" value="#Book_AR#"></td><tr>
<tr><td>Doc_Fee</td><td><input type=text name="Doc_Fee" value="#Doc_Fee#"></td><tr>
<tr><td>Contact3</td><td><input type=text name="Contact3" value="#Contact3#"></td><tr>
<tr><td>BookVent</td><td><input type=text name="BookVent" value="#BookVent#"></td><tr>
<tr><td>Store</td><td><input type=text name="Store" value="#Store#"></td><tr>
<tr><td>Status</td><td><input type=text name="Status" value="#Status#"></td><tr>
<tr><td>Signature</td><td><input type=text name="Signature" value="#Signature#"></td><tr>
<tr><td>Program</td><td><input type=text name="Program" value="#Program#"></td><tr>
<tr><td>Email</td><td><input type=text name="Email" value="#Email#"></td><tr>
<tr><td>LoanAgent</td><td><input type=text name="LoanAgent" value="#LoanAgent#"></td><tr>
<tr><td>MFGCodes</td><td><input type=text name="MFGCodes" value="#MFGCodes#"></td><tr>
<tr><td>Banner</td><td><input type=text name="Banner" value="#Banner#"></td><tr>
<tr><td colspan=2><input type=submit value="Update Dealer"></td><tr>
</table>
</cfoutput>
</form>
</cfif>
</body>
</html>