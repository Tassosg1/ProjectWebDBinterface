<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >

	<head>
        <title>Fly Me To The Moon - Checkout</title>
		<link rel="stylesheet" type="text/css" href="./StyleSheets/generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
                <!-- PLEASE mind the case-sensitivity (Glassfish©). Use the format recommended ^ -->
                <!--<link rel="stylesheet" type="text/css" href="Stylesheets/index.css" />-->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
    </head>

    <body>

		<header>
			<nav>
				<span class="Left"><a href="index.xhtml">Home</a></span>
				<span class="Right"><a href="login.jsp">Log In</a></span>
			</nav>
		</header>

		<!-- Here goes the Checkout page. The user sees a summary of the flight, and aggrees to commit the buy. The page can only point to commit.jsp
                     As a reminder, the strings for getting data from MySQL database are (the database formed by the updated script):
                     Class.forName("com.mysql.jdbc.Driver");
                     String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                     Connection DBCon = DriverManager.getConnection(DBConStr);
                     Statement airports = DBCon.createStatement();
                     ResultSet rsairporst = albums.executeQuery("SELECT * from airport");
                     From there on, several java functions (.first(),.next()) help you manage the results, and functions like (rsairport.getString("airport") to access them.
                -->
                     
        
		<footer>
			<span class="Right"><a href="https://github.com/Tassosg1/ProjectWebDBinterface" rel="author">Source</a></span>
		</footer>

	</body>
</html>
