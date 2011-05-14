<cfquery name="getAff" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, ContactName, ContactEmail from Affiliate_Table
	where ID=#ID#
</cfquery>


<!--- This includes the HTML that goes into the header. --->
<CFINCLUDE TEMPLATE="_header.cfm">

<table width="768" height="200" border="0" align="center" bgcolor="#FFFFFF">
<tr><td>

<cfoutput query="getAff">
<font face="arial" size="-1">
Your email has been sent to:<br>
Affiliate Name: #Name#<br>
Contact Name: #ContactName#<br>
Contact E-Mail: #ContactEmail#
<br><br>
<a href="SearchResults.cfm?vchName=#Name#">Return to Affiliate Profile</a>  - 
<a href="Search.cfm">Search for another Affiliate</a>
</font>
</cfoutput>



</td></tr>

</TABLE>


<!--- Close the document --->
<CFINCLUDE TEMPLATE="_footer.cfm">