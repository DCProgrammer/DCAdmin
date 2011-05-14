<cfinclude template="_header.cfm">

<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td bgcolor="#445999"> 
              <table width="400" border="0" cellspacing="1" cellpadding="3" align="center">
        <tr> 
          <td bgcolor='#445999' align="center" height="5"><font size="2" face="verdana" class="HeadWhite"><b>WebTrend 
            Reports </b></font></td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'><font size="2" face="Arial, Helvetica, sans-serif">Select 
            the Profile to view in New Window.</font></td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'> <a href="/WebTrendsAR/" target="_blank" class="nav">AutoReports</a>:</td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'> <a href="/WebTrendsCR/" target="_blank" class="nav">CAReports</a>: 
            <cfquery name="getStates" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
            SELECT DISTINCT State from ContinentalZipsToCoords order by State 
            </cfquery> </td>
        </tr>
        <tr> 
          <td bgcolor='#f2f2f2'><a href="/WebTrendsDC/" target="_blank" class="nav">DigitalCars</a>:</td>
        </tr>
        <tr>
          <td bgcolor='#f2f2f2'><a href="/AllstateWebTrends/" target="_blank">Allstate</a>: 
            WebTrend reports are generated for Allstate each Monday. The report 
            must be sent in Word Format to Pete Stoutenburg at pstou@allstate.com. 
            To generate this report, open the WebTrends, select last week time 
            frame, copy and past to word and save the report.</td>
        </tr>
      </table>
            </td>
          </tr>
        </table>




<CFINCLUDE TEMPLATE="_footer.cfm">