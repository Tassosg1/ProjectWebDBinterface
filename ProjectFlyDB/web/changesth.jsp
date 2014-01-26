<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Updating ... Please Wait.</title>
		<link rel="shortcut icon" href="Resources/favicon.ico" type="image/x-icon" />
		<link rel="icon" href="Resources/favicon.ico" type="image/x-icon" />
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
        <%
                Cookie allcookies[] = {};
                if (request.getCookies() != null) {
                allcookies = request.getCookies();
                }
                String username = null;
                for (int i = 0; i < allcookies.length; i++) {
                     if (allcookies[i].getName().equals("username")) {
                            username = allcookies[i].getValue();
                    }
                }
				%>
<%@ include file="cred/DBConnectCrede.jsp" %>
				<%
                 Statement removestatement = DBCon.createStatement();
                 
                 removestatement.executeUpdate("UPDATE user SET telephone='" + request.getParameter("tel") + "' , password='" + request.getParameter("password") + "' , name='" + request.getParameter("name")+ "' WHERE username='" + username + "'");
                 
                 
        %>
    Your credentials are being updated. You will be redirected soon.
    </body>
</html>
