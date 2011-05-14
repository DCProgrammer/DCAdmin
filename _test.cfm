<cfset state = "IL">


<cfquery name="getMembers2" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT rtrim(state), count(*)
	FROM         Members
	group by rtrim(state)
	order by count(*) desc
</cfquery>

<cfdump var=#getMembers2#>


<cfabort>


<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	--SELECT     Org, rtrim(FirstName) as firstname, rtrim(LastName) as lastname, Addr1, City, State, Zip, HomePhone, BPhone, Email, JoinDate, WorkFax, Fax, CellPhone
	--select count(*) as howmany
	select top 100 *
	FROM         Members
	WHERE 1 = 1
	--AND (Org NOT IN (SELECT org FROM  tempOrgsExclusion))
	AND (State = '#State#')
	order by newmemberid desc
</cfquery>


<cfquery name="get1" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	select count(*),FL
	FROM         Members
	group by memberID
	having count(*) > 1
</cfquery>
<cfquery name="get2" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	select count(*),newmemberID
	FROM         Members
	group by newmemberID
	having count(*) > 1
</cfquery>

<cfdump var=#get1#>
<cfdump var=#get2#>
<cfabort>

<cfquery name="getPhoneList" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
--SELECT ID=A.MemberID, Phone=
--Replace(Replace(Replace(Replace(Replace(HomePhone,'(',''),'/',''),')',''),' ',''),'-','')
-- , FirstName, LastName, Addr1,City, State, Zip,JoinDate
select count(*) as howmany
from MembersTable A
where 1=1
and State='#state#'
--order by JoinDate DESC
</cfquery>


<cfoutput>
getMembers: #getMembers.howmany#
<br><br>
getPhoneList: #getPhoneList.howmany#
</cfoutput>

<cfabort>


<!---
DealerID#chr(delim)#Name#chr(delim)#Addr1#chr(delim)#Addr2#chr(delim)#City#chr(delim)#State#chr(delim)#Zip#chr(delim)#Phone#chr(delim)#Ext#chr(delim)#Fax#chr(delim)#AnnualFee#chr(delim)#MonthFee#chr(delim)#QuartFee#chr(delim)#Contact#chr(delim)#Division#chr(delim)#Report#chr(delim)#Lead#chr(delim)#Bill#chr(delim)#GM#chr(delim)#JoinDate#chr(delim)#Bill_Deal#chr(delim)#FaxExt#chr(delim)#Owner#chr(delim)#CertFee#chr(delim)#Payment#chr(delim)#Follow_Date#chr(delim)#Follow_Comment#chr(delim)#Unappl_CAS#chr(delim)#Book_Order#chr(delim)#Contact2#chr(delim)#SalesRep#chr(delim)#Book_AR#chr(delim)#Doc_Fee#chr(delim)#Contact3#chr(delim)#BookVent#chr(delim)#Store#chr(delim)#Status#chr(delim)#Signature#chr(delim)#Program#chr(delim)#Email#chr(delim)#LoanAgent#chr(delim)#MFGCodes#chr(delim)#Banner





#getDealers.DealerID##chr(delim)#
#getDealers.Name##chr(delim)#
#getDealers.Addr1##chr(delim)#
#getDealers.Addr2##chr(delim)#
#getDealers.City##chr(delim)#
#getDealers.State##chr(delim)#
#getDealers.Zip##chr(delim)#
#getDealers.Phone##chr(delim)#
#getDealers.Ext##chr(delim)#
#getDealers.Fax##chr(delim)#
#getDealers.AnnualFee##chr(delim)#
#getDealers.MonthFee##chr(delim)#
#getDealers.QuartFee##chr(delim)#
#getDealers.Contact##chr(delim)#
#getDealers.Division##chr(delim)#
#getDealers.Report##chr(delim)#
#getDealers.Lead##chr(delim)#
#getDealers.Bill##chr(delim)#
#getDealers.GM##chr(delim)#
#getDealers.JoinDate##chr(delim)#
#getDealers.Bill_Deal##chr(delim)#
#getDealers.FaxExt##chr(delim)#
#getDealers.Owner##chr(delim)#
#getDealers.CertFee##chr(delim)#
#getDealers.Payment##chr(delim)#
#getDealers.Follow_Date##chr(delim)#
#getDealers.Follow_Comment##chr(delim)#
#getDealers.Unappl_CAS##chr(delim)#
#getDealers.Book_Order##chr(delim)#
#getDealers.Contact2##chr(delim)#
#getDealers.SalesRep##chr(delim)#
#getDealers.Book_AR##chr(delim)#
#getDealers.Doc_Fee##chr(delim)#
#getDealers.Contact3##chr(delim)#
#getDealers.BookVent##chr(delim)#
#getDealers.Store##chr(delim)#
#getDealers.Status##chr(delim)#
#getDealers.Signature##chr(delim)#
#getDealers.Program##chr(delim)#
#getDealers.Email##chr(delim)#
#getDealers.LoanAgent##chr(delim)#
#getDealers.MFGCodes##chr(delim)#
#getDealers.Banner##chr(delim)#
--->

<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfset Variables.labelLS = "col1,col2,col3">
<cfset Variables.sLabel = "">

<cfloop list="#Variables.labelLS#" index="thisLabel">
	<cfset Variables.sLabel = Variables.sLabel & thisLabel & chr(delim)>
</cfloop>
<cfoutput>#Variables.sLabel#</cfoutput>