<%-- 
    Document   : addsth
    Created on : Dec 22, 2013, 2:04:59 AM
    Author     : StormRider
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting. Please wait...</title>
    </head>
    <script type="text/JavaScript">
        function timedRedirect() {
            setTimeout("window.location=\"usercp.jsp\";",4000);
        }
    </script>
    
    <body onload="javascript:timedRedirect();">
        <%
                Cookie allcookies[] = {};
                if (request.getCookies() != null) {
                allcookies = request.getCookies();
                }
                String username = null;
                for (int i = 0; i < allcookies.length; i++) {
                     if (allcookies[i].getName().equals("username")) {
                            username = allcookies[i].getValue();
                    }
                }
				%>
<%@ include file="cred/DBConnectCrede.jsp" %>
				<%
                 Statement removestatement = DBCon.createStatement();
                 if (request.getParameter("flight") != null) {
                 out.println("Your flight has been deleted. You will be redirected soon.");
                 removestatement.executeUpdate("DELETE FROM bookings WHERE username='" + username + "' AND id=" + request.getParameter("flight") + " AND seat=" + request.getParameter("seat"));
                 } else if (request.getParameter("ccnum") != null) {
                 removestatement.executeUpdate("DELETE FROM cc WHERE username='" + username + "' AND ccnum='" + request.getParameter("ccnum") + "'");
                 out.println("Your CC is being deleted");
                 }

                 
        %>
    
    </body>
</html>
