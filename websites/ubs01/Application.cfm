<cfapplication name="UBS-2003" clientmanagement="Yes" sessionmanagement="Yes">

<cfset ORG='90017'>
<cfset Application.ORG='90017'>
<cfset currentDomain='.ubschicago.com'>
<!--- The following below Application.OrgFaxNumber should be commented out if 
      the organization requires leads faxed to them --->
<!--- FAX number must be masked as (999) 999-9999   --->	 
<!---CFSET Application.OrgFaxNumber="(847) 215-7000"--->
<cf_set_cfg>
<CFSET Application.ServerName=cfg_Server> <!--- THIS MUST ADJUSTED TO SERVER --->
<CFSET Application.DBUser="sa">
<cfset Application.DBPwd="SouthPark">
<cfset Application.MainDB=cfg_MainDB>

<cfparam name="Session.AffID" default="7">
<cfparam name="Session.validEmail" default="no">
<cfparam name="Session.Email" default="">

<cfset Application.genCert=0>  <!--- set to 1 to generate certificates --->

<cfset Session.FlagArray=ArrayNew(1)>
<cfset Session.FlagLabelArray=ArrayNew(1)>

<cfset Session.FlagArray[1]="isFinance">
<cfset Session.FlagLabelArray[1]="Would you like to Financing or Re-Financing your auto or home.">

<cfset Session.FlagArray[2]="isAuto">
<cfset Session.FlagLabelArray[2]="Auto">

<cfset Session.FlagArray[3]="isFurniture">
<cfset Session.FlagLabelArray[3]="Furniture">

<cfset Session.FlagArray[4]="isAppliance">
<cfset Session.FlagLabelArray[4]="Appliance">

<cfset Session.FlagArray[5]="isCarpeting">
<cfset Session.FlagLabelArray[5]="Carpeting">

<cfset Session.FlagArray[6]="isElectronics">
<cfset Session.FlagLabelArray[6]="Electronics">

<cfset Session.FlagArray[7]="isProduct">
<cfset Session.FlagLabelArray[7]="Consumber Product">


<cfset Session.FlagArray[8]="isService">
<cfset Session.FlagLabelArray[8]="Consumer Service">

<!--- comment this to stop passing on noFlags --->

<cfset Session.FlagArray[9]="noFlags">
<cfset Session.FlagLabelArray[9]="">
<!--- 

<cfset Session.FlagArray[5]="isGAP">
<cfset Session.FlagLabelArray[5]="GAP">

<cfset Session.FlagArray[6]="isWarranty">
<cfset Session.FlagLabelArray[6]="Warranty">

<cfset Session.FlagArray[7]="isRealEstate">
<cfset Session.FlagLabelArray[7]="Real Estate">

<cfset Session.FlagArray[8]="isTravel">
<cfset Session.FlagLabelArray[8]="Travel">

<cfset Session.FlagArray[9]="isCarpeting">
<cfset Session.FlagLabelArray[9]="Carpeting">

<cfset Session.FlagArray[10]="isCellPhone">
<cfset Session.FlagLabelArray[10]="Cell Phone">

<cfset Session.FlagArray[11]="isInsurance">
<cfset Session.FlagLabelArray[11]="Insurance">
--->



