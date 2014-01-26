function check(cookiename)
{
	var name = cookiename + "=";
	var found = 0;
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++)
	{
		var c = ca[i].trim();
		if (c.indexOf(name)===0) 
		{
			found = 1;
		}
	}
	if(found===0)
	{
		window.alert("You must be logged in in order to continue.");
		window.history.back();
	}
}