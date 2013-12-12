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
        <title>Advanced Search Results</title>
    </head>
    <body>
    <CENTER>
        <a href="./index.jsp"> <img src="./Images/songicon.jpg" alt="Image Missing." > </a>
        <HR>
        <form method="get" action="advsearchres.jsp">
            <input type="radio" name="sel" value="album" required="required">  Albums
            <input type="radio" name="sel" value="organs"> Organs 
            <BR> <a href="index.jsp"> <small>Back to normal search</small> </a> <BR><BR>
            <input type="submit" value="Search">

        </form>
    </center>
    
    
    <BR>
    <BR>
</body>
</html>
