function CheckForm(frmObject)
{

frm=document.UserForm;
	if(trim(frm.vchName.value).length == 0 )
	{
		alert("You must enter Name!");
		frm.vchName.focus();
		return false;
	}
	if(trim(frm.nvchAddress.value).length == 0 )
	{
		alert("You must enter Address!");
		frm.nvchAddress.focus();
		return false;
	}
	if(trim(frm.nvchCity.value).length == 0 )
	{
		alert("You must enter City!");
		frm.nvchCity.focus();
		return false;
	}
	if(trim(frm.vchState[frm.vchState.selectedIndex].value).length == 0 )
	{
		alert("You must Select State!");
		frm.vchState.focus();
		return false;
	}
	if(trim(frm.vchZip.value).length == 0 )
	{
		alert("You must enter Zip!");
		frm.vchZip.focus();
		return false;
	}
	if(trim(frm.AssetSize.value).length == 0 )
	{
		alert("You must enter AssetSize!");
		frm.AssetSize.focus();
		return false;
	}
	if(trim(frm.vchPhone.value).length == 0 )
	{
		alert("You must enter Phone!");
		frm.vchPhone.focus();
		return false;
	}
	if(trim(frm.vchGeneralEmail.value).length != 0 )
	{
		if(!validateEmail(frm.vchGeneralEmail.value))
		{
			alert("Invalid email Address. It should be user@domain.com!");
			frm.vchGeneralEmail.focus();
			return false;
		}
	}
	if(trim(frm.vchContactEmail.value).length != 0 )
	{
		if(!validateEmail(frm.vchContactEmail.value))
		{
			alert("Invalid email Address. It should be user@domain.com!");
			frm.vchContactEmail.focus();
			return false;
		}
	}
	if(trim(frm.vchLendMgrEmail.value).length != 0 )
	{
		if(!validateEmail(frm.vchLendMgrEmail.value))
		{
			alert("Invalid email Address. It should be user@domain.com!");
			frm.vchLendMgrEmail.focus();
			return false;
		}
	}
	if(trim(frm.vchSiteURL.value).length == 0 )
	{
		frm.vchSiteURL.value="#";
	}
	if(trim(frm.vchLoanURL.value).length == 0 )
	{
		frm.vchLoanURL.value="#";
	}
	if(trim(frm.vchFAQ_URL.value).length == 0 )
	{
		frm.vchFAQ_URL.value="#";
	}
	if(trim(frm.vchInsurance_URL.value).length == 0 )
	{
		frm.vchInsurance_URL.value="#";
	}
	if(trim(frm.vchServices_URL.value).length == 0 )
	{
		frm.vchServices_URL.value="#";
	}
return true;
}


function DisplayErrorMsg(objControl,strErrMessage)
{
	alert(strErrMessage);
	objControl.focus();
}

function ltrim ( s )
{
	return s.replace( /^\s*/, "" )
}

function rtrim ( s )
{
	return s.replace( /\s*$/, "" );
}

function trim ( s )
{
	return rtrim(ltrim(s));
}

function validateEmail(email){
	
	// This function is used to validate a given e-mail 
	// address for the proper syntax
	
	if (email == ""){
		return false;
	}
	badStuff = ";:/,' \"\\";
	for (i=0; i<badStuff.length; i++){
		badCheck = badStuff.charAt(i)
		if (email.indexOf(badCheck,0) != -1){
			return false;
		}
	}
	posOfAtSign = email.indexOf("@",1)
	if (posOfAtSign == -1){
		return false;
	}
	if (email.indexOf("@",posOfAtSign+1) != -1){
		return false;
	}
	posOfPeriod = email.indexOf(".", posOfAtSign)
	if (posOfPeriod == -1){
		return false;
	}
	if (posOfPeriod+2 > email.length){
		return false;
	}
	return true
}

function validateURL(url){
	
	// This function is used to validate a given 
	// address for the proper syntax
	url="http://"+url;
	var re;
	re = new RegExp("(http|ftp|https)://[-A-Za-z0-9._/]+");
	if (re.test(url)==false)
		return false;

	posOfAtSign = url.indexOf(".")

	if (posOfAtSign == -1){
		return false;
	}
	return true;
}