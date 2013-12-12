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

            if (request.getParameter("newtitle") != null) {

                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                sm.executeUpdate("INSERT INTO album VALUES(0" /* + request.getParameter("newalbumid") + */ + ", '" + request.getParameter("newtitle") + "','" + dateFormat.format(date) + "', " + request.getParameter("afm") + ")");
                response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
            } else if (request.getParameter("songtoaddorg") != null) {
                
                Statement addorg = DBCon.createStatement();
                addorg.executeUpdate("INSERT INTO song_mus_org VALUES(" + request.getParameter("songtoaddorg") + ", '" + request.getParameter("orgplay") + "'," + request.getParameter("organ") + ")");
                response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
                addorg.close();
            }
            else {
                String genre = "";
                Statement gen = DBCon.createStatement();
                Statement sellyr = DBCon.createStatement();
                Statement genlyr = DBCon.createStatement();

                ResultSet Genres = gen.executeQuery("SELECT * FROM genres");
                for (int i = 0; Genres.next(); i++) {
                    if (i == Integer.parseInt(request.getParameter("newgenre"))) {
                        genre = Genres.getString("genre");
                    }
                }
                sm.executeUpdate("INSERT INTO songs VALUES (NULL" /* + request.getParameter("newsongid") + */ + "," + request.getParameter("newsongalbumid") + ",'" + request.getParameter("newsongtitle") + "','" + genre + "' ,'" + request.getParameter("newsongmedia") + "')");
                ResultSet lyr = sellyr.executeQuery("SELECT * FROM songs WHERE title = '" + request.getParameter("newsongtitle") + "'");
                lyr.first();
                if (!request.getParameter("newsonglyrics").isEmpty())
                genlyr.executeUpdate("INSERT INTO song_mus_org VALUES (" + lyr.getInt("songid") + ", '" + request.getParameter("newsonglyrics") + "', 1)");
                gen.close();
                sellyr.close();
                genlyr.close();
                response.sendRedirect("musiciancp.jsp?afm=" + request.getParameter("afm"));
            }
            sm.close();
            

        %>
    </body>
</html>
