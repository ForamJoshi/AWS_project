<%-- 
    Document   : p1
    Created on : May 6, 2013, 9:56:10 AM
    Author     : IGIS_TEST
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
       
        <link href="./js/style.css" rel="stylesheet" type="text/css" />
        <link type="text/css" href="./js/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="./js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="./js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="./js/ui.core.js"></script>
        <script type="text/javascript" src="./js/ui.tabs.js"></script>
         <link type="text/css" href="./js/guest_css.css" rel="stylesheet" />
        <script type="text/javascript" src="./js/guest_validation.js"></script>

        
        <link type="text/css" href="./js/demos.css" rel="stylesheet" />
        <link type="text/css" href="./js/style.css" rel="stylesheet" />

        <title>JSP Page</title>
        
        <script type="text/javascript">
            $(function() {
                
                $('#datepicker').datepicker({
                    changeMonth: true,
                    changeYear: true
                    
                });
            });

            $(function() {
                $('#datepicker1').datepicker({
                    changeMonth: true,
                    changeYear: true
                });
            });
         
        </script>
         
         
        
        
        <script type="text/javascript">
       
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
            
            function getStation1(){
                
                xmlHttp=GetXmlHttpObject();
                
                var sta=document.getElementById("state1").value; 
                
                //.getElementById("coordinatestate").value;
               // alert(sta);
               // System.out.println("coordinatestate"+sta);
                // var dist=window.document.sdisform.districtlist.value;
                // alert(dist);
                var url="./getStation.jsp?State="+sta;
                xmlHttp.open("GET",url,true);
                xmlHttp.onreadystatechange=updateCoordinate1;

                xmlHttp.send(null);
            }

            function updateCoordinate1()
            {
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    if(xmlHttp.status==200)
                    {
                        var response=xmlHttp.responseText;
                        //alert(response);
                        document.getElementById("stations123").innerHTML=response;

                    }
                    else
                    {
                        alert("Error loading page\n"+ xmlHttp.status );
                    }
                }
            }
            </script>
            
    </head>
    <body>
       
        
    <form action="kavachart.jsp" name="mainForm" method="POST" id ="mainForm1">
            
            <table style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="center" width="750px">  
                <tbody>
                    <tr>
                        <td>
                            
                            <table border="0" align="center" cellspacing="3">
                                
                                <tbody>
                                    <tr>
                                        
                                        <td align="left" class="style2">State :</td>
                                        <td>
        <select name="State" id="state1" class="style2" Onchange="getStation1()">
            <option value="00" class="style3">------ All Location ------</option>>
            <option value="01">Andaman &amp; Nikobar</option>
            <option value="02">Andhra Pradesh</option>
            <option value="03">ANTARTICA</option>
            <option value="04">ARUNACHAL PRADESH</option>
            <option value="05">ASSAM</option>
            <option value="06">BIHAR</option>
            <option value="07">CHATTISGARH</option>
            <option value="08">DAMAN &amp; DIU</option>
            <option value="09">GOA</option>
            <option value="10">GUJARAT</option>
            <option value="11">HARYANA</option>
            <option value="12">HIMACHAL PRADESH</option>
            <option value="13">JAMMU &amp; KASHMIR</option>
            <option value="14">JHARKHAND</option>
            <option value="15">KARNATAKA</option>
            <option value="16">KERALA</option>
            <option value="17">LAKSHADWEEP</option>
            <option value="18">MADHYA PRADESH</option>
            <option value="19">MAHARASHTRA</option>
            <option value="20">MANIPUR</option>
            <option value="21">MEGHALAYA</option>
            <option value="22">MIZORAM</option>
            <option value="23">NAGALAND</option>
            <option value="24">NCR</option>
            <option value="25">ORISSA</option>
            <option value="26">PONDICHERRY</option>
            <option value="27">PUNJAB</option>
            <option value="28">RAJASTHAN</option>
            <option value="29">SIKKIM</option>
            <option value="30">TAMIL NADU</option>
            <option value="31">TRIPURA</option>
            <option value="32">UTTAR PRADESH</option>
            <option value="33">UTTARAKHAND</option>
            <option value="34">WEST BENGAL</option>
                                            </select>
                                            </td>    
                                       
                                       <td class="style2">
                                       
                                     <%
            try {
                String state = "";
                /*if (request.getParameter("State") == null) {
                    state = "CHATTISGARH";
                }*/
                state = request.getParameter("State");
                
                DatabaseConnection dbc = new DatabaseConnection();
                dbc.openConnection();
                String query = "SELECT \"State_Id\" FROM \"State\" WHERE \"State_Name\"='" + state + "'";
                String stateid ="";
                ResultSet rs = dbc.fetchData(query);
                while (rs.next()) {
                    stateid = rs.getString(1);
                }
                String query2 = "SELECT \"Station_Name\" FROM \"Station\" WHERE \"Station_Id\" LIKE '" + stateid + "%'";
                ResultSet rs2 = dbc.fetchData(query2);
        %>
        <td align="left" class="style2">Loacation :</td>
           <td><div id="stations123">
                   <select>
                 <option value="All Location" class="style3">---- All Locations ----</option>
                    </select>
               </div>
           </td>
               <td align="left" class="style2">   
               </td>
          <%} catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
                                            
                                </td>
                                    </tr>
                                    <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                                    <tr>
                                        <td class="style2">From Date :</td>
                                        <td>  
                                            <input autocomplete="off" readonly="readonly" name="txtFromDate" id="datepicker" size="24" type="text" onchange="fillTime()"/>
                                        </td>
                                        <td width="15px">&nbsp;</td>             
                                        <td class="style2">To Date :</td>
                                        <td>  
                                           <input autocomplete="off" readonly="readonly" name="txtToDate" id="datepicker1" size="20" type="text" onchange="fillTime()"/>
                                        </td>  
                                    </tr>
                                    <tr></tr>
                                    <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                                        <tr>
                                       <td class="style2" align="center">
                                           <LI>Select Parameter :</li></A>
                                       </td>
                                       <td></td>
                                       <td width="15px">&nbsp;</td>   
                                       <td></td>
                                       <td></td>
                                   </tr>
                                        <tr>
                                       <td></td>
                                       
                                       
                                   </tr>
                                   <tr>
                                       <td></td>
                                       <td>
                                           <input type="radio" name="parameter" value="mintemp" checked/>Minimum Temperature
                                       </td>
                                       <td width="15px">&nbsp;</td> 
                                       
                                   </tr>
                                   <tr>
                                       <td></td>
                                       <td>
                                            <input type="radio" name="parameter" value="maxtemp"/>Maximum Temperature
                                       </td>
                                       <td width="15px">&nbsp;</td> 
                                       
                                   </tr>
                                   <tr>
                                        <td></td>
                                        <td>
                                            <input type="radio" name="parameter" value="rainfall"/> Rainfall
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="radio" name="parameter" value="dewpoint"/>Dew Point
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="radio" name="parameter" value="sunshine"/> SunShine Hour
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="radio" name="parameter" value="windspeed"/> Wind Speed
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        
                                    </tr>
                                    
                                </tbody>
                           </table>
                            
                            <table align="Center" border="0" > 
                               <tr>
                                   <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                                   <td>
                                       <input type="submit" value="Plot" class="send_button" onclick="return Submit()"/>
                                       
                                   </td>
                                </tr>
                                          
                           </table>
                        </td>
                    </tr>
                </tbody>
            </table>
    </form>
                
          
        </body>
</html>
