<%-- 
    Document   : verify
    Created on : Apr 28, 2013, 7:37:21 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
    </head>
    <body>
    <CENTER>
        <img src="./Images/songicon.jpg">
        <HR>
        <form method="get" action="results.jsp">
            <input type="text" autofocus="autofocus" required="required" size="50" name="query"> <a href="advsearch.jsp"> <small>Σύνθετη Αναζήτηση</small> </a> <BR><BR>
            <input type="submit" value="Advanced Search"> 
        </form> 
        <h6>  <a  href="login.jsp"> Are you a musician? Log in here! </a> </h6> <BR>
    </center>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        String DBConStr = "jdbc:mysql://localhost:3306/ProjectDB?user=root&password=25139745";
        Connection DBCon = DriverManager.getConnection(DBConStr);
        Statement smalb = DBCon.createStatement();
        Statement smson = DBCon.createStatement();
        Statement smorg = DBCon.createStatement();
        ResultSet rssong = smalb.executeQuery("SELECT * FROM songs WHERE  title LIKE '%" + request.getParameter("query") + "%'");
        if (rssong.first()) {
            while (true) {

                int AlbumTitle = rssong.getInt("albumid");
                out.println("<HR><p id=\"song\">" + rssong.getString("title") + "</p>");
                ResultSet rsalbum = smson.executeQuery("SELECT * FROM album WHERE albumid = " + AlbumTitle);
                if (rsalbum.first()) {
                    while (true) {
                        out.println("<p id=\"alb\"> Albums this song has appeared:<BR>");
                        out.println(rsalbum.getString("title") + "</p>");
                        if (!rsalbum.next()) {
                            break;
                        }
                    }
                }
                ResultSet rssmorg = smorg.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));
                if (rssmorg.first()) {
                    out.println("<p id=\"org\"> A list of the organs played follows. <BR>");
                    while (true) {
                        Statement orgtitle = DBCon.createStatement();
                        Statement afmname = DBCon.createStatement();
                        ResultSet nameofm = afmname.executeQuery("SELECT * from musician where afm=" + rssmorg.getInt("afm"));
                        ResultSet titleorg = orgtitle.executeQuery("SELECT * from organs where orgid=" + rssmorg.getInt("orgid"));
                        nameofm.first();
                        titleorg.first();
                        String mus = nameofm.getString("surname") + ", " + nameofm.getString("name");
                        String org = titleorg.getString("orgname");
                        out.println(org + " : \t " + mus + ". <BR>");
                        if (!rssmorg.next()) {
                            break;
                        }
                    }
                    out.println("<BR> </p>");

                }
                out.println("<iframe width=\"310\" height=\"280\" src=\"http://www.youtube.com/embed/" + rssong.getString("media") + "?rel=0\" frameborder=\"0\" allowfullscreen></iframe>");

                if (!rssong.next()) {
                    break;
                }

            }

        }
    %>
</body>
</html>