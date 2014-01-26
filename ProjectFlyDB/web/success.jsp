<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >
	<head>
		<title>Fly Me To The Moon - Success !</title>
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
		<script src="Scripts/logout.js"></script>
</head>
<body>
<%@ include file="Includes/Header.jsp" %>
<%@ include file="Includes/popuplogin.jsp" %>
		<br><br>
			<h3>Your booking was successful</h3><img src="./Resources/success.png" alt="Success" width="50" height="50">
			<br><br><br><br><br><br><br><br><br>
		<a href="http://en.wikipedia.org/wiki/<%out.println(request.getParameter("destination"));%>" class="yoloright">Information</a>
		<a href="https://www.google.gr/?gws_rd=cr&ei=3_XSUtulK4mRtQa_84GgAw#q=weather+<%out.println(request.getParameter("destination"));%>" class="yoloright">Weather</a>
		<%@ include file="Includes/Footer.jsp" %>
	</body>
</html>
