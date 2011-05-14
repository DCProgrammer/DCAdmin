<!---
findProductDealers.cfm tag
inputs: productID, Zip
outputs-> sets caller.DealersFound with the count
		  sets caller.DealerQuery with query results
		  sets caller.ClosestDCDealer with DealerID
		  sets caller.ClosestDealerName with Dealer Name
		  sets caller.closestPhone with Dealer Phone
		  --->
<cfset MyZip=attributes.Zip>
<cfset MyProduct=attributes.productID>
		  
<cf_makeZipList Zip=#MyZip# Distance=100>
		  
<cfquery name="getDCDealers" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
SELECT Name, Phone, DealerID, Zip from DCDealers A, DealerToProduct B 
where Left(Zip,5) in (#ZipList#) 
and A.DealerID=B.DL_ID 
and B.Product_ID='#MyProduct#' 
and Status!='I'
</cfquery>

<cfset Caller.ClosestDCDealer=''>
<cfloop list=#ZipList# index=foo>
	<cfif Caller.ClosestDCDealer is ''>
		<cfloop query="getDCDealers">
			<cfif Left(Zip,5) is Left(foo,5)>
				<cfset Caller.ClosestDCDealer=DealerID>
				<cfset Caller.ClosestDealerName=Name>
				<cfset Caller.closestPhone=Phone>
			</cfif>
		</cfloop>
	</cfif>
</cfloop>

<cfset caller.DealersFound=getDCDealers.recordCount>
<cfset caller.DealerQuery=getDCDealers>
