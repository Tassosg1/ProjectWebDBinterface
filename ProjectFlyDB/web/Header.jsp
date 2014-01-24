<header>
	<nav>
		<span class="Left"><a href="index.jsp"><img src="Resources/Home.png" alt="Home" width="30" height="30"/></a></span>
		<span class="Center"><a href="Air.jsp">Air</a> <a href="Water.jsp">Water</a> <a href="Hotel.jsp">Hotel</a></span>
		<span class="Right"><jsp:include page="LoginScript.jsp" /></span>
	</nav>
</header>
<div id="popupbox"> 
	<form name="login" action="verify.jsp" method="get">
		<center>Username:</center>
		<center><input name="username" size="14" /></center>
		<center>Password:</center>
		<center><input name="password" type="password" size="14" /></center>
		<center><input type="submit" name="submit" value="login" /></center>
	</form>
	<center><a href="javascript:login('hide');">Close</a></center> 
</div>