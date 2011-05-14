<cfinclude template = "_header.cfm">
<script language='javascript' src='CreatedBy.js'></script>
<script language='javascript'>
function ValidateForm()
{
	if((trim(document.frmSearch.vchName.value).length == 0) && (trim(document.frmSearch.nvchCity.value).length == 0) && (trim(document.frmSearch.nvchState.value).length == 0) && (trim(document.frmSearch.vchZip.value).length == 0) )
	{
		 DisplayErrorMsg(document.frmSearch.vchName,'Must enter some value for search!');
		return false;
	}
	return true;
}
</script>
<table width="768" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>



<form name = "frmSearch"  action = "SearchResults.cfm"
onSubmit = "return ValidateForm()" >

  <table width="408"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
    <tr> 
      <td colspan="2" align="center" bgcolor="#ECEDDE"> <font face="Arial" size="2"><b>Search 
        Affiliate</b></font> </td>
    </tr>
    <tr> 
      <td align="right" height="4" >&nbsp;</td>
      <td height="4" >&nbsp;</td>
    </tr>
    <tr> 
      <td align="right" bgcolor="#ECEDDE" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Organization 
        Name: </font></td>
      <td bgcolor="#ECEDDE" > 
        <input type='text' name='vchName' value='' size='35' style='background-color:#ffffff ;color:#000000;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: #072044 1px solid; BORDER-TOP: #072044 1px solid; BORDER-LEFT: #072044 1px solid; BORDER-BOTTOM: #072044 1px solid;'>
      </td>
    </tr>
    <tr> 
      <td align="right" bgcolor="#ECEDDE" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">City: 
        </font></td>
      <td bgcolor="#ECEDDE" > 
        <input type='text' name='nvchCity' value='' size='35' style='background-color:#ffffff ;color:#000000;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: #072044 1px solid; BORDER-TOP: #072044 1px solid; BORDER-LEFT: #072044 1px solid; BORDER-BOTTOM: #072044 1px solid;'>
      </td>
    </tr>
    <tr> 
      <td align="right" bgcolor="#ECEDDE" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">State: 
        </font></td>
      <td bgcolor="#ECEDDE" > 
        <input type='text' name='nvchState' value='' size='2' style='background-color:#ffffff ;color:#000000;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: #072044 1px solid; BORDER-TOP: #072044 1px solid; BORDER-LEFT: #072044 1px solid; BORDER-BOTTOM: #072044 1px solid;'>
      </td>
    </tr>	
	
	
    <tr> 
      <td align="right" bgcolor="#ECEDDE" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Zip: 
        </font></td>
      <td bgcolor="#ECEDDE" > 
        <input type='text' name='vchZip' value='' size='35' style='background-color:#ffffff ;color:#000000;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: #072044 1px solid; BORDER-TOP: #072044 1px solid; BORDER-LEFT: #072044 1px solid; BORDER-BOTTOM: #072044 1px solid;'>
      </td>
    </tr>
    <tr align="center" bgcolor="#ECEDDE"> 
      <td colspan='2' >&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan='2' > 
        <input type='submit' value='Go' style='background-color:#51627C ;color:#ffffff;font-family:Arial;font-weight:bold;font-size:11px;BORDER-RIGHT: #072044 1px solid; BORDER-TOP: #072044 1px solid; BORDER-LEFT: #072044 1px solid; BORDER-BOTTOM: #072044 1px solid;' >
      </td>
    </tr>
  </table>
</form>



</td>
  </tr>
</table>

<cfinclude template = "_footer.cfm"> 
</body>
</html>