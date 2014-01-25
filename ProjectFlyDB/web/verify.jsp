<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Index</title>
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
        <link rel="stylesheet" type="text/css" href="./StyleSheets/popupbox.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/MainContent.css" />
        <!--<link rel="stylesheet" type="text/css" href="Stylesheets/index.css" />-->
		<!--External-->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<!-- /External -->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
		<script src="Scripts/CookieLogin.js"></script>
		<script src="Scripts/Date.js"></script>

</head>
<body onload="javascript:timedRedirect();">
<%@ include file="Header.jsp" %>
<BR>
<BR>		
<%@ include file="cred/DBConnectCrede.jsp" %>
                <%
		 Statement userstatement = DBCon.createStatement();
                 ResultSet rsuser = userstatement.executeQuery("SELECT * from user WHERE username='" + request.getParameter("username") + "'");
                 if(rsuser.first()) {
                     if (request.getParameter("password").equals(rsuser.getString("password"))) {
                         out.println("Login Successfull. You are now being redirected...");
                         response.addCookie(new Cookie("username",request.getParameter("username")));
                     } else out.println("Incorect Password.<BR>Please try again.");
                 } else {
                     out.println("This user ("+request.getParameter("username")+") does not exist.<BR> Please try again or contact the admin.");
                 }
                %>
<%@ include file="Footer.jsp" %>
	</body>
</html>
