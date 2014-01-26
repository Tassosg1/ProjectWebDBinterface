function logout()
{
	document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
	window.location="index.jsp";
}