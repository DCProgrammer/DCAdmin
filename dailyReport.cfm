<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfif isDefined("type")>
<cfset numDays=7>
<cfelse>
<cfset numDays=1>
</cfif>

<cfquery name="getMembers" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Org,A.MemberID,JoinDate,FirstName, LastName, Addr1, Addr2, City,State,Zip,HomePhone,BPhone, Email
from MembersTable A, MemberToOrg B 
where A.MemberID=B.MemberID and DateDiff(dd,JoinDate,getDate())<=#numDays#
</cfquery>

<cfquery name="getCerts" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT CERTIFICAT, ORGANIZATI, MEMBER, ADD_DATE, PRODUCT, DEALER
from CERTIFICAT where DateDiff(dd,Add_Date,getDate())<=#numDays#
</cfquery>

<table border=1>
<tr><th>MemberID</th><th>Name</th><th>Address</th><th>Join Date</th><th>Phone Numbers</th><th>Email</th></tr>
<cfoutput query="getMembers">
<tr>
<td>#MemberID#</td>
<td>#FirstName# #LastName#</td>
<td>#Addr1# #Addr2#<br>#City#, #State#  #Zip#</td>
<td>#JoinDate#</td>
<td>Home: #HomePhone#<br>
Work: #BPhone#
</td>
<td>#Email#</td>
</tr>
</cfoutput>
</table>

<table border>
<tr><th>Certificate Info</th><th>Member Info</th><th>Dealer Info</th><th>Product</th></tr>
<cfloop query="getCerts">
<cfquery name="getMember" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT MemberID,JoinDate,FirstName, LastName, Addr1, Addr2, City,State,Zip,HomePhone,BPhone, Email
from MembersTable 
where MemberID=#Member#
</cfquery>
<cfquery name="getDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, Addr1, Addr2, City, State, Zip, Phone, Ext, Fax, Contact
from DCDealers where DealerID="#DEALER#"
</cfquery>
<cfquery name="getProduct" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Product from Product where ProductID="#PRODUCT#"
</cfquery>
<cfoutput>
<tr>
<td>CertID: #Certificat#<br>Org: #Organizati#<br>Date Generated: #add_date#<br></td>
<td>#getMember.FirstName# #getMember.LastName#
<br>#getMember.Addr1# #getMember.Addr2#
<br>#getMember.City#, #getMember.State#  #getMember.Zip#
<br>Home: #getMember.HomePhone#
<br>Work: #getMember.BPhone#
<br>Email: #getMember.Email#</td>
<td>#getDealer.Name#
<br>#getDealer.Contact#
<br>#getDealer.Addr1# #getDealer.Addr2#<br>
#getDealer.City#, #getDealer.State#  #getDealer.Zip#<br>
Phone: #getDealer.Phone# x #getDealer.Ext#<br>
Fax: #getDealer.Fax#</td>
<td>#getProduct.Product#</td>
</tr>
</cfoutput>
</cfloop>
</table>
<cfmail from="info@ubsi.com" to="neal@ubsim.com" bcc="jdhilts@sbcglobal.net" subject="Daily Report" type="html">
<html><head><title>Report</title></head>
Report for: #Now()#<br>
<br>
<table border=1>
<tr><th>MemberID</th><th>Name</th><th>Address</th><th>Join Date</th><th>Phone Numbers</th><th>Email</th></tr>
<cfloop query="getMembers">
<tr>
<td>#MemberID#</td>
<td>#FirstName# #LastName#</td>
<td>#Addr1# #Addr2#<br>#City#, #State#  #Zip#</td>
<td>#JoinDate#</td>
<td>Home: #HomePhone#<br>
Work: #BPhone#
</td>
<td>#Email#</td>
</tr>
</cfloop>
</table>
<br>
<table border>
<tr><th>Certificate Info</th><th>Member Info</th><th>Dealer Info</th><th>Product</th></tr>
<cfloop query="getCerts">
<cfquery name="getMember" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT MemberID,JoinDate,FirstName, LastName, Addr1, Addr2, City,State,Zip,HomePhone,BPhone, Email
from MembersTable 
where MemberID=#Member#
</cfquery>
<cfquery name="getDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, Addr1, Addr2, City, State, Zip, Phone, Ext, Fax, Contact
from DCDealers where DealerID="#DEALER#"
</cfquery>
<cfquery name="getProduct" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Product from Product where ProductID="#PRODUCT#"
</cfquery>
<tr>
<td>CertID: #Certificat#<br>Org: #Organizati#<br>Date Generated: #add_date#<br></td>
<td>#getMember.FirstName# #getMember.LastName#
<br>#getMember.Addr1# #getMember.Addr2#
<br>#getMember.City#, #getMember.State#  #getMember.Zip#
<br>Home: #getMember.HomePhone#
<br>Work: #getMember.BPhone#
<br>Email: #getMember.Email#</td>
<td>#getDealer.Name#
<br>#getDealer.Contact#
<br>#getDealer.Addr1# #getDealer.Addr2#<br>
#getDealer.City#, #getDealer.State#  #getDealer.Zip#<br>
Phone: #getDealer.Phone# x #getDealer.Ext#<br>
Fax: #getDealer.Fax#</td>
<td>#getProduct.Product#</td>
</tr>
</cfloop>
</table>
</html>
</cfmail>

</body>
</html>
