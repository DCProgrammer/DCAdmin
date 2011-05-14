<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfquery name="getOrgs" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, Contact, Addr1, City, State, Zip, Organizati
from Organiza
where Organizati in (<cfloop index=st list=#Org#>"#st#",</cfloop>"placeholder")
</cfquery>

Org,Name,Contact,Addr1,City,State,Zip<br>
<cfoutput query="getOrgs">
#Organizati#,"#Name#",#Contact#,"#Addr1#",#City#,#State#,#Zip#<br>
</cfoutput>


</body>
</html>
