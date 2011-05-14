<cfquery name="AddNote" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
update AFFILIATE_TABLE SET Notes='#Notes#' where ID=#ID#
</cfquery>

<cfquery name="GetName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, Notes from Affiliate_Table where ID=#ID#
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
	<td align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Your 
      changes have been made for Affiliate <br>
      <cfoutput>#GetName.Name#</cfoutput> <br>
      <br>
      </font>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F0F0F0">
        <tr>
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><cfoutput>#GetName.Notes#</cfoutput></font><font color="#000066" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b> 
            </b></font></td>
        </tr>
      </table>
      <font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; </font><font color="#000066" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><br>
      <br>
      <a href="javascript:window.close()">click here to close window</a>. <br>
      <br>
      <br>
      </b></font></td>
</tr>


<tr>      
	<td bgcolor="#445999" align="center">
	<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1">
	&nbsp;
	</font></b>
	</td>
</tr>
</table>
