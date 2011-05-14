<cfinclude template = "pug_conn.cfm">
<html>
<head>
<title>Download Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#f2f2f2" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<cfinclude template = "top.cfm">
<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td bgcolor="#FFFFFF"> <br>
      <br>
      <cfparam name="AffiliateName" default=''>
      <cfparam name="ID" default=''>
      <cfparam name="Document" default=''>
      <!----------------------------------->
      <cfset CurrentPagePath = ExpandPath("*.*")>
      <cfset DirectoryUploadFolderPath = GetDirectoryFromPath(CurrentPagePath) & "Upload\documents">
      <cfset directoryname="Directory_#ID#">
      <cfset DirectoryPath = GetDirectoryFromPath(CurrentPagePath) & "Upload\#directoryname#">
      <!----------------------------------->
      <cfif  DirectoryExists(#DirectoryPath#)>
      <cfdirectory   name="directoryList" directory = "#DirectoryPath#"  sort = "name ASC, size DESC">
      </cfif>
      <br>
      <blockquote> 
        <blockquote> 
          <blockquote> 
            <blockquote>
              <div align="center">
                <center>
                  <font face="Arial, Helvetica, sans-serif" size="2">You may save 
                  these in your local hard drive and either mail them to the affiliate 
                  or print them out for your presentation.</font> 
                </center>
              </div>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <div align="center"> 
        <center>
          <p><font face="verdana" size="2"><b>Please download the documents for 
            </b></font> <font face="verdana" size="2"><b><cfoutput>#AffiliateName#</cfoutput></b></font></p>
        </center>
        <table width="350" border="0" cellspacing="2" cellpadding="5" align="center">
          <tr> 
            <td bgcolor='#445999' align="center"><font face='arial' size='2'><b><font color="#FFFFFF">Document 
              List</font></b></font></td>
          </tr>
          <cfoutput query="directoryList" startrow = "3"> 
            <cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
            SELECT DocumentName FROM PugDocumentdetail where DocumentUploadedFileName='#directoryList.Name#' 
            </cfquery>
            <tr> 
              <td bgcolor='##f2f2f2' align="center"><font face='arial' size='2'><a href='Upload/Directory_#ID#/#directoryList.Name#' >#documentqry.DocumentName#</a></font></td>
            </tr>
          </cfoutput> 
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p><br>
        </p>
      </div>
    </td>
  </tr>
</table>
<cfinclude template = "bottom.cfm">
<div align="center"></div>
</body>
</html>
