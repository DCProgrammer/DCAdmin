<html>
<head>
<title>Timesheet</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfif not isDefined("name")>
<cfset name="">
</cfif>

<cfif not isDefined("timeperiod")>
<cfset timeperiod="">
</cfif>

<form method=post action="timesheet.cfm">
<cfquery name="getName" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT personName from toDoPeople
</cfquery>
<cfquery name="getTimes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
select DISTINCT 
startDate=
DateAdd(ms,-datepart(ms,begin_time),
DateAdd(s,-datepart(s,begin_time),
DateAdd(mi,-datepart(mi,begin_time),
DateAdd(hh,-datepart(hh,begin_time),
DateAdd(dd,1-datepart(dw,begin_time),begin_time))))),
endDate=DateAdd(ms,-datepart(ms,begin_time),
DateAdd(s,-datepart(s,begin_time),
DateAdd(mi,-datepart(mi,begin_time),
DateAdd(hh,-datepart(hh,begin_time),
DateAdd(dd,8-datepart(dw,begin_time),begin_time)))))
from toDoTimes
</cfquery>
<select name=name>
<cfoutput query="getName">
<option value="#personName#" <cfif name is personName>selected</cfif>>#personName#</option>
</cfoutput>
</select>
<select name=timeperiod>
<cfoutput query="getTimes">
<option value="#startDate#" <cfif timeperiod is startDate>selected</cfif>>#DateFormat(StartDate)# - #DateFormat(EndDate)#</option>
</cfoutput>
</select>
<input type=hidden name=go value=1>
<input type=submit value="Get Time Sheet">
</form>

<cfif isDefined("go")>
<cfquery name="getTimeSheet" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT day=datepart(dw,begin_time),date=DateAdd(ms,-datepart(ms,begin_time),
DateAdd(s,-datepart(s,begin_time),
DateAdd(mi,-datepart(mi,begin_time),
DateAdd(hh,-datepart(hh,begin_time),
begin_time))))
from toDoTimes
</cfquery>
<table border=1>
<cfloop query="getTimeSheet">
<cfif datediff('d',timeperiod,date) gte 0 and datediff('d',timeperiod,date) lt 7>
<tr><td valign=center>
<cfoutput><cfswitch expression="#day#">
<cfcase value="1">Sunday</cfcase>
<cfcase value="2">Monday</cfcase>
<cfcase value="3">Tuesday</cfcase>
<cfcase value="4">Wednesday</cfcase>
<cfcase value="5">Thursday</cfcase>
<cfcase value="6">Friday</cfcase>
<cfcase value="7">Saturday</cfcase>
</cfswitch> #DateFormat(date)#</cfoutput>
</td>
<td><cfquery name="getInfo" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT begin_time,end_time,Name,Narrative,hours=(datediff(mi,Begin_time,IsNull(End_time,getdate()))/60),
minutes=datediff(mi,Begin_time,IsNull(End_time,getdate()))-((datediff(mi,Begin_time,IsNull(End_time,getdate()))/60)*60) 
from toDoTimes A, toDoList B
where A.ID=B.ID
and datediff(dd,"#date#",begin_time)=0
and Person="#name#"
order by begin_time
</cfquery>
<cfset totalhours=0>
<cfset totalminutes=0>
<cfoutput query="getInfo">
<cfset Myminutes=minutes+1>
<cfset totalhours=totalhours+hours>
<cfset totalminutes=totalminutes+Myminutes>
#TimeFormat(begin_time)#-#TimeFormat(end_time)#(<b>#Name#</b>) #Narrative# (#hours# hours, #Myminutes# minutes)<br>
</cfoutput>
</td>
<cfset totalHours=totalHours+totalMinutes/60>
<cfset totalMinutes=totalMinutes-((totalMinutes/60)*60)>
<cfoutput>
<td valign=center>#totalHours# hours</td>
</cfoutput>
</tr>
</cfif>
</cfloop>
</table>
</cfif>


</body>
</html>
