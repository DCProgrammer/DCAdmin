<cfquery name="GetCert" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT * from Certificat
	where Certificat=#Certificat#
</cfquery>
  

<html>
<head>
<title>Certificat Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="/DCAdmin/CSS/style1.css" rel=stylesheet>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table border="0" width="100%">
  <tr bgcolor="#445999"> 
    <td align="center" class="PopHead" colspan="2">CERTIFICATE: <cfoutput query="GetCert">#GetCert.Certificat#</cfoutput> </td>
  </tr>
  <cfoutput query="GetCert">
  <tr> 
    <td>CERTIFICATE:</td>
    <td>#CERTIFICAT#</td>
  </tr>
  <tr>
  	<td>DIVISION:</td>
	<td>#DIVISION#</td>
  </tr>
  <tr>
  	<td>ORGANIZATION:</td>
	<td>#ORGANIZATI#</td>
  </tr>
  <tr>
  	<td>MEMBER:</td>
	<td>#MEMBER#</td>
  </tr>
  <tr>
  	<td>SALES REPRESENTATIVE:</td>
	<td>#SALES_REP#</td>
  </tr>  
  <tr>
  	<td>AD SOURCE:</td>
	<td>#AD_SOURCE#</td>
  </tr>
  <tr>
  	<td>OPERATOR:</td>
	<td>#OPERATOR#</td>
  </tr>
  <tr>
  	<td>CALL TAKER:</td>
	<td>#DATA_ENTER#</td>
  </tr>      
  <tr>
  	<td>DATE GENERATED:</td>
	<td>#DateFormat(ADD_DATE)#</td>
  </tr>    
  <tr>
  	<td>PRODUCT:</td>
	<td>#PRODUCT#</td>
  </tr>
  <tr>
  	<td>BRAND:</td>
	<td>#BRAND#</td>
  </tr>
  <tr>
  	<td>DEALER:</td>
	<td>#DEALER#</td>
  </tr>
  <tr>
  	<td>VISIT:</td>
	<td>#VISIT#</td>
  </tr>
  <tr>
  	<td>BUYER ZIP CODE:</td>
	<td>#BUY_ZIP#</td>
  </tr>
  <tr>
  	<td>VEHICLE PURCHASED:</td>
	<td>#BUY#</td>
  </tr>
  <tr>
  	<td>AMOUNT:</td>
	<td>#AMT_13#</td>
  </tr>
  <tr>
  	<td>PURCHASE DATE:</td>
	<td>#PURCH_DATE#</td>
  </tr>
  <tr>
  	<td>SALES REPRESENTATIVE:</td>
	<td>#SALES_PER#</td>
  </tr>
  <tr>
  	<td>BILLED:</td>
	<td>#BILLED#</td>
  </tr> 
<form action="Cert_Details_ModifyAction.cfm" method="post">
<input type="hidden" name="CERTIFICAT" value="#GetCert.CERTIFICAT#">
<tr bgcolor="##CCCCCC">
 	<td><b>PAID:</b></td>
    <td>
		<cfif GetCert.Paid is "Y">
			<input type="radio" name="Paid" value="Y" checked>Yes
			<input type="radio" name="Paid" value="N">No
		<cfelse>
			<input type="radio" name="Paid" value="Y">Yes
			<input type="radio" name="Paid" value="N" checked>No		
		</cfif>
    </td>
  </tr>
  
  <tr>
  	<td>MEMBER FAX:</td>
	<td>#MEMBER_FAX#</td>
  </tr>
  <tr>
  	<td>MEMBER_PRI</td>
	<td>#MEMBER_PRI#</td>
  </tr>
  <tr>
  	<td>DEALER_PRI</td>
	<td>#DEALER_PRI#</td>
  </tr>
  <tr>
  	<td>STATUS:</td>
	<td>#STATUS#</td>
  </tr>
  <tr>
  	<td>RETURNED:</td>
	<td>#RETURNED#</td>
  </tr>
  <tr>
  	<td></td>
	<td>#LOANAGT#</td>
  </tr>
  <tr>
  	<td>DETERM:</td>
	<td>#DETERM#</td>
  </tr>

  <tr> 
    <td colspan="2" align="center">
	<input type="image" name="Update" value="UPDATE" src="/CommonImages/Buttons/White/w_update.gif">
	</td>
  </tr>
</form>  
  </cfoutput>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr><td colspan="2" align="center" valign="bottom"><a href="javascript:window.close()">Close Window</a></td></tr>

<tr>      
	<td  colspan="2" bgcolor="#445999" align="center">
	<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	&nbsp;
	</font></b>
	</td>
</tr>  
  
</table>


</body>
</html>
