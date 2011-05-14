<CFSET TITLE = "Certificate Search">
<CFINCLUDE TEMPLATE="_header.cfm">

<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td bgcolor="#445999"> 
              <table width="400" border="0" cellspacing="1" cellpadding="3" align="center">
        <tr> 
          <td bgcolor='#445999' align="center" height="5"><font size="2" face="verdana" class="HeadWhite"><b>REPORTS 
            BY AFFILIATE</b></font></td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'><font face="Arial, Helvetica, sans-serif" size="2">Welcome 
            to Certificate Report.&nbsp; The following will output all current 
            certificate for the current month.</font></td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'> <a href="Cert_Search_Results2.cfm" class="nav">Certificate 
            Report</a>: Select this link to view the current number of certificates 
            for the month.</td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'> <a href="Certificate_Search.cfm" class="nav">Certificate 
            Reports</a>: Select this link to generate a <strong>detailed</strong> 
            report total by by organization (by brach) 
            <cfquery name="getStates" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
            SELECT DISTINCT State from ContinentalZipsToCoords order by State 
            </cfquery>
           </td>
        </tr>
        <tr>
          <td bgcolor='#f2f2f2'><a href="Certificate_Search.cfm" class="nav">Certificate 
            Reports</a>: Select this link to generated <strong>overview</strong> 
            reports total by organization (by brach)</td>
        </tr>
      </table>
            </td>
          </tr>
        </table>




<CFINCLUDE TEMPLATE="_footer.cfm">