<%-- 
    Document   : StationInformation
    Created on : Sep 19, 2012, 10:14:27 AM
    Author     : IGIS_TEST
--%>
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
                font-size: 10px;
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
        
        <script type="text/javascript">
            
            function getInformation()
            {
                
                var StationName;
                var cnt;
        
                StationName = document.getElementById("station");
                LocationUrl="getInformation.jsp?&StationName=" + StationName.value;
        
                xmlHttp=GetXmlHttpObject();
        
                if (xmlHttp==null)
                {
                    alert ("Your browser does not support AJAX!");
                    return;
                } 
        
                xmlHttp.onreadystatechange = ShowLocation;
                xmlHttp.open("GET", LocationUrl, true);
                xmlHttp.send(null);
            } 
    
            function GetXmlHttpObject()
            {
                var xmlHttp = null;
                try
                {
                    //Firefox, Opera 8.0+, Safari,
                    xmlHttp = new XMLHttpRequest();
                }
                catch (e)
                {
                    //Internet Explorer
                    try
                    {
                        xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
                    }
                    catch (e)
                    {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
            function ShowLocation()
            {
                if(xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
                {
                    var response = xmlHttp.responseText;
                    var val = response.split("///");
                    document.getElementById("statename").value = val[0];
                    document.getElementById("stationname").value = val[1];
                    document.getElementById("lat").value = val[2];
                    document.getElementById("lon").value = val[3];
                }
            }
            
            
            
            
        </script>
        
    </head>
    <body>        
            <table align="left" cellpadding="3" cellspacing="10">
            <tr>
                <td class="style6">Select Station : </td> 
                <td class="style61">
                    <select id="station" onchange="getInformation()">
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
            </tr>
        </table>
        </tr>
        <tr>
        <table cellspacing="6" style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="right">
            <tr>
                <td class="style6">State Name</td>
                <td>:</td>
                <td><input style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif;" type="text" size="20" id="statename"/></td>
                <td class="style6">Station Name</td>
                <td>:</td>
                <td><input style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif;" type="text" size="20" id="stationname"/></td>
            </tr> 
            <tr>
                <td class="style6">Latitude</td>
                <td>:</td>
                <td><input style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif;" type="text" size="20"id="lat"/></td>
                <td class="style6">Longitude</td>
                <td>:</td>
                <td><input style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif;" type="text" size="20" id="lon"/></td>
            </tr> 
        </table>
        </tr>
      </table>
    </body>
</html>
