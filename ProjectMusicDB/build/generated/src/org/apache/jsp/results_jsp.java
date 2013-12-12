package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class results_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Search Results</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <CENTER>\n");
      out.write("        <img src=\"./Images/songicon.jpg\" height=\"200\">\n");
      out.write("        <HR>\n");
      out.write("        <form method=\"get\" action=\"results.jsp\">\n");
      out.write("            <input type=\"text\" autofocus=\"autofocus\" required=\"required\" size=\"50\" name=\"query\"> <a href=\"advsearch.jsp\"> <small>Σύνθετη Αναζήτηση</small> </a> <BR><BR>\n");
      out.write("            <input type=\"submit\" value=\"Αναζήτηση\"> \n");
      out.write("        </form> <BR><BR>\n");
      out.write("    </center>\n");
      out.write("        ");

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
                    out.println("Song Name: " + rssong.getString("title"));
      out.write(" <BR> ");
 //ΤΙΤΛΟΣ ΤΡΑΓΟΥΔΙΟΥ
                        ResultSet rsalbum = smson.executeQuery("SELECT * FROM album WHERE albumid = " + AlbumTitle);
                        if (rsalbum.first()) {
                            while (true) {
                                out.println("Albums this song has appeared:");
      out.write(" <BR> ");

                                    out.println("ID: " + rsalbum.getString("albumid") + "   Title: " + rsalbum.getString("title"));
        
      out.write(" <BR> ");

                            if (!rsalbum.next()) {
                                break;
                            }
                        }
                    }
ResultSet rssmorg = smorg.executeQuery("SELECT * from song_mus_org where songid = " + rssong.getInt("songid"));
    if (rssmorg.first()) {
        out.println("A list of the organs played follows."); 
      out.write(" <BR> ");

        while (true) {
            Statement orgtitle = DBCon.createStatement();
            Statement afmname = DBCon.createStatement();
            ResultSet nameofm = afmname.executeQuery("SELECT * from musician where afm=" + rssmorg.getInt("afm"));
            ResultSet titleorg = orgtitle.executeQuery("SELECT * from organs where orgid=" + rssmorg.getInt("orgid") );
            nameofm.first();
            titleorg.first();
            String mus = nameofm.getString("surname") + ", " + nameofm.getString("name");
            String org = titleorg.getString("orgname");
            out.println(org + " : \t " + mus + "."); 
      out.write(" <BR> ");

            if (!rssmorg.next()) {
                break;
            }
        }
    }



      out.write(" <BR> ");





                    if (!rssong.next()) {
                        break;
                    }
                }
            }

            /* sm.close();
            DBCon.close(); */
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
