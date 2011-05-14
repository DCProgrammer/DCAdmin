<cfquery name="GetCert" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
update CERTIFICAT SET Paid='#Paid#' where CERTIFICAT=#CERTIFICAT#
</cfquery>


<table width="360" border="0" align="center" cellspacing="0" cellpadding="3">
<tr>      
	<td bgcolor="##445999" align="center">
	<font color="##FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	<b>MODIFY CERTIFICATE RECORD</b>
	</font>
	</td>
</tr>
<tr>
	<td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
	Your changes have been made to <cfoutput>#CERTIFICAT#</cfoutput> <br>
	<br><br>
	<b>I M P O R T A N T</b>
	<br>
	Refresh your page for changes to take effect on the Update Page.
	<br>
	<br>
	<br>
	
	<a href="javascript:window.close()">click here to close window</a>.	
	</font>
	<br><br><br>
	</td>
</tr>


<tr>      
	<td bgcolor="#445999" align="center">
	<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	&nbsp;
	</font></b>
	</td>
</tr>
</table>
