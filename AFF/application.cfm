<cfapplication name="DCAdminArea" clientmanagement="Yes" sessionmanagement="Yes">

<cf_set_cfg>

<CFSET Application.ServerName=cfg_Server> <!--- THIS MUST ADJUSTED TO SERVER --->

<CFSET Application.DBUser="DCUser">
<cfset Application.DBPwd="SouthPark">
<cfset Application.MainDB=cfg_MainDB>
