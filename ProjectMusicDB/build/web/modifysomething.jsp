<%-- 
    Document   : modifysomething
    Created on : May 22, 2013, 7:27:31 PM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
        <% Class.forName("com.mysql.jdbc.Driver");
            String DBConStr = "jdbc:mysql://localhost/projectdb?user=root&password=25139745";
            Connection DBCon = DriverManager.getConnection(DBConStr);
            Statement sm = DBCon.createStatement();
            
            String genre = "";
            Statement gen = DBCon.createStatement();
            ResultSet Genres = gen.executeQuery("SELECT * FROM genres");
            for (int i = 0; Genres.next(); i++) {
                if (i == Integer.parseInt(request.getParameter("modgenre"))) {
                    genre = Genres.getString("genre");
                }
            }
            
            sm.executeUpdate("UPDATE songs SET title='" + request.getParameter("modtitle") + "', albumid=" + request.getParameter("modalbum") + ", media='" + request.getParameter("modmedia") + "', genre='" + genre + "' WHERE songid=" + request.getParameter("newsongmod"));
            response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
            
            sm.close();
            gen.close();
            
       %>
        // UPDATE TABLE songs SET albumid= ,    title =     , lyrics =      , media =          WHERE songid = PRMTR
    </body>
</html>
