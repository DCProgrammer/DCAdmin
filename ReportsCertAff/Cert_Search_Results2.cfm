<cfset CurrentPage=GetFileFromPath(GetTemplatePath())>

<cfif not isdefined("SearchMonth")>
<cfquery name="getCurMonth" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curMonth=Month(GETDATE())
</cfquery>
<cfquery name="getCurYear" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curYear=Year(GetDate())
</cfquery>
<cfset SearchMonth=getCurMonth.curMonth>
<cfset SearchYear=getCurYear.curYear>
</cfif>

<cfquery name="GetCert" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select A.MemberID, A.FirstName, A.LastName, A.City, A.State,
       B.Certificat, B.Ad_Source, B.Operator, B.Data_Enter, B.Add_Date, C.Name
from Members A, Certificat B, Organiza C
Where A.MemberID=B.Member
and B.Add_Date >='#SearchYear#-#SearchMonth#-01'
and A.Org=C.Organizati
order by B.ADD_Date, A.State	
</CFQUERY>

<cfparam name="PageNum_GetCert" default="1">
<cfset MaxRows_GetCert=25>
<cfset StartRow_GetCert=Min((PageNum_GetCert-1)*MaxRows_GetCert+1,Max(GetCert.RecordCount,1))>
<cfset EndRow_GetCert=Min(StartRow_GetCert+MaxRows_GetCert-1,GetCert.RecordCount)>
<cfset TotalPages_GetCert=Ceiling(GetCert.RecordCount/MaxRows_GetCert)>
<cfset QueryString_GetCert=Iif(CGI.QUERY_STRING NEQ "",DE("&"&CGI.QUERY_STRING),DE(""))>
<cfset tempPos=ListContainsNoCase(QueryString_GetCert,"PageNum_GetCert=","&")>
<cfif tempPos NEQ 0>
  <cfset QueryString_GetCert=ListDeleteAt(QueryString_GetCert,tempPos,"&")>
</cfif>
<CFINCLUDE TEMPLATE="_header.cfm">
<table width="500"  border="0" align="center" cellpadding="1" cellspacing="0">
  <tr> 
    <td align="center"><cfoutput>Records #StartRow_GetCert# to #EndRow_GetCert# of #GetCert.RecordCount# 
      </cfoutput> </td>
  </tr>
</table>
<table border="0" width="50%" align="center">
  <cfoutput> 
    <tr> 
      <td width="23%" align="center"> <cfif PageNum_GetCert GT 1>
          <a href="#CurrentPage#?PageNum_GetCert=1#QueryString_GetCert#">First</a> 
        </cfif> </td>
      <td width="31%" align="center"> <cfif PageNum_GetCert GT 1>
          <a href="#CurrentPage#?PageNum_GetCert=#Max(DecrementValue(PageNum_GetCert),1)##QueryString_GetCert#">Previous</a> 
        </cfif> </td>
      <td width="23%" align="center"> <cfif PageNum_GetCert LT TotalPages_GetCert>
          <a href="#CurrentPage#?PageNum_GetCert=#Min(IncrementValue(PageNum_GetCert),TotalPages_GetCert)##QueryString_GetCert#">Next</a> 
        </cfif> </td>
      <td width="23%" align="center"> <cfif PageNum_GetCert LT TotalPages_GetCert>
          <a href="#CurrentPage#?PageNum_GetCert=#TotalPages_GetCert##QueryString_GetCert#">Last</a> 
        </cfif> </td>
    </tr>
  </cfoutput> 
</table>


<table width="768" border="1" align="center" cellpadding="1" cellspacing="1">
  <tr bgcolor="#336699"> 
    <td><font color="#CCCCCC"><strong>MemberID</strong></font></td>
    <td><font color="#CCCCCC"><strong>First Name</strong></font></td>
    <td><font color="#CCCCCC"><strong>Last Name</strong></font></td>
    <td><font color="#CCCCCC"><strong>City</strong></font></td>
    <td><font color="#CCCCCC"><strong>State</strong></font></td>
    <td><font color="#CCCCCC"><strong>Certificat</strong></font></td>
    <td><font color="#CCCCCC"><strong>Source</strong></font></td>
    <td><font color="#CCCCCC"><strong>Operator</strong></font></td>
    <td><font color="#CCCCCC"><strong>Data_Enter</strong></font></td>
    <td><font color="#CCCCCC"><strong>Date</strong></font></td>
    <td><font color="#CCCCCC"><strong>Name</strong></font></td>
  </tr>
  <cfoutput query="GetCert" startRow="#StartRow_GetCert#" maxRows="#MaxRows_GetCert#"> 
    <tr> 
      <td>#GetCert.MemberID#</td>
      <td>#GetCert.FirstName#</td>
      <td>#GetCert.LastName#</td>
      <td>#GetCert.City#</td>
      <td>#GetCert.State#</td>
      <td>#GetCert.Certificat#</td>
      <td>#GetCert.Ad_Source#</td>
      <td>#GetCert.Operator#</td>
      <td>#GetCert.Data_Enter#</td>
      <td>#LSDateFormat(GetCert.Add_Date,'M/DD/YY')#</td>
      <td>#GetCert.Name#</td>
    </tr>
  </cfoutput> 
</table>

<table border="0" width="50%" align="center">
  <cfoutput> 
    <tr> 
      <td width="23%" align="center"> <cfif PageNum_GetCert GT 1>
          <a href="#CurrentPage#?PageNum_GetCert=1#QueryString_GetCert#">First</a> 
        </cfif> </td>
      <td width="31%" align="center"> <cfif PageNum_GetCert GT 1>
          <a href="#CurrentPage#?PageNum_GetCert=#Max(DecrementValue(PageNum_GetCert),1)##QueryString_GetCert#">Previous</a> 
        </cfif> </td>
      <td width="23%" align="center"> <cfif PageNum_GetCert LT TotalPages_GetCert>
          <a href="#CurrentPage#?PageNum_GetCert=#Min(IncrementValue(PageNum_GetCert),TotalPages_GetCert)##QueryString_GetCert#">Next</a> 
        </cfif> </td>
      <td width="23%" align="center"> <cfif PageNum_GetCert LT TotalPages_GetCert>
          <a href="#CurrentPage#?PageNum_GetCert=#TotalPages_GetCert##QueryString_GetCert#">Last</a> 
        </cfif> </td>
    </tr>
  </cfoutput> 
</table>



<cfinclude template="Date.cfm">


<CFINCLUDE TEMPLATE="_footer.cfm">
