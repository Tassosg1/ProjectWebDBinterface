<%-- 
    Document   : index
    Created on : Apr 22, 2013, 7:17:40 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Musician Login</title>
        <link rel="stylesheet" type="text/css" href="style.css"> 
    </head>
    <body>
        <h2>Welcome!</h2>
        <HR>
            Enter your VAT number and your password provided to continue. <BR>
            For any problem don't hesitate to contact the system administrator.<BR><BR>
        <form method="get" action="verify.jsp">
            VAT: <input type="text" required="required" name="un"> <BR><BR>
            Password: <input type="password" required="required" name="pw"> <BR> <BR>
            <input type="submit" value="Login">
        </form>
      
</body>
</html>
