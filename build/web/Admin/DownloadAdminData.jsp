<%-- 
    Document   : DownloadData
    Created on : Sep 21, 2012, 3:58:36 PM
    Author     : IGIS_TEST
--%>

<%@page import="Main.ReadAWSDATA"%>
<%
    
    String fromDate    = request.getParameter("txtFromDate");
    String toDate      = request.getParameter("txtToDate");
    
    ReadAWSDATA readAWS = new ReadAWSDATA();
    readAWS.ReadData(fromDate, toDate); 
    
%>
