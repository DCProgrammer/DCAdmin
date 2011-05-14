<cfif isDefined("selectOrgs")>
	<cfif isDefined("Fax")>
		Fax,Name,LinkCode,Contact,Addr1,City,State,Zip,Phone<br>
		<cfloop list="#Org#" index="OrgIndex">
			<cfquery name="getStateFile" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
			SELECT Fax=Fax_1Phone,Name,Contact,Addr1,City,State,Zip,LinkCode=Organizati,B_Phone
			from Organiza
			where Organizati="#OrgIndex#"	
			</cfquery>
			<cfoutput query="getStateFile">
				<cfif Trim(Fax) is not "">#Fax#,#Name#,#LinkCode#,#Contact#,#Addr1#,#City#,#State#,#Zip#,#B_Phone#<br></cfif>
			</cfoutput>
		</cfloop>
		<cfabort>
	</cfif>
	<cfif isDefined("Email")>
		Email,Company Name,Custom field 1,First Name,Address,City,State,Zip/Postal Code,Work Phone<br>
		<cfloop list="#Org#" index="OrgIndex">
			<cfquery name="getStateFile" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
			SELECT Fax=Fax_1Phone, Email,ContactEmail, Name, Contact, Addr1, City, State, Zip, LinkCode=Organizati, B_Phone
			from Organiza A,OrgsAddit C
			where A.Organizati*=C.Org
			and Organizati="#OrgIndex#"
			</cfquery>
			<cfoutput query="getStateFile">
				<cfif Trim(ContactEmail) is not "">
				"#ContactEmail#","#Name#","#LinkCode#","#Contact#","#Addr1#","#City#","#State#","#Zip#","#B_Phone#"<br>
				<cfelse>
				<cfif Trim(Email) is not "">
					"#Email#","#Name#","#LinkCode#","#Contact#","#Addr1#","#City#","#State#","#Zip#","#B_Phone#"<br>
				</cfif>
				</cfif>
			</cfoutput>
		</cfloop>
		<cfabort>
	</cfif>
	<cfif isDefined("Move")>
		<cfif isDefined("Org")>
		<cfoutput>Moving Org(s): #Org#<br>  Move is #Move#<br></cfoutput>
		</cfif>
		<cfloop list="#Org#" index="OrgIndex">
			<cfif Move is "Toggle">
				<cfquery name="getType" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
				SELECT Type from OrgType where Org="#OrgIndex#"
				</cfquery>
				<cfquery name="MoveOrg" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
				UPDATE OrgType
				set Type=<cfif getType.Type is not "Financial">"Financial"<cfelse>"Normal"</cfif>
				where Org="#OrgIndex#"
				</cfquery>
			<cfelse>
				<cfquery name="MoveOrg" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
				UPDATE OrgType
				set Type=<cfif Move is "ToFinancial">"Financial"<cfelse>"Normal"</cfif>
				where Org="#OrgIndex#"
				</cfquery>
			</cfif>
		</cfloop>
	</cfif>
</cfif>
<cfif isDefined("doList")>
Fax,Name,LinkCode,Contact,Addr1,City,State,Zip,Phone<br>
<cfloop list="#byState#" index="StateIndex">
<cfquery name="getStateFile" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
SELECT Fax=Fax_1Phone, Name, Contact,Addr1, City, State, Zip, LinkCode=Organizati, Type,B_Phone
from Organiza A, OrgType B
where Organizati=Org
and State="#Mid(StateIndex,1,2)#"
<cfif Len(StateIndex) gt 2>
	<cfif "ESM" is Right(StateIndex,Len(StateIndex)-2)>
		and Organizati LIKE "%B"
		and not Type="Financial"
	</cfif>
	<cfif "Financial" is Right(StateIndex,Len(StateIndex)-2)>
		and Type="Financial"
	</cfif>
<cfelse>
and Organizati NOT LIKE "%B"
and not (Type="Financial")
</cfif>
and Status!="I"
and Organizati not in (SELECT Org from OrgDups)
<cfif isDefined("subset")>
<cfif subset is not "">
AND (Zip LIKE "x" 
<cfloop index=x list=#subset#>
<cfoutput>OR Zip LIKE "#x#%"</cfoutput>
</cfloop>
)
</cfif>
</cfif>
order by Name
</cfquery>
<cfoutput query="getStateFile">
<cf_properCaps name=#Contact#>
<cfset ContactInProperCaps=capped>
<cfif Trim(Fax) is not "">"#Fax#","#Name#","#LinkCode#","#ContactInProperCaps#","#Addr1#","#City#","#State#","#Zip#","#B_Phone#"<br></cfif>
</cfoutput>
</cfloop>
<cfabort>
</cfif>
<cfif isDefined("doEmailList")>
Email,Company Name,Custom field 1,First Name,Address,City,State,Zip/Postal Code,Work Phone<br>
<cfloop list="#byState#" index="StateIndex">
<cfquery name="getStateFile" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
SELECT Fax=Fax_1Phone, Email,ContactEmail, Name, Contact,Addr1, City, State, Zip, LinkCode=Organizati, Type,B_Phone
from Organiza A, OrgType B,OrgsAddit C
where A.Organizati=B.Org
and A.Organizati*=C.Org
and State="#Mid(StateIndex,1,2)#"
<cfif Len(StateIndex) gt 2>
	<cfif "ESM" is Right(StateIndex,Len(StateIndex)-2)>
		and Organizati LIKE "%B"
		and not Type="Financial"
	</cfif>
	<cfif "Financial" is Right(StateIndex,Len(StateIndex)-2)>
		and Type="Financial"
	</cfif>
<cfelse>
and Organizati NOT LIKE "%B"
and not (Type="Financial")
</cfif>
and Status!="I"
and Organizati not in (SELECT Org from OrgDups)
<cfif isDefined("subset")>
<cfif subset is not "">
AND (Zip LIKE "x" 
<cfloop index=x list=#subset#>
<cfoutput>OR Zip LIKE "#x#%"</cfoutput>
</cfloop>
)
</cfif>
</cfif>
order by Name
</cfquery>
<cfoutput query="getStateFile">
<cf_properCaps name=#Contact#>
<cfset ContactInProperCaps=capped>
<cfif Trim(ContactEmail) is not "">
"#ContactEmail#","#Name#","#LinkCode#","#ContactInProperCaps#","#Addr1#","#City#","#State#","#Zip#","#B_Phone#"<br>
<cfelse>
<cfif Trim(Email) is not "">
"#Email#","#Name#","#LinkCode#","#ContactInProperCaps#","#Addr1#","#City#","#State#","#Zip#","#B_Phone#"<br>
</cfif>
</cfif>
</cfoutput>
</cfloop>
<cfabort>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Fax List Manager:<cfif not isDefined("ByState")>Step 1<cfelse>Step 2</cfif> </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<cfif not isdefined("ByState")>
<cfquery name="getStates" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
SELECT DISTINCT State from Organiza
order by State
</cfquery>
</cfif>

<cfif not isDefined("ByState")>
<form method=post action="getOrgsByState.cfm">
<table border=0>
<tr><th>State</th><th>Total Orgs in State</th><th>ESM</th><th>Financial</th><th>Other</th></tr>
<cfloop query="getStates">
<cfquery name="getStateInfo" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
SELECT ID,Name=Name, number=(select count(*) from Organiza where State="#getStates.State#"),
ESM=(select count(*) from Organiza A, OrgType B 
	where Organizati=Org 
	and not (Type="Financial") 
	and State="#getStates.State#" 
	and Organizati LIKE "%B"
and Organizati not in (SELECT Org from OrgDups)
	and Status!="I"),
Financial=(SELECT count(*) from Organiza A, OrgType B 
			where State="#getStates.State#" 
			and Type="Financial" 
			and A.Organizati=B.Org
and Organizati not in (SELECT Org from OrgDups)
			and Status!="I"),
Other=(SElECT count(*) from Organiza A, OrgType B 
		where State="#getStates.State#" 
		and not (Type="Financial") 
		and A.Organizati=B.Org 
		and Organizati not LIKE "%B"
and Organizati not in (SELECT Org from OrgDups)
		and Status!="I")
from StatesByName
where ID="#getStates.State#"
</cfquery>
<cfoutput query="getStateInfo">
<tr>
<td>#Name#</td>
<td>#Number#</td>
<td><input type=checkbox name="ByState" value="#ID#ESM">#ESM#</td>
<td><input type=checkbox name="ByState" value="#ID#Financial">#Financial#</td>
<td><input type=checkbox name="ByState" value="#ID#">#Other#</td>
</tr>
</cfoutput>
</cfloop>
</table>
<input type=submit value="choose Groups">
</form>
<cfelse>
<cfoutput>ByState="#ByState#"</cfoutput>
<form method=post action="getOrgsByState.cfm">
<cfoutput>
<input type=hidden name="byState" value="#ByState#">
Subset list: <input type=text name="subset" size=80 value=<cfif isDefined("Subset")>"#Subset#"<cfelse>""</cfif>
</cfoutput>
</form>
	<form method=post action="getOrgsByState.cfm">
	<cfoutput>
	<input type=hidden name="byState" value="#ByState#">
	</cfoutput>
	<br>
	<cfset total=0>
<cfloop list="#byState#" index="StateIndex">
<cfquery name="getStateFile" username="#Application.DBUser#" password="#Application.DBPwd#" datasource="MainSQL">
SELECT Fax=Fax_1Phone, Name, Contact,Addr1, City, State, Zip, LinkCode=Organizati, Type,B_Phone
from Organiza A, OrgType B
where Organizati=Org
and State="#Mid(StateIndex,1,2)#"
<cfif Len(StateIndex) gt 2>
	<cfif "ESM" is Right(StateIndex,Len(StateIndex)-2)>
		and Organizati LIKE "%B"
		and not Type="Financial"
	</cfif>
	<cfif "Financial" is Right(StateIndex,Len(StateIndex)-2)>
		and Type="Financial"
	</cfif>
<cfelse>
and Organizati NOT LIKE "%B"
and not (Type="Financial")
</cfif>
and Status!="I"
and Organizati not in (SELECT Org from OrgDups)
<cfif isDefined("subset")>
<cfif subset is not "">
AND (Zip LIKE "x" 
<cfloop index=x list=#subset#>
<cfoutput>OR Zip LIKE "#x#%"</cfoutput>
</cfloop>
)
</cfif>
</cfif>
order by Name
</cfquery>
<cfoutput>
Group: #StateIndex#<br>
Records: #getStateFile.recordCount#<br>
<cfset total=total+getStateFile.recordCount>
</cfoutput>
<table border=0>
<tr>
<th>Select</th>
<th>Fax</th>
<th width="25%">Name</th>
<th>LinkCode</th>
<th>Contact</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Zip</th>
<th>Business Phone</th>
</tr>
<cfoutput query="getStateFile">
<cf_properCaps name=#Contact#>
<cfset ContactInProperCaps=capped>
<tr>
<td>
	<input type=checkbox name=Org value="#LinkCode#">
</td>
<td>#Fax#</td>
<td>#Name#</td>
<td>#LinkCode#</td>
<td>#ContactInProperCaps#</td>
<td>#Addr1#</td>
<td>#City#</td>
<td>#State#</td>
<td>#Zip#</td>
<td>#B_Phone#</td>
</tr>
</cfoutput>
</cfloop>
</table>
<cfoutput>Total Records Shown: #total#<br></cfoutput>
<input type=hidden name="selectOrgs"> 
<input type=submit name="Move" value="Move Selected Orgs"><br>
<input type=submit name="Fax" value="Fax List for Selected Orgs"><br>
<input type=submit name="Email" value="Email List for  Selected Orgs"><br>
</form>
<form method=post action="getOrgsByState.cfm">
<input type=hidden name="doList">
<cfoutput>
<input type=hidden name="ByState" value="#ByState#">
<input type=hidden name="subset" value=<cfif isDefined("Subset")>"#Subset#"<cfelse>""</cfif>
</cfoutput>
<input type=submit value="generate Fax List for All Above Orgs">
</form>
<form method=post action="getOrgsByState.cfm">
<cfoutput>
<input type=hidden name="ByState" value="#ByState#">
<input type=hidden name="subset" value=<cfif isDefined("Subset")>"#Subset#"<cfelse>""</cfif>
</cfoutput>
<input type=hidden name="doEmailList">
<input type=submit value="generate Constant Contact Email List for All Above Orgs">
</form>
</cfif>
<form method=post action="getOrgsByState.cfm">
<input type=submit value="Back To State Listing">
</form>
</body>
</html>
