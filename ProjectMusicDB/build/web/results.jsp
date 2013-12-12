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
        <a href="./index.jsp"> <img src="./Images/songicon.jpg" alt="Image Missing." > </a>
        <HR>
        <form method="get" action="results.jsp">
            <input type="text" autofocus="autofocus" required="required" size="50" name="query"> <a href="advsearch.jsp"> <small>Advanced Search</small> </a> <BR><BR>
            <input type="submit" value="Search"> 
        </form> 
        <h6>  <a  href="login.jsp"> Are you a musician? Log in here! </a> </h6> <BR>
    </center>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        String DBConStr = "jdbc:mysql://localhost/projectdb?user=root&password=25139745";
        Connection DBCon = DriverManager.getConnection(DBConStr);
        Statement smalb = DBCon.createStatement();
        Statement smson = DBCon.createStatement();
        Statement smorg = DBCon.createStatement();
        Statement orgtitle = DBCon.createStatement();
        ResultSet rssong = smalb.executeQuery("SELECT * FROM songs WHERE  title LIKE '%" + request.getParameter("query") + "%'");
        if (rssong.first()) {
            while (true) {

                int AlbumTitle = rssong.getInt("albumid");
                out.println("<HR><p id=\"song\">" + rssong.getString("title") + "</p>");
                
                ResultSet rsalbum = smson.executeQuery("SELECT * FROM album WHERE albumid = " + AlbumTitle);
                if (rsalbum.first()) {
                    while (true) {
                        out.println("<p id=\"alb\"> Album:<BR>");
                        out.println(rsalbum.getString("title") + "</p>");
                        if (!rsalbum.next()) {
                            break;
                        }
                    }
                }
                
                ResultSet rssmorg = smorg.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));
                if (rssmorg.first()) {
                    out.println("<p id=\"org\">");
                    while (true) {
                        
                        ResultSet titleorg = orgtitle.executeQuery("SELECT * from organs where orgid=" + rssmorg.getInt("orgid"));
                        titleorg.first();
                        String mus = rssmorg.getString("afm");
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

        } else {
            out.println("<BR> <BR> <p id=\"login\"> No results were found.  </p>");
        }
        smalb.close();
        orgtitle.close();
        smson.close();
        smorg.close();
        
    %>
</body>
</html>