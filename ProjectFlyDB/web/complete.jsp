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
            Class.forName("com.mysql.jdbc.Driver");
            String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
            Connection DBCon = DriverManager.getConnection(DBConStr);
            //FIRST WE XHECK FOR THE CCVER NUMBER
            Statement cc = DBCon.createStatement();
            Statement book = DBCon.createStatement();
            ResultSet rscc = cc.executeQuery("SELECT ccver FROM cc WHERE ccnum=\"" + request.getParameter("ccnum") + "\"");
            rscc.first();
            if (request.getParameter("ccver").equals(String.valueOf(rscc.getInt("ccver")))) {
                // paywithcreditcard();
                book.executeUpdate("INSERT INTO bookings VALUES(" + request.getParameter("flight") + ",'" + username + "',0)");
                // trigger to decrease seats in DB
                out.println("Your purchase was a success. You are being redirected...");
                response.sendRedirect("success.jsp");
            } else {
                out.println("The verification number you entered was incorrect.");
            }










        %>
    </body>
</html>
