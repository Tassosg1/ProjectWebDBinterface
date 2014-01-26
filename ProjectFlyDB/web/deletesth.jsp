<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Deleting ... Please Wait.</title>
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
		<script src="Scripts/timedRedirect.js"></script>
		<script src="Scripts/logout.js"></script>
</head>
<body onload="javascript:timedRedirect();">
<%@ include file="cred/DBConnectCrede.jsp" %>
				<%
                 Statement removestatement = DBCon.createStatement();
                 if (request.getParameter("flight") != null) {
                 out.println("Your flight has been deleted. You will be redirected soon.");
                 removestatement.executeUpdate("DELETE FROM bookings WHERE username='" + username + "' AND id=" + request.getParameter("flight") + " AND seat=" + request.getParameter("seat"));
                 } else if (request.getParameter("ccnum") != null) {
                 removestatement.executeUpdate("DELETE FROM cc WHERE username='" + username + "' AND ccnum='" + request.getParameter("ccnum") + "'");
                 out.println("Your CC is being deleted");
                 }

                 
        %>
    
    </body>
</html>
