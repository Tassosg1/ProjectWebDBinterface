<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
    </head>

    <body>
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
			%>
<%@ include file="cred/DBConnectCrede.jsp" %>
			<%
            //FIRST WE CHECK FOR THE CCVER NUMBER
            Statement cc = DBCon.createStatement();
            Statement book = DBCon.createStatement();
            Statement dest = DBCon.createStatement();
            ResultSet destination = dest.executeQuery("SELECT to_port FROM flight WHERE id=" + request.getParameter("flight"));
            destination.first();
            ResultSet rscc = cc.executeQuery("SELECT ccver FROM cc WHERE ccnum=\"" + request.getParameter("ccnum") + "\"");
            rscc.first();
            if (request.getParameter("ccver").equals(String.valueOf(rscc.getInt("ccver")))) {
                // paywithcreditcard();
                book.executeUpdate("INSERT INTO bookings VALUES(" + request.getParameter("flight") + ",'" + username + "',0)");
                // trigger to decrease seats in DB
                out.println("Your purchase was a success. You are being redirected...");
                response.sendRedirect("success.jsp?destination=" + destination.getString("to_port"));
            } else {
                out.println("The verification number you entered was incorrect.");
            }










        %>
    </body>
</html>
