<%-- 
    Document   : verify
    Created on : Apr 28, 2013, 7:37:21 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>  Advanced Search  </title>
    </head>
    <body>
        <a href="./index.jsp"> <img src="./Images/songicon.jpg" alt="Image Missing." > </a>
        <HR>
        <form method="get" action="advsearchres.jsp">
            <input type="radio" name="sel" value="album" required="required">  Albums
            <input type="radio" name="sel" value="organs"> Organs 
            <BR> <a href="index.jsp"> <small>Back to normal search</small> </a> <BR><BR>
            <input type="submit" value="Search">

        </form>
        <HR>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String DBConStr = "jdbc:mysql://localhost/projectdb?user=root&password=25139745";
            Connection DBCon = DriverManager.getConnection(DBConStr);
            Statement albums = DBCon.createStatement();
            Statement orgs = DBCon.createStatement();
            Statement orgn = DBCon.createStatement();
            Statement alb = DBCon.createStatement();
            Statement organs = DBCon.createStatement();
            Statement songs = DBCon.createStatement();
            Statement orgtitle = DBCon.createStatement();
            if ((request.getParameter("sel") != null && request.getParameter("sel").equals("album")) || (request.getParameter("albums") != null)) {
                ResultSet rsalbum = albums.executeQuery("SELECT * from album");
                if (rsalbum.first()) {
                    out.println("<form method=\"get\" action=\"advsearchres.jsp\">");
                    out.println("<select name=\"albums\"> ");
                    while (true) {
                        out.println("<option value=\"" + rsalbum.getString("albumid") + "\">" + rsalbum.getString("title") + "</option> ");
                        if (!rsalbum.next()) {
                            break;
                        }
                    }
                    out.println("</select>");
                    out.println("<input type=\"submit\" value=\"More...\"");
                    out.println("</form>");
                    out.println("<BR>");
                    out.println("<BR>");
                }
            } else if (request.getParameter("sel") != null && request.getParameter("sel").equals("organs")) {

                ResultSet rsorgsel = albums.executeQuery("SELECT * from organs");
                if (rsorgsel.first()) {
                    out.println("<form method=\"get\" action=\"advsearchres.jsp\">");
                    out.println("<select name=\"organ\"> ");
                    while (true) {
                        out.println("<option value=\"" + rsorgsel.getInt("orgid") + "\">" + rsorgsel.getString("orgname") + "</option> ");
                        if (!rsorgsel.next()) {
                            break;
                        }
                    }
                    out.println("</select>");
                    out.println("done by <input type=\"text\" name=\"orgplay\" required=\"required\">");
                    out.println("<input type=\"submit\" value=\"More...\"");
                    out.println("</form>");

                }
            }
            if (request.getParameter("albums") != null) {
                int id = Integer.parseInt(request.getParameter("albums"));
                ResultSet rsalbum = albums.executeQuery("SELECT * from album where albumid = " + id);
                rsalbum.first();
                out.println("<p id=\"song\">" + rsalbum.getString("title") + "</p>");
                ResultSet rssong = songs.executeQuery("SELECT * FROM songs WHERE albumid = " + id);
                int a = 0;
                while (rssong.next()) {
                    a = 1;
                    out.println("<p id=\"song\">" + rssong.getString("title") + "</p>");

                    ResultSet rssmorg = orgs.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));
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
                }
                if (a == 0) {
                    out.println("<BR> <BR> <p id=\"login\"> No songs were found in this album.  </p>");
                }
            }
            if (request.getParameter("organ") != null) {

                ///
                ResultSet rsorgsel = albums.executeQuery("SELECT * from organs");
                if (rsorgsel.first()) {
                    out.println("<form method=\"get\" action=\"advsearchres.jsp\">");
                    out.println("<select name=\"organ\"> ");
                    while (true) {
                        out.println("<option value=\"" + rsorgsel.getInt("orgid") + "\">" + rsorgsel.getString("orgname") + "</option> ");
                        if (!rsorgsel.next()) {
                            break;
                        }
                    }
                    out.println("</select>");
                    out.println("done by <input type=\"text\" name=\"orgplay\" required=\"required\">");
                    out.println("<input type=\"submit\" value=\"More...\"");
                    out.println("</form>");

                }
                ///

                ResultSet rssong = organs.executeQuery("SELECT * FROM songs WHERE songid IN (SELECT songid from song_mus_org WHERE afm LIKE '%" + request.getParameter("orgplay") + "%' AND orgid = " + request.getParameter("organ") + ")");
                if (rssong.first()) {
                    while (true) {

                        int AlbumTitle = rssong.getInt("albumid");
                        out.println("<HR><p id=\"song\">" + rssong.getString("title") + "</p>");

                        ResultSet rsalbum = alb.executeQuery("SELECT * FROM album WHERE albumid = " + AlbumTitle);
                        if (rsalbum.first()) {
                            while (true) {
                                out.println("<p id=\"alb\"> Album:<BR>");
                                out.println(rsalbum.getString("title") + "</p>");
                                if (!rsalbum.next()) {
                                    break;
                                }
                            }
                        }

                        ResultSet rssmorg = orgn.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));
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
            }
            albums.close();
            orgs.close();
            orgn.close();
            alb.close();
            organs.close();
            songs.close();
            orgtitle.close();
            
        %>
    </body>
</html>
