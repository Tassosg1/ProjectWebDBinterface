<%
Cookie allcookies[] = {};
if(request.getCookies() != null)
	allcookies= request.getCookies();
int userfound = 0;
for (int i = 0;i < allcookies.length;i++)
	if (allcookies[i].getName().equals("username"))
		userfound=i;
if(userfound!=0) {
	out.println("<span class=\"Right\">Welcome <a href=\"usercp.jsp\">" + allcookies[userfound].getValue() + "! </a>");
	out.println("<a href=\"javascript:logout();\">Logout</a></span>"); } else {
%> 
<span class="Right"><a href="javascript:login('show');">Log In</a></span>
<%
}
%>