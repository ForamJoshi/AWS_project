<%-- 
    Document   : getStation
    Created on : May 13, 2013, 3:48:39 PM
    Author     : igis_test
--%>

<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String state = "";
                String query2="";
                /*if (request.getParameter("State") == null) {
                    state = "CHATTISGARH";
                }*/
                state = request.getParameter("State");
                if(state.equalsIgnoreCase("00"))
                                               {
                    query2 = "SELECT \"Station_Name\" FROM \"Station\"";
                }
                else
                                       {
                    query2 = "SELECT \"Station_Name\" FROM \"Station\" WHERE \"Station_Id\" LIKE '" + state + "%'";
                                       
                }
                      
                DatabaseConnection dbc = new DatabaseConnection();
                dbc.openConnection();
                //String query = "SELECT \"State_Id\" FROM \"State\" WHERE \"State_Name\"='" + state + "'";
                //String stateid ="";
                //ResultSet rs = dbc.fetchData(query);
                //while (rs.next()) {
                //    stateid = rs.getString(1);
                //}
                
                ResultSet rs2 = dbc.fetchData(query2);
        %>
        <select id="cities" disabled="true" name="cities" multiple=”multiple” onchange="emptyiframe()">
            <%while (rs2.next()) {
            %>
            <option value="<%=rs2.getString(1)%>" ><%=rs2.getString(1)%></option>
            <%
                }
            %></select>
            <%} catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
    </body>
</html>
