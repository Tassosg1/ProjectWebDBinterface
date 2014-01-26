<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >

	<head>
        <title>Fly Me To The Moon - Success!</title>
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
                <!-- PLEASE mind the case-sensitivity (Glassfish©). Use the format recommended ^ -->
                <!--<link rel="stylesheet" type="text/css" href="Stylesheets/index.css" />-->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
    </head>

    <script language="JavaScript" type="text/javascript">  
   function logout(){
        document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
        window.location="index.jsp";
  }
  </script>
    
    <body>

		<header>
			<nav>
				<span class="Left"><a href="index.jsp">Home</a></span>
                                <%
                                    Cookie allcookies[] = {};
                                    String username = null;
                                    allcookies= request.getCookies();
                                    for (int i = 0;i < allcookies.length;i++)
                                       if (allcookies[i].getName().equals("username")) {
                                    username = allcookies[i].getValue();
                                    out.println("<span class=\"Right\">Welcome <a href=\"usercp.jsp\">" + allcookies[i].getValue() + "! </a>");
                                    out.println("<a href=\"javascript:logout();\">Logout</a></span>"); }
                                %>
			</nav>
		</header>
		
		
		<br><br>
			<h3>Your booking was successful</h3><img src="./Resources/success.png" alt="Success" width="50" height="50">
			<br><br><br><br><br><br><br><br><br>
		<a href="http://en.wikipedia.org/wiki/<%out.println(request.getParameter("destination"));%>" class="yoloright">Information</a>
		<a href="https://www.google.gr/?gws_rd=cr&ei=3_XSUtulK4mRtQa_84GgAw#q=weather+<%out.println(request.getParameter("destination"));%>" class="yoloright">Weather</a>

  
  
		<footer>
			<span class="Right"><a href="https://github.com/Tassosg1/ProjectWebDBinterface" rel="author">Source</a></span>
		</footer>

	</body>
</html>
