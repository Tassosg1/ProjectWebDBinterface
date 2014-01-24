<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"  >

	<head>
        <title>Fly Me To The Moon - Success!</title>
		<link rel="stylesheet" type="text/css" href="./StyleSheets/generic.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/HeaderFooter.css" />
		<link rel="stylesheet" type="text/css" href="./StyleSheets/Class.css" />
                <!-- PLEASE mind the case-sensitivity (Glassfish©). Use the format recommended ^ -->
                <!--<link rel="stylesheet" type="text/css" href="Stylesheets/index.css" />-->
		<meta name="description" content="" />
		<meta name="author" content="OpenSource @ https://github.com/Tassosg1/ProjectWebDBinterface" />
		<meta name="robots" content="noindex, nofollow" />
		<meta charset="utf-8" />
    </head>

    <script language="JavaScript" type="text/javascript">  
   function logout(){
        document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
        window.location="index.jsp";
  }
  </script>
    
    <body>
<%@ include file="Header.jsp" %>
<%@ include file="popuplogin.jsp" %>
                <BR><BR><BR>
		Your booking was successful.
                     
                <%out.println(request.getParameter("destination"));%>
<%@ include file="Footer.jsp" %>
	</body>
</html>
