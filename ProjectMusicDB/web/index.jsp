<%-- 
    Document   : index
    Created on : Apr 22, 2013
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> MyTube </title>
    </head>
    <body>
        
    <CENTER>
        <a href="./index.jsp"> <img src="./Images/songicon.jpg" alt="Image Missing." > </a>
        <HR>
        <form method="get" action="results.jsp">
            <input type="text" autofocus="autofocus" required="required" size="50" name="query"> <a href="advsearch.jsp"> <small>Advanced Search</small> </a> <BR><BR>
            <input type="submit" value="Search!"> 
        </form>
        <h6>  <a  href="login.jsp"> Are you a musician? Log in here! </a> </h6> 

    </center>

</body>
</html>
