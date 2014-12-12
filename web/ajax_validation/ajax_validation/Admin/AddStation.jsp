<%-- 
    Document   : AddStation
    Created on : Sep 19, 2012, 3:11:28 PM
    Author     : IGIS_TEST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title>
        
        <style type="text/css">

            <!--
            .style7 {
                font-size: 12px;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: blueviolet;
            }
            
            .style71 {
                font-size: 12px;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: #000;
            }
            -->
        </style>
        
        <script type="text/javascript">
            
            function generate()
            {
                var tot = document.getElementById("no").value;
                var state11 = document.getElementById("state");
                var output;
                state11.innerHTML  = "";
                output = '<form method="POST" action="AddStationAction.jsp">';
                output += '<table cellpadding="5" cellspacing="6" style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="right">';
                for(var i =1;i<=tot;i++)
                {
                    output  += '<tr><td class="style71"> '+i+')  State Name</td><td><input type="text"  size = "15" maxlength= "20" name="state"> </td>' +
                      '<td class="style71">Station Name</td><td> <input type="text"  size = "20" maxlength= "15" name="station"></td> ' +
                      '<td class="style71">latitude</td><td><input type="text"  size = "5" maxlength= "5" name="lat"> </td>' +
                      '<td class="style71">longitude</td><td><input type="text"  size = "5" maxlength= "5" name="lon"></td></tr>';
  
                }
                output  += '<tr><td></td><td></td><td></td><td class="style71"><input type="submit" value="Submit"/></td><td></td><td></td><td></td><td></td></tr></table></form> ';
                //alert(output);
                state11.innerHTML = output;
            }
        </script>
    </head>
    <body>
        <table align="left">
            <tr>
                <td class="style7">Select No of Station :</td>
                <td class="style71"><select id="no" onchange="generate()">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </td>
            </tr>
        </table>
        <br/><br/>
        <div id="state">
            
        </div>
    </body>
</html>
