<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Phone List</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<!-- and A.MemberID in (SELECT MemberID from DCMailList) -->

<cfset PhoneStr="Replace(Replace(Replace(Replace(HomePhone,'(',''),')',''),' ',''),'-','')">

<cfif isDefined("State") or isDefined("Locale") or isDefined("AreaCode")>


<cfquery name="phoneList" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT ID=A.MemberID, Phone=
Replace(Replace(Replace(Replace(Replace(HomePhone,'(',''),'/',''),')',''),' ',''),'-','')
 , FirstName, LastName, Addr1,City, State, Zip,JoinDate
from MembersTable A
where 1=1
<cfif isDefined("State")>
and State='#State#'
</cfif>
<cfif isDefined("Locale")>
<cfif Locale is not 'ALL'>
and Left(
Replace(Replace(Replace(Replace(Replace(HomePhone,'(',''),'/',''),')',''),' ',''),'-','')
,3) in (SELECT AreaCode from LocaleToAreaCode where Locale='#Locale#')
</cfif>
</cfif>
<cfif isDefined("AreaCode")>
and Left(
Replace(Replace(Replace(Replace(Replace(HomePhone,'(',''),'/',''),')',''),' ',''),'-','')
,3)='#AreaCode#'
</cfif>
order by JoinDate DESC
</cfquery>

ID,Phone,FirstName,LastName,Address,City,State,Zip,JoinDate<br>
<cfoutput query="phoneList">
#ID#, #Phone#, #FirstName#, #LastName#, #Addr1#, #City#, #State#, #Zip#, #JoinDate#<br>
</cfoutput>


<cfelse>
<form method=post action="phoneList.cfm">
<cfquery name="getStates" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT STATE from MembersTable where State IN (SELECT DISTINCT State from ZipsToCoords)
order by State
</cfquery>
<select name="State">
<cfoutput query="getStates">
<option value="#State#">#State#</option>
</cfoutput>
</select>
<input type=submit value="Phone List by State">
</form>
<Form method=post action="phoneList.cfm">
Area Code: <input type=text size="3" width="3" name="AreaCode">
<input type=submit value="Phone List by Area Code">
</Form>
<form method=post action="phoneList.cfm">
<cfquery name="getLocales" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Locale, LocaleName from Locales
order by LocaleName
</cfquery>
<select name="Locale">
<cfoutput query="getLocales">
<option value="#Locale#">#LocaleName#</option>
</cfoutput>
</select>
<input type=submit value="Phone List by Locale">
</form>
</cfif>
</body>
</html>
