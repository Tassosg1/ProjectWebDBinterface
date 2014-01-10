<%
Cookie allcookies[] = {};
if(request.getCookies() != null)
	allcookies= request.getCookies();
int userfound = 0;
for (int i = 0;i < allcookies.length;i++)
	if (allcookies[i].getName().equals("username"))
		userfound=i;
if(userfound!=0)
{
	System.out.println("Welcome <a href=\"usercp.jsp\">" + allcookies[userfound].getValue() + "! </a><a href=\"javascript:logout();\">Logout</a>"); 
}
else 
{
	System.out.println("<a href=\"javascript:login(\'show\');\">Log In</a>");
}
%>