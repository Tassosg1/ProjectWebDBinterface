<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Fly Me To The Moon - Results</title>
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
<div id="container">
<%@ include file="cred/DBConnectCrede.jsp" %>
<%
                 Statement search = DBCon.createStatement();
                 Statement provider = DBCon.createStatement();
                 
                 int typeofservice = 0;
                 int isNotEmpty=0;
				 int LeftOrRight=0;
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
                                
                                out.println("Now showing results for:<br /> Departure: "+from_air+"<br /> Arrival: " + to_air + "<br /> On date: " + date);
                                
                                {int comma = from_air.lastIndexOf(',');from_air = from_air.substring(comma+2);};
                                {int comma = to_air.lastIndexOf(',');to_air = to_air.substring(comma+2);};

                                ResultSet rsfly = search.executeQuery("SELECT * FROM flight WHERE from_port='" + from_air + "' AND to_port='" + to_air + "' AND CAST(datetime AS DATE) = '" + date + "'" );
                                %>
                                
                                <form name="flightform" method="get" action="checkout.jsp">
                                  
                                <%
                                
                                if (rsfly.next())
								{
                                    isNotEmpty=1;
                                    LeftOrRight=1;
									while (true)
									{
									%>
									<span class="<% if((LeftOrRight%2)==1) out.println("Left"); else out.println("Right"); %>" >
									<%
										out.println("<h1>Flight : #" + rsfly.getInt("id") + ":</h1>");
										out.println("Departure Airport : " + rsfly.getString("from_port") + "<br />");
										out.println("Arrival Airport : " + rsfly.getString("to_port") + "<br />");
										out.println("Time of Departure : " + rsfly.getString("datetime") + "<br />");
										out.println("Available Seats : " + rsfly.getInt("seats") + "<br />");
										out.println("Total cost is : " + rsfly.getInt("cost") + "<br />");
										ResultSet rsprovider = provider.executeQuery("SELECT name FROM flightcom WHERE vat=" + rsfly.getInt("vat"));
										rsprovider.first();
										out.println("Flight provided by : " + rsprovider.getString("name") + "<br />");
										if (rsfly.getInt("seats") == 0) out.println("There are no seats left on this flight.");
										else out.println("<input type=\"radio\" required=\"required\" name=\"flight\" value=\"" + rsfly.getInt("id") + "\">");
										%>
										</span>
										<%
										if ((LeftOrRight%2)==1) out.println("<br />");
										LeftOrRight++;
										if(!rsfly.next())break;
									}
                                }
								else
									out.println("<h1> No flights were found. Try changing your search criteria.</h1>");
                                if(isNotEmpty==1)
								{
									out.println("<input class=\"Center\" type=\"submit\" value=\"Continue\">");
                                }
								%>
								</form>
								<%
								break;
                     case 2:
                         //Implement car results
                                break;
                     case 3:
                         //Implement room results chWchwchw
                                break;
                 }
%>
</div>
<%@ include file="Includes/Footer.jsp" %>
	</body>
</html>
