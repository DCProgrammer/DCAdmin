<cfinclude template = "pug_conn.cfm">

<cfparam name="flg" default=''>
<cfparam name="msg" default=''>
<cfparam name="DocumentName" default=''>
<cfparam name="DocumentID" default='0'>


<cfif flg eq 'edt'>
	<cfparam name="DocumentUploadedFileName" default=''>
	<cfparam name="filenameWithoutExt" default=''>
	<cfparam name="result" default='Conversion Not Done!'>
	<cfparam name="DocumentUploadedFilePath" default=''>
	<cfparam name="DocumentConvertedFilePath" default=''>
	<cfparam name="filetype" default=''>
	<cfparam name="filesubtype" default=''>
	<cfparam name="filemimetype" default=''>
	<cfparam name="totalcount" default=0>
	<cfparam name="DocumentConvertedFileName" default=''>
	<cfparam name="DocumentConvertedFileNameNew" default=''>
	<cfparam name="	DeleteFilenameWithoutExt" default=''>
	<cfparam name="DocumentType" default=''>
	<cfparam name="DocumentName_old" default=''>
	<cfparam name="i" default=0>
	<cfparam name="j" default=0>
<!---------------------->
<cfset CurrentPagePath = ExpandPath("*.*")>
<!---<cfset DirectoryDeleteFolderPath = GetDirectoryFromPath(CurrentPagePath) & "Delete">--->
<cfset DocumentUploadedFilePath = GetDirectoryFromPath(CurrentPagePath) & "Upload\Documents">
<!---------------------->
<cfif trim(DocumentName) neq trim(DocumentName_old)>
<cfquery name="documentqry1"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
    SELECT * FROM PugDocumentdetail where DocumentID <>#DocumentID# and DocumentName='#DocumentName#'
  </cfquery>    
<cfset totaldocument=#documentqry1.recordcount#>	

<cfif totaldocument neq 0>
	<cfset msg="Document '"& DocumentName &"' is already available.">
</cfif><!---<cfif totaldocument neq 0> --->

	<cfset totaldocument=0>
</cfif><!---<cfif trim(DocumentName) neq trim(DocumentName_old)> --->

<!---------------------->
<cfif msg eq "" >

	<cfif Form.FiletoUpload neq "" >
<!---------------------->
<cffile action="upload"    destination="#DocumentUploadedFilePath#\"  
nameConflict="MakeUnique"    fileField="Form.FiletoUpload">
		<cfset DocumentUploadedFileName=cffile.serverfile>
		<!---
<cfoutput>#DocumentUploadedFilePath# <br>#DocumentUploadedFileName#</cfoutput>
		--->
		
		<cfset j=Find(" ",DocumentUploadedFileName)>
		
	<cfif j gt 0 >
		<cfset DocumentUploadedFileNameNew=replace(DocumentUploadedFileName," ","_","all")>
		<cffile action = "rename"  source = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#" 
		destination = "#DocumentUploadedFilePath#\#DocumentUploadedFileNameNew#">
		<cfset DocumentUploadedFileName=DocumentUploadedFileNameNew>
	</cfif><!---		<cfif j gt 0 > --->

		<cfset i=Find(".",DocumentUploadedFileName)>
		<cfset filenameWithoutExt=left(DocumentUploadedFileName,i-1)>
		<cfset filetype=cffile.contentType>	
		<cfset filesubtype=cffile.contentSubType>
		<cfset filemimetype=filetype &"/"& filesubtype>	
<!---------------------->
<cfif msg eq "" >
		<cfif filemimetype neq  "application/msword" and filemimetype neq  "application/pdf" and filemimetype neq  "application/x-mspowerpoint">
			<cfset msg="Please upload only word or PDF or PowerPoint file.">
		<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#">
		</cfif>
</cfif><!--- <cfif msg eq "" > --->
<!---------------------->
<cfif msg eq "" >
		<cfset filesize=cffile.filesize>			
		<cfif filesize eq 0>
			<cfset msg="Please donot upload empty file">
		</cfif>
</cfif><!--- <cfif msg eq "" > --->
<!---------------------->
<cfif msg eq "" >

<cfif FileExists("#DocumentUploadedFilePath#\#DocumentUploadedFileName#")>
<!---
<cffile action = "move"
  source = "#DirectoryDeleteFolderPath#\#DocumentUploadedFileName#"
  destination = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#"  > 
  --->
<!----------------------------------------->
	<cfif filemimetype eq  "application/msword">
<cfset DocumentType='word'>
<cfobject action = "Create"  type = "COM"  class = "DOC2HTML.ConvertIt"  name = "conversionobject">
<cfset conversionobject.InputDOC = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#">
<cfset DocumentConvertedFileName="#filenameWithoutExt#.htm">
<cfset DocumentConvertedFilePath="#DocumentUploadedFilePath#\#DocumentConvertedFileName#">
<cfset conversionobject.OutputFile = "#DocumentConvertedFilePath#">
<cfset result = conversionobject.ConvertIt()>
<!------------------------------------------------->
<cfset i=0>
<cfset i=Find("Trial Version Expired",result)>
<!---
<cfoutput>#DocumentUploadedFilePath#\#DocumentUploadedFileName#</cfoutput><br>
--->
<cfif (i gt 0 )and FileExists("#DocumentUploadedFilePath#\#DocumentUploadedFileName#")>
	
	<center>Component DOC2HTML is Trial Version.It has Expired. Please visit http://www.finertechnologies.com.
		</center>
	<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#">
		
	<cfabort>
</cfif>
<!------------------------------------------------->
	</cfif><!--- 	<cfif filemimetype eq  "application/msword"> --->

<!----------------------------------------->
	<cfif filemimetype eq  "application/pdf">
		<cfset DocumentConvertedFileName="#DocumentUploadedFileName#">
		<cfset DocumentType='pdf'>
	</cfif><!---	<cfif filemimetype eq  "application/pdf"> --->

<!----------------------------------------->	
	<cfif filemimetype eq  "application/x-mspowerpoint">
		<cfset DocumentConvertedFileName="#DocumentUploadedFileName#">
		<cfset DocumentType='ppt'>
	</cfif><!--- 	<cfif filemimetype eq  "application/x-mspowerpoint"> --->
<!----------------------------------------->
<cfquery name="documentqry1"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
    SELECT DocumentConvertedFileName,DocumentUploadedFileName,FilenameWithoutExt FROM PugDocumentdetail where DocumentID =#DocumentID# 
  </cfquery>    
<cfset totaldocument=#documentqry1.recordcount#>	

<cfif totaldocument neq 0 >
<cfif documentqry1.DocumentUploadedFileName neq DocumentUploadedFileName>
	<cfoutput query="documentqry1" >
		<cfif fileExists("#DocumentUploadedFilePath#\#documentqry1.DocumentConvertedFileName#")>
		<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#documentqry1.DocumentConvertedFileName#">
		</cfif>
		<cfif fileExists("#DocumentUploadedFilePath#\#documentqry1.DocumentUploadedFileName#")>
		<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#documentqry1.DocumentUploadedFileName#">
		</cfif>
		<cfset DeleteFilenameWithoutExt=#documentqry1.FilenameWithoutExt#>
	</cfoutput>

	<cfif DirectoryExists("#DocumentUploadedFilePath#\#DeleteFilenameWithoutExt#_files")>
		<cfdirectory action = "list"  name="directoryList" directory = "#DocumentUploadedFilePath#\#DeleteFilenameWithoutExt#_files">

		<cfoutput query="directoryList" startRow = "3">
			<cfif fileExists("#DocumentUploadedFilePath#\#DeleteFilenameWithoutExt#_files\#directoryList.name#")>
			<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#DeleteFilenameWithoutExt#_files\#directoryList.name#">
			</cfif>
		</cfoutput>
		<cfdirectory action = "delete"  directory = "#DocumentUploadedFilePath#\#DeleteFilenameWithoutExt#_files">
	</cfif>
	<!---	<cfif DirectoryExists("#DocumentUploadedFilePath#\#DeleteFilenameWithoutExt#_files")>--->
</cfif>
</cfif><!---<cfif totaldocument neq 0> --->


<cfquery name="insert" datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
update PugDocumentdetail set DocumentName='#DocumentName#'
,DocumentConvertedFileName='#DocumentConvertedFileName#'
,DocumentUploadedFileName='#DocumentUploadedFileName#'
,filenameWithoutExt='#filenameWithoutExt#'
,DocumentType='#DocumentType#'
where DocumentID=#DocumentID#
</cfquery>
<!----------------------------------------->
</cfif><!---    <cfif msg eq "" > --->
</cfif><!---<cfif FileExists("#DocumentUploadedFilePath#\#DocumentUploadedFileName#")> --->

<!--------------------------------------------------------->
<cfelse>

<cfquery name="insert" datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
update PugDocumentdetail set DocumentName='#DocumentName#'
where DocumentID=#DocumentID#
</cfquery>

</cfif><!---		<cfif Form.FiletoUpload neq ""> --->
 <!---   --->
 <cflocation url = "manage_documents.cfm?flg=edt" addToken = "No"> 
 

</cfif><!---    <cfif msg eq "" > --->


 </cfif>
<!--------------------------------------------------------->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Upload Document </title>
</head>

<body bgcolor="#f2f2f2" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<cfinclude template = "top.cfm">
<center>
  <table width="768" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td bgcolor="#FFFFFF">
        <center>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <font face="verdana" size="2"><b><cfoutput>#msg#</cfoutput></b></font>
        </center>
        <script language="JavaScript">
<!--
function empty(object,str)
{
var str1=object.value;
			str2="";	
	for(var i=0;i<str1.length;i++)
	{	
		if ((str1.charAt(i)!="\r")&&(str1.charAt(i)!="\n")&&(str1.charAt(i)!=" ")) 
		{ 
			str2=str2+str1.charAt(i);		
		}
		
	}
	if (str2=="")
	{
		if (str!=""){
	alert(str)
	object.focus();
		object.value=""
		}
	return false;	
	}

	return true;
}
//****************************************************************************

function checkExtension(ext,filepath)
{
	if ((ext!="")&&(filepath !="")&&(filepath.indexOf(".")!=-1))
	{
		i=filepath.lastIndexOf(".")
			str=filepath.substring(i)
		if( str.toUpperCase()==ext.toUpperCase()) return true;
	}
	return false;
}


//****************************************************************************
function formcheck(theform)
{
if (!empty(theform.DocumentName,"Please enter Document Name.")) return false;
//if (!empty(theform.FiletoUpload,"Please enter Document File Name.")) return false;

filepath=theform.FiletoUpload.value
ext1=".doc"
ext2=".pdf"
ext3=".ppt"
if (empty(theform.FiletoUpload,""))
{
if ((!checkExtension(ext1,filepath))&&(!checkExtension(ext2,filepath))&&(!checkExtension(ext3,filepath)))
{
	alert("Please upload only word or pdf or ppt file.")
	theform.FiletoUpload.focus();
	theform.FiletoUpload.select();

return false;
}
}
//return false;
return true;
}
//****************************************************************************
//-->
</script>
        <cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
        SELECT DocumentName,DocumentUploadedFileName FROM PugDocumentdetail where 
        DocumentId=#DocumentId# 
        </cfquery>
        <cfset totaldocument=#documentqry.recordcount#>
        <cfif totaldocument neq 0>
        <cfoutput query = "documentqry" > 
          <form action='#CGI.SCRIPT_Name#' method="POST"   name="Form1" enctype="multipart/form-data" onSubmit="return formcheck(this)">
            <table width="450"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
              <tr > 
                <td colspan="2" > <font face='verdana' size='2'>Document Name 
                  :<b>#DocumentName#</b></font> </td>
              </tr>
              <tr bgcolor="##445999"> 
                <td colspan="2" align="center"> <b><font face="verdana" size="2" color="##FFFFFF">Edit 
                  Document</font> </b></td>
              </tr>
              <tr bgcolor="##f2f2f2"> 
                <td align="right" width="199"> <font face="Arial, Helvetica, sans-serif" size="2">Document 
                  Name :</font></td>
                <td width="240"> <font face="Arial, Helvetica, sans-serif" size="2"> 
                  <input type="text"      name="DocumentName" value="#trim(DocumentName)#">
                  </font></td>
              </tr>
              <tr bgcolor="##f2f2f2"> 
                <td align="right" width="199"> <font face="Arial, Helvetica, sans-serif" size="2">Document 
                  File Name: <br>
                  <a href="Upload/documents/#DocumentUploadedFileName#" target="_blank">#DocumentUploadedFileName#</a> 
                  </font></td>
                <td width="240"> <font face="Arial, Helvetica, sans-serif" size="2"> 
                  <input type="file"      name="FiletoUpload" >
                  </font></td>
              </tr>
              <tr bgcolor="##f2f2f2"> 
                <td align="right" colspan="2"> 
                  <center>
                    <font face="Arial, Helvetica, sans-serif" size="2"> 
                    <input type="submit" value="Submit" name="submit">
                    <input type="hidden" value="edt" name="flg">
                    <input type="hidden" value="#DocumentName#" name="DocumentName_old">
                    <input type="hidden" value="#DocumentId#" name="DocumentId">
                    </font> 
                  </center>
                </td>
              </tr>
            </table>
          </form>
          <script language="Javascript">
<!--
document.forms[0].elements[0].focus();

//-->
</script>
        </cfoutput> 
        </cfif>
        <p>&nbsp;</p>
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
