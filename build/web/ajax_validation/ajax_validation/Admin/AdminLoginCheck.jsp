<%	
	String user=request.getParameter("un");
	String pass=request.getParameter("pw");
	int user_id=12;
	if(user.equalsIgnoreCase("admin") &&
            pass.equals("postgresadmin123") )
   	{
   	   	out.print(user_id);
   	}
   	else
   	{
   		out.print("ERROR");
   	}
%>