<cfinclude template="_header.cfm">


<cfquery name="getOrgs" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Organizati, Name, Addr1, City, State, Zip from OrganizaSpCheck
where SoundEx(Name)=SoundEx("#OrgName#")
and Organizati not LIKE '%X'
and Organizati not LIKE '%W'
and Organizati not LIKE '%H'
and Verified=1
<cfif OrgName is ''>
and 0=1
</cfif>
</cfquery>

<cfif getOrgs.recordCount lt 1>
<cflocation url="complete.cfm">
</cfif>

<table width="750" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td colspan="2"> <p><img src="images/headers/organizations_select.gif" alt="Select Organization" width="400" height="25"></p>
            <p>Select the organization on the right that you are a member. If 
              you do not belong to any of the listed organization, <a href="Complete.cfm">click 
              here to continue</a>.<br>
            </p>
            </td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td align="right">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    <td><img src="images/spacers/1.gif" alt="Spacer" width="300" height="1" border="0">
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr> 
          <td><a href="complete.cfm">DO NOT BELONG TO ANY BELOW</a></td>
        </tr>
		
		<cfoutput query="getOrgs">
        <tr> 
            <td bgcolor="f0f0f0"> 
              <p><a href="changeMemberOrg.cfm?NewOrg=#Organizati#" class="article">#Name#<br>
                </a>(click name to select)<br>
                #Addr1#<br>
                #City#, #State# #Zip#</p></td>
        </tr>
		</cfoutput>
      </table> </td>
  </tr>
</table>


<cfinclude template="_footer.cfm">
