<cfinclude template = "pug_conn.cfm">

<cfparam name="flg" default=''>
<cfparam name="msg" default=''>
<cfparam name="DocumentName" default=''>

<cfif flg eq 'add'>
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
<cfparam name="DocumentType" default=''>
<cfparam name="i" default=0>
<cfparam name="j" default=0>
<!---------------------->
<cfset CurrentPagePath = ExpandPath("*.*")>
<!---	<cfset DirectoryDeleteFolderPath = GetDirectoryFromPath(CurrentPagePath) & "Delete">--->
<cfset DocumentUploadedFilePath = GetDirectoryFromPath(CurrentPagePath) & "Upload\Documents">
<!---------------------->
<cffile action="upload"    destination="#DocumentUploadedFilePath#"    nameConflict="MakeUnique"    fileField="Form.FiletoUpload">
		<cfset DocumentUploadedFileName=cffile.serverfile>
		<cfset j=Find(" ",DocumentUploadedFileName)>
 
 <cfif j gt 0 >
	<cfset DocumentUploadedFileNameNew=replace(DocumentUploadedFileName," ","_","all")>
	<cffile action = "rename"  source = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#" 
  destination = "#DocumentUploadedFilePath#\#DocumentUploadedFileNameNew#">
    <cfset DocumentUploadedFileName=DocumentUploadedFileNameNew>	
 </cfif>

		<cfset i=Find(".",DocumentUploadedFileName)>
		<cfset filenameWithoutExt=left(DocumentUploadedFileName,i-1)>
		<!---<cfset filenameWithoutExt=cffile.clientFileName>--->
		<cfset filetype=cffile.contentType>	
		<cfset filesubtype=cffile.contentSubType>
		<cfset filemimetype=filetype &"/"& filesubtype>	
<!---------------------->
<cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
    SELECT DocumentId FROM PugDocumentdetail where DocumentName='#trim(DocumentName)#'
  </cfquery>    
  <cfset totalcount=#documentqry.recordcount#>	
<cfif totalcount neq 0>
	<cfset msg="Document '"& DocumentName &"' is already available.">
	<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#">
</cfif>
<!---------------------->
<!---
<cfoutput>#filemimetype#</cfoutput>
<cfif filemimetype neq "text/html" and filemimetype neq "application/octet-stream">
--->
<!----------------------> 
<cfif msg eq "" >
 <cfif filemimetype neq  "application/msword" and filemimetype neq  "application/pdf" and filemimetype neq  "application/x-mspowerpoint">
	<cfset msg="Please upload only word or PDF or PowerPoint file.">
	<cffile action = "delete"  file = "#DocumentUploadedFilePath#\#DocumentUploadedFileName#">
 </cfif>
</cfif>
<!---------------------->
<cfif msg eq "" >
	<cfset filesize=cffile.filesize>			
	<cfif filesize eq 0>
		<cfset msg="Please donot upload empty file">
	</cfif>
</cfif>
<!---------------------->

	
<cfif msg eq "" >
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
	</cfif><!---	<cfif filemimetype eq  "application/msword">	
--->

	<cfif filemimetype eq  "application/pdf">
		<cfset DocumentConvertedFileName="#DocumentUploadedFileName#">
		<cfset DocumentType='pdf'>
	</cfif>
	
	<cfif filemimetype eq  "application/x-mspowerpoint">
		<cfset DocumentConvertedFileName="#DocumentUploadedFileName#">
		<cfset DocumentType='ppt'>
	</cfif>


<!---<cfset conversionobject=nothing>--->
<cfquery name="insert" datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#" >
INSERT INTO PugDocumentdetail(DocumentName,DocumentConvertedFileName,DocumentUploadedFileName,filenameWithoutExt,DocumentType) values('#trim(DocumentName)#','#DocumentConvertedFileName#','#DocumentUploadedFileName#','#filenameWithoutExt#','#DocumentType#')
</cfquery>

 <cflocation url = "manage_documents.cfm?flg=add" addToken = "No"> 
</cfif>
<!--------------------------------------------------------->
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
      <td bgcolor="#FFFFFF" align="center"> 
        <center>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p><font face="verdana" size="2"><b><cfoutput>#msg#</cfoutput></b></font> 
          </p>
        </center>
        <p> 
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
if (!empty(theform.FiletoUpload,"Please enter Document File Name.")) return false;

filepath=theform.FiletoUpload.value
ext1=".doc"
ext2=".pdf"
ext3=".ppt"
if ((!checkExtension(ext1,filepath))&&(!checkExtension(ext2,filepath))&&(!checkExtension(ext3,filepath)))
{
	alert("Please upload only word or pdf or ppt file.")
	theform.FiletoUpload.focus();
	theform.FiletoUpload.select();

return false;
}
//return false;
return true;
}
//****************************************************************************
//-->
</script>
        </p>
        <blockquote> 
          <blockquote> 
            <blockquote>
              <p><font face="Arial, Helvetica, sans-serif" size="2">To upload 
                a new document template, define a name for your document and then 
                browse and locate the template on your system to add the document 
                template. Please ensure your document template has all the relevant variable 
                tags. See help for more details.</font></p>
            </blockquote>
          </blockquote>
        </blockquote>
        <form action='<cfoutput>#CGI.SCRIPT_Name#</cfoutput>' method="POST"   name="Form1" enctype="multipart/form-data" onSubmit="return formcheck(this)">
          <table width="450"
       border="0"
       cellspacing="1"
       cellpadding="2"
       align="center">
            <tr bgcolor="#445999" align="center"> 
              <td colspan="2" height="22"> <font face="Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Upload 
                Document</b></font> </td>
            </tr>
            <tr> 
              <td align="right" bgcolor="#f2f2f2" width="199"> <font face="Arial, Helvetica, sans-serif" size="2">Document 
                Name :</font></td>
              <td bgcolor="#f2f2f2" width="240"> <font face="Arial, Helvetica, sans-serif" size="2"> 
                <input type="text"      name="DocumentName" value="<cfoutput>#DocumentName#</cfoutput>">
                </font></td>
            </tr>
            <tr> 
              <td align="right" bgcolor="#f2f2f2" width="199"> <font face="Arial, Helvetica, sans-serif" size="2">Document 
                File Name:</font></td>
              <td bgcolor="#f2f2f2" width="240"> <font face="Arial, Helvetica, sans-serif" size="2"> 
                <input type="file"      name="FiletoUpload" >
                </font></td>
            </tr>
            <tr> 
              <td align="right" colspan="2" bgcolor="#f2f2f2"> 
                <center>
                  <font face="Arial, Helvetica, sans-serif" size="2"> 
                  <input type="submit" value="Submit" name="submit">
                  <input type="hidden" value="add" name="flg">
                  </font> 
                </center>
              </td>
            </tr>
          </table>
        </form>
        <p> 
          <script language="Javascript">
<!--
document.forms[0].elements[0].focus();

//-->
</script>
        </p>
        <p>&nbsp; </p>
        <p>&nbsp; </p>
      </td>
    </tr>
  </table>
</center>
<cfinclude template = "bottom.cfm">
</body>
</html>
