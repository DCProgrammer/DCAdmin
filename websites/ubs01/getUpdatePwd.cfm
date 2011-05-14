<cfinclude template="_header.cfm">
<table width="750" border="0" cellspacing="0" cellpadding="10">

<td bgcolor=#ffffff>
<p>&nbsp;</p>
      <p>We have an existing account with that email.<br>
        To correct our records and continue, please provide the password which 
        we have emailed you.<br>
        <br>
      </p>
      <form method=post action="processpwd.cfm">
<cfoutput>
<input type=hidden name="MemberID" value="#MemberID#">
</cfoutput>
Password: <input type=test name="Password">
<input type=submit value="Continue">
</form>
<cfset Session.SeenUpdatePage=1>
<br><br>
</td></table>
<cfinclude template="_footer.cfm">
