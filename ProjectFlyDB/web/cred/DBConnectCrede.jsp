<%
Class.forName("com.mysql.jdbc.Driver");
String DBConStr = "jdbc:mysql://localhost:3306/flydb?user=root&password=";
Connection DBCon = DriverManager.getConnection(DBConStr);
%>