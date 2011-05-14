<cfquery name="GetName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, ID from Affiliate_Table 
where ID=#ID#
</cfquery>


<table width="360" border="0" align="center" cellspacing="0" cellpadding="3">
<cfoutput query="GetName">
<tr>      
	<td bgcolor="##445999" align="center">
	<font color="##FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	<b>
	MODIFY AFFILIATE NAME
	</font></b>
	</td>
</tr>
<tr>
	<td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
	You are about to change the name of <br>
	#GetName.Name#<br>
	If you are sure continue, if not <a href="javascript:window.close()">click here to close window</a>.
	
	</font></td>
</tr>
<tr>
	<td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change to?</font></td>
</tr>
<form action="MofifyAffNameAction.cfm" method="post">
<input type="Hidden" name="ID" value="#GetName.ID#">
<tr>
	<td align="center"><input type="text" name="Name" value="#UCase(GetName.Name)#" size="35"></td> 
</tr>
<tr>
	<td align="center"><input type="submit" value="Confirm"></td>	
</tr>
</form>
</cfoutput>

<tr>      
	<td bgcolor="#445999" align="center">
	<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	&nbsp;
	</font></b>
	</td>
</tr>
</table>

