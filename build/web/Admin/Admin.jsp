<%@page import="com.sun.org.apache.xpath.internal.axes.SubContextList"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="Database.DBConnection"%>
<html>
    <head>
        <title> AWS DATABASE </title>
        <link type="text/css" href="../js/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="../js/ui.core.js"></script>
        <script type="text/javascript" src="../js/ui.tabs.js"></script>
        <script type="text/javascript" src="../js/ui.datepicker.js"></script>
        <script type="text/javascript" src="../js/ui.accordion.js"></script>
        <link type="text/css" href="../js/demos.css" rel="stylesheet" />
        <link type="text/css" href="../js/style.css" rel="stylesheet" />
        
        
        <style type="text/css">

            <!--
            .style3 {
                font-size: small;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: #000000;
            }
            -->

            

            <!--
            .style4 {
                font-size: small;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: orangered;
            }
            -->

            
            -->
        </style>

        <script type="text/javascript">
            
            $(function() {
		$("#accordion").accordion({
			autoHeight: false
		});
            });

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
            
            $(function() {
                $("#tabs").tabs({
                    collapsible: true
                });
            });
         </script>
         
         <script type="text/javascript">
             
             function selectCheckbox()
            {
                len = document.getElementsByName("aParameter");
                if(len[0].checked == true)
                {
                    for(i=0;i<len.length;i++)
                    {
                        len[i].checked = true;
                    }
                }
                else
                {
                    for(i=0;i<len.length;i++)
                    {
                        len[i].checked = false;
                    } 
                }
            }
             
            function fillTime()
            {
                var fromDate = document.getElementById("datepicker").value;
                var toDate = document.getElementById("datepicker1").value;
               
		if(fromDate == "")
		{
			alert ("Please Select From Date First !");
			document.getElementById("datepicker1").value = "";
			return false;
		}
                else
                {
                    var one_day = 1000*60*60*24;
                    var x = fromDate.split("/");
                    var y = toDate.split("/");
        
                    var date1 = new Date(x[2],x[0],(x[1]-1));
                    var date2 = new Date(y[2],y[0],(y[1]-1));
                
                    var diff = (date2.getTime() - date1.getTime()) / (one_day);
                    if(diff < 0)
                    {
                        alert("Please Select Valid Date !");  
                        document.getElementById("datepicker1").value = "";
                        return false;
                    }
                }
            }
            
            function Submit()
            {
               var fromDate = document.getElementById("datepicker");
               var toDate = document.getElementById("datepicker1");
               
               if(fromDate.value == ""
                  || toDate.value == "")
                {
                    alert("Please Select All Required Data !");
                    document.getElementById("datepicker").value = fromDate.value;
                    document.getElementById("datepicker1").value = toDate.value;
                }
                else
                {
                    document.mainForm.action = "DownloadAdminData.jsp";
                }
            }
        </script>
        
        
    </head>

    <body>
        <table border="0">
            <tr>	
                <td><input type="image" src="./Images1/sac.JPG"/></td>
            </tr>
        </table>
        <table align="right">
            <tr>
                <td style="font-size: small;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color:mediumblue; font-weight: bold;"><A href="index.jsp" style="text-decoration: none; color:mediumblue;">Logout</a></td>
            </tr>
        </table>
        <table align="center">
            <tr></tr>
            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
            <tr>
                <td style="font-size: small;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color:mediumblue; font-weight: bold;"><h3>WelCome Admin !!</td>
                
            </tr>
        </table>
        <br/>
        <div class="demo">
            <div id="tabs">
                <ul>
                    
                    <li><a href="#tabs-2">Station Information</a></li>
                    
                </ul>
               
                        
                <div id="tabs-2">
                        <div id="accordion">
                            <h3 class="style3"><a href="#">Statistics</a></h3>
                            <div>
                                <jsp:include page="TotalStations.jsp"/>  
                            </div>
                            <h3 class="style3"><a href="#">Find Stations Information</a></h3>
                            <div>
                                <jsp:include page="StationInformation.jsp"/>  
                            </div>
                            <h3 class="style3"><a href="#">Add Station</a></h3>
                            <div>
                                <jsp:include page="AddStation.jsp"/> 
                            </div>
                            <h3 class="style3"><a href="#">Delete Station</a></h3>
                            <div>
                                <jsp:include page="DeleteStation.jsp"/> 
                            </div>
                        </div>
                  
                </div>  <%-- End of tab-2 --%>
                <%-- End of tab-3 --%>
            </div>
        </div>
            
             <table>
        <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
        <tr>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
               <a href="index.jsp"> <input type="image" src="./Images1/h.JPG"/></a>
               </td>
            <td>
                   </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                <a href="aws.jsp"><input type="image" src="./Images1/a1.jpg"/></a>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                <a href="Admin/alog.jsp"><input type="image" src="./Images1/admin.jpg"/></a>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                <a href="Aboutus.jsp"><input type="image" src="./Images1/aboutus.jpg"/></a>
                </td>
            </tr>
        </table>
                     <table>
                         <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
        <tr>
            <td>
                <input type="image" src="./Images1/footer.png"/>
                </td>
            </tr>
        </table>
    </body>
</html>