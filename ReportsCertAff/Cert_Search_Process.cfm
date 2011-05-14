<CFINCLUDE TEMPLATE="_header.cfm">



<cfset Session.Add_Date='#Form.Add_Date#'>
<cfquery name="GetCert" datasource="MainSQL" maxrows="25" username="#Application.DBUser#" password="#Application.DBPwd#">
Select *
from Organiza
where Organizati = Organizati
and Status='A'
<CFIF Form.Name NEQ "">
		<!--- Access version --->
		<CFIF Server.OS.Name CONTAINS "Windows">
		AND (Name LIKE '%#Form.Name#%')

		<!--- dBase Version --->
        <CFELSE>
		AND (Upper(Name) LIKE '%#UCase(Form.Name)#%')

		</CFIF> 
	</CFIF>
	
	ORDER BY Name  
	
</CFQUERY>

<table width="600" border="0" align="center">
<TR>
	<TD colspan="2">
	<FONT FACE="Arial, Geneva, Helvetica" SIZE="-1">
	<P><CFOUTPUT>Your search for <B>"#Form.Name#"</B> has returned <B>#GetCert.RecordCount#</B> Certificate(s).</CFOUTPUT></P>
	</FONT>
	</TD>
</TR>

<tr><td colspan="2"><hr size="1"></td></tr>
<cfif GetCert.RecordCount gt 0>
<CFOUTPUT QUERY="GetCert">
<TR>
	<TD VALIGN="top">
	<A HREF="Cert_Return.cfm?Organizati=#URLEncodedFormat(GetCert.Organizati)#">#Trim(GetCert.Name)#</A>
	</td>
	<td>&nbsp;</TD>
</TR>
</CFOUTPUT>
<cfelse>
<TR>
	<TD VALIGN="top" colspan="2">
	NO AFFILIATE FOUND
	</td>
</TR>
</cfif>
<tr><td colspan="2"><hr size="1"></td></tr>

</TABLE>


<CFINCLUDE TEMPLATE="_footer.cfm">
