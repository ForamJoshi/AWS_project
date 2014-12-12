<%-- 
    Document   : Guest
    Created on : Sep 19, 2012, 11:17:20 AM
    Author     : IGIS_TEST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="./js/guest_css.css" rel="stylesheet" />
        <script type="text/javascript" src="./js/guest_validation.js"></script>
        <link href="./js/style.css" rel="stylesheet" type="text/css" />
        <link type="text/css" href="./js/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="./js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="./js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="./js/ui.core.js"></script>
        <script type="text/javascript" src="./js/ui.tabs.js"></script>

        <script type="text/javascript" src="./js/ui.datepicker.js"></script>
        <link type="text/css" href="./js/demos.css" rel="stylesheet" />
        <link type="text/css" href="./js/style.css" rel="stylesheet" />

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
        
    </head>
    <body>            
        <form action="" name="mainForm" method="POST" id ="mainForm1">
            <center><p style="color: #0010ac; font-size: 14px; font-weight: bold;">Welcome To Download AWS Data.</p></center>
            <table style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="center" width="750px">  
                <tbody>
                    <tr>
                        <td>
                            
                            <table border="0" align="center" cellspacing="3">
                                <tbody>
                                    <tr>
                                        <td align="left" class="style2">State :</td>
                                        <td>
                                            <select name="State" id="State" class="style2" onchange="GetLocationData()">
                                            <option value="00" class="style3">------ All States ------</option>
                                            <option value="01">ANDAMAN &amp; NICOBAR</option>
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
                                       <td width="15px">&nbsp;</td>
                                       <td class="style2">Location :</td>
                                       <td> 
                                           <select name="Location" id="Location" class="style2" onchange="GetData()">
                                            <option value="All Location" class="style3">---- All Locations ----</option>
                                            </select>
                                       </td>
                                    </tr>
                                    <tr><td colspan="5"><div class="style4" id="datainformation"></div></td></tr>
                                    <tr></tr>
                                    <tr></tr>
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
                                       <td class="style2">
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
                           <br/>
                           <div id="DeviceData" align="center"></div>
                                   <br/>   
                           <table align="Center" border="0" > 
                               <tr>
                                   <td>
                                       <input type="button" value="Download" class="send_button" onclick="return Submit()"/>
                                       
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




