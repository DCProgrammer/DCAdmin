

<!--- If we weren't given an CLoanID, this template can't be
	processed; go instead to search form --->
<CFIF NOT ISDEFINED("URL.CLoanID")>
	<CFLOCATION URL="searchform.cfm">
</CFIF>

<!--- This includes the HTML that goes into the header. --->
<!CFINCLUDE TEMPLATE="_header.cfm">

<!--- Retrieve the  details using a SQL query --->
<cfquery name="getDetails" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * FROM Kinectalog
WHERE CLoanID = '#CLoanID#'
</CFQUERY>

<!--- Now we just output the results --->
<CFOUTPUT QUERY="getDetails">
<table border="0">
<TR>
   	<TD WIDTH=100 ALIGN="RIGHT" VALIGN="TOP">&nbsp;</TD>
	<TD VALIGN="TOP">
		<FONT FACE="Arial, Helvetica">
		<P>
			<B>Name:</B> #FirstName# #LastName#<BR>
			<B>SSN:</B> #SSN#<BR>
			<B>ACCT NUMBER:</B> #AccountNo#<BR>
			<cfif AccountNoTemp neq 0><B>ACCT TEMP NUMBER:</B> #AccountNoTemp#<BR><cfelse>PERMANENT TEMP NUMBER<br></cfif>
			<cfif AccountNoPerm neq 0><B>ACCT PERM NUMBER:</B> #AccountNoPerm#<BR><cfelse>NO PERMANENT ACCT NUMBER<br></cfif>
<!--			<B>Temporary:</B> YesNoFormat(binIsTemp)<BR> -->
			<B>New/Used:</B> #NewOrUsed#<BR>
			<B>Status:</B> #Status#<BR>
			<B>Status Date:</B> #DateFormat(Status_Date, "mmmm d, yyyy")#<BR>
			<B>Disbursement Date:</B> #DateFormat(Disb_Date, "mmmm d, yyyy")#<BR>			
		</P>

        
        <!--- Notice we're passing the EmpID in the URL... --->
		<P><FONT SIZE="2"><A HREF="##">Modify Information</A> | 
		<a href="searchform.cfm">New Search</a></FONT></P>
	</TD>
	<TD WIDTH="100" NOWRAP>&nbsp;</TD>
</TR>
</CFOUTPUT>

</TABLE>

<!--- Close the document --->
<!CFINCLUDE TEMPLATE="_footer.cfm">