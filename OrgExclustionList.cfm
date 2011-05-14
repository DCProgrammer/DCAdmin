<cfquery name="GetList" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT B.Name, A.Org from tempOrgsExclusion A, Organiza B
where A.Org=B.Organizati
order by B.name
</cfquery>


<table width="360" border="0" align="center" cellspacing="0" cellpadding="3">
<tr>      
	  <td bgcolor="##445999" align="center"> 
        <font color="##FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1"> <b> 
        ORG LIST</font></td>
</tr>
<cfoutput query="GetList">
<tr>
	  <td><p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
      #GetList.Name# #GetList.Org#<br>
 </font></td>
</tr>
</cfoutput>

<tr>      
	<td bgcolor="#445999" align="center">
     <a href="javascript:window.close()">
	 <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
	 <b>click here to close window</b></font></a></td>
</tr>
</table>



