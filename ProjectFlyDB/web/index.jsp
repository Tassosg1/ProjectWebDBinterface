<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Index</title>
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
        <link rel="stylesheet" type="text/css" href="./StyleSheets/Popupbox.css" />
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
		<script language="JavaScript" type="text/javascript">  
		function login(showhide)
		{
			if(showhide === "show")
			{
				document.getElementById('popupbox').style.visibility="visible";
			}
			else if(showhide === "hide")
			{
				document.getElementById('popupbox').style.visibility="hidden"; 
			}
		}
		function logout()
		{
		document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
		window.location="index.jsp";
		}
		$(function()
		{
			$("#from_date").datepicker();
			$("#to_date").datepicker();
		});
  </script>
</head>
<body>
<%@ include file="Header.jsp" %>
	<div id="popupbox"> 
		<form name="login" action="verify.jsp" method="get">
			<center>Username:</center>
			<center><input name="username" size="14" /></center>
			<center>Password:</center>
			<center><input name="password" type="password" size="14" /></center>
			<center><input type="submit" name="submit" value="login" /></center>
		</form>
		<center><a href="javascript:login('hide');">Close</a></center> 
</div>
<div id="container">
<%@ include file="DBConnectCrede.jsp" %>
                <%
                 ResultSet rsairport = airportsstatement.executeQuery("SELECT * from port");
                 rsairport.last();int size = rsairport.getRow();rsairport.first();
                 String[] airports = new String[size];
                    if (rsairport.first()) {
                              airports[0] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
                              for(int i = 1; rsairport.next(); i++ ) 
                                 airports[i] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
                    }
                %>
                <form method="get" action ="results.jsp">
				<span id="from" class="Left">
				<h1>From</h1>
				<label for="from_air">Airport :</label>
                <select name="from_air" id="from_air">
                <%
                for (int i = 0;i < airports.length;i++)
                    out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                %>   
                </select>
				<br />
				<label for="from_date">Date</label>
				<input type="text" id="from_date" />
				</span>
				<span id ="to" class="Right">
				<h1>To</h1>
                <label for="to_air">Airport : </label>
                <select name="to_air" id="to_air">
                <%
                for (int i = 0;i < airports.length;i++)
                    out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                %>   
                </select>
				<br />
				<label for="to_date">Date</label>
				<input type="text" id="to_date" />
				</span>
				<input type="submit" value="Search!">
                </form>
</div>
<%@ include file="Footer.jsp" %>
	</body>
</html>
