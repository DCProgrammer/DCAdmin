<cfquery name="updateDealer" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
UPDATE DCDealers
SET
Name="#Name#",
Addr1="#Addr1#",
Addr2="#Addr2#",
City="#City#",
State="#State#",
Zip="#Zip#",
Phone="#Phone#",
Ext="#Ext#",
Fax="#Fax#",
AnnualFee="#AnnualFee#",
MonthFee="#MonthFee#",
QuartFee="#QuartFee#",
Contact="#Contact#",
Division="#Division#",
Report="#Report#",
Lead="#Lead#",
Bill="#Bill#",
GM="#GM#",
JoinDate="#JoinDate#",
Bill_Deal="#Bill_Deal#",
FaxExt="#FaxExt#",
Owner="#Owner#",
CertFee="#CertFee#",
Payment="#Payment#",
Follow_Date="#Follow_Date#",
Follow_Comment="#Follow_Comment#",
Unappl_CAS="#Unappl_CAS#",
Book_Order="#Book_Order#",
Contact2="#Contact2#",
SalesRep="#SalesRep#",
Book_AR="#Book_AR#",
Doc_Fee="#Doc_Fee#",
Contact3="#Contact3#",
BookVent="#BookVent#",
Store="#Store#",
Status="#Status#",
Signature="#Signature#",
Program="#Program#",
Email="#Email#",
LoanAgent="#LoanAgent#",
MFGCodes="#MFGCodes#",
Banner="#Banner#"
WHERE DealerID="#DealerID#"
</cfquery>
<cflocation url="editDealer.cfm?dlrID=#DealerID#">

