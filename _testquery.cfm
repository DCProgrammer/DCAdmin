<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT    count(*)
	FROM         Members a
		inner join members_nodupe b on a.newmemberid = b.newmemberid
	WHERE (a.State = 'il')
</cfquery>
<cfdump var=#getmembers#>

<cfquery name="getMembers2" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT    count(*)
	FROM         Members
	WHERE (State = 'il')
</cfquery>
<cfdump var=#getmembers2#>

<cfabort>

<!--- clean up members table --->
<cfif false>
	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		update members
		set firstname = rtrim(FirstName),
			LastName = rtrim(LastName),
			Addr1 = rtrim(Addr1),
			City = rtrim(City),
			State = rtrim(State),
			Zip = rtrim(Zip),
			HomePhone = rtrim(HomePhone),
			BPhone = rtrim(BPhone),
			Email = rtrim(Email),
			WorkFax = rtrim(WorkFax),
			Fax = rtrim(Fax),
			CellPhone = rtrim(CellPhone)
	</cfquery>
	<cfabort>
</cfif>

<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT top 100 *
	FROM members_nodupe nd JOIN (
		SELECT firstname, min(newMemberID) AS minid FROM members
		GROUP BY firstname
		HAVING ( COUNT(firstname) > 1 )
	) AS dupmem
	ON nd.firstname = dupmem.firstname
	ORDER BY nd.firstname DESC
</cfquery>

<cfdump var=#getMembers#><cfabort>

<!---
<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
--drop table dbo.members_nodupe


create table dbo.members_nodupe (
FirstName varchar(255),
LastName varchar(255),
Addr1 varchar(255),
City varchar(255),
State varchar(255),
Zip varchar(255),
HomePhone varchar(255),
BPhone varchar(255)
)

</cfquery>

<cfabort>
--->

<!---
<cfquery name="q1" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT     rtrim(FirstName) as firstname, rtrim(LastName) as lastname,
	rtrim(Addr1) as Addr1, rtrim(City) as City, rtrim(State) as State, rtrim(Zip) as Zip,
	rtrim(HomePhone) as HomePhone, rtrim(BPhone) as BPhone
	FROM         Members
	WHERE  (State = 'WI')
		AND (rtrim(Addr1) is not null) and (rtrim(Addr1) <> '')
		and (rtrim(City) is not null) and (rtrim(City) <> '')
		and (rtrim(State) is not null) and (rtrim(State) <> '')
		and (rtrim(Zip) is not null) and (rtrim(Zip) <> '')
	group by rtrim(FirstName), rtrim(LastName),
		rtrim(Addr1), rtrim(City), rtrim(State), rtrim(Zip),
		rtrim(HomePhone), rtrim(BPhone)
</cfquery>

<cfdump var=#q1#><cfabort>
--->

<cfif false>
	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		truncate table dbo.members_nodupe
	</cfquery>

	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	insert into dbo.members_nodupe (
		FirstName,
		LastName,
		Addr1,
		City,
		State,
		Zip,
		HomePhone,
		BPhone
	)
	(
		SELECT     rtrim(FirstName) as firstname, rtrim(LastName) as lastname,
		rtrim(Addr1) as Addr1, rtrim(City) as City, rtrim(State) as State, rtrim(Zip) as Zip,
		rtrim(HomePhone) as HomePhone, rtrim(BPhone) as BPhone
		FROM         Members
		WHERE  1=1 <!---(State = 'WI')--->
			AND (rtrim(Addr1) is not null) and (rtrim(Addr1) <> '')
			and (rtrim(City) is not null) and (rtrim(City) <> '')
			and (rtrim(State) is not null) and (rtrim(State) <> '')
			and (rtrim(Zip) is not null) and (rtrim(Zip) <> '')
		group by rtrim(FirstName), rtrim(LastName),
			rtrim(Addr1), rtrim(City), rtrim(State), rtrim(Zip),
			rtrim(HomePhone), rtrim(BPhone)
	)
	</cfquery>
</cfif>

<cfif false>
	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		select count(*) from dbo.members_nodupe
	</cfquery>
</cfif>

<cfdump var=#getMembers#>

<!---
<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
	SELECT     Org, newMemberID, rtrim(a.FirstName) as firstname, rtrim(a.LastName) as lastname,
	rtrim(a.Addr1) as Addr1, rtrim(a.City) as City, rtrim(a.State) as State, rtrim(a.Zip) as Zip,
	rtrim(a.HomePhone) as HomePhone, rtrim(a.BPhone) as BPhone, rtrim(a.Email) as Email,
	JoinDate, rtrim(a.WorkFax) as WorkFax, rtrim(a.Fax) as Fax, rtrim(a.CellPhone) as CellPhone
	FROM         Members a
	WHERE exists (


	)
	<cfif FORM.hasEmail EQ "Yes">
		AND (Email <> '')
	<cfelseif FORM.hasEmail EQ "No">
		AND (Email = '')
	</cfif>
	<cfif Form.exclusion>
		AND (Org NOT IN (SELECT org FROM  tempOrgsExclusion))
	</cfif>
	<cfif FORM.State NEQ "">
		AND (State = '#FORM.State#')
	</cfif>
	<cfif FORM.JoinDate NEQ "">
		AND (JoinDate > '#FORM.JoinDate#')
	</cfif>
	<cfif FORM.Zip NEQ "">
		AND (Zip like '#FORM.Zip#%')
	</cfif>
	order by lastname,firstname
</cfquery>

--->


