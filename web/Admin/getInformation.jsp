<%@page import="Database.DatabaseConnection"%>
<%@page language="java" import="java.sql.*,java.net.*,java.math.*,javax.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.*" %>

<%
	String sto = request.getParameter("StationName");
        System.out.println(sto); 
	response.setContentType("text/html");
	response.setHeader("Cache-Control","no-cache");
	ResultSet rs = null;
        
        DatabaseConnection db = new DatabaseConnection();
        db.openConnection();
        
        String selectId = "";
        
        selectId = "SELECT * FROM \"Station\" where "
                 + "\"Station_Name\"='"+sto+"';";
        
	try
	{
                rs = db.fetchData(selectId);
                String output="",ids="", station_Name="",lat="",lon="",state_Name="";
		while(rs.next())
		{	
                    station_Name = rs.getString("Station_Name"); 
                    lat = rs.getString("Latitude"); 
                    lon = rs.getString("Longitude"); 
                    String id = rs.getString("Station_Id");
                    ids = id.substring(0, 2);
                    System.out.println(ids); 
		}
                rs.close();
                
                selectId = "SELECT \"State_Name\" FROM \"State\" where "
                 + "\"State_Id\"='"+ids+"';";
                ResultSet rs1;
                rs1 = db.fetchData(selectId);
                while(rs1.next())
		{	
                    state_Name = rs1.getString("State_Name"); 
                }
                output = state_Name +"///"+ station_Name + "///" + lat +"///"+ lon;
		response.getWriter().println(output);

	}
	catch(Exception ex)
	{
		System.out.println(ex);
		response.getWriter().println(ex);
	}
%>
