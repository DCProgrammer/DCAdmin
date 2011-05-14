<!CFINCLUDE TEMPLATE="_header.cfm">
<cfset Form.strDptIDFK = "All">

<!CFQUERY datasource="cfx" NAME="SearchResults">
<cfquery name="getApp" datasource="MainSQL" maxrows=25 username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * FROM Kinectalog
    WHERE CloanID = CLoanID
	and (firstname like '%#Form.FirstName#%')
	and (lastname like '%#Form.LastName#%')
	
	ORDER BY LastName, firstName
	
	</cfquery>
<table width="100%">
<TR>
	<TD COLSPAN="2">
		<FONT FACE="Arial, Geneva, Helvetica" SIZE="-1">
		<CFOUTPUT>Your search for <B>"#Form.FirstName# #Form.LastName#"</B> has returned <B>#getApp.RecordCount#</B> applicants(s).</CFOUTPUT>
		</FONT>
	</TD>
</TR>

<CFOUTPUT QUERY="getApp">
<TR>

   	<TD WIDTH=100 ALIGN="RIGHT" VALIGN="TOP">&nbsp;</TD>
    <TD VALIGN="top"><FONT FACE="Myriad Web, Verdana, Helvetica" SIZE="-1">
        	<!--- Notice we're passing the EmpID in the URL... --->
			<A HREF="searchdetails.cfm?CLoanID=#CLoanID#">#FirstName# #LastName#</A><BR>
		</FONT>
    </TD>
    


</TR>
</CFOUTPUT>

</TABLE>

<!CFINCLUDE TEMPLATE="_footer.cfm">
