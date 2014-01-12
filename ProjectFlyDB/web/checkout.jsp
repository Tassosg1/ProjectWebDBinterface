<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >

	<head>
        <title>Fly Me To The Moon - Checkout</title>
				<link rel="stylesheet" type="text/css" href="./StyleSheets/generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
                <link rel="stylesheet" type="text/css" href="./StyleSheets/popupbox.css" />
                <!-- PLEASE mind the case-sensitivity (Glassfish©). Use the format recommended ^ -->
                <!--<link rel="stylesheet" type="text/css" href="Stylesheets/index.css" />-->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
                 
  <script language="JavaScript" type="text/javascript">  
    function check(cookiename){
        var name = cookiename + "=";
        var found = 0;
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) 
        {
            var c = ca[i].trim();
            if (c.indexOf(name)===0) {
                found = 1;
            }
        }
        if(found===0) {
            window.alert("You must be logged in in order to continue.");
            window.history.back();
        }
  }
  function logout(){
        document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
        window.location="index.jsp";
  }
  </script>
</head>

    <body onload="javascript:check('username');">

		<header>
			<nav>
				<span class="Left"><a href="index.jsp">Home</a></span>
                                <%
                                    Cookie allcookies[] = {};
                                    String username = null;
                                    allcookies= request.getCookies();
                                    for (int i = 0;i < allcookies.length;i++)
                                       if (allcookies[i].getName().equals("username")) {
                                    username = allcookies[i].getValue();
                                    out.println("<span class=\"Right\">Welcome <a href=\"usercp.jsp\">" + allcookies[i].getValue() + "! </a>");
                                    out.println("<a href=\"javascript:logout();\">Logout</a></span>"); }
                                %>
				
			</nav>
		</header>
<%
                 Class.forName("com.mysql.jdbc.Driver");
                 String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                 Connection DBCon = DriverManager.getConnection(DBConStr);
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
