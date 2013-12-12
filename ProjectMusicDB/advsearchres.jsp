<%-- 
    Document   : verify
    Created on : Apr 28, 2013, 7:37:21 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Search Results</title>
    </head>
    <body>
    <CENTER>
        <img src="./Images/songicon.jpg" alt="Image Missing." >
        <HR>
        <form method="get" action="advsearchres.jsp">
            <input type="radio" name="sel" value="album" required="required">  Albums
            <input type="radio" name="sel" value="organs"> Organs 
            <BR> <a href="index.jsp"> <small>Back to normal search</small> </a> <BR><BR>
            <input type="submit" value="Αναζήτηση">

        </form>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            String DBConStr = "jdbc:mysql://localhost:3306/ProjectDB?user=root&password=25139745";
            Connection DBCon = DriverManager.getConnection(DBConStr);
            Statement albums = DBCon.createStatement();
            if ((request.getParameter("sel") != null && request.getParameter("sel").equals("album")) || (request.getParameter("albums") != null)) {
                int i = 1;
                ResultSet rsalbum = albums.executeQuery("SELECT * from album");
                if (rsalbum.first()) {
                    out.println("<form method=\"get\" action=\"advsearchres.jsp\">");
                    out.println("<select name=\"albums\"> ");
                    out.println("<option value=\" 0 \">  </option> ");
                    while (true) {
                        out.println("<option value=\"" + i + "\">" + rsalbum.getString("title") + "</option> ");
                        i++;
                        if (!rsalbum.next()) {
                            break;
                        }
                    }
                    out.println("</select>");
                    out.println("<input type=\"submit\" value=\"Περισσότερα...\"");
                    out.println("</form>");
                    out.println("<BR>");
                    out.println("<BR>");

                }
            } else if (request.getParameter("sel") != null && request.getParameter("sel").equals("organs")) {
            }
            if (request.getParameter("albums") != null) {

                int id = Integer.parseInt(request.getParameter("albums"));
                ResultSet rsalbum = albums.executeQuery("SELECT * from album where albumid = " + id);
                rsalbum.first();
                out.println("The name of the album is: " + rsalbum.getString("title"));


            }
        %>
    </center>
</body>
</html>