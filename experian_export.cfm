<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->



<cfparam name="FORM.State" Default="">
<cfparam name="FORM.Zip" Default="">
<cfparam name="FORM.JoinDate" Default="">
<cfparam name="FORM.Search" Default="NO">
<cfparam name="FORM.hasEmail" Default="Yes">
<cfparam name="FORM.csv" Default="NO">
<cfparam name="FORM.membercsv" Default="NO">
<cfparam name="FORM.exclusion" Default="Yes">
<cfparam name="FORM.delim" Default="comma">

<cfif form.delim EQ "comma">
	<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->
<cfelse>
	<!--- nope try pipe --->
	<cfset delim = 124>
</cfif>

<!--- if generating zip count csv, do before any other output --->
<cfif FORM.csv EQ "Yes">
	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		SELECT     Zip, COUNT(*) AS zipcount
		FROM         Members
		WHERE 1 = 1
		<cfif FORM.hasEmail EQ "Yes">
			AND (Email <> '')
		<cfelseif FORM.hasEmail EQ "No">
			AND (Email = '')
		</cfif>
		AND (Org NOT IN (SELECT org FROM  tempOrgsExclusion))
		<cfif FORM.State NEQ "">
			AND (State = '#FORM.State#')
		</cfif>
		<cfif FORM.JoinDate NEQ "">
			AND (JoinDate > '#FORM.JoinDate#')
		</cfif>
		<cfif FORM.Zip NEQ "">
			AND (Zip like '#FORM.Zip#%')
		</cfif>
		GROUP BY Zip
		ORDER BY Zip
	</cfquery>
	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=zipcount.csv">
	<CFCONTENT type="text/csv">

		<!--- Output Column Headers --->
		<cfoutput>Zip#chr(delim)#Count</cfoutput>

		<cfoutput>#chr(13)#</cfoutput> <!--- line break after column header --->

		<!--- Spill out data from a query --->
	<cfoutput query="getmembers">#Zip##chr(delim)##zipcount##chr(13)#</cfoutput>

<cfelseif FORM.membercsv EQ "Yes">
	<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
		SELECT     a.newMemberID, a.FirstName, a.LastName,
		a.Addr1, a.City, a.State, a.Zip,
		a.HomePhone
		FROM         Members a
			inner join members_nodupe b on a.newmemberid = b.newmemberid
		WHERE 1 = 1
		<cfif FORM.State NEQ "">
			AND (a.State = '#FORM.State#')
		</cfif>
		order by a.lastname,a.firstname
	</cfquery>


	<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=memberlist#form.state#.csv">
	<CFCONTENT type="text/csv">


		<!--- Output Column Headers --->
		<cfoutput>NewMemberID#chr(delim)#FirstName#chr(delim)#LastName#chr(delim)#Addr1#chr(delim)#City#chr(delim)#State#chr(delim)##chr(delim)#HomePhone</cfoutput>

		<cfoutput>#chr(13)#</cfoutput> <!--- line break after column header --->

		<!--- Spill out data from a query --->
	<cfoutput query="getmembers">#chr(delim)##getMembers.NewMemberID##chr(delim)##getMembers.FirstName##chr(delim)##getMembers.LastName##chr(delim)##getMembers.Addr1##chr(delim)##getMembers.City##chr(delim)##getMembers.State##chr(delim)##getMembers.Zip##chr(delim)##getMembers.HomePhone##chr(13)#</cfoutput>

	<cfabort>

<cfelse>
	<cfoutput>
	<script language="javascript">
	function generateCSV() {
		document.getmembers.csv.value = "Yes";
		document.getmembers.submit();
	}
	function generateMemberCSV() {
		document.getmembers.membercsv.value = "Yes";
		document.getmembers.submit();
	}
	</script>

	<form action="experian_export.cfm" name="getmembers" method="post">
		State:<!---<input type="text" name="state">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--->
	<select name="state">
<option value="" selected="selected">Select a State</option>
<option value="AL">Alabama</option>
<option value="AK">Alaska</option>
<option value="AZ">Arizona</option>
<option value="AR">Arkansas</option>
<option value="CA">California</option>
<option value="CO">Colorado</option>
<option value="CT">Connecticut</option>
<option value="DE">Delaware</option>
<option value="DC">District Of Columbia</option>
<option value="FL">Florida</option>
<option value="GA">Georgia</option>
<option value="HI">Hawaii</option>
<option value="ID">Idaho</option>
<option value="IL">Illinois</option>
<option value="IN">Indiana</option>
<option value="IA">Iowa</option>
<option value="KS">Kansas</option>
<option value="KY">Kentucky</option>
<option value="LA">Louisiana</option>
<option value="ME">Maine</option>
<option value="MD">Maryland</option>
<option value="MA">Massachusetts</option>
<option value="MI">Michigan</option>
<option value="MN">Minnesota</option>
<option value="MS">Mississippi</option>
<option value="MO">Missouri</option>
<option value="MT">Montana</option>
<option value="NE">Nebraska</option>
<option value="NV">Nevada</option>
<option value="NH">New Hampshire</option>
<option value="NJ">New Jersey</option>
<option value="NM">New Mexico</option>
<option value="NY">New York</option>
<option value="NC">North Carolina</option>
<option value="ND">North Dakota</option>
<option value="OH">Ohio</option>
<option value="OK">Oklahoma</option>
<option value="OR">Oregon</option>
<option value="PA">Pennsylvania</option>
<option value="RI">Rhode Island</option>
<option value="SC">South Carolina</option>
<option value="SD">South Dakota</option>
<option value="TN">Tennessee</option>
<option value="TX">Texas</option>
<option value="UT">Utah</option>
<option value="VT">Vermont</option>
<option value="VA">Virginia</option>
<option value="WA">Washington</option>
<option value="WV">West Virginia</option>
<option value="WI">Wisconsin</option>
<option value="WY">Wyoming</option>
	</select><br>

		Zip:<input type="text" name="zip"><br>
		Start Join Date (MM/DD/YYYY):<input type="text" name="joindate"><br>
		Has an email Yes-<input type="Radio" name="hasEmail" value="Yes" checked>&nbsp;&nbsp;&nbsp;&nbsp;
		No-<input type="Radio" name="hasEmail" value="No">
		Both-<input type="Radio" name="hasEmail" value="Both"><br>
		Exclude using Org Exclusion table Yes-<input type="Radio" name="exclusion" value="Yes" checked>&nbsp;&nbsp;&nbsp;&nbsp;
		No-<input type="Radio" name="exclusion" value="No">
	<br><br>
	Choose delimiter: comma<input type="Radio" name="delim" value="comma" checked>&nbsp;&nbsp;&nbsp;&nbsp;
		pipe<input type="Radio" name="delim" value="comma">
	<input type="hidden" name="Search" value="Yes">
	<input type="hidden" name="csv" value="No">
	<input type="hidden" name="membercsv" value="No">
		<a href="##" onclick="javascript:document.getmembers.submit() ;">Click Here to Get Member List</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="getMembers.cfm">Rest Form</a>

		<br><br>
		<a href="##" onclick="javascript:generateMemberCSV()">Click Here to Get Member List CSV File</a>

		<br><br>
		<a href="##" onclick="javascript:generateCSV()">Click Here to Get Zip Count CSV File</a>
	</form>

	<!--- display results if the form was submitted --->
	<cfif FORM.Search EQ "Yes">
		<cfquery name="getMembers" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
			SELECT     Org, FirstName, LastName, Addr1, City, State, Zip, HomePhone, BPhone, Email, JoinDate, WorkFax, Fax, CellPhone
			FROM         Members
			WHERE 1 = 1
			<cfif FORM.hasEmail EQ "Yes">
				AND (Email <> '')
			<cfelseif FORM.hasEmail EQ "No">
				AND (Email = '')
			</cfif>
			AND (Org NOT IN (SELECT org FROM  tempOrgsExclusion))
			<cfif FORM.State NEQ "">
				AND (State = '#FORM.State#')
			</cfif>
			<cfif FORM.JoinDate NEQ "">
				AND (JoinDate > '#FORM.JoinDate#')
			</cfif>
			<cfif FORM.Zip NEQ "">
				AND (Zip like '#FORM.Zip#%')
			</cfif>
			ORDER BY JoinDate
		</cfquery>
		#getmembers.RecordCount# Records Returned
		<table cellpadding="10" border="1">
			<tr>
				<td>count</td>
				<td>Org</td>
				<td>FirstName</td>
				<td>LastName</td>
				<td>Addr1</td>
				<td>City</td>
				<td>State</td>
				<td>Zip</td>
				<td>HomePhone</td>
				<td>BPhone</td>
				<td>Email</td>
				<td>JoinDate</td>
				<td>Work Fax</td>
				<td>Fax</td>
				<td>CellPhone</td>
			</tr>
		<cfloop query="getMembers">
			<cfif getMembers.CurrentRow MOD 2>
				<cfset BGC = "F5F5F5">
			<cfelse>
				<cfset BGC = "FFFFFF">
			</cfif>
			<tr bgcolor="###BGC#">
					<td>#getMembers.CurrentRow#</td>
					<td>#getMembers.Org#</td>
					<td>#getMembers.FirstName#</td>
					<td>#getMembers.LastName#</td>
					<td>#getMembers.Addr1#</td>
					<td>#getMembers.City#</td>
					<td>#getMembers.State#</td>
					<td>#getMembers.Zip#</td>
					<td>#getMembers.HomePhone#</td>
					<td>#getMembers.BPhone#</td>
					<td>#getMembers.Email#</td>
					<td>#getMembers.JoinDate#</td>
					<td>#getMembers.WorkFax#</td>
					<td>#getMembers.Fax#</td>
					<td>#getMembers.CellPhone#</td>
				</tr>
			<cfif getMembers.CurrentRow MOD 100>
				<cfflush>
			</cfif>
		</cfloop>
	</cfif>
	<a href="index.cfm">Back to DCAdmin</a>
	</cfoutput>
</cfif>
