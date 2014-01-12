<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./StyleSheets/popupbox_cc.css" />
    </head>
    <body>

        <div id="popupbox"> 
            <form name="ccver" action="complete.jsp" method="get">
                <center>As a safety measure, please enter your credit card's verification number.</center>
                <center><input name="ccver" size="14" /></center>
                <% 
                out.println("<input type=\"hidden\" name=\"flight\" value=\"" + request.getParameter("flight") + "\">");
                out.println("<input type=\"hidden\" name=\"ccnum\" value=\"" + request.getParameter("ccnum") + "\">");
                %>
                <center><input type="submit" value="Complete" /></center>
            </form>
            <BR>
        </div> 


    </body>
</html>
