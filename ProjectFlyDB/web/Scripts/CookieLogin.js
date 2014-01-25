function login(showhide)
{
	if(showhide === "show")
	{
		document.getElementById('popupbox').style.visibility="visible";
	}
	else if(showhide === "hide")
	{
		document.getElementById('popupbox').style.visibility="hidden"; 
	}
}
function logout()
{
	document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
	window.location="index.jsp";
}