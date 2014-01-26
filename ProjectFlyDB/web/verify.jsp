<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Verifycation in progress</title>
		<link rel="shortcut icon" href="Resources/favicon.ico" type="image/x-icon">
		<link rel="icon" href="Resources/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
        <link rel="stylesheet" type="text/css" href="./StyleSheets/popupbox.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/MainContent.css" />
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
		<script src="Scripts/login.js"></script>
		<script src="Scripts/logout.js"></script>
		<script src="Scripts/timedRedirect.js"></script>
</head>
<body onload="javascript:timedRedirect();">
<%@ include file="Includes/Header.jsp" %>
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
<%@ include file="Includes/Footer.jsp" %>
	</body>
</html>
