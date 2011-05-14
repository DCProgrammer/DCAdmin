<cfinclude template = "pug_conn.cfm">

<cfparam name="documentPath" default=''>
<cfparam name="UploadedFileName" default=''>

<cfset filePath="#documentPath#\#UploadedFileName#.txt">

<cffile action="read" FILE=#filePath# variable="cardata">
<!--<cfoutput> #cardata#</cfoutput>-->
<cfparam name="dbyear" default=''>
<cfparam name="make" default=''>
<cfparam name="model" default=''>
<cfparam name="LimitsDescription" default=''>
<cfparam name="Description1" default=''>
<cfparam name="EffectiveDate" default=''>

<CFQUERY  NAME = "deletedata" 
		datasource="#Application.MainDB#"  
		username="#Application.DBUser#" 
		password="#Application.DBPwd#">
		delete from NewRebates
</cfquery>

<cfset findstr =Chr(13)>
<cfset aa  = ListToArray(#cardata#, #findstr#)>
<cfset strlen = ArrayLen(aa)>

<CFLOOP FROM = "1" TO = #strlen# INDEX = "i">
	<cfset findPipe ="|" >
	<cfset arrpipe  = ListToArray(aa[i], findPipe) >
	<cfoutput>#isArray(arrpipe)#</cfoutput>
	<cfoutput>#ArrayLen(arrpipe)#</cfoutput>
	
	<cfset Description1=arrpipe[2]>
	<cfset EffectiveDate = arrpipe[3]>
	<cfset bigstr = trim(arrpipe[1])>

	<cfset yearindex = find("'",bigstr)>
	<cfif yearindex neq 0>

		<cfset firstpart = left(bigstr, yearindex-1) >
		<cfset dbyear = mid(bigstr , yearindex+1, 2)>
		<!--<cfoutput>#firstpart# <br></cfoutput>-->
		
		<cfparam name="rightpick" default=0>
		<cfset yearindexTwo = yearindex + 2>
		
		<cfset rightpick = len(bigstr) - yearindexTwo>
		<!--<cfoutput>#bigstr# -- #len(bigstr)# -- #yearindexTwo#Somi<br></cfoutput>
			<cfoutput>#rightpick# Somi<br></cfoutput>
		-->
		<cfif rightpick neq 0 >
			<cfset bb = right(bigstr , rightpick)>
			<cfoutput> #bb# <br>
			</cfoutput>
			<cfif bb neq '' >
				<cfset LimitsDescription= bb>
			</cfif>
		</cfif>
		<cfset makeindex = find(' ', firstpart)>
		<cfif makeindex neq 0>
			<cfset make = mid(firstpart, 1,makeindex)>
			<cfset model = right(firstpart, (len(firstpart) - makeindex))> 
		</cfif>

		<cfoutput> 
			year = #dbyear#
			<br>
			make = #make#
			<br>
			model = #model#
			<br>
			LimitsDescription = #LimitsDescription# <br>
			Description1 = #Description1# <br>
			EffectiveDate = #EffectiveDate# <br>
			<br>
		</cfoutput>
		<CFQUERY  NAME = "insertdata" 
			datasource="#Application.MainDB#"  
			username="#Application.DBUser#" 
			password="#Application.DBPwd#">
			insert into NewRebates (Year, Make, Model, LimitsDescription, Description1, EffectiveDate)
				values ( '20#dbyear#', '#make#', '#model#', '#LimitsDescription#', '#Description1#', '#EffectiveDate#')
		</cfquery>
		<cfoutput> #aa[i]# Done<br><hr></cfoutput>

	<cfelse>
		<cfoutput> Please upload the text file with only the correct and formatted data.</cfoutput>
	</cfif>

</cfloop>
<!--<cflocation url = "pug_ViewCarDeals.cfm" addToken = "No"> 	-->

	

