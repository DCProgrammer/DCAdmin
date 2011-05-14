<cfinclude template = "pug_conn.cfm">

<cfparam name="flg" default=''>
<cfparam name="msg" default=''>
<cfparam name="DocumentName" default=''>

<cfset CurrentPagePath = ExpandPath("*.*")>

<cfset documentPath = GetDirectoryFromPath(CurrentPagePath) & "Upload\Documents">
	
<!-- Code to upload the car dealers text file.	-->
<cfif flg eq 'add'>

 <CFFILE ACTION="UPLOAD"  DESTINATION=#documentPath# FILEFIELD="FiletoUpload" NAMECONFLICT="OVERWRITE">
 <cfset UploadedFileName=cffile.serverfilename>
<cfoutput><br>#UploadedFileName# is uploaded</cfoutput>

<cflocation url = "pug_parseCarDeals.cfm?documentPath=#documentPath#&UploadedFileName=#UploadedFileName#" addToken = "No"> 

</cfif>
<!-- ENDS the Code to upload the car dealers text file.	-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Upload Car Dealers File </title>
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

if (!empty(theform.FiletoUpload,"Please enter Document File Name.")) return false;

filepath=theform.FiletoUpload.value
ext1=".txt"
if ((!checkExtension(ext1,filepath)))
{
	alert("Please upload only text file.")
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
                a new car dealers file browse and locate the file on your system to add the file 
                to the server. 
		</font></p>
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
                Car Dealers File</b></font> </td>
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
