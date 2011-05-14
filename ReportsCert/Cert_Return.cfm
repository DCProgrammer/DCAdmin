<cfif not isDefined("Session.Add_Date")>
	<cflocation url="Certificate_Search.cfm">
</cfif>
<cfinclude template="_header.cfm">
<cfquery name="GetCert" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select Distinct A.Certificat, A.ADD_Date, A.Paid as CertificatPaid,
	   B.DealerID, B.Name as DealerName, B.Addr1, B.City, B.State, B.Zip, B.Phone, B.Contact, B.SalesRep as DCSalesRep,
       C.FirstName, C.LastName, C.Addr1 as MAddress, C.City as MCity, C.State as MState, C.Zip as MZip,
	   C.HomePhone, C.BPhone, C.CellPhone,
	   D.Name as OrgName, 
       E.Product,
	   F.Paid as InvPaid
from Certificat A, DCDealers B, MembersTable C, Organiza D, Product E, INV_LINE F
where A.Dealer='#DealerID#'
and A.Dealer=B.DealerID
and A.ADD_DATE > '#Session.Add_Date#'
and A.Member=C.MemberID
and A.Organizati=D.Organizati
and A.Product=E.ProductID
and A.Certificat*=F.Certificat
order by A.Add_Date Desc

</cfquery>

<cfif GetCert.RecordCount gt 0>
<table width="768" border="0" align="center">
<tr bgcolor="#445999">
	<td class="HeadWhite">MEMBER INFO</td>
	<td class="HeadWhite">DEALER INFO</td>
</tr>
<CFOUTPUT query="GetCert">


<SCRIPT LANGUAGE="javascript">

function open_digital(page) { var msie=false; var appName=navigator.appName; 
if(appName.indexOf("Microsoft")==0) msie=true; 
DC_window=window.open(page, "DC_window", 
"width=400,height=400,status=0, resizable=no,menubar=no,scrollbars=yes,toolbar=no,location=0,menubar=no"); 
if(!msie) DC_window.focus(); }

</SCRIPT>

<cfif Trim(GetCert.CertificatPaid) eq 'Y'>
	<cfset CPaid = "PAID">
<cfelse>
	<cfset CPaid = "PENDING">
</cfif>

<cfif Trim(GetCert.InvPaid) eq 'Y'>
	<cfset IPaid = "PAID">
<cfelse>
	<cfset IPaid = "PENDING">
</cfif>



<tr>
	<td align="left" valign="top">
	<b class="bold">#GetCert.Certificat#</b>:#DateFormat(GetCert.ADD_Date)#
	<br>
	Invoice Line Paid Status: #IPaid#
	<br>
    Certificate Paid Status: <b class="bold"><A href="javascript:open_digital('Cert_Details.cfm.cfm?Certificat=#GetCert.Certificat#');">#CPaid#</a></b>
	<br>
	#FirstName# #LastName#<br>
	#GetCert.MAddress#<br>
	#GetCert.MCity#,  #GetCert.MState# #GetCert.MZip#<br>
	<cfif GetCert.HomePhone neq "">HM:#GetCert.HomePhone#<cfelse> HM:N/A</cfif><br>
	<cfif GetCert.BPhone neq "">WK:#GetCert.BPhone#<cfelse> WK:N/A</cfif> <cfif GetCert.CellPhone neq "">M:#GetCert.CellPhone#<cfelse> M:N/A</cfif><br>
	PRODUCT: #GetCert.Product#<br>
	AFFILIATE MEMBER: #GetCert.OrgName#
	</td>
	<td align="left" valign="top">
	DEALER ID:#GetCert.DealerID#<br>
	#GetCert.DealerName#<br>
	#GetCert.Addr1#<br>
	#GetCert.City# #GetCert.State# #GetCert.Zip#<br>
	#GetCert.Phone#<br>
	#GetCert.Contact#
	<BR><BR>
	DC Sales Representative: #Trim(GetCert.DCSalesRep)#
	</td>
</tr>
<tr><td colspan="2"><hr size="1"></td></tr>
</CFOUTPUT>
</table>
	



<cfelse>
  <div align="center">NO CERTIFICATS FOUND</div>
</cfif>


<cfinclude template="_footer.cfm">


