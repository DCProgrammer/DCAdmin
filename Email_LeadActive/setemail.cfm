<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Set Dealers Email</title>
</head>

<body>
<cfquery name="qryDealers" datasource="MainSQL" username="sa" password="SouthPark">
SELECT   Name
	from DCDealers order by name
</cfquery>
<p>
<cfform ACTION="wantsemail.cfm" NETHOD="POST" title="Dealers">
Available Dealers:
<select NAME="Dealers">
<cfoutput query=qryDealers>
<option>#Name#
</cfoutput>
</select>

<P>
<input TYPE="radio" Name="EmailStatus"  Value="Yes" CHECKED>Wants Email <BR>
<input TYPE="radio" Name="EmailStatus" Value="No">Does Not Want Email <BR>
<P>

<input type="submit" Value="Process">
</cfform>


</body>
</html>
