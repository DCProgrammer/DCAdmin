<cfinclude template="_header.cfm">

<cfquery name="getCategories" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT DISTINCT Category, count(*) 
from ProductItem
where type='product'
group by Category
ORDER by count(*) desc
</cfquery>

<cfset NumColumns=3>
<cfquery name="getItemCount" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT myCount=count(*) from ProductItem where type='product'
</cfquery>

<cfset numItems=0>
<cfset MaxItemsPerRow=((getItemCount.myCount)+(getCategories.recordCount*2))/NumColumns>
<table bgcolor="#ffffff" width=750> 
<tr><td colspan="3"><img src="images/headers/selectservices.gif"></td></tr>
<form method=post action="form_temp_info.cfm">
<tr>
<cfloop query="getCategories">
<td valign=top>
<cfoutput><br>
<b>#category#</b>
</cfoutput>
<hr size=1>
<cfset myCategory=Category>
<cfquery name="getProducts" datasource="#Application.MainDB#" username="#Application.DBUser#" password="#Application.DBPwd#">
SELECT Name, ProductID from ProductItem where Category='#myCategory#' and type='product' order by name
</cfquery>
<cfoutput query="getProducts">
<input type=checkbox class="inputCheckBox2" name=productname value='#Name# [#ProductID#]'>#Name#<br>
</cfoutput>
</td>
<!--- <cfset numItems=numItems+getProducts.recordCount+2>
<cfif numItems gt MaxItemsPerRow>
--->
<cfset numItems=numItems+1>
<cfif numItems gte NumColumns>
</tr><tr valign=top><cfset numItems=0></cfif>


</cfloop>
<cfset numItemsLeft=NumColumns-numItems>
<cfloop from=#numItemsLeft# to=1 step=-1 index=foo>
<td>&nbsp;<br><br><hr size=1></td>
</cfloop>
</tr>
<tr><td colspan=3 align=right>
<input type="submit" value="Continue" >
</td></tr>
</form>
</table>
<cfinclude template="_footer.cfm">