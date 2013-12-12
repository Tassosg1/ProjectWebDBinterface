<%-- 
    Document   : verify
    Created on : Apr 22, 2013, 7:37:21 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verifying...</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String DBConStr = "jdbc:mysql://localhost:3306/ProjectDB?user=root&password=25139745";
            Connection DBCon = DriverManager.getConnection(DBConStr);
            Statement sm = DBCon.createStatement();
            ResultSet rsuser = sm.executeQuery("SELECT * FROM musician WHERE  afm = '" + request.getParameter("un") + "'");
            if (!rsuser.first()) {
                 out.println("A musician with your credentials could not be found in our records.");
            } else if (rsuser.getString("password").equals(request.getParameter("pw"))) {
                out.println("You are being redirected. Please wait...");
                response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("un"));
            } else {
                out.println("Wrong Password. Please press 'back' and try again.");
            }
            sm.close();
            DBCon.close();
        %>
    </body>
</html>