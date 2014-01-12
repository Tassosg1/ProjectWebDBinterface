package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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
      response.setContentType("text/html");
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
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("<title>Fly Me To The Moon - Index</title>\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"./StyleSheets/generic.css\" />\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"./StyleSheets/HeaderFooter.css\" />\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"./StyleSheets/Class.css\" />\n");
      out.write("                <link rel=\"stylesheet\" type=\"text/css\" href=\"./StyleSheets/popupbox.css\" />\n");
      out.write("                <!-- PLEASE mind the case-sensitivity (Glassfish©). Use the format recommended ^ -->\n");
      out.write("                <!--<link rel=\"stylesheet\" type=\"text/css\" href=\"Stylesheets/index.css\" />-->\n");
      out.write("\t\t<meta name=\"description\" content=\"\" />\n");
      out.write("\t\t<meta name=\"author\" content=\"OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface\" />\n");
      out.write("\t\t<meta name=\"robots\" content=\"noindex, nofollow\" />\n");
      out.write("\t\t<meta charset=\"utf-8\" />\n");
      out.write("                 \n");
      out.write("  <script language=\"JavaScript\" type=\"text/javascript\">  \n");
      out.write("  function login(showhide){\n");
      out.write("     if(showhide === \"show\"){\n");
      out.write("        document.getElementById('popupbox').style.visibility=\"visible\";\n");
      out.write("        }else if(showhide === \"hide\"){\n");
      out.write("        document.getElementById('popupbox').style.visibility=\"hidden\"; \n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("  function logout(){\n");
      out.write("        document.cookie = \"username=; expires=Thu, 01 Jan 1970 00:00:00 GMT\";\n");
      out.write("        window.location=\"index.jsp\";\n");
      out.write("  }\n");
      out.write("  </script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\t\t<header>\n");
      out.write("\t\t\t<nav>\n");
      out.write("\t\t\t\t<span class=\"Left\"><a href=\"index.jsp\">Home</a></span>\n");
      out.write("                                ");

                                    Cookie allcookies[] = {};
                                    if(request.getCookies() != null)
                                        allcookies= request.getCookies();
                                    int userfound = 0;
                                    for (int i = 0;i < allcookies.length;i++)
                                       if (allcookies[i].getName().equals("username"))
                                           userfound=i;
                                    
                                if(userfound!=0) {
                                    out.println("<span class=\"Right\">Welcome <a href=\"usercp.jsp\">" + allcookies[userfound].getValue() + "! </a>");
                                    out.println("<a href=\"javascript:logout();\">Logout</a></span>"); } else {
                                
      out.write(" \n");
      out.write("                                <span class=\"Right\"><a href=\"javascript:login('show');\">Log In</a></span>\n");
      out.write("                                ");

                                }
                                
      out.write("\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t</nav>\n");
      out.write("\t\t</header>\n");
      out.write("                                \n");
      out.write("<div id=\"popupbox\"> \n");
      out.write("    <form name=\"login\" action=\"verify.jsp\" method=\"get\">\n");
      out.write("        <center>Username:</center>\n");
      out.write("        <center><input name=\"username\" size=\"14\" /></center>\n");
      out.write("        <center>Password:</center>\n");
      out.write("        <center><input name=\"password\" type=\"password\" size=\"14\" /></center>\n");
      out.write("        <center><input type=\"submit\" name=\"submit\" value=\"login\" /></center>\n");
      out.write("    </form>\n");
      out.write("    <center><a href=\"javascript:login('hide');\">Close</a></center> \n");
      out.write("    <BR>\n");
      out.write("</div> \n");
      out.write("       \n");
      out.write("        \n");
      out.write("\t\t<!-- Here goes the Index (Search) page. The dropdown boxes (airports) are filled with the lines from the table port_country, field 'airport'.\n");
      out.write("                     As a reminder, the strings for getting data from MySQL database are (the database formed by the updated script):\n");
      out.write("                     Class.forName(\"com.mysql.jdbc.Driver\");\n");
      out.write("                     String DBConStr = \"jdbc:mysql://localhost:3306/flydb?user=root&password=\";\n");
      out.write("                     Connection DBCon = DriverManager.getConnection(DBConStr);\n");
      out.write("                     Statement airports = DBCon.createStatement();\n");
      out.write("                     ResultSet rsairporst = albums.executeQuery(\"SELECT * from airport\");\n");
      out.write("                     From there on, several java functions (.first(),.next()) help you manage the results, and functions like (rsairport.getString(\"airport\") to access them.\n");
      out.write("                      -->\n");
      out.write("                ");

                 Class.forName("com.mysql.jdbc.Driver");
                 String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
                 Connection DBCon = DriverManager.getConnection(DBConStr);
                 Statement airportsstatement = DBCon.createStatement();
                 ResultSet rsairport = airportsstatement.executeQuery("SELECT * from port");
                 rsairport.last();int size = rsairport.getRow();rsairport.first();
                 String[] airports = new String[size];
                    if (rsairport.first()) {
                              airports[0] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
                              for(int i = 1; rsairport.next(); i++ ) 
                                 airports[i] =  rsairport.getString("country") + ", " + rsairport.getString("airport");
                    }
                
      out.write("\n");
      out.write("                <BR><BR><BR>\n");
      out.write("                <h3>From airport:</h3>\n");
      out.write("                <form method=\"get\" action =\"results.jsp\">\n");
      out.write("                    <select name=\"from_air\">\n");
      out.write("                     ");

                       for (int i = 0;i < airports.length;i++)
                            out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                     
      out.write("   \n");
      out.write("                    </select>\n");
      out.write("                <BR><BR><BR>\n");
      out.write("                <h3>To airport:</h3>\n");
      out.write("                    <select name=\"to_air\">\n");
      out.write("                      ");

                       for (int i = 0;i < airports.length;i++)
                            out.println("<option value=\"" + airports[i] + "\"> " + airports[i] + "</option>");
                      
      out.write("   \n");
      out.write("                    </select>\n");
      out.write("                    <BR>\n");
      out.write("                    <input type=\"hidden\" name=\"date\" value=\"2013-12-25\">\n");
      out.write("                    <input type=\"hidden\" name=\"service\" value=\"fly\">\n");
      out.write("                    <input type=\"submit\" value=\"Search!\">\n");
      out.write("                </form>\n");
      out.write("                    <h5> Date of departure is 25/12/13 </h5>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("\t\t<footer>\n");
      out.write("\t\t\t<span class=\"Right\"><a href=\"https://github.com/Tassosg1/ProjectWebDBinterface\" rel=\"author\">Source</a></span>\n");
      out.write("\t\t</footer>\n");
      out.write("\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
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
