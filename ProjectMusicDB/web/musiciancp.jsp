<%-- 
    Document   : musiciancp
    Created on : May 16, 2013, 4:30:13 AM
    Author     : StormRider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<% Class.forName("com.mysql.jdbc.Driver");
    String DBConStr = "jdbc:mysql://localhost/projectdb?user=root&password=25139745";
    Connection DBCon = DriverManager.getConnection(DBConStr);
    Statement sm = DBCon.createStatement();
    Statement smalb = DBCon.createStatement();
    Statement smson = DBCon.createStatement();
    Statement smorg = DBCon.createStatement();
    Statement smalbsel = DBCon.createStatement();
    Statement smalbsel1 = DBCon.createStatement();
    Statement smalbsel2 = DBCon.createStatement();
    Statement smgensel = DBCon.createStatement();
    Statement organs = DBCon.createStatement();
    Statement songsorgmod = DBCon.createStatement();
    Statement smgensel1 = DBCon.createStatement();
    Statement orgtitle = DBCon.createStatement();
    ResultSet rsuser = sm.executeQuery("SELECT * from musician where afm =" + request.getParameter("afm"));
    rsuser.first();;
    String surname = rsuser.getString("surname");
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
            int flag = 0;
            while (rsalbum.next()) {
                flag = 1;
                out.println("<p id=\"song\">" + rsalbum.getString("title") + "<p>");
                ResultSet rssong = smson.executeQuery("SELECT * from songs where albumid =" + rsalbum.getString("albumid"));
                int flags = 0;
                while (rssong.next()) {
                    flags = 1;
                    out.println("<p id=\"alb\">" + rssong.getString("title") + "</p>");

                    ResultSet rsorg = smorg.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));

                    while (rsorg.next()) {
                        ResultSet titleorg = orgtitle.executeQuery("SELECT * from organs where orgid=" + rsorg.getInt("orgid"));
                        titleorg.first();
                        String mus = rsorg.getString("afm");
                        String org = titleorg.getString("orgname");
                        out.println("<p id=\"org\">" + org + " : \t " + mus + ". </p>");
                    }
                    //DELETE SONG
                    out.println("<form method=\"get\" action=\"deletesomething.jsp\">");
                    out.println("<input type = \"hidden\" value=\"" + rssong.getInt("songid") + "\" name=\"delsong\">");
                    out.println("<input type=\"hidden\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\"> <input type=\"submit\" value=\"Delete Song\"> </form>");
                    out.println("<BR>");
                }
                if (flags == 0) {
                    out.println("<p id=\"alb\"> There are no songs in this album. <BR> You may add one below! </p>");
                }
                //DELETE ALBUM
                out.println("<form method=\"get\" action=\"deletesomething.jsp\">");
                out.println("<input type = \"hidden\" value=\"" + rsalbum.getInt("albumid") + "\" name=\"delalbum\">");
                out.println("<input type=\"hidden\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\"> <input type=\"submit\" value=\"Delete Album\"> </form>");
                out.println("<BR>");
                out.println("<BR>");
            }
            if (flag == 0) {
                out.println("You have not produced any albums.");
            }
            out.println("<HR>");
            out.println("<u> New album? Insert it here! </u>");
            out.println("<form name=\"newalbum\" action=\"newsomething.jsp\"> VAT: <input type=\"text\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\">  <BR> Title: <input type=\"text\" name=\"newtitle\" required=\"required\"> <input type=\"submit\" value=\"Create!\"></form> <HR>");
            out.println("<u>New song? Insert it here!</u>");
            out.println("<form name=\"newsong\" action=\"newsomething.jsp\"><input type=\"hidden\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\">  "
                    + " Title: <input type=\"text\" required=\"required\" name=\"newsongtitle\"> <BR> Album:");


            ResultSet rsalbsel = smalbsel.executeQuery("SELECT * from album WHERE afmprod=" + afm);
            out.println("<select name=\"newsongalbumid\"> ");

            while (rsalbsel.next()) {
                out.println("<option value=\"" + rsalbsel.getInt("albumid") + "\">" + rsalbsel.getString("title") + "</option> ");
            }


            out.println("</select>");
            ResultSet rsgensel = smgensel.executeQuery("SELECT * from genres");
            out.println("<BR>Genre: <select name=\"newgenre\"> ");
            int i = 0;
            while (rsgensel.next()) {
                out.println("<option value=\"" + i + "\">" + rsgensel.getString("genre") + "</option> ");
                i++;
            }
            out.println("</select>");
            out.println(" <BR> Lyrics by (optional): <input type=\"text\" name=\"newsonglyrics\"> <BR> YT Media: <input type=\"text\" maxlength=\"11\" name=\"newsongmedia\"> <input type=\"submit\" value=\"Create!\"> </form>");
            out.println("<small> Hint! Paste only the video ID. f.e. http://www.youtube.com/watch?v=<font color=\"red\" size=3><b>oHg5SJYRHA0</b></font></small><HR>");

            out.println("<u>Wish to modify a song? You may do so here.</u> <BR>");
            out.println("<form name=\"modsong\" action=\"modifysomething.jsp\"> <input type=\"hidden\" name=\"afm\" value=\"" + afm + "\" readonly=\"readonly\"> Song to be modified:");

            ResultSet rssongsmod = smalbsel1.executeQuery("SELECT * from songs WHERE albumid IN (SELECT albumid from album where afmprod = " + afm + ")");
            out.println("<select name=\"newsongmod\"> ");

            while (rssongsmod.next()) {
                out.println("<option value=\"" + rssongsmod.getInt("songid") + "\">" + rssongsmod.getString("title") + "</option> ");

            }
            out.println("</select><BR> Title: <input type=\"text\" name=\"modtitle\" required=\"required\"> <BR> Album: <select name=\"modalbum\"> ");
            ResultSet rsalbmod = smalbsel2.executeQuery("SELECT * from album WHERE afmprod=" + afm);

            while (rsalbmod.next()) {
                out.println("<option value=\"" + rsalbmod.getInt("albumid") + "\">" + rsalbmod.getString("title") + "</option> ");
            }
            out.println("</select>");

            ResultSet rsgensel1 = smgensel1.executeQuery("SELECT * from genres");
            out.println("<BR>Genre: <select name=\"modgenre\"> ");
            int k = 0;
            while (rsgensel1.next()) {
                out.println("<option value=\"" + k + "\">" + rsgensel1.getString("genre") + "</option> ");
                k++;
            }
            out.println("</select><BR>");
            out.println("YT Media: <input type=\"text\" maxlength=\"11\" name=\"modmedia\"> <input type=\"submit\" value=\"Modify Song\"> </form>");
            out.println("<HR>");
            /////////////////////////////////////////////
            out.println("You can know add an instrument played in your song!<BR>");
            ResultSet rssongsorgmod = songsorgmod.executeQuery("SELECT * from songs WHERE albumid IN (SELECT albumid from album where afmprod = " + afm + ")");

            out.println("<form method=\"get\" action=\"newsomething.jsp\"> <input type=\"hidden\" name=\"afm\" value=\"" + afm + "\">");
            out.println("Song: <select name=\"songtoaddorg\"> ");
            while (rssongsorgmod.next()) {
                out.println("<option value=\"" + rssongsorgmod.getInt("songid") + "\">" + rssongsorgmod.getString("title"));
            }

            out.println("</select>  Organ: ");
            ResultSet rsorgsel = organs.executeQuery("SELECT * from organs");
            if (rsorgsel.first()) {
                out.println("<select name=\"organ\"> ");
                while (true) {
                    out.println("<option value=\"" + rsorgsel.getInt("orgid") + "\">" + rsorgsel.getString("orgname") + "</option> ");
                    if (!rsorgsel.next()) {
                        break;
                    }
                }
                out.println("</select>");
                out.println("done by <input type=\"text\" name=\"orgplay\" required=\"required\">");
                out.println("<input type=\"submit\" value=\"Add to song\"");
                out.println("</form>");
            }
            orgtitle.close();
            sm.close();
            smalb.close();
            smson.close();
            smorg.close();
            smalbsel.close();
            smalbsel1.close();
            smalbsel2.close();
            smgensel.close();
            organs.close();
            songsorgmod.close();
            smgensel1.close();
        %>
    </body>
</html>
