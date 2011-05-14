<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfset Flags="Flags">
<cfloop list=#ArrayToList(Session.FlagArray)# index=foo>
<cfoutput>#foo#</cfoutput>
<cfif isDefined(foo)>
<!--- <cfif Product is foo> --->
 FOUND
<cfset Flags=Flags & "&" & foo & "=1">
</cfif>
<br>
</cfloop>

<cfquery name="getZip" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from ZipsToCoords
where ZipCode="#Zip#"
</cfquery>
<cfoutput>#Flags#</cfoutput>
<cfif getZip.recordCount lt 1>
<cflocation url="Process_Auto.cfm?Error=Invalid+Zip&#Flags#">
</cfif>	
	
<cfset Session.Zip=Zip>

<!---
<!cf_mailTest email=#email#>
<cfif Email_Level is 0>
	<cfset Session.validEmail="yes">
	<cfset Session.Email=email>
	
	<cfquery name="checkBlackList" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT Blacklisted, ReturnedEmail, removedList, onUBSList
	from VisitedWeb
	where Email='#Email#'
	</cfquery>
	
	<cfif checkBlackList.recordCount is 0>
		<!-- We've never seen this email before -->
		<cfquery name="addToList" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		INSERT Into VisitedWeb (Email,VisitDate,IP,AffiliateID,ZipCode)
		values ('#Email#',GETDATE(),'#REMOTE_ADDR#',#Session.AffID#,'#Zip#')
		</cfquery>
		<cfmail from="info@UBSChicago.com" to="info@UBSChicago.com" subject="Member visiting UBSChicago">
		A user with Email '#Email#' visited UBSChicago.
		</cfmail>
	<cfelse>
		<cfif checkBlackList.BlackListed is 1 or checkBlackList.ReturnedEmail is 1>
			<cfset Session.validEmail="no">
		<!---
			<cfset Password=''>
			<cfset AlphaNum='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'>
			<cfloop index=foo from=1 to=8>
			<cfset Password=Password & Mid(AlphaNum,RandRange(1,62),1)>
			</cfloop>
			
			<cfquery name="checkPass" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
			SELECT * from EmailPwds
			where Email='#Email#'
			</cfquery>
			
			<cfif checkPass.recordCount lt 1>
			
			<cfquery name="setPass" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
			INSERT INTO EmailPwds (Email, Password)
			values ('#Email#','#Password#')
			</cfquery>
			
			<cfelse>
			<cfset Password=checkPass.Password>
			</cfif>
		
			<cfmail from="info@ubschicago.com" to="#Email#" bcc="adam@digitalcars.com" subject="UBS Chicago validation">
			Your password is '#Password#'
			
			Note: disclaimers.
			</cfmail>
			--->
		</cfif>
	</cfif>
	<cfelse> <!-- mail has syntax error -->
<cfset Session.foundBadEmail=1>
<cflocation url="Process_Auto.cfm?Error=#URLEncodedFormat(Email_Message)#&#Flags#">
</cfif>
--->

<cfif isDefined("isFinance")>
<cflocation url="Form_finance.cfm?#Flags#">
</cfif>
<cfif Flags is 'Flags&noFlags=1'>
<cflocation url="Form_select_Category.cfm">
</cfif>
<cfif isDefined("isProduct")>
<cflocation url="Form_select_Category.cfm">
</cfif>
<cfif isDefined("isService")>
<cflocation url="Form_select_service.cfm">
</cfif>
<cflocation url="Form_temp_info.cfm?#Flags#">

</body>
</html>
