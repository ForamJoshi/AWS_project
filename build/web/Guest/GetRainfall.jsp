<%@page import="Database.DatabaseConnection"%>
<%@page language="java" import="java.sql.*,java.net.*,java.math.*,javax.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.*" %>

<%
	String sto = request.getParameter("Id");
	response.setContentType("text/html");
	response.setHeader("Cache-Control","no-cache");
	ResultSet rs = null;
                     
	String buffer = "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading... !</label>";
        response.getWriter().println(buffer);
%>
