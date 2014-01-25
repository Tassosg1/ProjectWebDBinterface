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
<body>
<%@ include file="Header.jsp" %>
<%@ include file="popuplogin.jsp" %>
		<!-- Here goes the user Control Panel page. From here a user can change his details. Maybe view his flights, maybe cancel them. Dunno.
                     As a reminder, the strings for getting data from MySQL database are (the database formed by the updated script):
                     Class.forName("com.mysql.jdbc.Driver");
                     String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                     Connection DBCon = DriverManager.getConnection(DBConStr);
                     Statement airports = DBCon.createStatement();
                     ResultSet rsairporst = albums.executeQuery("SELECT * from airport");
                     From there on, several java functions (.first(),.next()) help you manage the results, and functions like (rsairport.getString("airport") to access them.
                     
                -->
                <BR><BR><BR>
                <center>This is your control panel. From here you can change your data, or cancel your flights.
                <HR>
<%@ include file="cred/DBConnectCrede.jsp" %>  
                <%
                 Statement userstatement = DBCon.createStatement();
                 Statement ccstatement = DBCon.createStatement();
                 Statement flightstatement = DBCon.createStatement();
                 String username = "";
                 Cookie allcookies[] = {}; if(request.getCookies() != null) allcookies = request.getCookies();
                  for (int i = 0;i < allcookies.length;i++)
                      if (allcookies[i].getName().equals("username")) {
                            username = allcookies[i].getValue();
                                       }                
                ResultSet rsuser = userstatement.executeQuery("SELECT * from user WHERE username='" + username + "'");
                rsuser.first();
                out.println("<form method=\"get\" action=\"changesth.jsp\"><BR><BR>");
                out.println("Username: <input type=\"text\" name=\"username\" disabled=\"disabled\" value=\""+ username +"\"<BR><BR><BR>");
                out.println("Password: <input type=\"password\" required=\"required\" name=\"password\" value=\"" + rsuser.getString("password") + "\"><BR><BR>");
                out.println("Name: <input type=\"text\" name=\"name\" required=\"required\" value=\"" + rsuser.getString("name") + "\"> <BR><BR>");
                out.println("Telephone: <input type=\"number\" name=\"tel\" value=\"" + rsuser.getString("telephone") + "\"> <BR><BR>");
                out.println("<input type=\"hidden\" name=\"type\" value=\"user\">");
                
                out.println("<input type=\"submit\" value=\"Update!\">");
                out.println("</form><BR><BR> ");
                
                
                
                out.println("<h2>Credit Cards: </h2> <form name=cc ");
                ResultSet cc = ccstatement.executeQuery("SELECT * FROM cc WHERE username='" + username + "'");
                
                while(cc.next()) {
                    out.println("<form name=\"cc\" action=\"deletesth.jsp\">");
                    out.println("<input readonly=\"readonly\" name=\"ccnum\" type=\"text\" value=\"" + cc.getString("ccnum") + "\"></option>");
                    out.println("<input type=\"submit\" value=\"Delete CC\">");
                    out.println("</form><BR>");
                }
                
                out.println("Add a new credit card:<BR><BR>");
                out.println("<form action=\"addsth.jsp\"> <input name=\"ccnum\" type=\"number\" min=\"1111111111111111\" max=\"9999999999999999\" value=\"1111222233334444\"> - "
                        + "<input type=\"number\" name=\"ccver\" size=\"3\" min=\"0\" max=\"999\" value=\"123\"><input type=\"submit\" value=\"Add\"></form><BR><BR>");
                
                
                out.println("<HR><h2> My Flights </h2><BR>");
                ResultSet flights = flightstatement.executeQuery("SELECT * from bookings WHERE username='" + username + "'");
                if(!flights.first()) out.println("You haven't booked any flights.");
                else while(true) {
                    Statement whatflightstatement = DBCon.createStatement();
                    ResultSet whatflight = whatflightstatement.executeQuery("SELECT * from flight WHERE id=" + flights.getInt("id"));
                    whatflight.first();
                    out.println("<form method=\"get\" action=\"deletesth.jsp\" > ");
                    out.println("You have booked a flight from " + whatflight.getString("from_port") + " to " + whatflight.getString("to_port") + " on " + whatflight.getString("datetime"));
                    out.println("<BR> <input type=\"submit\"value=\"I won't be able to attend.\">");
                    out.println("<input type=\"hidden\" name=\"flight\" value=\"" + flights.getInt("id") + "\">");
                    out.println("<input type=\"hidden\" name=\"seat\" value=\"" + flights.getInt("seat") + "\">");
                    out.println("</form><BR><BR>");
                    if(!flights.next()) {break;};
                }
                
                %>
<%@ include file="Footer.jsp" %>
	</body>
</html>
