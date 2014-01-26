<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Completed</title>
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
</head>
<%@ include file="cred/DBConnectCrede.jsp" %>
			<%
            //FIRST WE CHECK FOR THE CCVER NUMBER
            Statement cc = DBCon.createStatement();
            Statement book = DBCon.createStatement();
            Statement dest = DBCon.createStatement();
            ResultSet destination = dest.executeQuery("SELECT to_port FROM flight WHERE id=" + request.getParameter("flight"));
            destination.first();
            ResultSet rscc = cc.executeQuery("SELECT ccver FROM cc WHERE ccnum=\"" + request.getParameter("ccnum") + "\"");
            rscc.first();
            if (request.getParameter("ccver").equals(String.valueOf(rscc.getInt("ccver")))) {
                // paywithcreditcard();
                book.executeUpdate("INSERT INTO bookings VALUES(" + request.getParameter("flight") + ",'" + username + "',0)");
                // trigger to decrease seats in DB
                out.println("Your purchase was a success. You are being redirected...");
                response.sendRedirect("success.jsp?destination=" + destination.getString("to_port"));
            } else {
                out.println("The verification number you entered was incorrect.");
            }










        %>
    </body>
</html>
