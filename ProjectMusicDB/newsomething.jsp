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
                String DBConStr = "jdbc:mysql://localhost:3306/ProjectDB?user=root&password=25139745";
                Connection DBCon = DriverManager.getConnection(DBConStr);
                Statement sm = DBCon.createStatement();

                if (request.getParameter("newalbumid") != null) {

                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = new Date();
                    sm.executeUpdate("INSERT INTO album VALUES(" + request.getParameter("newalbumid") + ", '" + request.getParameter("newtitle") + "','" + dateFormat.format(date) + "', " + request.getParameter("afm") + ")");
                    response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
                    
                } else  {
                    sm.executeUpdate("INSERT INTO songs VALUES (" + request.getParameter("newsongid") + "," + request.getParameter("newsongalbumid") + ",'" + request.getParameter("newsongtitle") + "','" + request.getParameter("newgenre") + "','" + request.getParameter("newsonglyrics") + "','" + request.getParameter("newsongmedia") + "')");
                   response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
                }

            
        %>
    </body>
</html>
