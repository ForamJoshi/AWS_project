<%@page import="Database.DatabaseConnection"%>
<%@page language="java" import="java.sql.*,java.net.*,java.math.*,javax.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.*" %>

<%
	String sto = request.getParameter("StateId");
	response.setContentType("text/html");
	response.setHeader("Cache-Control","no-cache");
	ResultSet rs = null;
        
        DatabaseConnection db = new DatabaseConnection();
        db.openConnection();
        
        String selectId = "";
        
        selectId = "SELECT \"Station_Name\" FROM \"Station\" where "
                 + "\"Station_Id\" like '"+sto.trim()+"%';";
        
	try
	{
                rs = db.fetchData(selectId);
                
		String buffer = "<select name=\"Location\" id=\"Location\" class=\"style2\" onchange=\"GetData()\"><option value = \"All Location\" class=\"style3\">---- All Locations ----</option>";
		while(rs.next())
		{	
			buffer = buffer+"<option value = '"+rs.getString(1)+"'>"+rs.getString(1)+"</option>";
		}
		buffer = buffer+"</select>";
		response.getWriter().println(buffer);
                db.closeConnection();
	}
        
	catch(Exception ex)
	{
		ex.printStackTrace();
		response.getWriter().println(ex);
	}
%>
