<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Wants Email</title>
</head>

<body>
<cfquery name="qryDealers" datasource="MainSQL" username="sa" password="SouthPark">
	select Email,DealerID from DCDealers 
	where Name='#Form.Dealers#' 
</cfquery>

<cfoutput query="qryDealers">
<cfif #EmailStatus# IS "Yes">
<cfstoredproc
		procedure="activateDCDealerEmail"
		datasource="MainSQL"
		dbtype="ODBC"
		username="sa" password="SouthPark"  >
		
		<CFPROCPARAM TYPE="IN" 
		  CFSQLTYPE="CF_SQL_VARCHAR" maxlength=10
		  DBVARNAME="@DealerID"
		  VALUE="#DealerID#" >
	<H1 Align="Center">Dealer Added to list of those that want email with Email <font color="red">#Email#</font></h1>	
</cfstoredproc>
</cfif>

		
<cfif #EmailStatus# IS "No">
<cfstoredproc
		procedure="deactivateDCDealerEmail"
		datasource="MainSQL"
		dbType="ODBC"
		username="sa" password="SouthPark"  >
		
		<CFPROCPARAM TYPE="IN"
				CFSQLTYPE="CF_SQL_VARCHAR" maxlength=10
				DBVARNAME="@DealerID"
				VALUE="#DealerID#" >
		<H1 Align="Center">Dealer Removed from list of those who want email</h1>
</cfstoredproc>
</cfif> 
</cfoutput>
<p>
<a href="setemail.cfm">return to Set Dealers Email</a>
</body>
</html>
