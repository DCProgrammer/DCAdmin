<cfinclude template = "pug_Conn.cfm">
<html>
<head>
	<title>Upload Car Dealers File </title>
</head>

<body bgcolor="#f2f2f2" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<cfinclude template = "top.cfm">
<center>
  <table width="768" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td bgcolor="#FFFFFF" align="center"> 
        <center>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p><font face="verdana" size="2"><b><cfoutput>View Car Deals Report</cfoutput></b></font> 
          </p>
        </center>

<CFQUERY  NAME = "selectdata" 
		datasource="#Application.MainDB#"  
		username="#Application.DBUser#" 
		password="#Application.DBPwd#">

SELECT      DISTINCT Year, Make, Model, LimitsDescription, Description1, EffectiveDate
	FROM        NewRebates
ORDER BY Make,Year
</cfquery>
<table border="0" width="100%">
<tr><td colspan="5"></td></tr>
<tr bgcolor="#013821">
	<th>
	<font face="arial" color="white" size="-1">
	YEAR
	</font>
	</th>
	<th>
	<font face="arial" color="white" size="-1">
	MAKE
	</font>
	</th>
	<th>
	<font face="arial" color="white" size="-1">
	MODEL
	</font>
	</th>
	<th>
	<font face="arial" color="white" size="-1">
	TRIM LINE
	</font>
	</th>
	<th>
	<font face="arial" color="white" size="-1">
	DESCRIPTION
	</font>
	</th>
	<th>
	<font face="arial" color="white" size="-1">
	EXPIRATION DATE
	</font>
	</th>		
</tr>

<CFSET mycolor="##F0f0f0">

<CFOUTPUT QUERY="selectdata">
<CFIF mycolor is "##f0f0f0">
<CFSET mycolor="white">
<CFELSE>
<CFSET mycolor="##F0f0f0">
</cfif>
<tr bgcolor="#mycolor#">
	<td><font face="arial" color="black" size="-1">#selectdata.Year#&nbsp;</font></td>
	<td><font face="arial" color="black" size="-1">#selectdata.Make#&nbsp;</font></td>
	<td><font face="arial" color="black" size="-1">#selectdata.Model#&nbsp;</font></td>
	<td><font face="arial" color="black" size="-1">#selectdata.LimitsDescription#&nbsp;</font></td>
	<td><font face="arial" color="black" size="-1">#selectdata.Description1#&nbsp;</font></td>
	<td><font face="arial" color="black" size="-1">#selectdata.EffectiveDate#&nbsp;</font></td>
</tr>

</CFOUTPUT>


<tr><td colspan="5">
<p><br>
<font face="arial" color="maroon" size="-1">
	(D) = means factory to dealer only rebate or incentive
"varies by region" means not available in all states<br>
	(C) = means factory to consumer rebate or incentive<br>
</font>
</td></tr>


</table>


   <p>&nbsp; </p>
        <p>&nbsp; </p>
      </td>
    </tr>
  </table>
</center>
<cfinclude template = "bottom.cfm">
</body>
</html>
