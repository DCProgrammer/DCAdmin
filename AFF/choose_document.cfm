<cfinclude template = "pug_conn.cfm">
<cfparam name="flg" default=''>
<cfparam name="msg" default=''>
<cfparam name="AffiliateName" default=''>
<cfparam name="strDocumentId" default=''>
<cfparam name="DocumentUploadedFileName" default=''>
<cfparam name="filenameWithoutExt" default=''>
<cfparam name="DocumentConvertedFileName" default=''>
<cfparam name="DocumentType" default=''>
<cfparam name="Servername" default=''>
<cfparam name="logotag" default=''>
<cfparam name="count" default=0>
<cfparam name="DeleteDirectoryPath" default=''>
<cfparam name="ImagePath" default=''>
<cfparam name="AssettSize" default=''>
<cfparam name="totaldocument" default=0>
<cfparam name="assett" default=0>
<cfparam name="strDeleteFileName" default=''>
<cfparam name="logoImage" default=''>
<cfparam name="LogoImagePath" default=''>
<cfparam name="name" default=''>
<cfparam name="amount" default=0>

<cfif flg eq 'add' >
	<cfset msg="">
<CFIF IsDefined("form.ID") is True>
		<cfset msg="Please select an affiliate.">
</cfif>

<cfif msg eq ''>
<CFIF IsDefined("form.strDocumentId") is True>
		<cfset msg="Please select at least one document.">
</cfif>
</cfif>


<cfif msg eq ''>
<cfset Servername=CGI.server_name &":"&CGI.SERVER_PORT>
<!----------------------------------->  
<cfset CurrentPagePath = ExpandPath("*.*")>
<cfset LogoImagePath = ExpandPath("..\..\*.*")>

<cfset DirectoryUploadFolderPath = GetDirectoryFromPath(CurrentPagePath) & "Upload\documents">
<cfset directoryname="Directory_#ID#">
<cfset DirectoryPath = GetDirectoryFromPath(CurrentPagePath) & "Upload\#directoryname#">
<cfset DeleteDirectoryPath = GetDirectoryFromPath(CurrentPagePath) & "Delete\">
<!---
<cfoutput>#CurrentPagePath#</cfoutput>
<br>

<cfset ImagePath = GetDirectoryFromPath(CurrentPagePath) & "upload\logos\image001.jpg">
--->
<cfset ImagePath = GetDirectoryFromPath(LogoImagePath) & "dc\CAReports\CAReports-09-00\images\headers\">

<!---
<cfoutput>#ImagePath#</cfoutput>
<cfabort>

<cfset ImagePath="c:\digitalcars\DC\CAReports\CAReports-09-00\Images\Headers\">
<cfoutput>#ImagePath#</cfoutput>

--->
<!----------------------------------->  
<cfif not DirectoryExists(#DirectoryPath#)>  
<cfdirectory action = "create"  directory = "#DirectoryPath#"  > 
</cfif>
<!----------------------------------->
<cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#"  >
    SELECT * FROM PugDocumentdetail where DocumentId in (#strDocumentId#)
 </cfquery> 
<!----------------------------------->
<cfoutput query = "documentqry" >       

<!----------------------------------->
<cfquery name="nameqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#"  >
   
	SELECT ID,Name,Assett_Size,Password,BannerName FROM Affiliate_Table where id=#ID#

		<!---
	SELECT ID,Name,Assett_Size,Password,BannerName FROM pug_Affliates where id=#ID#
	--->
</cfquery> 
<!---
#nameqry.Name# <br>
#nameqry.Assett_Size# --2233
--->
<cfset AssettSize=trim(nameqry.Assett_Size)>
<cfset name=trim(nameqry.Name)>
<cfset logoImage=trim(nameqry.BannerName)>
<cfif logoImage eq "">
<cfset logoImage="head.gif">
</cfif>
<!----------------------------------->
<cfif AssettSize neq "">
<cfset AssettSize=replace(AssettSize,",","","all")>
<cfelse>
<cfset AssettSize="0">
</cfif>
<cfif AssettSize gte 0 and  AssettSize lte 50000000>
<cfset assett=45.00>
<cfelseif AssettSize gte 51000000 and  AssettSize lte 100000000>
<cfset assett=40.00>
<cfelseif AssettSize gte 101000000 and  AssettSize lte 150000000>
<cfset assett=35.00>
<cfelseif AssettSize gt 150000000 >
<cfset assett=25.00>
</cfif>
<!----------------------------------->

<cfif DocumentType eq 'word'>
<cffile action="read" file="#DirectoryUploadFolderPath#\#DocumentConvertedFileName#" variable="filedata">
<!--- for replacing varaibles--->
<!---<cfset filedata=replace(filedata,"<head>","<head><base  href='http://"&Servername&"/dcadmin/aff/upload/documents/'>")>--->
<cfset filedata=replace(filedata,"<head>","<head><base  href='http://"&Servername&"/aff/upload/documents/'>")>



<cfset filedata=ReplaceNoCase(filedata,"##name##",#Name#,"all")>
<cfset filedata=ReplaceNoCase(filedata,"##assett_size##",#assett#,"all")>
<cfset filedata=ReplaceNoCase(filedata,"##current_date##",#DateFormat(Now(),"mm/dd/yyyy")#,"all")>
<!---
<cfset logotag="<img src='http://"&Servername&"/dc/CAReports/CAReports-09-00/images/headers/" & logoImage &"'>">
--->
<!---<cfset logotag="<img src='http://"&Servername&"/dcadminlogo/CAReports/CAReports-09-00/images/headers/" & logoImage &"'>">--->
<cfset logotag="<img src='http://www.careports.com/images/headers/" & logoImage &"'>">

<cfset filedata=ReplaceNoCase(filedata,"##companylogo##","#logotag#","all")>
<cffile action = "write"  file="#DirectoryPath#\#DocumentUploadedFileName#"  output = "#filedata#">
</cfif>
<!----------------------------------->
<cfif DocumentType eq 'pdf'>
<cffile action="copy" source="#DirectoryUploadFolderPath#\#DocumentConvertedFileName#" destination = "#DirectoryPath#\">
</cfif>
<!----------------------------------->
<cfif DocumentType eq 'ppt'>
<!--------
<cffile action="copy" source="#DirectoryUploadFolderPath#\#DocumentConvertedFileName#" destination = "#DirectoryPath#\">
#ImagePath#<br>
#logoImage#
<cfabort>
#DirectoryPath#\#DocumentUploadedFileName#
<br>
#DeleteDirectoryPath#
<br>
#ImagePath#
<cfabort>
<cfset ImagePath=#ImagePath# & "affID029.gif">
<cfif not FileExists("#trim(ImagePath)#")>
exists
<cfelse>
<br>Not Exists<br>
</cfif>
<cfabort>
------------->
<cfset ImagePath=#ImagePath# & #logoImage#>

<cfif  FileExists("#DirectoryUploadFolderPath#\#trim(DocumentConvertedFileName)#")>
<!---
<cfobject action = "Create"  type = "COM"  class = "PowerPointInsertLogoObj.InsertLogoAndID"  name = "pptSlide1">
--->
<cfobject action = "Create"  type = "COM"  class = "LogoNameAmntObj1.LogoNameAmntID1"  name = "pptSlide1">
<cfset pptSlide1.FileAbsPath="#DirectoryUploadFolderPath#\#DocumentConvertedFileName#">
<cfset pptSlide1.SaveAsFileAbsPath ="#DirectoryPath#\#DocumentUploadedFileName#">
<cfset pptSlide1.SaveAsDeleteFolderAbsPath ="#DeleteDirectoryPath#">
<cfset pptSlide1.ImageAbsPath ="#trim(ImagePath)#">
<cfset pptSlide1.ImageDistanceFromBottom = 15>
<cfset pptSlide1.ImageDistanceFromRight = 10>
<cfset pptSlide1.ImageHeight = 45>
<cfset pptSlide1.ImageWidth = 150>
<cfset pptSlide1.ID = #ID#>
<cfset pptSlide1.Name = #name#>
<cfset pptSlide1.amount = #assett#>
<cfset pptSlide1.AddLogo()>
</cfif>
<!---<cfif  FileExists("#DirectoryUploadFolderPath#\#trim(DocumentConvertedFileName)#")>
--->


<!---
<cfset strDeleteFileName = pptSlide1.DeleteFileName>
<cfif fileExists("#DeleteDirectoryPath#\#strDeleteFileName#")>
<cffile action = "delete"  file = "#DeleteDirectoryPath#\#strDeleteFileName#">
</cfif>
--->
</cfif>
<!----------------------------------->

</cfoutput>
<!----------------------------------->
<cfif DirectoryExists("#DeleteDirectoryPath#")>
	<cfdirectory action = "list"  name="directoryList" directory = "#DeleteDirectoryPath#">
	<cfoutput query="directoryList" startRow = "3">
		<!---<cfif fileExists("#DeleteDirectoryPath#\#directoryList.name#")>--->		
		<cffile action = "delete"  file = "#DeleteDirectoryPath##directoryList.name#">
		<!---</cfif>--->
	</cfoutput>
</cfif>
<!----------------------------------->

 <cflocation url = "download_document.cfm?ID=#ID#&AffiliateName=#URLEncodedFormat(AffiliateName)#" addToken = "No"> 

</cfif><!---<cfif msg eq ''>--->

<cfabort><!---<cfif flg eq 'add' >--->

</cfif>


<html>
<head>
<title>Choose Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function selectbox(object,str,val)
{
var value=object.options[object.selectedIndex].value
	if (value==val)
	{
		alert(str);
		object.focus();
		return false;
	}else return true;
}

//****************************************************************************
function formcheck(theform)
{
object=theform.ID;
str="Please select an affiliate."
val=""
if (!selectbox(object,str,val)) return false;
flg=true
if(theform.totaldocument.value==1)
{
	val=""
str=""

	val=theform.DocumentId.value
	if(theform.DocumentId.checked) 
	{	
	str=str + val + ","
	flg=false
	}	
}
else
{
	len=theform.DocumentId.length
	val=""
	str=""

	for(k=0;k<len;k++)
	{
		
		if(theform.DocumentId[k].checked) 
		{	
			val=theform.DocumentId[k].value
		str=str + val + ","
		flg=false
		}	
	}

}

if(str!="")
{
	str1=""
	for(k=0;k<(str.length-1);k++)
	{
		str1=str1 + str.charAt(k)
	}
	str=str1

}
if(flg)
{
alert("Please select at least one document.")
return false;
}
theform.strDocumentId.value=str
name=theform.ID.options[theform.ID.selectedIndex].text
theform.AffiliateName.value=name

return true;
}
//****************************************************************************
//-->
</script>
<body bgcolor="#f2f2f2" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<cfinclude template = "top.cfm">
<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <form name="form1"  action="<cfoutput>#CGI.SCRIPT_Name#</cfoutput>" onSubmit="return formcheck(this)">
        
        <center>
         
          <font face="verdana" size="2"><b><cfoutput>#msg#</cfoutput></b></font> 
        </center>
        <blockquote> 
          <blockquote> 
            <blockquote>
              <p> 
                <center>
                  <font size="2" face="Arial, Helvetica, sans-serif">All documents 
                  for the presentation are available here. Please select the name 
                  of the affiliate you wish to generate the documents for select 
                  the documents you require and click the &quot;Generate&quot; button 
                  to generate your final documents.</font> 
                </center>
              </p>
            </blockquote>
          </blockquote>
        </blockquote>
        <br>
        <table width="500" border="0" cellspacing="1" cellpadding="2" align="center">
          <tr bgcolor="#445999" align="center"> 
            <td colspan="2"> <font face='verdana' size='2'><b><font color="#FFFFFF">Choose 
              Document</font></b></font> </td>
          </tr>
          <cfquery name="nameqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#"  >
          SELECT ID,Name FROM Affiliate_Table where state='#form.State#' 
          <!---
		  SELECT ID,Name FROM pug_Affliates
		  --->
          </cfquery>
          <tr align="center" bgcolor="#f2f2f2"> 
            <td height="2" colspan="2" bgcolor="#f2f2f2"><font face='arial' size='2'>Note 
              Current State Output is <strong><cfoutput>#Form.State#</cfoutput></strong> - Consult 
              IT for Change</font> </td>
          </tr>
          <tr bgcolor="#f2f2f2"> 
            <td bgcolor="#f2f2f2" align="right" width="177" height="2"><font face='arial' size='2'>Choose 
              Affiliate Name:</font></td>
            <td width="262" height="2"> <select name="ID">
                <option value=''>select</option>
                <cfoutput query = "nameqry" > 
                  <option value='#nameqry.ID#'>#nameqry.name#</option>
                </cfoutput> </select> </td>
          </tr>
          <tr bgcolor="#f2f2f2"> 
            <td bgcolor="#f2f2f2" align="right" width="177" height="86" valign="top"><font face='arial' size='2'>Select 
              Document (s)</font> </td>
            <td width="262" height="86"> <table width="230" border="0" cellspacing="0" cellpadding="0">
                <cfquery name="documentqry"  datasource="#Application.MainDB#"   username="#Application.DBUser#"  password="#Application.DBPwd#"  >
                SELECT DocumentId,DocumentName FROM PugDocumentdetail 
                </cfquery>
                <cfset totaldocument=#documentqry.recordcount#>
                <cfif totaldocument eq 0>
                  <tr> 
                    <td ><font face='arial' size='2'>There are no document available. 
                      </font></td>
                  </tr>
                  <cfelse>
                  <cfset i=0>
                  <cfoutput query = "documentqry" > 
                    <tr> 
                      <td width="31"> <input type="checkbox" name="DocumentId" value="#DocumentId#"> 
                      </td>
                      <td width="199"><font face='arial' size='2'>#DocumentName# </font></td>
                    </tr>
                    <cfset i=i+1>
                  </cfoutput> 
                </cfif>
              </table></td>
          </tr>
          <tr bgcolor="#f2f2f2"> 
            <td  height="23" bgcolor="#f2f2f2" colspan="2" align="center"> <input type="submit" name="generate" value="Generate"> 
              <input type="hidden" value="add" name="flg"> <input type="hidden" value="<cfoutput>#totaldocument#</cfoutput>" name="totaldocument"> 
              <input type="hidden" value="" name="strDocumentId"> <input type="hidden" value="" name="AffiliateName"> 
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </form>
    </td>
  </tr>
</table>
<cfinclude template = "bottom.cfm">
</body>
</html>
