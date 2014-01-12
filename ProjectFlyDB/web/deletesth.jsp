<%-- 
    Document   : addsth
    Created on : Dec 22, 2013, 2:04:59 AM
    Author     : StormRider
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/JavaScript">
        function timedRedirect() {
            setTimeout("window.location=\"index.jsp\";",4000);
        }
    </script>
    
    <body onload="javascript:timedRedirect();">
        <%
                Cookie allcookies[] = {};
                if (request.getCookies() != null) {
                allcookies = request.getCookies();
                }
                String username = null;
                for (int i = 0; i < allcookies.length; i++) {
                     if (allcookies[i].getName().equals("username")) {
                            username = allcookies[i].getValue();
                    }
                }
            
                 Class.forName("com.mysql.jdbc.Driver");
                 String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                 Connection DBCon = DriverManager.getConnection(DBConStr);
                 Statement removestatement = DBCon.createStatement();
                 
                 ResultSet 
                 
                 
        %>
    </body>
</html>
