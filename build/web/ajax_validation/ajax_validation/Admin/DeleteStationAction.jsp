<%-- 
    Document   : DeleteStationAction
    Created on : Sep 21, 2012, 2:34:24 PM
    Author     : IGIS_TEST
--%>

<%@page import="Database.DatabaseConnection"%>
<%
    String delValue = request.getParameter("station").toString();
    DatabaseConnection db = new DatabaseConnection();
    db.openConnection();
    String StationID = "Select \"Station_Id\" From \"Station\" Where \"Station_Name\"='"+delValue+"'";
    String delString = "Delete From \"Station\" Where \"Station_Name\"='"+delValue+"'";
    String delDewPoint = "Delete From \"DEW_Point_2012\" Where \"Station_Id\"='"+delValue+"'";
    String delMinTemp = "Delete From \"DEW_Point_2012\" Where \"Station_Id\"='"+delValue+"'";
    String delMaxTemp = "Delete From \"DEW_Point_2012\" Where \"Station_Id\"='"+delValue+"'";
    String delRainfall = "Delete From \"DEW_Point_2012\" Where \"Station_Id\"='"+delValue+"'";
    String delSunshine = "Delete From \"DEW_Point_2012\" Where \"Station_Id\"='"+delValue+"'";
    String delWindspeed = "Delete From \"DEW_Point_2012\" Where \"Station_Id\"='"+delValue+"'";
%>
