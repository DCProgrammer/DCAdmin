<cfset testing=1>

<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Organiza
where Email!=''
<cfif isdefined("testing")>
and Email='info@ubschicago.com'
</cfif>
</cfquery>

<cfif not isDefined("sendMail")>
<form method=post action="EmailToOrgs.cfm">
<cfoutput>
<input type=hidden name="sendMail" value=1> 
<input type=submit value="Send #getOrgs.recordCount# emails">
</cfoutput>
</form>
<cfelse>
<cfloop query="getOrgs">
<cfmail from="info@ubsi.com" to="#getOrgs.Email#" subject="Your Link To UBSChicago" type="html">
Our webpage has recently had more functionality developed!  It now allows<br>
our affiliates to link to it from their webpages with a special ID so that they<br>
can track members.<br>

Your organization's link codes are<br>
Home page: http://www.ubschicago.com/index.cfm?Org=#Organizati#<br>
Mortgage page: http://www.ubschicago.com/Process_Auto.cfm?isFinance=1&Flags=0&Org=#Organizati#<br>
<br>
Text link to home page: <a href="http://www.ubschicago.com/index.cfm?Org=#Organizati#">Mortgage and Finance Service</a><br>
Graphic link to home page: <a href="http://www.ubschicago.com/index.cfm?Org=#Organizati#"><img src="http://www.ubschicago.com/images/ubslogo_50.gif"></a><br>
<br>
Text link to mortgage page: <a href="http://www.ubschicago.com/Process_Auto.cfm?isFinance=1&Flags=0&Org=#Organizati#">Mortgage and Finance Service</a><br>
Graphic link to mortgage page: <a href="http://www.ubschicago.com/Process_Auto.cfm?isFinance=1&Flags=0&Org=#Organizati#"><img src="http://www.ubschicago.com/images/ubslogo_50.gif"></a><br>
<br>
Please make a note of this special code.<br>
<br>
For any questions, please call our marketing rep, Mary Okolowicz, at<br>
847-215-7000<br>
<br>
<a href="mailto:info@ubsi.com">info@ubsi.com</a>
</cfmail>
</cfloop>
</cfif>
