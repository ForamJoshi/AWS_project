<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseConnection"%>
<%
    DatabaseConnection db = new DatabaseConnection();
    db.openConnection();
    
    String selectString = "Select \"Station_Name\" from \"Station\" order by \"Station_Name\"";
    ResultSet rs = db.fetchData(selectString);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style type="text/css">

            <!--
            .style6 {
                font-size: 14px;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: blueviolet;
            }
            .style61 {
                font-size: 12px;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: #000;
            }
            -->
        </style>
    </head>
    <body>        
            <table align="left" cellpadding="3" cellspacing="10">
            <tr>
                <td class="style6">Select Station : </td> 
                <td class="style61">
                    <select name="station" id="station" onchange="getInformation()">
                        <%
                            while(rs.next())
                            {
                        %>
                      
                        <option value=<%=rs.getString(1)%>>
                            <%=rs.getString(1)%>
                        </option>    
                        <%
                           }
                        %>
                    </select>
                </td>
                <td class="style61">
                    <input  type="submit" value="Submit"/>
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td class="style6">
                    Note : If You Delete Station Here 
                </td>
            </tr>
            <tr>
                <td class="style6">
                    it will Delete all information regarding 
                </td>
            </tr>
            <tr>
                <td class="style6">
                    to this Station. So be careful.
                </td>
            </tr>
        </table>
      </body>
</html>