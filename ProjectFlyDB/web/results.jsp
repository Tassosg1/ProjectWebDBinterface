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
<%@ include file="cred/DBConnectCrede.jsp" %>
				<%
                 Statement search = DBCon.createStatement();
                 Statement provider = DBCon.createStatement();
                 
                 int typeofservice = 0;
                 int isEmpty=0;
                 if(request.getParameter("service").equals("fly")) typeofservice = 1; 
                 switch(typeofservice) {
                     case 1:
                                String from_air = request.getParameter("from_air");
                                String to_air = request.getParameter("to_air");
                                String date = request.getParameter("date");
                                
                                //DATE MANIPULATION
                                // Comes: 25/12/2013 Expects: 2013/12/25
                                
                                String[] dateFragments = date.split("/");
                                date = "";
                                date = date.concat(dateFragments[2] + "/" + dateFragments[0] + "/" + dateFragments[1]);
                                
                                out.println("<BR><BR><BR><BR>Now showing results for:<BR> From: "+from_air+"<BR>To: " + to_air + "<BR> On date: " + date + "<BR>");
                                
                                {int comma = from_air.lastIndexOf(',');from_air = from_air.substring(comma+2);};
                                {int comma = to_air.lastIndexOf(',');to_air = to_air.substring(comma+2);};

                                ResultSet rsfly = search.executeQuery("SELECT * FROM flight WHERE from_port='" + from_air + "' AND to_port='" + to_air + "' AND CAST(datetime AS DATE) = '" + date + "'" );
                                %>
                                
                                <form name="flightform" method="get" action="checkout.jsp">
                                  
                                <%
                                
                                if (rsfly.next()) {
                                    isEmpty=1;
                                    while (true) {
                                    out.println("<BR><h3>Flight details:</h3>");
                                    out.println("From port: " + rsfly.getString("from_port") + "<BR>");
                                    out.println("To port: " + rsfly.getString("to_port") + "<BR>");
                                    out.println("Time of flight: " + rsfly.getString("datetime") + "<BR>");
                                    out.println("Available Seats: " + rsfly.getInt("seats") + "<BR>");
                                    out.println("Total cost is " + rsfly.getInt("cost") + "<BR>");
                                    ResultSet rsprovider = provider.executeQuery("SELECT name FROM flightcom WHERE vat=" + rsfly.getInt("vat"));rsprovider.first();
                                    out.println("This flight is brought to you by " + rsprovider.getString("name") + "<BR>");
                                    if (rsfly.getInt("seats") == 0) {out.println("There are no seats left on this flight.");continue;}
                                    out.println("<input type=\"radio\" required=\"required\" name=\"flight\" value=\"" + rsfly.getInt("id") + "\">");
                                    if(!rsfly.next()) break;
                                    }
                                } else out.println("<h3> No flights were found. Try changing your search criteria.</h3>");
                                   
                                
                                if(isEmpty==1) {
                                out.println("<BR><input type=\"submit\" value=\"Continue\">");
                                out.println("</form>");
                                }
                         
                         
                         
                                break;
                     case 2:
                         //Implement car results
                                break;
                     case 3:
                         //Implement room results chWchwchw
                                break;
                 }
                     
                 %>
<%@ include file="Footer.jsp" %>
	</body>
</html>
