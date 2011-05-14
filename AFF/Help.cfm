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
      <td bgcolor="#FFFFFF" align="left"> 
        <p>&nbsp;</p>
        <blockquote>
<blockquote> 
            <p><font face="Arial, Helvetica, sans-serif" size="2"><b>Create a 
              New Document</b></font></p>
            <p><font face="Arial, Helvetica, sans-serif" size="2">The variables 
              available for the documents are as follows:</font></p>
            <ol>
              <li><b><font face="Arial, Helvetica, sans-serif" size="2">#current_date#</font></b><font face="Arial, Helvetica, sans-serif" size="2"> 
                : Display the current date in the document.</font></li>
              <li><font face="Arial, Helvetica, sans-serif" size="2"><b>#name#</b> 
                : Displays the name of the affiliate.</font></li>
              <li><font face="Arial, Helvetica, sans-serif" size="2"><b>#assett_size#</b> 
                : Calculates the monthly fee for GAP.</font></li>
              <li><font face="Arial, Helvetica, sans-serif" size="2"><b>&lt;ID&gt;</b> 
                : Displays affiliate ID in the Power Point Templates.</font></li>
            </ol>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Note : All these 
              fields are generated from the database and shall be displayed in 
              the document exactly as they appear in the database.</font></p>
            <p><font face="Arial, Helvetica, sans-serif" size="2">To add a new 
              document use the above variables wherever applicable. These variables 
              shall be replaced by true values when the document is dynamically 
              generated.</font></p>
            <p align="center"><font face="Arial, Helvetica, sans-serif" size="2"><a href="javascript:history.back();">&lt;&lt;back</a></font></p>
            <p>&nbsp;</p>
          </blockquote>
        </blockquote>
      </td>
    </tr>
  </table>
</center>
  <cfinclude template = "bottom.cfm">
</body>
</html>
