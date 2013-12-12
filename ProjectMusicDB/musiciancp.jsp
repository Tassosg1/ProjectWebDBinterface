<%-- 
    Document   : musiciancp
    Created on : May 16, 2013, 4:30:13 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<% Class.forName("com.mysql.jdbc.Driver");
    String DBConStr = "jdbc:mysql://localhost:3306/ProjectDB?user=root&password=25139745";
    Connection DBCon = DriverManager.getConnection(DBConStr);
    Statement sm = DBCon.createStatement();
    Statement smalb = DBCon.createStatement();
    Statement smson = DBCon.createStatement();
    Statement smorg = DBCon.createStatement();
    ResultSet rsuser = sm.executeQuery("SELECT * from musician where afm =" + request.getParameter("afm"));
    rsuser.first();;
    String surname = rsuser.getString("surname");
    String name = rsuser.getString("name");
    String road = rsuser.getString("road");
    int tcode = rsuser.getInt("tcode");
    int addno = rsuser.getInt("addno");
    int afm = rsuser.getInt("afm");
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <% out.println(surname + "'s Control Panel");%></title>
    </head>
    <body>
        <%  out.println("<p id=\"title\">  Hello " + surname + "! </p> <p id=\"header\"> <a href=\"index.jsp\"> Click here to return to the main screen. </a> </p> <HR>");
            //PRINTING SONGS
            ResultSet rsalbum = smalb.executeQuery("SELECT * FROM album WHERE afmprod = " + afm);
            out.println("<p id=\"prod\"> Albums you have produced: </p>");
            while (rsalbum.next()) {
                out.println("<p id=\"song\">" + rsalbum.getString("title") + "<p>");
                ResultSet rssong = smson.executeQuery("SELECT * from songs where albumid =" + rsalbum.getString("albumid"));
                while (rssong.next()) {
                    out.println("<p id=\"alb\">" + rssong.getString("title") + "</p>");
                    ResultSet rsorg = smorg.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));

                    while (rsorg.next()) {
                        Statement orgtitle = DBCon.createStatement();
                        Statement afmname = DBCon.createStatement();
                        ResultSet nameofm = afmname.executeQuery("SELECT * from musician where afm=" + rsorg.getInt("afm"));
                        ResultSet titleorg = orgtitle.executeQuery("SELECT * from organs where orgid=" + rsorg.getInt("orgid"));
                        nameofm.first();
                        titleorg.first();
                        String mus = nameofm.getString("surname") + ", " + nameofm.getString("name");
                        String org = titleorg.getString("orgname");
                        out.println("<p id=\"org\">" + org + " : \t " + mus + ". </p>");
                    }
                    out.println("<BR>");
                }
                out.println("<BR>");
            }
            out.println("<HR>");
            out.println("New album? Insert it here!");
            out.println("<form name=\"newalbum\" action=\"newsomething.jsp\"> AFM: <input type=\"text\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\"> <BR> AlbumID: <input type=\"text\" required=\"required\" name=\"newalbumid\"> <BR> Title: <input type=\"text\" name=\"newtitle\"> <input type=\"submit\" value=\"Create!\"></form> <HR>");
            out.println("New song? Insert it here!");
            out.println("<form name=\"newsong\" action=\"newsomething.jsp\"><input type=\"hidden\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\"> <BR> SongID: <input type=\"text\" required=\"required\" name=\"newsongid\"> <BR> AlbumID: <input type=\"text\" name=\"newsongalbumid\"> <BR> Title: <input type=\"text\" name=\"newsongtitle\"> <BR> Genre: <input type=\"text\" name=\"newgenre\"> <BR> Lyrics by: <input type=\"text\" name=\"newsonglyrics\"> <BR> YT Media: <input type=\"text\" name=\"newsongmedia\"> <input type=\"submit\" value=\"Create!\"> </form>");

        %>
    </body>

</html>
