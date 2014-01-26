<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Home</title>
		<link rel="shortcut icon" href="Resources/favicon.ico" type="image/x-icon" />
		<link rel="icon" href="Resources/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
                <link rel="stylesheet" type="text/css" href="./StyleSheets/popupbox.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/MainContent.css" />
		<!--External-->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<!-- /External -->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
		<script src="Scripts/login.js"></script>
		<script src="Scripts/Date.js"></script>
		<script src="Scripts/logout.js"></script>
</head>
<body>
<%@ include file="Includes/Header.jsp" %>
<%@ include file="Includes/popuplogin.jsp" %>
<div id="container">
<%@ include file="cred/DBConnectCrede.jsp" %>
<%
        Statement airportsstatement = DBCon.createStatement();
        ResultSet rsairport = airportsstatement.executeQuery("SELECT * from port");
	rsairport.last();int size = rsairport.getRow();rsairport.first();
	String[] airports = new String[size];
	if (rsairport.first())
	{
	airports[0] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
	for(int i = 1; rsairport.next(); i++ ) 
		airports[i] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
	}%>
	
                <form method="get" action ="results.jsp">
                <input type="hidden" name ="service" value="fly">
				<span id="from" class="Left">
				<h1>From</h1>
				<label for="from_air">Airport : </label>
                <select name="from_air" title="The airport you want to fly from." id="from_air">
                <%
                for (int i = 0;i < airports.length;i++)
                    out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                %>   
                </select>
				<br />
				<label for="from_date">Date : </label>
				<input type="text" title="The date you want to fly.&#013;If you want results for a range of dates, also fill the 'to' date field." required="required" name="date" id="from_date" />
				</span>
				<span id ="to" class="Right">
				<h1>To</h1>
                <label for="to_air">Airport : </label>
                <select name="to_air" title="The airport you want to fly to." id="to_air">
                <%
                for (int i = 0;i < airports.length;i++)
                    out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                %>   
                </select>
				<br />
				<label for="to_date">Date : </label>
				<input type="text" title="Fill this field in case you want to&#013;search for a range of dates." id="to_date" />
				</span>
				<input class="Center" title="Search for a flight matching your criteria." type="submit" value="Search!">
                </form>
			</div>
	<%@ include file="Includes/Footer.jsp" %>
	</body>
</html>
