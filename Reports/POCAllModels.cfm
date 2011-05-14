<!-- JSModels tag takes two optional attributes: target and Included

'target', if defined, specifies where the form is suuposed to post to.
Included, if defined, means the tag is inside a form, so don't define one.
-->

<cfif IsDefined("attributes.target")>
<cfset MyTarget=attributes.target>
<cfelse>
<cfset MyTarget="">
</cfif>

<cfquery name="getMakes" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Year,Make from NewMakes
order by Make,Year
</cfquery>

<script language="javascript">
<!-- Hide from non JS browsers
var Vehicles = new Array();

// Stop Hiding -->
</script>

<cfset MakeCount=0>
<script language="javascript">
<!-- Hide from non JS browsers
<cfloop query="getMakes"><cfset MyMake=getMakes.Make><cfquery name="getModels" datasource="MainSQL" username="#Application.DBUser#" password="#Application.DBPwd#">SELECT DISTINCT Model from NewModels where MakeID in (SELECT MakeID from NewMakes where Make='#MyMake#')</cfquery><cfoutput>Vehicles[#MakeCount#]=new Array();</cfoutput><cfset MyCount=0><cfoutput query="getModels">Vehicles[#MakeCount#][#MyCount#]='#Model#';<cfset MyCount=MyCount+1></cfoutput><cfset MakeCount=MakeCount+1></cfloop>

function changeModel(){
var pForm;
var n;
var Make;
var makeIndex;

pForm=document.MyForm;
//pForm.Debug.value=Vehicles.length;
Make=pForm.Make.options[document.MyForm.Make.selectedIndex].value;
if (Make!=''){
	makeIndex=pForm.Make.selectedIndex-1;
	document.MyForm.Model.length=1;
	for (n=0;n<Vehicles[makeIndex].length;n++){
		pForm.Model.options[n]=new Option(Vehicles[makeIndex][n],Vehicles[makeIndex][n]);
		}
	}
	else
	{
		pForm.Model.options.length=1;
		pForm.Model.options[0]=new Option('--','----');
	}
}

// Stop Hiding -->
</script>
<cfif not IsDefined("attributes.Included")>
<cfoutput>
<form method=post name="MyForm" target="#MyTarget#">
</cfoutput>
</cfif>
<!--input type=text name="Debug"-->
<select name="Make" onChange="changeModel()">
<option value="">Select a Make</option>
<cfoutput query="getMakes">
<option value="#Year# #Make#">#Year# #Make#</option>
</cfoutput>
</select><br>

<select name="Model">
<option value="">Select a Model</option>
<option value="">Select a Model</option>
<option value="">Select a Model</option>
<option value="">Select a Model</option>
<option value="">Select a Model</option>
<option value="">Select a Model</option>
</select>
<cfif not IsDefined("attributes.Included")>
</form>
</cfif>
