<%@page import="java.sql.*"%>
<html>
	<head>
<title>Fly Me To The Moon - Index</title>
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
    <BR>
</div> 
       
        
		<!-- Here goes the Index (Search) page. The dropdown boxes (airports) are filled with the lines from the table port_country, field 'airport'.
                     As a reminder, the strings for getting data from MySQL database are (the database formed by the updated script):
                     Class.forName("com.mysql.jdbc.Driver");
                     String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                     Connection DBCon = DriverManager.getConnection(DBConStr);
                     Statement airports = DBCon.createStatement();
                     ResultSet rsairporst = albums.executeQuery("SELECT * from airport");
                     From there on, several java functions (.first(),.next()) help you manage the results, and functions like (rsairport.getString("airport") to access them.
                      -->
                <%
                 Class.forName("com.mysql.jdbc.Driver");
                 String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                 Connection DBCon = DriverManager.getConnection(DBConStr);
                 Statement airportsstatement = DBCon.createStatement();
                 ResultSet rsairport = airportsstatement.executeQuery("SELECT * from port");
                 rsairport.last();int size = rsairport.getRow();rsairport.first();
                 String[] airports = new String[size];
                    if (rsairport.first()) {
                              airports[0] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
                              for(int i = 1; rsairport.next(); i++ ) 
                                 airports[i] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
                    }
                %>
                <BR><BR><BR>
                <h3>From airport:</h3>
                <form method="get" action ="results.jsp">
                    <select name="from_air">
                     <%
                       for (int i = 0;i < airports.length;i++)
                            out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                     %>   
                    </select>
                <BR><BR><BR>
                <h3>To airport:</h3>
                    <select name="to_air">
                      <%
                       for (int i = 0;i < airports.length;i++)
                            out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                      %>   
                    </select>
                    <BR>
                    <input type="hidden" name="date" value="2013-12-25">
                    <input type="hidden" name="service" value="fly">
                    <input type="submit" value="Search!">
                </form>
                    <h5> Date of departure is 25/12/13 </h5>
                
                
		<footer>
			<span class="Right"><a href="https://github.com/Tassosg1/ProjectWebDBinterface" rel="author">Source</a></span>
		</footer>

	</body>
</html>
