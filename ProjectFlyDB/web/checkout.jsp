<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Checkout</title>
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
		<script src="Scripts/check.js"></script>
		<script src="Scripts/logout.js"></script>
</head>
<body onload="javascript:check('username');">
<%@ include file="Header.jsp" %>
<%@ include file="popuplogin.jsp" %>
<%@ include file="cred/DBConnectCrede.jsp" %>
<%
                 Statement search = DBCon.createStatement();
                 Statement provider = DBCon.createStatement();
                 Statement cc = DBCon.createStatement();
                 int hasCC=0;
                 
                 ResultSet rsfly = search.executeQuery("SELECT * FROM flight WHERE id="+request.getParameter("flight"));
                 out.println("CHECKOUT");
                  if (rsfly.first()) {
                                    out.println("<BR><h3>Flight details:</h3>");
                                    out.println("From port: " + rsfly.getString("from_port") + "<BR>");
                                    out.println("To port: " + rsfly.getString("to_port") + "<BR>");
                                    out.println("Time of flight: " + rsfly.getString("datetime") + "<BR>");
                                    out.println("Available Seats: " + rsfly.getString("seats") + "<BR>");
                                    out.println("Total cost is " + rsfly.getInt("cost") + "<BR>");
                                    ResultSet rsprovider = provider.executeQuery("SELECT name FROM flightcom WHERE vat=" + rsfly.getInt("vat"));rsprovider.first();
                                    out.println("This flight is brought to you by " + rsprovider.getString("name") + "<BR>");
                  } else out.println("No flights with this id.");
                                    
                  out.println("<BR><BR>Please select the CC you'll use to complete your purchase.<BR><BR>");   
                  ResultSet rscc = cc.executeQuery("SELECT * from cc WHERE username=\"" + username + "\"");
                  %> <form name="ccform" method="get" action="precomplete.jsp"> <%
                  if (rscc.next()) {
                    hasCC=1;
                    while(true) {
                      out.println(rscc.getString("ccnum"));
                      out.println("<input type=\"hidden\" name=\"flight\" value=\"" + rsfly.getInt("id") + "\">");
                      out.println("<input type=\"radio\" required=\"required\" name=\"ccnum\" value=\"" + rscc.getString("ccnum") + "\"><BR>");
                      rscc.next();
                    }
                  }
                    if(hasCC==1) out.println("<input type=\"submit\" value=\"Pay " + rsfly.getInt("cost") + "E using this credit card.\">");
                    %>
        
		<footer>
			<span class="Right"><a href="https://github.com/Tassosg1/ProjectWebDBinterface" rel="author">Source</a></span>
		</footer>

	</body>
</html>
