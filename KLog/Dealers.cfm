<CFSET LENDER="20">

<cfquery name="getDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select DealerToLenderIndex,B.DL_Index, Org_ID,B.Name 
from DealerToLender A
Join IndexedNWDealers B on A.DL_Index = B.DL_INDEX
and ORG_ID=#LENDER#
order by Name
</CFQUERY>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form action="" method="POST">
<select name="Dealer">
<cfoutput query="getDealer">
			<option value="#getDealer.DL_Index#" SELECTED>#getDealer.Name#</option>
</cfoutput>			
</select>
<br><FONT FACE="Myriad Web, Verdana, Helvetica" SIZE="-1">
HUGHES ID: <input type="text" name="">
</font>
<br>
<input type="Submit" value="ADD">
</form>
</body>
</html>
