<%-- 
    Document   : newsomething
    Created on : May 17, 2013, 9:38:30 PM
    Author     : StormRider
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifying Values...</title>
    </head>
    <body>
        <%  Class.forName("com.mysql.jdbc.Driver");
            String DBConStr = "jdbc:mysql://localhost/projectdb?user=root&password=25139745";
            Connection DBCon = DriverManager.getConnection(DBConStr);
            Statement sm = DBCon.createStatement();

            if (request.getParameter("delalbum") != null) {
                sm.executeUpdate("DELETE FROM album WHERE albumid=" + request.getParameter("delalbum"));
                response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
            } else if (request.getParameter("delsong") != null) {
                sm.executeUpdate("DELETE FROM songs WHERE songid=" + request.getParameter("delsong"));
                response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
            }
            sm.close();

        %>
    </body>
</html>
