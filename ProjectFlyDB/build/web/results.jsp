<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >

	<head>
        <title>Fly Me To The Moon - Results</title>
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
      
  function login(showhide){
     if(showhide === "show"){
        document.getElementById('popupbox').style.visibility="visible";
        }else if(showhide === "hide"){
        document.getElementById('popupbox').style.visibility="hidden"; 
    }
  }
  function logout(){
        document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
        window.location="index.jsp";
  }
  </script>
</head>

    <body>

		<header>
			<nav>
				<span class="Left"><a href="index.jsp">Home</a></span>
                                <%
                                    Cookie allcookies[] = {};
                                    if(request.getCookies() != null)
                                        allcookies= request.getCookies();
                                    int userfound = 0;
                                    for (int i = 0;i < allcookies.length;i++)
                                       if (allcookies[i].getName().equals("username"))
                                           userfound=i;
                                    
                                if(userfound!=0) {
                                    out.println("<span class=\"Right\">Welcome <a href=\"usercp.jsp\">" + allcookies[userfound].getValue() + "! </a>");
                                    out.println("<a href=\"javascript:logout();\">Logout</a></span>"); } else {
                                %> 
                                <span class="Right"><a href="javascript:login('show');">Log In</a></span>
                                <%
                                }
                                %>
				
			</nav>
		</header>

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
                
                 <%
		 Class.forName("com.mysql.jdbc.Driver");
                 String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                 Connection DBCon = DriverManager.getConnection(DBConStr);
                 Statement search = DBCon.createStatement();
                 Statement provider = DBCon.createStatement();
                 
                 int typeofservice = 0;
                 if(request.getParameter("service").equals("fly")) typeofservice = 1; 
                 switch(typeofservice) {
                     case 1:
                                String from_air = request.getParameter("from_air");
                                String to_air = request.getParameter("to_air");
                                String date = request.getParameter("date");
                                out.println("<BR><BR><BR><BR>Now showing results for:<BR> From: "+from_air+"<BR>To: " + to_air + "<BR> On date: " + date + "<BR>");
                                
                                {int comma = from_air.lastIndexOf(',');from_air = from_air.substring(comma+2);};
                                {int comma = to_air.lastIndexOf(',');to_air = to_air.substring(comma+2);};

                                ResultSet rsfly = search.executeQuery("SELECT * FROM flight WHERE from_port='" + from_air + "' AND to_port='" + to_air + "' AND DATE(datetime) = '" + date + "'" );
                                %>
                                
                                <form name="flightform" method="get" action="checkout.jsp">
                                  
                                <%
                                while (rsfly.next()) {
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
                                } %>
                                <BR>
                                    
                                <input type="submit" value="Continue">
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
		<footer>
			<span class="Right"><a href="https://github.com/Tassosg1/ProjectWebDBinterface" rel="author">Source</a></span>
		</footer>

	</body>
</html>
