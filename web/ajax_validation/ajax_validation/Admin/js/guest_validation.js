	
        
        
        function fillTime()
            {
		if(document.mainForm.txtFromDate.value == "")
		{
			alert ("Please Select From Date First !");
			document.mainForm.txtToDate.value = "";
			
		}
                else
                {
                    var fromDate = document.mainForm.txtFromDate.value;
                    var toDate = document.mainForm.txtToDate.value;
                    
                    var one_day = 1000*60*60*24;
                    var x = fromDate.split("/");
                    var y = toDate.split("/");
        
                    var date1 = new Date(x[2],x[0],(x[1]-1));
                    var date2 = new Date(y[2],y[0],(y[1]-1));
                
                    var diff = (date2.getTime() - date1.getTime()) / (one_day);
                    if(diff < 0)
                    {
                        alert("Please Select Valid Date !");  
                        document.mainForm.txtToDate.value = "";
                        
                    }
                }
            }
            
            function Submit()
            {
                
               var len      = document.getElementsByName("Parameter");
               var fromDate = document.getElementById("datepicker");
               var toDate   = document.getElementById("datepicker1");
               var stationid   = document.getElementById("Location");
               var stateid   = document.getElementById("State");
               
               if(fromDate.value != "" && toDate.value != "")
               {
                   if(len[0].checked == true || len[1].checked == true
                      || len[2].checked == true || len[3].checked == true
                      || len[4].checked == true || len[5].checked == true
                      || len[6].checked == true) 
                   {
                       var str = "";
                       if(len[0].checked == true)
                           str = str + "Minimum Temperature---Maximum Temperature---Rainfall---" +
                                         "Dew Point---SunShine Hour---Wind Speed---";
                       else
                       {
                       if(len[1].checked == true)
                           str = str + "Minimum Temperature---" ;
                       if(len[2].checked == true)
                           str = str + "Maximum Temperature---";
                       if(len[3].checked == true)
                           str = str + "Rainfall---";
                       if(len[4].checked == true)
                           str = str + "Dew Point---";
                       if(len[5].checked == true)
                           str = str + "SunShine Hour---";
                       if(len[6].checked == true)
                           str = str + "Wind Speed---";
                       }
                       
                      
                      var strLoading = "";
                        strLoading = "<table border='0' cellspacing='0' cellpadding='0' class='boxborder'>";
                        strLoading = strLoading + "<tr>";
                        strLoading = strLoading + "<td align='center' valign='top'><span class='section_header' id='txtload'>Downloading Data... </span><br /><br /><img src='Images/preloader.gif' id='imgload'></td>";
                        strLoading = strLoading + "</tr>";
                        strLoading = strLoading + "</table>";
                        
                    document.getElementById('DeviceData').innerHTML = strLoading;
                    document.getElementById('minTempsign').innerHTML = "";
                    document.getElementById('minTemptext').innerHTML = "";
                    document.getElementById('maxTempsign').innerHTML = "";
                    document.getElementById('maxTemptext').innerHTML = "";
                    document.getElementById('rainfallsign').innerHTML = "";
                    document.getElementById('rainfalltext').innerHTML = "";
                    document.getElementById('dewpointsign').innerHTML = "";
                    document.getElementById('dewpointtext').innerHTML = "";
                    document.getElementById('sunshinesign').innerHTML = "";
                    document.getElementById('sunshinetext').innerHTML = "";
                    document.getElementById('windspeedsign').innerHTML = "";
                    document.getElementById('windspeedtext').innerHTML = "";
                   // alert("Hello");
                    
                        var mintempUrl="Guest/CreateExcel.jsp?&fromdate="+fromDate.value+
                                            "&todate="+toDate.value+
                                            "&stationid="+stationid.value+
                                            "&stateid="+stateid.value+
                                            "&parameter="+str;
                        xmlHttpmin = GetXmlHttpObject();
        
                        if (xmlHttpmin ==null)
                        {
                            alert ("Your browser does not support AJAX!");
                            return;
                        } 
        
                        xmlHttpmin.onreadystatechange = CreateExcelFile;
                        xmlHttpmin.open("Post", mintempUrl, true);
                        xmlHttpmin.send(null);
                    
                    
                   }
                   else
                   {
                        alert("Select any Parameter First !");
                   }
               }
               else
               {
                    alert("Select Dates For Downloading !");
               }
            }
        
            function selectCheckbox()
            {
                len = document.getElementsByName("Parameter");
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
    
            function GetLocationData()
            { 
                var LocationUrl;
                var StateId;
                var StateVal;
                var cnt;
        
                StateVal = document.mainForm.State.selectedIndex;
                StateId = document.mainForm.State[StateVal].value;
        
                LocationUrl="Guest/GetLocations.jsp?&StateId="+StateId;
        
                xmlHttp=GetXmlHttpObject();
        
                if (xmlHttp==null)
                {
                    alert ("Your browser does not support AJAX!");
                    return;
                } 
        
                //Clearing the DropDownList
                var clen =  document.mainForm.Location.options.length;
        
                for(cnt=clen-1; cnt > 0; cnt--)
                {
                    document.mainForm.Location.options.remove(cnt);
                }
	
                xmlHttp.onreadystatechange = ShowLocation;
                xmlHttp.open("Post", LocationUrl, true);
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
                    document.getElementById("Location").innerHTML = xmlHttp.responseText;
                }
            }
            
            function GetData()
            {
                var loc = document.getElementById("Location").value;
                document.getElementById("datainformation").innerHTML = "<center>* Data Available for Location "+loc+" is From 01-Jan-2012 To till Date.</center>";
            }
            
            
            
            function CreateExcelFile()
            {
                if(xmlHttpmin.readyState == 4 || xmlHttpmin.readyState == "complete")
                {
                    var minTemp = xmlHttpmin.responseText;
                    var s = minTemp.split("///");
                    window.setTimeout("startDownload('"+s[0]+"')",2000);
                    document.getElementById('minTempsign').innerHTML = s[1];
                    document.getElementById('minTemptext').innerHTML = s[2];
                    document.getElementById('maxTempsign').innerHTML = s[3];
                    document.getElementById('maxTemptext').innerHTML = s[4];
                    document.getElementById('rainfallsign').innerHTML = s[5];
                    document.getElementById('rainfalltext').innerHTML = s[6];
                    document.getElementById('dewpointsign').innerHTML = s[7];
                    document.getElementById('dewpointtext').innerHTML = s[8];
                    document.getElementById('sunshinesign').innerHTML = s[9];
                    document.getElementById('sunshinetext').innerHTML = s[10];
                    document.getElementById('windspeedsign').innerHTML = s[11];
                    document.getElementById('windspeedtext').innerHTML = s[12];
                    var strLoading1 = "";
                        strLoading1 = "<table border='0' cellspacing='0' cellpadding='0' class='boxborder'>";
                        strLoading1 = strLoading1 + "<tr>";
                        strLoading1 = strLoading1 + "<td align='center' valign='top'><span class='section_header' id='txtload'>Downloading Complete. </span><br /><br /><img src='Images/End.gif' id='imgload'></td>";
                        strLoading1 = strLoading1 + "</tr>";
                        strLoading1 = strLoading1 + "</table>";
                    document.getElementById('DeviceData').innerHTML = strLoading1;
                    
                }
                
            }
            function startDownload(str)  
            {  
                    var url="./Data/"+str; 
                    window.open(url,'Download');  
            } 