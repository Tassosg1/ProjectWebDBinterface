<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >

	<head>
        <title>Fly Me To The Moon - Verifying</title>
                <link rel="stylesheet" type="text/css" href="./StyleSheets/generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
                <!-- PLEASE mind the case-sensitivity (Glassfish�). Use the format recommended ^ -->
                <!--<link rel="stylesheet" type="text/css" href="Stylesheets/index.css" />-->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
    </head>

<script type="text/JavaScript">
function timedRedirect() {
	setTimeout("window.location=\"index.jsp\";",4000);
}
</script>
    
    <body onload="javascript:timedRedirect();">

		<header>
			<nav>
				<span class="Left"><a href="index.jsp">Home</a></span>
			</nav>
		</header>
<BR>
<BR>		
                <%
                 Class.forName("com.mysql.jdbc.Driver");
                 String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                 Connection DBCon = DriverManager.getConnection(DBConStr);
                 Statement userstatement = DBCon.createStatement();
                 ResultSet rsuser = userstatement.executeQuery("SELECT * from user WHERE username='" + request.getParameter("username") + "'");
                 if(rsuser.first()) {
                     if (request.getParameter("password").equals(rsuser.getString("password"))) {
                         out.println("Login Successfull. You are now being redirected...");
                         response.addCookie(new Cookie("username",request.getParameter("username")));
                     } else out.println("Incorect Password.<BR>Please try again.");
                 } else {
                     out.println("This user ("+request.getParameter("username")+") does not exist.<BR> Please try again or contact the admin.");
                 }
                %>
        
		<footer>
			<span class="Right"><a href="https://github.com/Tassosg1/ProjectWebDBinterface" rel="author">Source</a></span>
		</footer>

	</body>
</html>