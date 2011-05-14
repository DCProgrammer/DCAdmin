<cfquery name="qryAff" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Affiliate_Table
	where ID=#ID#
</cfquery>


<cfset vchSiteURL = "#qryAff.URL#">
<cfif vchSiteURL contains  "creditunions.com">
	<cfinclude template="_header.cfm">
	<table width="768" border="0" align="center" bgcolor="#FFFFFF">
	<tr>
		
    <td height="200"> <font size="-1" face="Arial, Helvetica, sans-serif">The 
      chosen Affiliate has an invalid profile. In order to send e-mail the affiliate 
      must have all mandatory fields filled out correctly. Please select a choice 
      below. <br>
      <br>
      <cfoutput><a href="SearchResults.cfm?vchName=#URLEncodedFormat(qryAff.Name)#"></cfoutput>Return 
      to Affiliate Profile</a> - <a href="Search.cfm">Search for another Affiliate</a> 
      </font> </td>
	</tr>
	</table>
	<cfinclude template="_footer.cfm">
	<cfabort>


	<cfset SiteSite = "http://www.CAReports.com/default.cfm?affid=#ID#">
	<cfset PhoneNumber = "847-291-7900">
<cfelse>
	<cfset SiteSite = "#vchSiteURL#">
	<cfset PhoneNumber = "#qryAff.Phone#">
</cfif>


<cfif HTMLORTEXT EQ "HTML">
	
	<cfmail query="qryAff" 
		to="#Trim(Marketing_Email)#" 
		from="info@digitalcars.com" 
		subject="DigitalCars Newsletter" 
		type="HTML" 
		bcc="info@digitalcars.com">
	
	
	<body bgcolor="white">
	<table border="0">
	<tr>
		<td colspan="2">
		<cfif IsDefined("Additional_Comments")>
			<cfif Additional_Comments is not "">
				<font face="arial" size="-1">
				#Additional_Comments#
				</font>
			</cfif>
		</cfif>
		</td>
	</tr>
	</table>

  <table width="640" border="0" align="center" cellpadding="1" cellspacing="2" bgcolor="##FFFFFF">
    <tr> 
      <td>
	  <font size="4" face="Arial, Helvetica, sans-serif">&nbsp;</font> 
	  <table width="100%" border="0" cellspacing="2" cellpadding="1">
          <tr valign="top"> 
            <td><font size="4" face="Arial, Helvetica, sans-serif"><strong>NEWS 
              RELEASE #DateFormat(Now(),"mm/dd/yy")#<br>
              Contact: Mary Okolowicz<br>
              800.610.2277 x30</strong></font></td>
            <td align="right"><font size="3" face="Arial, Helvetica, sans-serif">#Name#<br>
              #Marketing_Contact#<br>
              #Marketing_Fax#<br>
              #Marketing_Email#</font></td>
          </tr>
        </table>
	    </td>
    </tr>
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif">&nbsp;</font> </td>
    </tr>
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif">&nbsp;</font> </td>
    </tr>
    <tr> 
      <td><font size="4" face="Arial, Helvetica, sans-serif"><strong>Credit Union 
        Vehicle Buying and Finance Service</strong></font></td>
    </tr>
    <tr> 
      <td><p><font face="Arial, Helvetica, sans-serif"><font size="4"></font></font></p></td>
    </tr>
    <tr> 
      <td><font size="5" face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"> 
        <p>&nbsp;</p>
        </font></font></td>
    </tr>
    <tr> 
      <td align="left"><div align="justify"><font size="3" face="Arial, Helvetica, sans-serif"><strong><font size="3" face="Arial, Helvetica, sans-serif">Try 
          our Vehicle Buying Service- in order to get the best price and a great 
          loan on the car, truck or van you want! Don't waste time spending hours 
          negotiating with a dealer. Let our credit union vehicle buying and finance 
          service work for you. Make the vehicle buying and financing process 
          easy. Just log on to the credit union web site address <u>#SiteSite#</U> or 
		  call #PhoneNumber# today! </font></div>
        <font size="3" face="Arial, Helvetica, sans-serif"></strong></font> </div> </font> 
        <p align="justify"><font size="3" face="Arial, Helvetica, sans-serif"><strong> 
          You get the car, truck or van you want at a price that you can afford. 
          It's that easy! </strong></font> </td>
    </tr>
    <tr> 
      <td align="left">&nbsp;</td>
    </tr>
    <tr> 
      <td align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="left" valign="top">
			<P> <font size="-1" face="Arial, Helvetica, sans-serif">DigitalCars.com, Inc.<br>
                    500 Skokie Blvd Suite 280<br>
                    Northbrook, IL 60062<br>
                    (847)291-7900 FAX:(847)564-1952<br>
                    info@digitalcars.com </font> </td>
            <td align="right" valign="top"><img src="http://www.CAReports.com/CommonImages/DigitalCars.gif" alt="DigitalCars" border="0"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="200" align="left">&nbsp;</td>
    </tr>
    <tr> 
      <td align="left" bgcolor="##000000">
	  <table width="100%" border="0" cellpadding="1" cellspacing="2" bgcolor="##FFFFFF">
      <tr>
      	<td>
		NOTE: If you would like a PDF FILE please send your e-mail address 
		to mary@digitalcars.com</td>
          </tr>
        </table>
		</td>
    </tr>
  </table>

	</body>
	</html>
	</cfmail>
	
	<cflocation url="Email_Confirm.cfm?ID=#ID#" addtoken="No">
	
	
<cfelse>


<cfmail query="qryAff" 
to="#ContactEmail#" from="info@digitalcars.com" 
subject="DigitalCars Newsletter" 
bcc="info@digitalcars.com">

<cfif IsDefined("Additional_Comments")>
<cfif Additional_Comments is not "">
#Additional_Comments#
</cfif>
</cfif>
#Trim(UCase(Name))#




Thank you, 
DigitalCars.com


DigitalCars.com, Inc.
500 Skokie Blvd Suite 280
Northbrook, IL 60062
(847)291-7900 FAX:(847)564-1952
info@digitalcars.com

</cfmail>

<cflocation url="Email_Confirm.cfm?ID=#ID#" addtoken="No">
		
		

</cfif>