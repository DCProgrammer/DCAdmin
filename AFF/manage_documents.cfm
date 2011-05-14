<cfinclude template = "pug_conn.cfm">

<cfparam name="flg" default=''>
<cfparam name="msg" default=''>
<cfparam name="CurrentPagePath" default=''>
<cfparam name="DocumentUploadedFilePath" default=''>
<cfparam name="DocumentConvertedFileName" default=''>
<cfparam name="FilenameWithoutExt" default=''>
<cfparam name="totaldocument" default=0>

<cfif flg eq "add">
<cfset msg="Document has been successfully uploaded.">
<cfelseif flg eq "edt">
<cfset msg="Document has been successfully edited.">
</cfif>

<cfif flg eq 'dlt' >
	<cfset msg="">
	<cfset CurrentPagePath = ExpandPath("*.*")>
<cfset DocumentUploadedFilePath = GetDirectoryFromPath(CurrentPagePath) & "Upload\Documents">
<cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
	delete from PugDocumentdetail where DocumentId=#DocumentId#
</cfquery> 
<!---
<cfset totaldocument=#documentqry.recordcount#>	
<cfif totaldocument neq 0>
--->
<cfif FileExists("#DocumentUploadedFilePath#\#DocumentUploadedFileName#")>
<cffile action = "delete" file = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#">
</cfif>
<cfif FileExists("#DocumentUploadedFilePath#\#DocumentConvertedFileName#")>
<cffile action = "delete" file = "#DocumentUploadedFilePath#\#DocumentConvertedFileName#">
</cfif>

<cfif DirectoryExists("#DocumentUploadedFilePath#\#FilenameWithoutExt#_files")>

<cfdirectory action = "list"  name="directoryList" directory = "#DocumentUploadedFilePath#\#FilenameWithoutExt#_files">

<cfoutput query="directoryList" startRow = "3">
<cfif fileExists("#DocumentUploadedFilePath#\#FilenameWithoutExt#_files\#directoryList.name#")>
<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#FilenameWithoutExt#_files\#directoryList.name#">
		</cfif>
</cfoutput>
<cfdirectory action = "delete"  directory = "#DocumentUploadedFilePath#\#FilenameWithoutExt#_files">

</cfif>

<cfset msg="Document has been deleted.">
<!---</cfif>--->

</cfif>


<html>
<head>
<title>Manage Documents</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function confirmdel()
{
	if (confirm("Are you sure you want delete this document.")) return true;
return false;		
}

//****************************************************************************
//-->
</script>
</head>
<body bgcolor="#f2f2f2" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<cfinclude template = "top.cfm">
<center>
  <table width="768" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td bgcolor="#FFFFFF" align="center"> 
        <center>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <font face="verdana" size="2"><b><cfoutput>#msg#</cfoutput></b></font> 
        </center>
        <p><font face="Arial, Helvetica, sans-serif" size="2">The following is 
          a list of all documents template currently available for presentations.<br>
          Click on the <b>&quot;Document Name&quot;</b> to view the document template.<br>
          Click on the <b>&quot;Modify&quot;</b> link to make changes in
          the relevant document template.<br>
          Click on <b>&quot;Add 
          New Document&quot;</b> if you wish to create a new document template.<br>
          Click on the <b>&quot;Help&quot;</b> link to learn about how to modify 
          or create a new document.</font></p>
        <table width="450" border="0" cellspacing="1" cellpadding="2" align="center">
          <tr bgcolor="#445999"> 
            <td colspan="4" align="center"> 
              <p><font face="Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Document 
                Template List</font></b></font></p>
            </td>
          </tr>
          <tr bgcolor="#f2f2f2"> 
            <td width="50"> <font face="Arial, Helvetica, sans-serif" size="2"><b>Sr 
              No</b></font> </td>
            <td width="200"> <font face="Arial, Helvetica, sans-serif" size="2"><b>Document 
              Name</b></font> </td>
            <td width="100"> <font face="Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font> 
            </td>
            <td width="100"> <font face="Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font> 
            </td>
          </tr>
          <cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
          SELECT DocumentId,DocumentName,DocumentUploadedFileName,DocumentConvertedFileName,FilenameWithoutExt 
          FROM PugDocumentdetail 
          </cfquery>
          <cfset totaldocument=#documentqry.recordcount#>
          <cfif totaldocument eq 0>
          <tr bgcolor="#f2f2f2"> 
            <td  height="23" bgcolor="#f2f2f2" colspan="4" > <font face="Arial, Helvetica, sans-serif" size="2">There 
              are no document available. </font></td>
          </tr>
          <cfelse>
          <cfset i=1>
          <cfoutput query = "documentqry" > 
            <tr bgcolor="##f2f2f2"> 
              <td width="50" bgcolor="##f2f2f2" align="center"> <font face="Arial, Helvetica, sans-serif" size="2">#i#.</font> 
              </td>
              <td width="200"><font face="Arial, Helvetica, sans-serif" size="2"><a href="Upload/documents/#DocumentUploadedFileName#" >#DocumentName#</a></font> 
              </td>
              <td width="100"> <font face="Arial, Helvetica, sans-serif" size="2"><a href="edit_document.cfm?DocumentId=#DocumentId#">Modify</a></font> 
              </td>
              <td width="100"> <font face="Arial, Helvetica, sans-serif" size="2"><a  
	onClick="javascript:return confirmdel();"  href="#CGI.SCRIPT_Name#?DocumentId=#DocumentId#&DocumentUploadedFileName=#URLEncodedFormat(DocumentUploadedFileName)#&flg=dlt&DocumentConvertedFileName=#URLEncodedFormat(DocumentConvertedFileName)#&FilenameWithoutExt=#URLEncodedFormat(FilenameWithoutExt)#">Delete</a></font> 
              </td>
            </tr>
            <cfset i=i+1>
          </cfoutput> 
          </cfif>
        </table>
        <table width="450"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
          <tr> 
            <td  bgcolor="#f2f2f2" align="center" > <font face="Arial, Helvetica, sans-serif" size="2"><b><a href="uploadDocument.cfm">Add 
              New Document</a> </b></font> </td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </td>
    </tr>
  </table>
</center>
  <cfinclude template = "bottom.cfm">
</body>
</html>
