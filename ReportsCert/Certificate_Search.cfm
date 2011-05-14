<CFSET TITLE = "Dealer Search Search">
<CFINCLUDE TEMPLATE="_header.cfm">


<cfif not IsDefined("OrderBy")>
	<cfset OrderBy="Name">
</cfif>


<cfquery name="GetCert" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
Select * from DCDealers
order by #OrderBy#
</cfquery>


<table width="600" border="0" align="center">
<TR>

	<TD VALIGN="TOP">
		<FORM ACTION="Cert_Search_Process.cfm" METHOD="POST">
        <FONT FACE="Myriad Web, Verdana, Helvetica" SIZE="-1"> 
        <P>INPUT DEALER NAME TO BEGIN CERTIFICATE SEARCH<BR>
          NAME: 
          <INPUT TYPE="TEXT" NAME="Name">
          BEGIN DATE: 
          <input type="text" name="Add_Date">
        </P>
        <P>
          <INPUT TYPE="SUBMIT" VALUE="Search">
        </P>
        </FONT> 
      </FORM>
	</TD>
</TR>
</TABLE>

<CFINCLUDE TEMPLATE="_footer.cfm">