<title>DigitalCars.com</title>
<body bgcolor="#f2f2f2" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><cfinclude template = "top.cfm">
<div align="center">
<table width="768" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td bgcolor="#FFFFFF" align="center">
<p>&nbsp;</p><table border="0" cellspacing="0" cellpadding="0" width="400">
          <tr>
            <td bgcolor="#445999"> 
              <table width="400" border="0" cellspacing="1" cellpadding="3" align="center">
                <tr> 
                  <td bgcolor='#445999' align="center" height="5"><font face="verdana" size="2"><b></b></font></td>
                </tr>
                <tr> 
                  <td bgcolor='#f2f2f2'><font face="Arial, Helvetica, sans-serif" size="2">Welcome 
                    to the document generation module. You can generate custom 
                    documents here for making presentations to your affiliates. 
                    Please choose one of the links below.</font></td>
                </tr>
                <tr> 
                  <td bgcolor='#f2f2f2'><font face="Arial, Helvetica, sans-serif" size="2"> 
                    <a href='manage_documents.cfm'> <b>Manage Documents</b></a> 
                    : Select this link to view the documents that are currently 
                    there in this system. You may edit, delete or add more documents 
                    through this interface.</font></td>
                </tr>
                <tr> 
                  <td bgcolor='#f2f2f2'><font face="Arial, Helvetica, sans-serif" size="2"> 
                    <a href='choose_document.cfm'><b>Generate Document</b></a> 
                    : Select this link to generate a set of documents for specific 
                    affiliate.
					<br>

<cfquery name="getStates" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT State from ContinentalZipsToCoords
order by State
</cfquery>					
					
					<cfform action="choose_document.cfm" method="post">
					<cfselect name="State" size="1"
					Message="Your State Is Required"
					REQUIRED="YES">
					<cfoutput query="getStates">
					<option value="#State#">#State#</option>
					</cfoutput>
		            </cfselect>
					<input type="submit" value="submit">
					</cfform>
					</font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
        </td>
    </tr>
  </table> </div>
<div align="center"> 
  <table width="768" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td bgcolor="#445999">&nbsp;</td>
    </tr>
  </table>
</div>
</body>
</html>