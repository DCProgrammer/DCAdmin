  <cfquery name="MarkUp" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT * from NewMarkUps 
	where DealerID='#DCDealerID#'
	and MarkupID=#MarkupID#
  </cfquery>
  
  <cfquery name="DealerName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT * from IndexedNWDealers 
	where DCDealerID='#DCDealerID#'
  </cfquery>  

<html>
<head>
<title>Mark Up Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="/DCAdmin/CSS/style1.css" rel=stylesheet>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table border="0" width="100%">
  <tr bgcolor="#445999"> 
    <td align="center" class="PopHead" colspan="2"> <cfoutput query="DealerName">#DealerName.Name#</cfoutput> </td>
  </tr>
  <cfoutput query="MarkUp">
  <tr> 
    <td>Mark Up ID</td>
    <td>#MarkUp.MarkupID#</td>
  </tr>
  <tr> 
    <td>Make</td>
    <td>#MarkUp.Make#</td>
  </tr>
  <tr> 
    <td>Model</td>
    <td>#MarkUp.Model#</td>
  </tr>
  <tr> 
    <td>Style</td>
    <td>#MarkUp.Style#</td>
  </tr>
  <tr> 
    <td>Mark Up Dollar</td>
    <td>#MarkUp.MarkUp_Dollar#</td>
  </tr>
  <tr> 
    <td>Mark Up Percentage</td>
    <td>#MarkUp.MarkUp_Perc#</td>
  </tr>
  <tr> 
    <td>Mark Up Retail</td>
    <td>#MarkUp.MarKUp_Retail#</td>
  </tr>
  <tr> 
    <td>Prep Fee</td>
    <td>#MarkUp.PrepFee#</td>
  </tr>
  <tr> 
    <td>Advertisement Retail</td>
    <td>#MarkUp.Advert_Retail#</td>
  </tr>
  <tr> 
    <td>Advertisement Precentage</td>
    <td>#MarkUp.Advert_Perc#</td>
  </tr>
  <tr> 
    <td>Advertisement Dollar</td>
    <td>#MarkUp.Advert_dollar#</td>
  </tr>
  <tr> 
    <td>Advertisement Options</td>
    <td>#MarkUp.Advert_Inc_Options#</td>
  </tr>
  <tr> 
    <td colspan="2">Addional Notes:<br>#MarkUp.Notes#</td>
  </tr>
  </cfoutput>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr><td colspan="2" align="center" valign="bottom"><a href="javascript:window.close()">Close Window</a></td></tr>
</table>


</body>
</html>
