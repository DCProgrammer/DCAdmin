<cfinclude template="_header.cfm">

<cfif isDefined("Session.Product")>
<cfset myProduct=Session.Product>
<cfelse>
<cfset MyProduct='11020'>  <!-- for testing tag-->
</cfif>

<cf_findProductDealers zip='#Session.Zip#' productid='#MyProduct#'>
<table width="750" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
<td>
<cfif Application.genCert is 0><cfset DealersFound=1></cfif>
<cfif DealersFound gt 0>

<cfif Application.genCert is 1>
<cf_addLead memberID=#Session.MemberID# product=#MyProduct# DealerID=#closestDCDealer# Zip=#Session.Zip#>
	<cfif MyCertID is not ''>
		<cfquery name="addleadfaxQueue" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
		insert into LeadFaxQueue (CertID,memberID,Make,Model,WhenBuy,Destination,Type,origin) values 
		(#Right(MyCertID,6)# ,#Session.MemberID#,'#Session.Make#','#Session.Model#',
		'Within 30 days',
		'DL','L','UBS')
		</cfquery>
	</cfif>

</cfif>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td colspan="2"> <p><img src="images/headers/complete-goodlead.gif" alt="Complete" width="400" height="25"></p>
              <p>Thank you for using UBS Chicago. Once we verify all information, 
                please look in you email to a local participating dealer in your 
                area who will be able to offer you a discount.</p>
            <p>If you have questions, contact us at 800.YES.COST or by email at 
              info@ubschicago.com 
			  <cfif Application.genCert is 1>
			  <cfoutput>
			  and reference your certificate number of #MyCertID#.
			  </cfoutput>
			  </cfif></p>
            <p>Thank you.<br>
            </p></td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
<cfelse>
      <p>&nbsp;</p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td colspan="2"> <p><img src="images/headers/complete-goodlead.gif" alt="Complete" width="400" height="25"></p>
              <p>Thank you for using United Buying Service Chicago. Your request 
                has been received. Unfortunately at the moment we do not have 
                an available dealer for your request in the area. Please contact 
                us at 800.YES.COST and one of national counselors will be able 
                to assist you and find a local dealer who will be able to service 
                you.</p>
            <p>If you have questions, contact us at 800.YES.COST or by email at 
              info@ubschicago.com
			  <cfif Application.genCert is 1> 
			  <cfoutput>and reference your certificate number of #MyCertID#</cfoutput>
			  </cfif>.</p>
            <p>Thank you.<br>
            </p></td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
</cfif>
      <p>&nbsp;</p></td>
    <td><img src="images/spacers/1.gif" alt="Spacer" width="300" height="1" border="0"> 
    </td>
  </tr>
</table>

<cfinclude template="_footer.cfm">
