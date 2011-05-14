
<cfset Caller.cfg_MainDB="MainSQL"> 

<cfinclude template = "_header.cfm"> 
<table width="768" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>


<style type='text/css'>
td { font-family:Verdana;font-size:9pt;}
a { font-color:#0000ff }

</style>


<body bgcolor="#FFFFFF">

<CFQUERY  NAME = "list" 
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#">
	SELECT * FROM Affiliate_Table
	WHERE
<!---pug_Affliates --->

<CFIF IsDefined("vchName") AND Len(Trim(vchName))>
     Name LIKE '#vchName#%' 
</CFIF>


<CFIF IsDefined("nvchCity") AND Len(Trim(nvchCity)) >
	<CFIF IsDefined("vchName") AND Len(Trim(vchName))>
	      and City LIKE '#nvchCity#%'
	<CFELSE>
	      City LIKE '#nvchCity#%' 
	</CFIF>
</CFIF>

<CFIF IsDefined("nvchState") AND Len(Trim(nvchState))>
	<CFIF (IsDefined("nvchCity") AND Len(Trim(nvchCity))) or (IsDefined("vchName") and Len(Trim(vchName)))>
		and State like '#nvchState#%'
	<cfelse>
		State like '#nvchState#%'
	</cfif>
</CFIF>


<CFIF IsDefined("vchZip") AND Len(Trim(vchZip)) >
	<CFIF (IsDefined("nvchCity") AND Len(Trim(nvchCity))) OR  (IsDefined("vchName") AND Len(Trim(vchName))) OR  (IsDefined("nvchState") AND Len(Trim(nvchState)))>
	      and Zip LIKE '#vchZip#%' 
	<CFELSE>
	      Zip LIKE '#vchZip#%' 
	</CFIF>
</CFIF>

	
	ORDER BY Name
</CFQUERY>

<!--- Set the number of records to display on each page. --->
<CFSET OnEachPage = 10>

<!--- Set the default startrow to 1 if a value was not passed. --->
<!--- Determine whether or not to show the previous or next links. --->
<CFPARAM NAME = "StartRow" DEFAULT = "1">

<!--- Set the value of endrow to the maxrows + startrow - 1 --->
<CFSET EndRow = StartRow + OnEachPage - 1>

<!--- If the end row is greater than the recordcount, determine how many records are left. --->
<CFIF EndRow GTE list.RecordCount>
     <CFSET EndRow = list.RecordCount>
     <CFSET Next = false>

<!--- Othereise, set Next to true and determine the next set of records. --->
<CFELSE>
     <CFSET Next = true>
     <CFIF EndRow + OnEachPage GT list.RecordCount>
          <CFSET NextNum = list.RecordCount - EndRow>
     <CFELSE>
          <CFSET NextNum =  OnEachPage>
     </CFIF>
     <CFSET NextStart = EndRow + 1>
</CFIF>

<!--- If StartRow is 1, set Previous to false. --->
<CFIF StartRow IS 1>
     <CFSET Previous = false>

<!--- Othewise, determine the previous set of records. --->
<CFELSE>
     <CFSET Previous = true>
     <CFSET PreviousStart = StartRow - OnEachPage>
</CFIF>

<!--- Determine how many pages will be displayed. --->
<CFSET NumPages = Ceiling(list.RecordCount / OnEachPage)>
<CFPARAM NAME = "PageNum" DEFAULT = "1">

<P>

<TABLE BORDER = "0" CELLPADDING='2' cellspacing='2' align='center' width='100%' bgcolor="#ECEDDE" >
     <TR>
          <TD VALIGN = "top" align='left'>
		<CFOUTPUT>
		<font face='Verdana' size='2'>
		Your Search Yielded #list.RecordCount# Results.<BR>
		Displaying records #StartRow# to #EndRow#
		</font>
		</CFOUTPUT>
	</TD>
	</tr>	
</table>
<script language='javascript'>
function ConfirmDelete()
{
	var agree=confirm("Do you want to Delete the Current Affiliate?");
	if (agree)
		return true ;
	else
		return false ;
	return false ;
}
</script>

<TABLE BORDER = "0" CELLPADDING='2' cellspacing='0' align='center' width='100%' bgcolor="#ECEDDE" >
	<tr><td colspan='4'><hr width='100%' size='1' color='#000000'></tD></tr>
	<tR>
		<td><B>Organization Name</B></td>
		<td><B>View</B></td>
		<td align='center'><b>Modify</b></td>
		<td align='center'><b>Activate/Deactivate</b></td>		
	</tr>
	<tr><td colspan='4'><hr width='100%' size='1' color='#000000'></tD></tr>
	
   <CFOUTPUT QUERY = "list" STARTROW = "#startrow#" MAXROWS = "#OnEachPage#">
   <tr  bgcolor="##C8CBA0">
		<TD VALIGN = "top">
		<ui>
			<li><B>#Name#</b></li>
		</ui>
		</td>
		<td align='center' valign='top'>
		<a href='pugViewDetails.cfm?intAffiliateID=#ID#'><font color='##0000ff'>View</font></a></td>
        <TD align='center' VALIGN = "top">
        <a href='pugModifyDetails.cfm?intAffiliateID=#ID#'><font color='##0000ff'>Modify</font></a>
        </TD>
        <TD align='center' VALIGN = "top">
        <a href='pugDeleteDetails.cfm?intAffiliateID=#ID#&Act=<cfif #active# eq '1'>0<cfelse>1</cfif>'><font color='##0000ff'><cfif #active# eq '1'>DeActivate<cfelse>Activate</cfif></font></a>
        </TD>
		
	</tr>
		
    <TR>
    	<TD VALIGN = "top">
        
		<blockquote>
		<b>Add:&nbsp;&nbsp;</b>#Address# <BR>
		<b>Location:&nbsp;&nbsp;</b>#City#&nbsp;#State#&nbsp;&nbsp;#Zip#<BR>
		<b>Tel/Fax:&nbsp;&nbsp;</b>#Phone#&nbsp;/&nbsp;#Fax# <BR>
		<CFIF Len(Trim(#GeneralEmail#)) >
			<b>General EMail:&nbsp;&nbsp;</b> <A HREF='mailto:#GeneralEmail#'>#GeneralEmail#</a><br>
		</CFIF>
		<CFIF Len(Trim(#ContactEmail#)) >
			<b>Contact EMail:&nbsp;&nbsp;</b> <A HREF='mailto:#ContactEmail#'>#ContactEmail#</a><br>
		</CFIF>
                <CFIF Len(Trim(#Marketing_Email#)) >
                  <b>Marketing EMail:&nbsp;&nbsp;</b> <A HREF='mailto:#Marketing_Email#'>#Marketing_Email#</a> <a href="Email_Form.cfm?id=#ID#"><img src="../images/email2.gif" alt="Send Newsletter" width="16" height="12" border="0" align="absmiddle"></a> 
                  <a href="FaxNewsLetter.cfm?intAffiliateID=#ID#"><img src="../images/printer_small.gif" alt="Send to Print" border="0" align="absmiddle"></a><br>
                </CFIF>
                <cfset vchSiteURL = "#List.URL#">
		
		<CFIF Len(Trim(#vchSiteURL#)) >
                  <b>[</b><A HREF='#vchSiteURL#' TARGET='_BLANK'>Website</a><b>]</b> 
                  &nbsp;&nbsp;&nbsp; <b>[</b><a href="http://www.CAReports.com/default.cfm?affid=#ID#" target="_blank">Co-Brand 
                  Page</a><b>]</b> <b>[</b><a href="http://64.27.158.42/default.cfm?affid=#ID#"  target="_blank">Stage</a><b>]</b>
                </CFIF>		
		</blockquote>
        </TD>
		<td colspan="3">&nbsp;</td>
		
     </TR>
    </CFOUTPUT>

</table>
<BR><BR>
<TABLE BORDER = "0" CELLPADDING='2' cellspacing='2' align='center' >
     <TR>
          <TD VALIGN = "top">
               <!--- If Previous is true, display the previous link. --->
               <CFIF Previous>
                    <CFOUTPUT>
                         <A HREF = "SearchResults.cfm?StartRow=#PreviousStart#&PageNum=#DecrementValue(PageNum)#&vchName=#URLEncodedFormat(vchName)#
&nvchCity=#URLEncodedFormat(nvchCity)#
&vchZip=#URLEncodedFormat(vchZip)#
"><< Previous</A>
                    </CFOUTPUT>
               <CFELSE>
                     
               </CFIF>
          </TD>
          <CFLOOP FROM = "1" TO = "#NumPages#" INDEX = "ThisPage">
               <CFOUTPUT>
                    <CFIF ThisPage IS PageNum>
                         <TD>#ThisPage#</TD>
                    <CFELSE>
                         <CFSET PageNumStart = (((ThisPage - 1) * OnEachPage) + 1)>
                         <TD><A HREF = "SearchResults.cfm?StartRow=#PageNumStart#&PageNum=#ThisPage#&vchName=#URLEncodedFormat(vchName)#
&nvchCity=#URLEncodedFormat(nvchCity)#
&vchZip=#URLEncodedFormat(vchZip)#
">#ThisPage#</A></TD>
                    </CFIF>
               </CFOUTPUT>
          </CFLOOP>
          <TD VALIGN = "top">

               <!--- If Next is true, display the previous link. --->
               <CFIF Next>
                    <CFOUTPUT>
                         <A HREF = "SearchResults.cfm?StartRow=#NextStart#&PageNum=#IncrementValue(PageNum)#&vchName=#URLEncodedFormat(vchName)#
&nvchCity=#URLEncodedFormat(nvchCity)#
&vchZip=#URLEncodedFormat(vchZip)#
">Next >></A>
                    </CFOUTPUT>
               <CFELSE>
                     
               </CFIF>
          </TD>
     </TR>

     </table>


</td></tr></table>
<cfinclude template="_footer.cfm">

</body>
</html>