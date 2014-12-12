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

        <script type="text/javascript" src="./js/ui.datepicker.js"></script>
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
        <script type="text/javascript" >
            var flag=-1;
            //alert(flag);
            function disabledcities(){
                flag=flag*-1;
                
                if(flag==-1){
                    document.getElementById("cities").disabled=true;
                }
                else{
                    document.getElementById("cities").disabled=false;
                }
                // emptyiframe();
            }
            function emptyiframe(){
                var doc = document.getElementById('showlink').contentWindow.document;
                doc.open();
                doc.write('<html><head><title></title></head><body></body></html>');
                doc.close();
            }
        </script>
         <script type="text/javascript" src="./js/ui.tabs.js"></script>
        
       
        <script type="text/javascript">
            function setTarget(i){
                if(i==1){
                    document.mainForm1.action="plot.jsp";
                }
                else{
                    document.mainForm1.action="plot.jsp";
                }
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
            
            function getStation(){
                //alert("hi1234");
                xmlHttp=GetXmlHttpObject();
                
                var sta=document.getElementById("state").value;
                //alert(sta);
                
                //.getElementById("coordinatestate").value;
               // alert(sta);
               // System.out.println("coordinatestate"+sta);
                // var dist=window.document.sdisform.districtlist.value;
                // alert(dist);
                var url="./getStation.jsp?State="+sta;
                xmlHttp.open("GET",url,true);
                xmlHttp.onreadystatechange=updateCoordinate11;

                xmlHttp.send(null);
            }

            function updateCoordinate11()
            {
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    if(xmlHttp.status==200)
                    {
                        var response=xmlHttp.responseText;
                        //alert(response);
                        document.getElementById("stations1").innerHTML=response;

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
      
        
        
    <form action="" name="mainForm123" method="POST" id ="mainForm1">
            <center><p style="color: #0010ac; font-size: 20px; font-weight: bold;">Welcome To Download AWS Data.</p></center>
            <table style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="center" width="750px">  
                <tbody>
                    <tr>
                        <td>
                            
                            <table border="0" align="center" cellspacing="3">
                               
                                <tbody>
                                    <tr>
                                        
                                        <td align="left" class="style2">State :</td>
                                        <td>
        <select name="State" id="state" class="style2" Onchange="getStation()">
            <option value="00" class="style3">------ All Location ------</option>>
            <option value="01">ANDAMAN &amp; NIKOBAR</option>
            <option value="02">ANDHRA PRADESH</option>
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
        <td class="style2">Loacation :</td>
        <td><div id="stations1">
            <select name="cities">
                 <option value="All Location" class="style3">---- All Locations ----</option>
            </select>
        </div></td>
          <%} catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
                                            
                                </td>
                                    </tr>
                                    
                            <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td><td colspan="4">Select All Location : <input type="checkbox" checked="checked" name="allcities" onclick="disabledcities()" /></td>
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
                                       <td>
                                            <input type="checkbox" id="Parameter" name="Parameter" value="All" onclick="selectCheckbox()"/> <label class="style4">All</label>
                                       </td>
                                       <td width="15px">&nbsp;</td> 
                                       <td></td>
                                       <td></td>
                                   </tr>
                                   <tr>
                                       <td></td>
                                       <td>
                                           <input type="checkbox" id="Parameter" name="Parameter" value="MinTemp"/> <label class="style2">Minimum Temperature</label>
                                       </td>
                                       <td width="15px">&nbsp;</td> 
                                       <td>
                                           <div id="minTempsign"></div>
                                       </td>
                                       <td>
                                           <div id="minTemptext"></div>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td></td>
                                       <td>
                                            <input type="checkbox" id="Parameter" name="Parameter" value="MaxTemp"/> <label class="style2">Maximum Temperature</label>
                                       </td>
                                       <td width="15px">&nbsp;</td> 
                                       <td>
                                            <div id="maxTempsign"></div>
                                       </td>
                                       <td>
                                            <div id="maxTemptext"></div>
                                       </td>
                                   </tr>
                                   <tr>
                                        <td></td>
                                        <td>
                                            <input type="checkbox" id="Parameter" name="Parameter" value="Rainfall"/> <label class="style2">Rainfall</label>
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        <td>
                                            <div id="rainfallsign"></div>
                                        </td>
                                        <td>
                                            <div id="rainfalltext"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="checkbox" id="Parameter" name="Parameter" value="DewPoint"/> <label class="style2">Dew Point</label>
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        <td>
                                             <div id="dewpointsign"></div>
                                        </td>
                                        <td>
                                             <div id="dewpointtext"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="checkbox" id="Parameter" name="Parameter" value="SunShine"/> <label class="style2">SunShine Hour</label>
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        <td>
                                            <div id="sunshinesign"></div>
                                        </td>
                                        <td>
                                            <div id="sunshinetext"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="checkbox" id="Parameter" name="Parameter" value="WindSpeed"/> <label class="style2">Wind Speed</label>
                                        </td>
                                        <td width="15px">&nbsp;</td> 
                                        <td>
                                            <div id="windspeedsign"></div>
                                        </td>
                                        <td>
                                            <div id="windspeedtext"></div>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                           </table>
                            
                            <table align="Center" border="0" > 
                               <tr>
                                   <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <td align="right">
                                <input type="submit"  value="ViewData" class="send_button" onclick="Submit(1)"/>
                                </td>
                                   <td>
                                       <input type="submit" value="Download" class="send_button" onclick="Submit(2)"/>
                                       
                                   </td>
                                </tr>
                                          
                           </table>
                </tbody>
            </table>
    </form>
            <table align="center">
                <tr>
                    <td></td>
                    <td>
            <iframe align="center" name="table" width="750px" height="200" frameborder="0">
</iframe> 
</td>
</tr>
</table>
                
                    
    
   
        
          
        </body>
</html>
