
<CFINCLUDE TEMPLATE="_header.cfm">

<cfquery name="getCurMonth" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curMonth=Month(GETDATE())
</cfquery>
<cfquery name="getCurYear" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curYear=Year(GetDate())
</cfquery>

<cfset SearchMonth=getCurMonth.curMonth>
<cfset SearchYear=getCurYear.curYear>


<cfquery name="GetCert" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select A.MemberID, A.FirstName, A.LastName, A.City, A.State,
       B.Certificat, B.Ad_Source, B.Operator, B.Data_Enter, B.Add_Date, C.Name
from Members A, Certificat B, Organiza C
Where A.MemberID=B.Member
and B.Add_Date >='#SearchYear#-#SearchMonth#-01'
and A.Org=C.Organizati
order by B.ADD_Date, A.State	
</CFQUERY>

<table width="768" border="0" align="center">
  
  <TR> 
    <TD colspan="9"> <FONT FACE="Arial, Geneva, Helvetica" SIZE="-1"> 
      <P><CFOUTPUT>This month current results returned <B>#GetCert.RecordCount#</B> certificate(s).</CFOUTPUT></P>
      </FONT> </TD>
  </TR>
  <tr> 
    <td colspan="9"><hr size="1"></td>
  </tr>
  <cfif GetCert.RecordCount gt 0>
    <TR bgcolor="#336699"> 
      <TD VALIGN="top"><font color="#CCCCCC"><strong>Member&nbsp;ID</strong></font></td>
      <td><font color="#CCCCCC"><strong>First&nbsp;Name</strong></font></TD>
      <td><font color="#CCCCCC"><strong>Last&nbsp;Name</strong></font></td>
      <td><font color="#CCCCCC"><strong>City</strong></font></td>
      <td><font color="#CCCCCC"><strong>State</strong></font></td>
      <td><font color="#CCCCCC"><strong>Certificate</strong></font></td>
      <td><font color="#CCCCCC"><strong>Source</strong></font></td>
      <td><font color="#CCCCCC"><strong>&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;&nbsp;</strong></font></td>
      <td><font color="#CCCCCC"><strong>Affiliate&nbsp;Name</strong></font></td>
    </TR>
    <CFOUTPUT QUERY="GetCert"> 
      <TR> 
        <TD VALIGN="top">#MemberID#</td>
        <td>#FirstName#</TD>
        <td>#LastName#</td>
        <td>#City#</td>
        <td>#State#</td>
        <td>#Certificat#</td>
        <td>#Ad_Source#</td>
        <td>#DateFormat(Add_Date)#</td>
        <td>#Name#</td>
      </TR>
    </CFOUTPUT> 
    <cfelse>
    <TR> 
      <TD VALIGN="top" colspan="9"> NO CERTIFICATE(S) FOUND </td>
    </TR>
  </cfif>
  <tr> 
    <td colspan="9"><hr size="1"></td>
  </tr>
</TABLE>




<CFINCLUDE TEMPLATE="_footer.cfm">
