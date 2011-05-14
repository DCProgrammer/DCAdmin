<CFSET TITLE = "Dealer Search Search">
<CFINCLUDE TEMPLATE="_header.cfm">

<cfset CurrentPage=GetFileFromPath(GetTemplatePath())>
<cfquery name="getCurMonth" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curMonth=Month(GETDATE())
</cfquery>
<cfquery name="getCurYear" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT curYear=Year(GetDate())
</cfquery>

<cfset SearchMonth=getCurMonth.curMonth>
<cfset SearchYear=getCurYear.curYear>



<table width="600" border="0" align="center">
<TR>

	<TD VALIGN="TOP">
		<FORM ACTION="Cert_Search_Process.cfm" METHOD="POST">
        <FONT FACE="Myriad Web, Verdana, Helvetica" SIZE="-1"> 
        <P>INPUT AFFILIATE NAME TO BEGIN CERTIFICATE SEARCH<BR>
          NAME: 
          <INPUT TYPE="TEXT" NAME="Name">
          BEGIN DATE: 
		   
          <input type="text" name="Add_Date" <cfoutput>value="#SearchMonth#-01-#SearchYear#"</cfoutput>>
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