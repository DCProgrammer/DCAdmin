<cfquery name="GetName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, ID, Notes from Affiliate_Table 
where ID=#ID#
</cfquery>


<table width="360" border="0" align="center" cellspacing="0" cellpadding="3">
<cfoutput query="GetName">
<tr>      
	  <td bgcolor="##445999" align="center"> 
        <font color="##FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1"> <b> 
        MODIFY/VIEW AFFILIATE NOTES</font></td>
</tr>
<tr>
	  <td align="center"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
          You are about to add additional notes. To create a line break insert 
          &lt;BR&gt; or to create a paragraph separator insert &lt;P&gt;</font></p>
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">.<br>
          #GetName.Name#<br>
          If you are sure continue, if not <a href="javascript:window.close()">click 
          here to close window</a>. </font></p></td>
</tr>
<tr>
	  <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Add 
        Notes, Please leave initials and date?</font></td>
</tr>
<form action="MofifyAffNotesAction.cfm" method="post">
<input type="Hidden" name="ID" value="#GetName.ID#">
<tr>
	<td align="center"><textarea name="Notes" cols="40" rows="20" wrap="VIRTUAL">#UCase(GetName.Notes)#</textarea></td> 
</tr>
<tr>
	<td align="center"><input type="submit" value="Modify Notes"></td>	
</tr>
</form>
</cfoutput>

<tr>      
	<td bgcolor="#445999" align="center"> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
      &nbsp; </font></td>
</tr>
</table>

