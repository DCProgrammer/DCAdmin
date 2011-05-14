<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<cfinclude template="../_header.cfm">


<cfquery name="getDealerDetails" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT * from IndexedNWDealers
 where DL_Index=#DL_Index#
</cfquery>
<cfquery name="getDealerType" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select B.TypeDescription as DealerType from IndexedNWDealers A, IndexDealers_Type B 
where A.dl_index=#DL_Index#
and B.TypeID=A.Dealer_TypeID
</cfquery>




<table width="768" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF"><cfoutput query="getDealerDetails">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="##0000FF">
        <cfparam name="HTTP_REFERER" default="">
        <TR> 
          <td valign="bottom">&nbsp;</td>
          <td height="21" nowrap>Dealer Details</td>
          <TD valign='bottom'>&nbsp;</TD>
          <TD valign='bottom' WIDTH="100%" align=right><a href="IndexDealerSearch.cfm">Search 
            Again </a></TD>
        </TR>
        <TR> 
          <td width="100%" height="1" colspan="4" align="right" valign="top" bgcolor="##000000"><IMG height=1 src="/CommonImages/Headers/black.gif" width="100%"></td>
        </TR>
      </TABLE></td>
  </tr>
  <tr> 
    <td colspan="2"> <table border="0" width="100%">
        <tr> 
          <!--- OUTPUT COMPANY NAME HEADER FROM AFFILIATEID FIELD --->
          <td class="td_header" align="left" valign="top">&nbsp;<b>#UCase(Name)#</b>&nbsp;&nbsp;</td>
          <td align="right" valign="top"><a href="ModifyDealerMain.cfm?DL_Index=#DL_Index#">Modify</a></td>
        </tr>
		<tr>
		<td colspan=2 align=right><a href="ModifyDealerMakes.cfm">Change Makes</a></td>
		</tr>
      </table></td>
  </tr>
  <tr align="LEFT" valign="TOP"> 
    <td width="20%"> 
      <!--- PHOTO TABLE --->
      <table width="100%">
        <tr> 
          <td width="120" align="CENTER" valign="TOP"> <img width=120 height=120 src="/CommonImages/Icons/nophoto.gif" border=0 alt="No Photo Available"> 
          </td>
        </tr>
      </table>
      <!--- PHOTO TABLE --->
    </td>
    <td width="80%" align="LEFT" valign="TOP"> 
      <!--- CONTACT INFORMATION TABLE --->
      <table width="100%" border="0" cellspacing="0" cellpadding="3" valign="TOP">
        <tr> 
          <td>#Name#</td>
          <td align="right"> <b>DC Dealer:</b> <cfif DCDealer eq 1>
              <b>#DCDealerID#</b> 
              <cfelse>
              <font color="red">NO</font> </cfif> </td>
        </tr>
        <tr> 
          <td colspan="2"> #Address#<br> #City#, #State# #Zip# </td>
        </tr>
        <tr> 
          <td colspan="2"><hr size=1></td>
        </tr>
        <tr> 
          <td>Dealer Type:</td>
          <td>#UCase(getDealerType.DealerType)#</td>
        </tr>
        <tr> 
          <td colspan="2"><hr size=1></td>
        </tr>
        <tr> 
          <td>Phone:</td>
          <td>#Phone#</td>
        </tr>
        <cfif TollFree is not ''>
          <tr> 
            <td>TollFree</td>
            <td>#TollFree#</td>
          </tr>
        </cfif>
        <cfif Fax is not ''>
          <tr> 
            <td>Fax</td>
            <td>#Fax#</td>
          </tr>
        </cfif>
        <cfif WebSite eq "1">
          <cfif WebsiteURL is not ''>
            <tr> 
              <td>Website</td>
              <td><a href="#Trim(WebSiteURL)#" target="_blank">#WebsiteURL#</a></td>
            </tr>
          </cfif>
        </cfif>
        <cfif (Email neq '') and (Email gt 0)>
          <tr> 
            <td>Email</td>
            <td><a href="mailto:#Trim(Email)#">#Email#</a></td>
          </tr>
        </cfif>
        <tr> 
          <td colspan=2><hr size=1></td>
        </tr>
        <cfif Owner is not ''>
          <tr> 
            <td>Dealer 
              Principle</td>
            <td>#Owner#</td>
          </tr>
        </cfif>
        <cfif GM is not ''>
          <tr> 
            <td>General 
              Manager</td>
            <td>#GM#</td>
          </tr>
        </cfif>
        <cfif Contact is not ''>
          <tr> 
            <td>Contact</td>
            <td>#Contact#</td>
          </tr>
        </cfif>
        <tr> 
          <td colspan=2><hr size=1></td>
        </tr>
        <tr> 
          <td>Password</td>
          <td>#Password#</td>
        </tr>
        <tr> 
          <td colspan="2"><hr size=1></td>
        </tr>
        <tr> 
          <td>Date Record Created</td>
          <td>#DateFormat(DateCreated)#</td>
        </tr>
        <tr> 
          <td>Date Record Updated</td>
          <td><cfif DateUpdated neq ''>
              #DateFormat(DateUpdated)# 
              <cfelse>
              <font color="red">Never Updated</font></cfif></td>
        </tr>
        <cfif DateUpdated neq ''>
          <tr> 
            <td>User 
              Updated</td>
            <td><cfif userUpdated neq ''>
                #Trim(UCase(userUpdated))# 
                <cfelse>
                <font color="red">No Status</font></cfif></td>
          </tr>
        </cfif>
      </table>
      <!--- CONTACT INFORMATION TABLE --->
    </td>
  </tr>
  
  <!--- OUTPUT ASSOCIATED MARK UPS FOR DEALERSHIP --->
  <cfif DCDealer eq 1>
  <cfquery name="MarkUp" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT * from NewMarkUps 
	where DealerID='#DCDealerID#'
	order by year, make desc
  </cfquery>
  
<SCRIPT LANGUAGE="javascript">

function open_digital(page) { var msie=false; var appName=navigator.appName; 
if(appName.indexOf("Microsoft")==0) msie=true; 
DC_window=window.open(page, "DC_window", 
"width=400,height=400,status=0, resizable=no,menubar=no,scrollbars=yes,toolbar=no,location=0,menubar=no"); 
if(!msie) DC_window.focus(); }

</SCRIPT>
  
  <tr align="LEFT" valign="TOP"> 
    <td colspan="2">
	  

    <tr align="LEFT" valign="TOP"> 
      <td colspan="2">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="##0000FF">
          <TR> 
            <td valign="bottom">&nbsp;</td>
            <td height="21" nowrap>Mark Ups</td>
            <TD valign='bottom'>&nbsp;</TD>
            <TD valign='bottom' WIDTH="100%" align=right>&nbsp;</TD>
          </TR>
          <TR> 
            <td width="100%" height="1" colspan="4" align="right" valign="top" bgcolor="##000000"><IMG height=1 src="/CommonImages/Headers/black.gif" width="100%"></td>
          </TR>
        </TABLE>
		</td>
    </tr>
 
	
	</td>
  </tr>
  <tr align="LEFT" valign="TOP"> 
    <td>&nbsp;</td>
    <td align="LEFT" valign="TOP">
	<table background="0" width="100%">
	<cfloop query="MarkUp">
	<tr>
		<td align="left" valign="top">
		#Year# #Make# #Model#<br>
		#Style#
		</td>
		<td align="left" valign="top">&nbsp;
		<!---
		#MarkUp_Dollar#<br>      
		#MarkUp_Perc#<br>                                     
		#MarKUp_Retail# #PrepFee#<br>
		#Advert_Retail# #Advert_Perc#<br>                                           
		#Advert_dollar#<br>
		#Advert_Inc_Options#<br>
		#Notes#
		--->
		</td>
		      <td align="right" valign="top"> 
                <A href="javascript:open_digital('MarkUp_Details.cfm.cfm?MarkUpID=#MarkUpID#&DCDealerID=#getDealerDetails.DCDealerID#');"><img src="/CommonImages/Icons/record_view.gif" alt="View" border="0"></a><A href="javascript:open_digital('MarkUp_Edit.cfm.cfm?MarkUpID=#MarkUpID#');"><img src="/CommonImages/Icons/record_edit.gif" alt="Edit" border="0"></a><img src="/CommonImages/Icons/record_delete.gif" alt="Delete" border="0"> 
              </td>		
	</tr>
	<tr><td colspan="3"><hr size="1"></td></tr>
	</cfloop>
	</table>
	 
	
	</td>
  </tr>
  </cfif>
</table>
	
	

							
			</td>
		</tr>
		</table>
	<!--- CONTACT HEADER TABLE --->		
		
	</td></tr>
</table>

</cfoutput>


<cfinclude template="../_footer.cfm">