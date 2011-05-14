<!--- This template takes an ID and shows the details for that Affiliate --->

<!--- If we weren't given an ID, this template can't be
	processed; go instead to the sent page --->
<CFIF NOT ISDEFINED("URL.ID")>
	<CFLOCATION URL="Search.cfm">
</CFIF>

<!--- This includes the HTML that goes into the header. --->
<CFINCLUDE TEMPLATE="_header.cfm">


<cfquery name="GetAff" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, Marketing_Email, Marketing_Contact from Affiliate_Table
where ID=#ID#
</cfquery>

<table width="600" border="1" align="center" cellpadding="1" cellspacing="1">
  <tr> 
    <td colspan="2" bgcolor="445999" align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF"> 
      <cfoutput query="GetAff">#GetAff.Name# - MARKETING</cfoutput> </font> </td>
  </tr>
  <form action="Email_Action.cfm" method="POST">
  <cfoutput query="GetAff">
    <tr> 
      <td colspan="2"> 
        <font face="arial" size="-1"> Choose E-mail preference to set; default 
        is set to HTML<BR>
        <BR>
        <input type="Radio" name="HTMLORTEXT" value="HTML" checked>
        HTML 
        <input type="Radio" name="HTMLORTEXT" value="TEXT">
        TEXT </font></td>
    </tr>
    <tr> 
      <td><font size="-1" face="Arial, Helvetica, sans-serif">To:</font></td>
      <td><font size="-1" face="Arial, Helvetica, sans-serif">#Marketing_Contact# at #Marketing_Email#</font></td>
    </tr>
    <tr> 
      <td><font size="-1" face="Arial, Helvetica, sans-serif">From:</font></td>
      <td><font size="-1" face="Arial, Helvetica, sans-serif">info@digitalcars.com</font></td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <font face="arial" size="-1">Add additional comments or concerns.</font><br> 
        <textarea name="Additional_Comments" cols="50" rows="4" wrap="VIRTUAL"></textarea> 
        <p> <font face="Arial" size="-1"> What Reader Will See. <P> <font face="arial" size="-1"> 
          <br>
          <br>
          If you have any other further questions please contact DigitalCars.com, 
          Inc.<br>
          and ask for Mary at 847-291-1952 x30. Mary is Marketing Administrator. 
          <br>
          <br>
          DigitalCars.com, Inc.<br>
          500 Skokie Blvd<br>
          Northbrook, IL 60062<br>
          (847)291-7900 FAX:(847)564-1952<br>
          info@digitalcars.com </font> </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <br> <input type=hidden name="ID" value="#ID#"> 
        <input type="Submit" name="Submit" value="Send Newsletter"></td>
    </tr>
  </form>
  </cfoutput>
</table>



<CFINCLUDE TEMPLATE="_footer.cfm">
