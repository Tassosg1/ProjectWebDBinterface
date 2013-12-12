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
        <title> Υπηρεσία Σύνθετης Αναζήτησης MyTube </title>
    </head>
    <body>
    <CENTER>
        <img src="./Images/songicon.jpg">
        <HR>
        <form method="get" action="advsearchres.jsp">
            <input type="radio" name="sel" value="album">  Μουσικά Άλμπουμ
            <input type="radio" name="sel" value="organs"> Μουσικά Όργανα 
         <BR> <a href="index.jsp"> <small>Πίσω στην κανονική αναζήτηση</small> </a> <BR><BR>
         <input type="submit" value="Αναζήτηση"> 
        </form>
    </center>
    
    
    <BR>
    <BR>
</body>
</html>
