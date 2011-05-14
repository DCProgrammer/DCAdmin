<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>UBS Chicago</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META 
content="" 
name=description>
<META 
content="" 
name=keywords>
<META content=INDEX,FOLLOW,all name=robots>
<META content=document name=resource-type>
<META content=global name=distributon>
<META content="5 days" name="revisit after">
<META content="" name=author>

<cfif isDefined("URL.AffID")>
<cfset Session.AffID=URL.AffID>
</cfif>

<cf_AffDataPreload>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<LINK href="style.css" rel=stylesheet>
</HEAD>
<BODY bgColor=000BAE text=#336699 link=#336699 vLink=#6699cc aLink=#6699cc 
leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/buttons/but_contact_us_on.gif','images/buttons/but_dealers_on.gif','images/buttons/but_orgs_on.gif','images/buttons/but_aboutus_on.gif','images/buttons/but_mortfin_off.gif','images/buttons/but_mortfin_on.gif','images/buttons/but_autofin_off.gif','images/buttons/but_autofin_on.gif','images/buttons/but_carbuyingsvc_off.gif','images/buttons/but_carbuyingsvc_on.gif','images/buttons/but_consumerprod_off.gif','images/buttons/but_consumerprod_on.gif','images/buttons/but_consumersvc_off.gif','images/buttons/but_consumersvc_on.gif')">
<table width="750" border="0" cellpadding="1" cellspacing="0" bgcolor="000BAE">
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td><h1><a 
      href="#"><img src="images/ubslogo_50.gif" alt="UBS" width="50" height="50" border="0" align="top"></a> 
              <font color="#FFFFFF" face="Arial, Helvetica, sans-serif">United 
              Buying Service Chicago</font></h1></td>
          <td align="right"><a href="index.cfm"><img src="images/buttons/HomeButtonWhite.gif" alt="Home" width="50" height="50" border="0"></a></td>
        </tr>
      </table>
     </td>
  </tr>
  <tr> 
    <td><table border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td><a href="Process_Auto.cfm?isFinance=1&NoFlags=1" target="_top" onClick="MM_nbGroup('down','group1','Financing','images/buttons/but_mortfin_off.gif',1)" onMouseOver="MM_nbGroup('over','Financing','images/buttons/but_mortfin_on.gif','images/buttons/but_mortfin_on.gif',1)" onMouseOut="MM_nbGroup('out')"><img src="images/buttons/but_mortfin_off.gif" alt="Financing" name="Financing" border="0" onload=""></a></td>
          <td><a href="Process_Auto.cfm?isAuto=1&NoFlags=1" target="_top" onClick="MM_nbGroup('down','group1','AutoFin','images/buttons/but_autofin_off.gif',1)" onMouseOver="MM_nbGroup('over','AutoFin','images/buttons/but_autofin_on.gif','images/buttons/but_autofin_on.gif',1)" onMouseOut="MM_nbGroup('out')"><img src="images/buttons/but_autofin_off.gif" alt="Auto Financing" name="AutoFin" border="0" onload=""></a></td>
          <td><a href="Process_Auto.cfm?isAuto=1&NoFlags=1" target="_top" onClick="MM_nbGroup('down','group1','CarBuyingSvc','images/buttons/but_carbuyingsvc_off.gif',1)" onMouseOver="MM_nbGroup('over','CarBuyingSvc','images/buttons/but_carbuyingsvc_on.gif','images/buttons/but_carbuyingsvc_on.gif',1)" onMouseOut="MM_nbGroup('out')"><img src="images/buttons/but_carbuyingsvc_off.gif" alt="Car Buying Service" name="CarBuyingSvc" border="0" onload=""></a></td>
          <td><a href="Process_Auto.cfm?NoFlags=1&isProduct=1" target="_top" onClick="MM_nbGroup('down','group1','ConsumerProd','images/buttons/but_consumerprod_off.gif',1)" onMouseOver="MM_nbGroup('over','ConsumerProd','images/buttons/but_consumerprod_on.gif','images/buttons/but_consumerprod_on.gif',1)" onMouseOut="MM_nbGroup('out')"><img src="images/buttons/but_consumerprod_off.gif" alt="Consumer Products" name="ConsumerProd" border="0" onload=""></a></td>
          <td><a href="Process_Auto.cfm?NoFlags=1&isService=1" target="_top" onClick="MM_nbGroup('down','group1','ConsumerSvc','images/buttons/but_consumersvc_off.gif',1)" onMouseOver="MM_nbGroup('over','ConsumerSvc','images/buttons/but_consumersvc_on.gif','images/buttons/but_consumersvc_on.gif',1)" onMouseOut="MM_nbGroup('out')"><img name="ConsumerSvc" src="images/buttons/but_consumersvc_off.gif" border="0" alt="Consumer Services" onLoad=""></a></td>
        </tr>
		  </table></td>
  </tr>

</table>

<cf_checkZip>