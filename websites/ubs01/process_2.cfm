<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfif not IsDefined("OptIn")>
<cfset OptIn=0>
</cfif>

<cfset BirthYear=DatePart('YYYY',Now())>
<cfif isDefined("DriversLicence")>
<cfset BirthYear=BirthYear-19>
<cfelse>
<cfset BirthYear=BirthYear-17>
</cfif>

<cfquery name="getCityData" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT City, State from ZipsToCoords where
ZipCode="#Session.Zip#"
</cfquery>

<cfset City=getCityData.City>
<cfset State=getCityData.State>

<cfset Session.Email=email>

<cfif not isDefined("Session.MemberID")>
<cfset Session.MemberID="">
</cfif>
<cfif Session.MemberID is "">
<cfif FirstName is "" or LastName is "" or Addr1 is "" or (HomePhone is "" and HomeFax is "" and CellPhone is "" and BPhone is "")>
<cfset Missing="">
<cfif FirstName is ""><cfset Missing=ListAppend(Missing, "First Name")></cfif>
<cfif LastName is ""><cfset Missing=ListAppend(Missing, "Last Name")></cfif>
<cfif Addr1 is ""><cfset Missing=ListAppend(Missing, "Street Addresss")></cfif>
<cfif HomePhone is "" and HomeFax is "" and CellPhone is "" and BPhone is "">
<cfset Missing=ListAppend(Missing, "Any Phone Number")>
</cfif>
<cfif Session.Email is ""><cfset Missing=ListAppend(Missing, "Email")></cfif>
<cflocation url="form_temp_info.cfm?Error=Missing+Required+Fields:#URLEncodedFormat(Missing)#">
</cfif>

<cfquery name="checkUser" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Members where Email='#Session.Email#' order by LastUpdate DESC
</cfquery>

<cfif checkUser.recordCount gt 0>
	<cfset memberToUpdate=checkUser.MemberID>
	<cfquery name="checkAddress" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		SELECT * from Members
		where Email='#Session.Email#'
		and FirstName='#FirstName#'
		and LastName='#LastName#'
		and Addr1='#Addr1#'
		order by lastUpdate DESC
	</cfquery>
	<cfset VarNames="HomePhone,BPhone,CellPhone,HomeFax">
	<cfset foundNumber=false>
	<cfif checkAddress.recordCount gt 0>
		<!-- check for phone # matches -->
		<cfset PhoneList="">
		<cfset PhoneList=ListAppend(PhoneList,HomePhone)>
		<cfset PhoneList=ListAppend(PhoneList,HomeFax)>
		<cfset PhoneList=ListAppend(PhoneList,CellPhone)>
		<cfset PhoneList=ListAppend(PhoneList,BPhone)>
		<cfloop list=#PhoneList# index=foo>
			<cfset CheckPhone="">
			<cfloop from=1 to=#Len(foo)# index=ch>
				<cfif isNumeric(Mid(foo,ch,1))>
					<cfset CheckPhone=CheckPhone & Mid(foo,ch,1)>
				</cfif>
			</cfloop>
			<cfloop query="checkAddress">
				<cfloop list=#VarNames# index=var>
					<cfset toPhoneFull=Evaluate(var)>
					<cfset toPhone="">
					<cfloop from=1 to=#Len(toPhoneFull)# index=ch>
						<cfif isNumeric(Mid(toPhoneFull,ch,1))>
							<cfset toPhone=toPhone & Mid(toPhoneFull,ch,1)>
						</cfif>
					</cfloop>								
					<cfif CheckPhone is toPhone>
						<cfset foundNumber=true>
						<cfset dontAddMember=1>
						<cfset Session.MemberID=MemberID>
					</cfif>
				</cfloop>
			</cfloop>
		</cfloop>
	</cfif>
	<cfif Session.MemberID is "">
	
	<cfset Password=''>
	<cfset AlphaNum='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'>
	<cfloop index=foo from=1 to=8>
	<cfset Password=Password & Mid(AlphaNum,RandRange(1,62),1)>
	</cfloop>
	
	<cfquery name="checkPass" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT * from EmailPwds
	where Email='#Session.Email#'
	</cfquery>
	
	<cfif checkPass.recordCount lt 1>
	
	<cfquery name="setPass" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	INSERT INTO EmailPwds (Email, Password)
	values ('#Session.Email#','#Password#')
	</cfquery>
	
	<cfelse>
	<cfset Password=checkPass.Password>
	</cfif>
	
	
		<cfset dontAddMember=1>
		<cfmail from="info@UBSChicago.com" to="#Session.Email#" bcc="info@UBSChicago.com" subject="Welcome back">
		#FirstName# #LastName#,
		
		Welcome back to UBSChicago!
		
		Email: #Session.Email#
		Password: #Password#

		Cut and paste the above password into the form provided to continue,
		or dial 888/YES-COST to have an operator assist you.
		</cfmail>
	</cfif>
</cfif>

<cfif Session.MemberID is not "">
</cfif>

<cfif isDefined("isAuto")>
<cfquery name="getProduct" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from Product where Product='<cfif isDefined("NewOrUsed")><cfif NewOrUsed is 'Used'>USED </cfif></cfif>#Session.Make#'
</cfquery>
<cfset Session.Make=Make>
<cfset Session.Model=Model>
<cfif getProduct.recordCount gt 0>
<cfset Session.Product=getProduct.Product>
</cfif>
<cfelse>
	<cfif isDefined("ProductName")>
	<cfif Find("[",ProductName)>
	<cfset Session.Product=Mid(ProductName,Find("[",ProductName)+1,6)>
	<cfset ProductName=Mid(ProductName,1,Find("[",ProductName)-1>
	</cfif>
	<cfset Session.Make=ProductName>
	<cfset Session.Model="">
	<cfelse>
	<cfset Session.make="">
	<cfset Session.Model="">
	</cfif>
</cfif>

<cfif Session.MemberID is "">
<cfif not isDefined("dontAddMember")>
<cf_AddMember FirstName=#FirstName# LastName=#LastName# ORG=#Application.Org# 
 AddressOne=#Addr1# AddressTwo="" City=#City# State=#State# Zip=#Session.Zip# 
 WorkPhone=#BPhone# HomePhone=#HomePhone# HomeFax=#HomeFax# Email=#Session.Email#
  CellPhone=#CellPhone# OnEmailList=#OptIn# 
  BirthMonth=1 BirthDay=1 BirthYear=#BirthYear#
  WillingToTravel=35 OnlineBuyer=1 PreferredCallingTime=ContacTime>

<cfset Session.MemberID=#returnedMemberID#>
<cfset newMemberAdded=1>
</cfif>
</cfif>
</cfif>

<cfif Session.MemberID is not "">
	<cfquery name="getMember" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT FirstName,LastName, Org, Addr1, BPhone, HomePhone, 
	Fax, CellPhone, NotOnList
	from Members where MemberID=#Session.MemberID#
	</cfquery>
	<cfset FirstName=getMember.FirstName>
	<cfset LastName=getMember.LastName>
	<cfset Org=getMember.Org>
	<cfset Addr1=getMember.Addr1>
	<cfset BPhone=getMember.BPhone>
	<cfset HomePhone=getMember.HomePhone>
	<cfset HomeFax=getMember.Fax>
	<cfset CellPhone=getMember.CellPhone>
	<cfif getMember.NotOnList is 0>
	<cfset OptIn=1>
	<cfelse>
	<cfset OptIn=0>
	</cfif>
	
	<cfquery name="getOrgName" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT Name from Organiza
	where Organizati='#Trim(Org)#'
	</cfquery>
	
	<cfset MemberOrgID=Org>
	<cfset MemberOrg=getOrgName.Name>
	
	
	<cfif isDefined("referredFlag")>
	<cflocation url="Select_Org.cfm?OrgName=#URLEncodedFormat(NameOfOrg)#">
	</cfif>
	
	<cfmail from="info@ubschicago.com" to="info@UBSChicago.com" cc="mortgageinfo@UBSChicago.com" subject="Preliminary UBSChicago Lead">
	FirstName: #FirstName#
	LastName: #LastName#
	Org: #Application.Org#
	AddressOne: #Addr1#
	City: #City#
	State: #State#
	Zip: #Session.Zip#
	WorkPhone: #BPhone#
	HomePhone: #HomePhone#
	HomeFax: #HomeFax#
	Email: #Session.Email#
	CellPhone: #CellPhone#
	OnEmailList: #OptIn#
	MemberID: #Session.MemberID#
	
	Member Belongs to #MemberOrg# (#MemberOrgID#)
	
	<cfif isDefined("referredFlag")>
	-----
	
	Referred By: #NameOfOrg#
	</cfif>
	
	-----
	
	<cfif isDefined("isAuto")>
	Vehicle: #NewOrUsed# #Year# #Make# #Model#
	</cfif>
	
	<cfif isDefined("productName")>
	Appliance Request:
	<cfloop list=#productName# index=foo>
	#foo#
	</cfloop>
	</cfif>
	
	<cfif isDefined("isFinance")>
	Financial Request:
	
	Birthday: #Session.Birthday#
	Finance Type: #Session.financeType#
	Occupancy Status: #Session.occupancy#
	Loan Amount: #Session.LoanAmount#
	Mortgage Balance: #Session.CurrentMortgage#
	Gross Monthly Income: #Session.GrossIncome#
	</cfif>
	
	</cfmail>
	<cfif not isDefined("Session.SeenUpdatePage") and not isDefined("newMemberAdded") >
		<cflocation url="getUpdatePwd.cfm?MemberID=#Session.MemberID#">
	<cfelse>
		<cflocation url="complete.cfm">
	</cfif>
<cfelse>

<cfquery name="getOrgName" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name from Organiza
where Organizati='#Trim(Application.Org)#'
</cfquery>

<cfset MemberOrgID=Application.Org>
<cfset MemberOrg=getOrgName.Name>

<cfif isDefined("referredFlag")>
<cflocation url="Select_Org.cfm?OrgName=#URLEncodedFormat(NameOfOrg)#">
</cfif>

<cfmail from="info@ubschicago.com" to="info@UBSChicago.com" cc="mortgageinfo@UBSChicago.com" subject="UBSChicago Lead">
FirstName: #FirstName#
LastName: #LastName#
Org: #Application.Org#
AddressOne: #Addr1#
City: #City#
State: #State#
Zip: #Session.Zip#
WorkPhone: #BPhone#
HomePhone: #HomePhone#
HomeFax: #HomeFax#
Email: #Session.Email#
CellPhone: #CellPhone#
OnEmailList: #OptIn#
MemberID: #Session.MemberID#

Member Belongs to #MemberOrg# (#MemberOrgID#)

<cfif isDefined("referredFlag")>
-----

Referred By: #NameOfOrg#
</cfif>

-----

<cfif isDefined("isAuto")>
Vehicle: #NewOrUsed# #Year# #Make# #Model#
</cfif>

<cfif isDefined("productName")>
Appliance Request:
<cfloop list=#productName# index=foo>
#foo#
</cfloop>
</cfif>

<cfif isDefined("isFinance")>
Financial Request:

Birthday: #Session.Birthday#
Finance Type: #Session.financeType#
Occupancy Status: #Session.occupancy#
Loan Amount: #Session.LoanAmount#
Mortgage Balance: #Session.CurrentMortgage#
Gross Monthly Income: #Session.GrossIncome#
</cfif>

</cfmail>


<cflocation url="getUpdatePwd.cfm?MemberID=#MemberToUpdate#">
</cfif>

</body>
</html>
