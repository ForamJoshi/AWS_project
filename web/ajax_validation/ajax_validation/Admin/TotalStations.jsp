<%-- 
    Document   : TotalStations
    Created on : Sep 19, 2012, 9:58:04 AM
    Author     : IGIS_TEST
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseConnection"%>
<%
    DatabaseConnection db = new DatabaseConnection();
    db.openConnection();
    
    String selectString = "SELECT COUNT(\"State_Id\")FROM \"State\";";
    ResultSet rs = db.fetchData(selectString);
    String state="", station="";
    while(rs.next())
    {
        state = rs.getString("count");  
    }
    rs.close();
    String selectSt = "SELECT COUNT(\"Station_Id\")FROM \"Station\";";
    ResultSet rs1 = db.fetchData(selectSt);
    while(rs1.next())
    {
        station = rs1.getString("count");
    }
    rs.close();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            <!--
            .style2 {
                font-size: small;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: blueviolet;
            }
            -->
        </style>
    </head>
    <body>
        <table align="left" cellpadding="8" cellspacing="10">
            <tr>
                <td class="style2">
                Here is the Information About States and Stations that are Store 
                in our Database, If you want to Change or Edit or Delete then more 
                links are Available. 
                </td>
            </tr>
            <tr>
                <td class="style2">
                   1) No Of States : <%=state%>
                   <br/><br/>
                   2) No Of Stations : <%= station%>
                </td>
            </tr>
        </table>
    </body>
</html>
