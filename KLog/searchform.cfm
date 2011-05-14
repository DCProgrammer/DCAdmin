<CFSET TITLE = "APPLICANT SEARCH">
<!CFINCLUDE TEMPLATE="_header.cfm">

<!---
<cfquery name="getApp" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Kinectalog
</cfquery>
--->
<table>
<TR>
	<TD HEIGHT="250" WIDTH="10" nowrap>&nbsp;</TD>
	<TD VALIGN="TOP">
		<FORM ACTION="searchaction.cfm" METHOD="POST">
		<FONT FACE="Myriad Web, Verdana, Helvetica" SIZE="-1">
        <P>First Name<BR>
		<INPUT TYPE="TEXT" NAME="FirstName"></P>
        <P>Last Name<BR>
		<INPUT TYPE="TEXT" NAME="LastName"></P>
		<P><INPUT TYPE="SUBMIT" VALUE="Search"></P>


		</FONT>
		</FORM>
	</TD>
    <TD>&nbsp;</TD>
</TR>
</TABLE>
<!CFINCLUDE TEMPLATE="_footer.cfm">