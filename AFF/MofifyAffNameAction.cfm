<cfquery name="GetName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
update AFFILIATE_TABLE SET Name='#UCase(Trim(Name))#' where ID=#ID#
</cfquery>


<table width="360" border="0" align="center" cellspacing="0" cellpadding="3">
<tr>      
	<td bgcolor="##445999" align="center">
	<font color="##FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	<b>MODIFY AFFILIATE NAME</b>
	</font>
	</td>
</tr>
<tr>
	<td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
	Your changes have been made for Affiliate <br>
	<cfoutput>#Name#</cfoutput>
	<br><br>
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
