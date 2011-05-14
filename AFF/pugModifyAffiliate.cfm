
<cfset Caller.cfg_MainDB="MainSQL"> 

<cfinclude template = "_header.cfm"> 
<cfquery name="getAffiliates"
	datasource="#Application.MainDB#"  
	username="#Application.DBUser#" 
	password="#Application.DBPwd#">
SELECT ID, Name
FROM Affiliate_Table
ORDER By Name
</cfquery>





<table width="450"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
  <tr bgcolor="#ECEDDE"> 
    <td colspan="2" align="center"> 

        <font face="Arial" size="2"><B>Modify Affiliate</font>

    </td>
  </tr>
  <td colspan='2'>


<cfform action="pugModifyDetails.cfm" method="get"  >
</td></tr>

  <tr> 
    <td align="right" bgcolor="#ECEDDE" width="199"><font face="Arial" size="-1">Select Affiliate:</font></td>
    <td bgcolor="#ECEDDE" width="240"> 
      <cfselect name="intAffiliateID" message="You need to select an Affliate"
	 size="1"
	 query="getAffiliates"
	 value="ID"
	 display="Name"
	 required="Yes">
	  </cfselect>
    </td>
  </tr>



  <tr> 
    <td align="right" colspan="2" bgcolor="#ECEDDE"><font face="Arial" size="-1">&nbsp;</font></td>
  </tr>
  <tr> 
    <td colspan="2" align='center'> 

        <input type='submit' value='Modify' style='background-color:#51627C ;color:#ffffff;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: #072044 1px solid; BORDER-TOP: #072044 1px solid; BORDER-LEFT: #072044 1px solid; BORDER-BOTTOM: #072044 1px solid;' >

    </td>
  </tr>
</table>

</cfform>
