<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="InsertData.DownloadGuestData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFDataFormat"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>

<%
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        String stationid = request.getParameter("stationid");
        String stateid = request.getParameter("stateid");
        String parameter = request.getParameter("parameter");
        
        String para[] = parameter.split("---");
        ArrayList arr = new ArrayList();
        
        for(int i=0;i<para.length;i++)
            arr.add(para[i]);
        response.setContentType("text/html");
	response.setHeader("Cache-Control","no-cache");
        String buffer="";
        
        HSSFWorkbook myWorkBook = new HSSFWorkbook();
        HSSFCellStyle cs = myWorkBook.createCellStyle();
        HSSFDataFormat df = myWorkBook.createDataFormat();
        cs.setDataFormat(df.getFormat("0.0"));
        
        Date da = new Date();
        String sp[] = da.toString().split(" ");
        String ti[] = sp[3].split(":");
        String finalstr = sp[2] + sp[1] + sp[5] + "_" + ti[0] + ti[1] + ti[2];
                
        String filename = "E:\\VISHAL\\NetBeansProject\\AWS_DATA_Download\\web\\Data\\AWS_Data_"+finalstr+".xls";
                
        buffer = "AWS_Data_"+finalstr+".zip ///";
        FileOutputStream out_file = new FileOutputStream(filename); 
        int min=-1,max=-1,rain=-1,dew=-1,sun=-1,wind=-1;
        for(int i=0;i<1;i++)
        {
            
            if(arr.contains("Minimum Temperature"))
            {
                try
                {
                    min=0;
                    DownloadGuestData down = new DownloadGuestData();
                    DatabaseConnection db = new DatabaseConnection();
                    db.openConnection();
        
                    String selectId = "",staid="";
                    selectId = "SELECT \"Station_Id\" FROM \"Station\" where "
                             + "\"Station_Name\" = '"+stationid.trim()+"';";
                    System.out.println(selectId); 
                    
                    ResultSet rs = null;   
                    rs = db.fetchData(selectId);
                    
                    while(rs.next())
                    {
                        staid = rs.getString(1);
                    }
        
                    
                    String fromyear = fromdate.substring(6, 10);
                    String toyear = todate.substring(6, 10);
                    String tableyear = "";
                    if((Integer.parseInt(fromyear) - Integer.parseInt(toyear)) == 0)
                    {
                        tableyear = "\"MinTemp_"+toyear+"\"";
                    }
                    else
                    {
                        int diff = Integer.parseInt(toyear) - Integer.parseInt(fromyear);
                        int fy = Integer.parseInt(fromyear);
                        while(diff >= 0)
                        {
                            tableyear = tableyear + "\"MinTemp_"+fy+"\", ";
                            fy++;
                            diff--;
                        }
                        System.out.println(tableyear.substring(0, tableyear.length()-2));
                    }
                    
                    String s="",nameid="";
                    if(stationid.equals("All Location") && stateid.equals("00"))
                    {   
                        s=" order by \"Station_Id\"";
                        nameid = "\"Station_Id\"";
                    } 
                    else if(stationid.equals("All Location"))
                    {
                        s=" where \"State_Id\" = '"+stateid+"' order by \"Station_Id\"";
                        nameid = "\"State_Id\"";
                    }    
                    else
                    {
                        s = " where \"Station_Id\" = '"+staid+"'";
                        nameid = "\"Station_Id\"";
                    }
        
        
                    ArrayList dates = down.getBetweenDates(fromdate, todate);
                    String year="";
        
                    String selectString = "Select \"State_Id\", \"Station_Id\", ";
                    for(int j=0;j<dates.size();j++)
                    {
                        String date = dates.get(j).toString();
                        year = "20"+date.substring(5, 7);
                        selectString = selectString + "\"MinTemp_"+year+"\".\"D"+date+"\", ";
                    }
                
                    String str = selectString.substring(0, selectString.length()-2);
                    str = str + " From "+ tableyear + s ;
                    System.out.println(str); 
                    rs.close();
                    
                    ArrayList data = new ArrayList();
                    ArrayList row = new ArrayList();
                
                    ResultSet rs1 = null;
                    rs1 = db.fetchData(str);
    
                    while(rs1.next())
                    {
                        String stateid1 = rs1.getString("State_Id"); 
                        String selectstateid = "SELECT \"State_Name\" FROM \"State\" where "
                                                + "\"State_Id\" = '"+stateid1+"'";
                        ResultSet rs_state = db.fetchData(selectstateid);
                        while(rs_state.next())
                        {
                            //System.out.println(rs_state.getString(1)); 
                            data.add(rs_state.getString(1)); 
                            row.add(rs_state.getString(1)); 
                        }
                        rs_state.close();
                            
                        String stationid1 = rs1.getString("Station_Id"); 
                        String selectstationid = "SELECT \"Station_Name\" FROM \"Station\" where "
                                                + "\"Station_Id\" = '"+stationid1+"'";
                        ResultSet rs_station = db.fetchData(selectstationid);
                        while(rs_station.next())
                        {
                            //System.out.println(rs_station.getString(1)); 
                            data.add(rs_station.getString(1));
                            row.add(rs_station.getString(1));
                                
                        }
                        rs_station.close();
                            
                        for(int k=0;k<dates.size();k++)
                        {
                            String date = dates.get(k).toString();
                            String val = rs1.getString("D"+date); 
                            //System.out.println(val); 
                            if(val==null)
                                data.add("-999");
                            else
                                data.add(val);
                        }
                    }
        
                    rs1.close();
                    db.closeConnection();
                
                
                
                    String[][] excelData = down.preapreDataToWriteToExcel(data, row.size()/2 , dates.size()+2); 
            
                
                    HSSFSheet mySheet = myWorkBook.createSheet("Minimum Temperature");
                    HSSFRow myRow = null;
                    HSSFCell myCell = null;

                    String[][] Head = new String[2][dates.size()+2];
                    int j=0,in=0;
                    for(j=0;j<dates.size()+2;j++)
                    {
                        if(j==0)
                            Head[0][0] = "State_Name";
                        else if(j==1)
                            Head[0][1] = "Station_Name";
                        else    
                        {
                            Head[0][j] = dates.get(in).toString();
                            in++;
                        }
                    }
                    for(j=0;j<dates.size()+2;j++)
                        Head[1][j] = ""; 
                        
                    for (int rowNum = 0; rowNum < 2; rowNum++) {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) {
                            myCell = myRow.createCell(cellNum);
                            myCell.setCellValue(Head[rowNum][cellNum]);                
                        }
                    }
                    
                    for (int rowNum = 2; rowNum < (row.size()/2)+2; rowNum++) 
                    {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) 
                        {
                            myCell = myRow.createCell(cellNum);
                            if(cellNum==0 || cellNum==1)
                            {
                                myCell.setCellValue(excelData[rowNum-2][cellNum]); 
                            }
                            else
                            {            
                                myCell.setCellValue(Float.parseFloat(excelData[rowNum-2][cellNum]));                 
                                myCell.setCellStyle(cs); 
                            }
                        }
                    }
                    buffer += "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>///";
                    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    buffer += "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>///";
                }
            }
            else
            {
                if(min==-1)
                    buffer += " /// ///";
            }
            if(arr.contains("Maximum Temperature"))
            {
                try
                {
                    max=0;
                    DownloadGuestData down = new DownloadGuestData();
                    DatabaseConnection db = new DatabaseConnection();
                    db.openConnection();
        
                    String selectId = "",staid="";
                    selectId = "SELECT \"Station_Id\" FROM \"Station\" where "
                             + "\"Station_Name\" = '"+stationid.trim()+"';";
                    System.out.println(selectId); 
                    
                    ResultSet rs = null;   
                    rs = db.fetchData(selectId);
                    
                    while(rs.next())
                    {
                        staid = rs.getString(1);
                    }
        
                    
                    String fromyear = fromdate.substring(6, 10);
                    String toyear = todate.substring(6, 10);
                    String tableyear = "";
                    if((Integer.parseInt(fromyear) - Integer.parseInt(toyear)) == 0)
                    {
                        tableyear = "\"MaxTemp_"+toyear+"\"";
                    }
                    else
                    {
                        int diff = Integer.parseInt(toyear) - Integer.parseInt(fromyear);
                        int fy = Integer.parseInt(fromyear);
                        while(diff >= 0)
                        {
                            tableyear = tableyear + "\"MaxTemp_"+fy+"\", ";
                            fy++;
                            diff--;
                        }
                        System.out.println(tableyear.substring(0, tableyear.length()-2));
                    }
                    
                    String s="",nameid="";
                    if(stationid.equals("All Location") && stateid.equals("00"))
                    {   
                        s=" order by \"Station_Id\"";
                        nameid = "\"Station_Id\"";
                    } 
                    else if(stationid.equals("All Location"))
                    {
                        s=" where \"State_Id\" = '"+stateid+"' order by \"Station_Id\"";
                        nameid = "\"State_Id\"";
                    }    
                    else
                    {
                        s = " where \"Station_Id\" = '"+staid+"'";
                        nameid = "\"Station_Id\"";
                    }
        
        
                    ArrayList dates = down.getBetweenDates(fromdate, todate);
                    String year="";
        
                    String selectString = "Select \"State_Id\", \"Station_Id\", ";
                    for(int j=0;j<dates.size();j++)
                    {
                        String date = dates.get(j).toString();
                        year = "20"+date.substring(5, 7);
                        selectString = selectString + "\"MaxTemp_"+year+"\".\"D"+date+"\", ";
                    }
                
                    String str = selectString.substring(0, selectString.length()-2);
                    str = str + " From "+ tableyear + s ;
                    System.out.println(str); 
                    rs.close();
                    
                    ArrayList data = new ArrayList();
                    ArrayList row = new ArrayList();
                
                    ResultSet rs1 = null;
                    rs1 = db.fetchData(str);
    
                    while(rs1.next())
                    {
                        String stateid1 = rs1.getString("State_Id"); 
                        String selectstateid = "SELECT \"State_Name\" FROM \"State\" where "
                                                + "\"State_Id\" = '"+stateid1+"'";
                        ResultSet rs_state = db.fetchData(selectstateid);
                        while(rs_state.next())
                        {
                            //System.out.println(rs_state.getString(1)); 
                            data.add(rs_state.getString(1)); 
                            row.add(rs_state.getString(1)); 
                        }
                        rs_state.close();
                            
                        String stationid1 = rs1.getString("Station_Id"); 
                        String selectstationid = "SELECT \"Station_Name\" FROM \"Station\" where "
                                                + "\"Station_Id\" = '"+stationid1+"'";
                        ResultSet rs_station = db.fetchData(selectstationid);
                        while(rs_station.next())
                        {
                            //System.out.println(rs_station.getString(1)); 
                            data.add(rs_station.getString(1));
                            row.add(rs_station.getString(1));
                                
                        }
                        rs_station.close();
                            
                        for(int k=0;k<dates.size();k++)
                        {
                            String date = dates.get(k).toString();
                            String val = rs1.getString("D"+date); 
                            //System.out.println(val); 
                            if(val==null)
                                data.add("-999");
                            else
                                data.add(val);
                        }
                    }
        
                    rs1.close();
                    db.closeConnection();
                
                
                
                    String[][] excelData = down.preapreDataToWriteToExcel(data, row.size()/2 , dates.size()+2); 
            
                
                    HSSFSheet mySheet = myWorkBook.createSheet("Maximum Temperature");
                    HSSFRow myRow = null;
                    HSSFCell myCell = null;

                    String[][] Head = new String[2][dates.size()+2];
                    int j=0,in=0;
                    for(j=0;j<dates.size()+2;j++)
                    {
                        if(j==0)
                            Head[0][0] = "State_Name";
                        else if(j==1)
                            Head[0][1] = "Station_Name";
                        else    
                        {
                            Head[0][j] = dates.get(in).toString();
                            in++;
                        }
                    }
                    for(j=0;j<dates.size()+2;j++)
                        Head[1][j] = ""; 
                        
                    for (int rowNum = 0; rowNum < 2; rowNum++) {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) {
                            myCell = myRow.createCell(cellNum);
                            myCell.setCellValue(Head[rowNum][cellNum]);                
                        }
                    }
                    
                    for (int rowNum = 2; rowNum < (row.size()/2)+2; rowNum++) 
                    {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) 
                        {
                            myCell = myRow.createCell(cellNum);
                            if(cellNum==0 || cellNum==1)
                            {
                                myCell.setCellValue(excelData[rowNum-2][cellNum]); 
                            }
                            else
                            {            
                                myCell.setCellValue(Float.parseFloat(excelData[rowNum-2][cellNum]));                 
                                myCell.setCellStyle(cs); 
                            }
                        }
                    }
                    buffer += "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>///";
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    buffer += "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>///";
                }
            }
            else
            {
                if(max==-1)
                    buffer += " /// ///";
            }
            if(arr.contains("Rainfall"))
            {
                try
                {
                    rain=0;
                    DownloadGuestData down = new DownloadGuestData();
                    DatabaseConnection db = new DatabaseConnection();
                    db.openConnection();
        
                    String selectId = "",staid="";
                    selectId = "SELECT \"Station_Id\" FROM \"Station\" where "
                             + "\"Station_Name\" = '"+stationid.trim()+"';";
                    System.out.println(selectId); 
                    
                    ResultSet rs = null;   
                    rs = db.fetchData(selectId);
                    
                    while(rs.next())
                    {
                        staid = rs.getString(1);
                    }
        
                    
                    String fromyear = fromdate.substring(6, 10);
                    String toyear = todate.substring(6, 10);
                    String tableyear = "";
                    if((Integer.parseInt(fromyear) - Integer.parseInt(toyear)) == 0)
                    {
                        tableyear = "\"Rainfall_"+toyear+"\"";
                    }
                    else
                    {
                        int diff = Integer.parseInt(toyear) - Integer.parseInt(fromyear);
                        int fy = Integer.parseInt(fromyear);
                        while(diff >= 0)
                        {
                            tableyear = tableyear + "\"Rainfall_"+fy+"\", ";
                            fy++;
                            diff--;
                        }
                        System.out.println(tableyear.substring(0, tableyear.length()-2));
                    }
                    
                    String s="",nameid="";
                    if(stationid.equals("All Location") && stateid.equals("00"))
                    {   
                        s=" order by \"Station_Id\"";
                        nameid = "\"Station_Id\"";
                    } 
                    else if(stationid.equals("All Location"))
                    {
                        s=" where \"State_Id\" = '"+stateid+"' order by \"Station_Id\"";
                        nameid = "\"State_Id\"";
                    }    
                    else
                    {
                        s = " where \"Station_Id\" = '"+staid+"'";
                        nameid = "\"Station_Id\"";
                    }
        
        
                    ArrayList dates = down.getBetweenDates(fromdate, todate);
                    String year="";
        
                    String selectString = "Select \"State_Id\", \"Station_Id\", ";
                    for(int j=0;j<dates.size();j++)
                    {
                        String date = dates.get(j).toString();
                        year = "20"+date.substring(5, 7);
                        selectString = selectString + "\"Rainfall_"+year+"\".\"D"+date+"\", ";
                    }
                
                    String str = selectString.substring(0, selectString.length()-2);
                    str = str + " From "+ tableyear + s ;
                    System.out.println(str); 
                    rs.close();
                    
                    ArrayList data = new ArrayList();
                    ArrayList row = new ArrayList();
                
                    ResultSet rs1 = null;
                    rs1 = db.fetchData(str);
    
                    while(rs1.next())
                    {
                        String stateid1 = rs1.getString("State_Id"); 
                        String selectstateid = "SELECT \"State_Name\" FROM \"State\" where "
                                                + "\"State_Id\" = '"+stateid1+"'";
                        ResultSet rs_state = db.fetchData(selectstateid);
                        while(rs_state.next())
                        {
                            //System.out.println(rs_state.getString(1)); 
                            data.add(rs_state.getString(1)); 
                            row.add(rs_state.getString(1)); 
                        }
                        rs_state.close();
                            
                        String stationid1 = rs1.getString("Station_Id"); 
                        String selectstationid = "SELECT \"Station_Name\" FROM \"Station\" where "
                                                + "\"Station_Id\" = '"+stationid1+"'";
                        ResultSet rs_station = db.fetchData(selectstationid);
                        while(rs_station.next())
                        {
                            //System.out.println(rs_station.getString(1)); 
                            data.add(rs_station.getString(1));
                            row.add(rs_station.getString(1));
                                
                        }
                        rs_station.close();
                            
                        for(int k=0;k<dates.size();k++)
                        {
                            String date = dates.get(k).toString();
                            String val = rs1.getString("D"+date); 
                            //System.out.println(val); 
                            if(val==null)
                                data.add("-999");
                            else
                                data.add(val);
                        }
                    }
        
                    rs1.close();
                    db.closeConnection();
                
                
                
                    String[][] excelData = down.preapreDataToWriteToExcel(data, row.size()/2 , dates.size()+2); 
            
                
                    HSSFSheet mySheet = myWorkBook.createSheet("Rainfall");
                    HSSFRow myRow = null;
                    HSSFCell myCell = null;

                    String[][] Head = new String[2][dates.size()+2];
                    int j=0,in=0;
                    for(j=0;j<dates.size()+2;j++)
                    {
                        if(j==0)
                            Head[0][0] = "State_Name";
                        else if(j==1)
                            Head[0][1] = "Station_Name";
                        else    
                        {
                            Head[0][j] = dates.get(in).toString();
                            in++;
                        }
                    }
                    for(j=0;j<dates.size()+2;j++)
                        Head[1][j] = ""; 
                        
                    for (int rowNum = 0; rowNum < 2; rowNum++) {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) {
                            myCell = myRow.createCell(cellNum);
                            myCell.setCellValue(Head[rowNum][cellNum]);                
                        }
                    }
                    
                    for (int rowNum = 2; rowNum < (row.size()/2)+2; rowNum++) 
                    {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) 
                        {
                            myCell = myRow.createCell(cellNum);
                            if(cellNum==0 || cellNum==1)
                            {
                                myCell.setCellValue(excelData[rowNum-2][cellNum]); 
                            }
                            else
                            {            
                                myCell.setCellValue(Float.parseFloat(excelData[rowNum-2][cellNum]));                 
                                myCell.setCellStyle(cs); 
                            }
                        }
                    }
                    buffer += "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>///";
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    buffer += "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>///";
                }
            }
            else
            {
                if(rain==-1)
                    buffer += " /// ///";
            }
            if(arr.contains("Dew Point"))
            {
                try
                {
                    dew=0;
                    DownloadGuestData down = new DownloadGuestData();
                    DatabaseConnection db = new DatabaseConnection();
                    db.openConnection();
        
                    String selectId = "",staid="";
                    selectId = "SELECT \"Station_Id\" FROM \"Station\" where "
                             + "\"Station_Name\" = '"+stationid.trim()+"';";
                    System.out.println(selectId); 
                    
                    ResultSet rs = null;   
                    rs = db.fetchData(selectId);
                    
                    while(rs.next())
                    {
                        staid = rs.getString(1);
                    }
        
                    String fromyear = fromdate.substring(6, 10);
                    String toyear = todate.substring(6, 10);
                    String tableyear = "";
                    if((Integer.parseInt(fromyear) - Integer.parseInt(toyear)) == 0)
                    {
                        tableyear = "\"DEWPoint_"+toyear+"\"";
                    }
                    else
                    {
                        int diff = Integer.parseInt(toyear) - Integer.parseInt(fromyear);
                        int fy = Integer.parseInt(fromyear);
                        while(diff >= 0)
                        {
                            tableyear = tableyear + "\"DEWPoint_"+fy+"\", ";
                            fy++;
                            diff--;
                        }
                        System.out.println(tableyear.substring(0, tableyear.length()-2));
                    }
                    
                    String s="",nameid="";
                    if(stationid.equals("All Location") && stateid.equals("00"))
                    {   
                        s=" order by \"Station_Id\"";
                        nameid = "\"Station_Id\"";
                    } 
                    else if(stationid.equals("All Location"))
                    {
                        s=" where \"State_Id\" = '"+stateid+"' order by \"Station_Id\"";
                        nameid = "\"State_Id\"";
                    }    
                    else
                    {
                        s = " where \"Station_Id\" = '"+staid+"'";
                        nameid = "\"Station_Id\"";
                    }
        
        
                    ArrayList dates = down.getBetweenDates(fromdate, todate);
                    String year="";
        
                    String selectString = "Select \"State_Id\", \"Station_Id\", ";
                    for(int j=0;j<dates.size();j++)
                    {
                        String date = dates.get(j).toString();
                        year = "20"+date.substring(5, 7);
                        selectString = selectString + "\"DEWPoint_"+year+"\".\"D"+date+"\", ";
                    }
                
                    String str = selectString.substring(0, selectString.length()-2);
                    str = str + " From "+ tableyear + s ;
                    System.out.println(str); 
                    rs.close();
                    
                    ArrayList data = new ArrayList();
                    ArrayList row = new ArrayList();
                
                    ResultSet rs1 = null;
                    rs1 = db.fetchData(str);
    
                    while(rs1.next())
                    {
                        String stateid1 = rs1.getString("State_Id"); 
                        String selectstateid = "SELECT \"State_Name\" FROM \"State\" where "
                                                + "\"State_Id\" = '"+stateid1+"'";
                        ResultSet rs_state = db.fetchData(selectstateid);
                        while(rs_state.next())
                        {
                            //System.out.println(rs_state.getString(1)); 
                            data.add(rs_state.getString(1)); 
                            row.add(rs_state.getString(1)); 
                        }
                        rs_state.close();
                            
                        String stationid1 = rs1.getString("Station_Id"); 
                        String selectstationid = "SELECT \"Station_Name\" FROM \"Station\" where "
                                                + "\"Station_Id\" = '"+stationid1+"'";
                        ResultSet rs_station = db.fetchData(selectstationid);
                        while(rs_station.next())
                        {
                            //System.out.println(rs_station.getString(1)); 
                            data.add(rs_station.getString(1));
                            row.add(rs_station.getString(1));
                                
                        }
                        rs_station.close();
                            
                        for(int k=0;k<dates.size();k++)
                        {
                            String date = dates.get(k).toString();
                            String val = rs1.getString("D"+date); 
                            //System.out.println(val); 
                            if(val==null)
                                data.add("-999");
                            else
                                data.add(val);
                        }
                    }
        
                    rs1.close();
                    db.closeConnection();
                
                
                
                    String[][] excelData = down.preapreDataToWriteToExcel(data, row.size()/2 , dates.size()+2); 
            
                
                    HSSFSheet mySheet = myWorkBook.createSheet("DEW Point");
                    HSSFRow myRow = null;
                    HSSFCell myCell = null;

                    String[][] Head = new String[2][dates.size()+2];
                    int j=0,in=0;
                    for(j=0;j<dates.size()+2;j++)
                    {
                        if(j==0)
                            Head[0][0] = "State_Name";
                        else if(j==1)
                            Head[0][1] = "Station_Name";
                        else    
                        {
                            Head[0][j] = dates.get(in).toString();
                            in++;
                        }
                    }
                    for(j=0;j<dates.size()+2;j++)
                        Head[1][j] = ""; 
                        
                    for (int rowNum = 0; rowNum < 2; rowNum++) {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) {
                            myCell = myRow.createCell(cellNum);
                            myCell.setCellValue(Head[rowNum][cellNum]);                
                        }
                    }
                    
                    for (int rowNum = 2; rowNum < (row.size()/2)+2; rowNum++) 
                    {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) 
                        {
                            myCell = myRow.createCell(cellNum);
                            if(cellNum==0 || cellNum==1)
                            {
                                myCell.setCellValue(excelData[rowNum-2][cellNum]); 
                            }
                            else
                            {            
                                myCell.setCellValue(Float.parseFloat(excelData[rowNum-2][cellNum]));                 
                                myCell.setCellStyle(cs); 
                            }
                        }
                    }
                    buffer += "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>///";
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    buffer += "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>///";
                }
            }
            else
            {
                if(dew==-1)
                    buffer += " /// ///";
            }
            if(arr.contains("SunShine Hour"))
            {
                try
                {
                    sun=0;
                    DownloadGuestData down = new DownloadGuestData();
                    DatabaseConnection db = new DatabaseConnection();
                    db.openConnection();
        
                    String selectId = "",staid="";
                    selectId = "SELECT \"Station_Id\" FROM \"Station\" where "
                             + "\"Station_Name\" = '"+stationid.trim()+"';";
                    System.out.println(selectId); 
                    
                    ResultSet rs = null;   
                    rs = db.fetchData(selectId);
                    
                    while(rs.next())
                    {
                        staid = rs.getString(1);
                    }
        
                    
                    String fromyear = fromdate.substring(6, 10);
                    String toyear = todate.substring(6, 10);
                    String tableyear = "";
                    if((Integer.parseInt(fromyear) - Integer.parseInt(toyear)) == 0)
                    {
                        tableyear = "\"SunShine_"+toyear+"\"";
                    }
                    else
                    {
                        int diff = Integer.parseInt(toyear) - Integer.parseInt(fromyear);
                        int fy = Integer.parseInt(fromyear);
                        while(diff >= 0)
                        {
                            tableyear = tableyear + "\"SunShine_"+fy+"\", ";
                            fy++;
                            diff--;
                        }
                        System.out.println(tableyear.substring(0, tableyear.length()-2));
                    }
                    
                    String s="",nameid="";
                    if(stationid.equals("All Location") && stateid.equals("00"))
                    {   
                        s=" order by \"Station_Id\"";
                        nameid = "\"Station_Id\"";
                    } 
                    else if(stationid.equals("All Location"))
                    {
                        s=" where \"State_Id\" = '"+stateid+"' order by \"Station_Id\"";
                        nameid = "\"State_Id\"";
                    }    
                    else
                    {
                        s = " where \"Station_Id\" = '"+staid+"'";
                        nameid = "\"Station_Id\"";
                    }
        
        
                    ArrayList dates = down.getBetweenDates(fromdate, todate);
                    String year="";
        
                    String selectString = "Select \"State_Id\", \"Station_Id\", ";
                    for(int j=0;j<dates.size();j++)
                    {
                        String date = dates.get(j).toString();
                        year = "20"+date.substring(5, 7);
                        selectString = selectString + "\"SunShine_"+year+"\".\"D"+date+"\", ";
                    }
                
                    String str = selectString.substring(0, selectString.length()-2);
                    str = str + " From "+ tableyear + s ;
                    System.out.println(str); 
                    rs.close();
                    
                    ArrayList data = new ArrayList();
                    ArrayList row = new ArrayList();
                
                    ResultSet rs1 = null;
                    rs1 = db.fetchData(str);
    
                    while(rs1.next())
                    {
                        String stateid1 = rs1.getString("State_Id"); 
                        String selectstateid = "SELECT \"State_Name\" FROM \"State\" where "
                                                + "\"State_Id\" = '"+stateid1+"'";
                        ResultSet rs_state = db.fetchData(selectstateid);
                        while(rs_state.next())
                        {
                            //System.out.println(rs_state.getString(1)); 
                            data.add(rs_state.getString(1)); 
                            row.add(rs_state.getString(1)); 
                        }
                        rs_state.close();
                            
                        String stationid1 = rs1.getString("Station_Id"); 
                        String selectstationid = "SELECT \"Station_Name\" FROM \"Station\" where "
                                                + "\"Station_Id\" = '"+stationid1+"'";
                        ResultSet rs_station = db.fetchData(selectstationid);
                        while(rs_station.next())
                        {
                            //System.out.println(rs_station.getString(1)); 
                            data.add(rs_station.getString(1));
                            row.add(rs_station.getString(1));
                                
                        }
                        rs_station.close();
                            
                        for(int k=0;k<dates.size();k++)
                        {
                            String date = dates.get(k).toString();
                            String val = rs1.getString("D"+date); 
                            //System.out.println(val); 
                            if(val==null)
                                data.add("-999");
                            else
                                data.add(val);
                        }
                    }
        
                    rs1.close();
                    db.closeConnection();
                
                
                
                    String[][] excelData = down.preapreDataToWriteToExcel(data, row.size()/2 , dates.size()+2); 
            
                
                    HSSFSheet mySheet = myWorkBook.createSheet("Sun Shine");
                    HSSFRow myRow = null;
                    HSSFCell myCell = null;

                    String[][] Head = new String[2][dates.size()+2];
                    int j=0,in=0;
                    for(j=0;j<dates.size()+2;j++)
                    {
                        if(j==0)
                            Head[0][0] = "State_Name";
                        else if(j==1)
                            Head[0][1] = "Station_Name";
                        else    
                        {
                            Head[0][j] = dates.get(in).toString();
                            in++;
                        }
                    }
                    for(j=0;j<dates.size()+2;j++)
                        Head[1][j] = ""; 
                        
                    for (int rowNum = 0; rowNum < 2; rowNum++) {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) {
                            myCell = myRow.createCell(cellNum);
                            myCell.setCellValue(Head[rowNum][cellNum]);                
                        }
                    }
                    
                    for (int rowNum = 2; rowNum < (row.size()/2)+2; rowNum++) 
                    {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) 
                        {
                            myCell = myRow.createCell(cellNum);
                            if(cellNum==0 || cellNum==1)
                            {
                                myCell.setCellValue(excelData[rowNum-2][cellNum]); 
                            }
                            else
                            {            
                                myCell.setCellValue(Float.parseFloat(excelData[rowNum-2][cellNum]));                 
                                myCell.setCellStyle(cs); 
                            }
                        }
                    }
                    buffer += "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>///";
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    buffer += "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>///";
                }
            }
            else
            {
                if(sun==-1)
                    buffer += " /// ///";
            }
            if(arr.contains("Wind Speed"))
            {
                try
                {
                    wind=0;
                    DownloadGuestData down = new DownloadGuestData();
                    DatabaseConnection db = new DatabaseConnection();
                    db.openConnection();
        
                    String selectId = "",staid="";
                    selectId = "SELECT \"Station_Id\" FROM \"Station\" where "
                             + "\"Station_Name\" = '"+stationid.trim()+"';";
                    System.out.println(selectId); 
                    
                    ResultSet rs = null;   
                    rs = db.fetchData(selectId);
                    
                    while(rs.next())
                    {
                        staid = rs.getString(1);
                    }
        
                    
                    String fromyear = fromdate.substring(6, 10);
                    String toyear = todate.substring(6, 10);
                    String tableyear = "";
                    if((Integer.parseInt(fromyear) - Integer.parseInt(toyear)) == 0)
                    {
                        tableyear = "\"WindSpeed_"+toyear+"\"";
                    }
                    else
                    {
                        int diff = Integer.parseInt(toyear) - Integer.parseInt(fromyear);
                        int fy = Integer.parseInt(fromyear);
                        while(diff >= 0)
                        {
                            tableyear = tableyear + "\"WindSpeed_"+fy+"\", ";
                            fy++;
                            diff--;
                        }
                        System.out.println(tableyear.substring(0, tableyear.length()-2));
                    }
                    
                    String s="",nameid="";
                    if(stationid.equals("All Location") && stateid.equals("00"))
                    {   
                        s=" order by \"Station_Id\"";
                        nameid = "\"Station_Id\"";
                    } 
                    else if(stationid.equals("All Location"))
                    {
                        s=" where \"State_Id\" = '"+stateid+"' order by \"Station_Id\"";
                        nameid = "\"State_Id\"";
                    }    
                    else
                    {
                        s = " where \"Station_Id\" = '"+staid+"'";
                        nameid = "\"Station_Id\"";
                    }
        
        
                    ArrayList dates = down.getBetweenDates(fromdate, todate);
                    String year="";
        
                    String selectString = "Select \"State_Id\", \"Station_Id\", ";
                    for(int j=0;j<dates.size();j++)
                    {
                        String date = dates.get(j).toString();
                        year = "20"+date.substring(5, 7);
                        selectString = selectString + "\"WindSpeed_"+year+"\".\"D"+date+"\", ";
                    }
                
                    String str = selectString.substring(0, selectString.length()-2);
                    str = str + " From "+ tableyear + s ;
                    System.out.println(str); 
                    rs.close();
                    
                    ArrayList data = new ArrayList();
                    ArrayList row = new ArrayList();
                
                    ResultSet rs1 = null;
                    rs1 = db.fetchData(str);
    
                    while(rs1.next())
                    {
                        String stateid1 = rs1.getString("State_Id"); 
                        String selectstateid = "SELECT \"State_Name\" FROM \"State\" where "
                                                + "\"State_Id\" = '"+stateid1+"'";
                        ResultSet rs_state = db.fetchData(selectstateid);
                        while(rs_state.next())
                        {
                            //System.out.println(rs_state.getString(1)); 
                            data.add(rs_state.getString(1)); 
                            row.add(rs_state.getString(1)); 
                        }
                        rs_state.close();
                            
                        String stationid1 = rs1.getString("Station_Id"); 
                        String selectstationid = "SELECT \"Station_Name\" FROM \"Station\" where "
                                                + "\"Station_Id\" = '"+stationid1+"'";
                        ResultSet rs_station = db.fetchData(selectstationid);
                        while(rs_station.next())
                        {
                            //System.out.println(rs_station.getString(1)); 
                            data.add(rs_station.getString(1));
                            row.add(rs_station.getString(1));
                                
                        }
                        rs_station.close();
                            
                        for(int k=0;k<dates.size();k++)
                        {
                            String date = dates.get(k).toString();
                            String val = rs1.getString("D"+date); 
                            //System.out.println(val); 
                            if(val==null)
                                data.add("-999");
                            else
                                data.add(val);
                        }
                    }
        
                    rs1.close();
                    db.closeConnection();
                
                
                
                    String[][] excelData = down.preapreDataToWriteToExcel(data, row.size()/2 , dates.size()+2); 
            
                
                    HSSFSheet mySheet = myWorkBook.createSheet("Wind Speed");
                    HSSFRow myRow = null;
                    HSSFCell myCell = null;

                    String[][] Head = new String[2][dates.size()+2];
                    int j=0,in=0;
                    for(j=0;j<dates.size()+2;j++)
                    {
                        if(j==0)
                            Head[0][0] = "State_Name";
                        else if(j==1)
                            Head[0][1] = "Station_Name";
                        else    
                        {
                            Head[0][j] = dates.get(in).toString();
                            in++;
                        }
                    }
                    for(j=0;j<dates.size()+2;j++)
                        Head[1][j] = ""; 
                        
                    for (int rowNum = 0; rowNum < 2; rowNum++) {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) {
                            myCell = myRow.createCell(cellNum);
                            myCell.setCellValue(Head[rowNum][cellNum]);                
                        }
                    }
                    
                    for (int rowNum = 2; rowNum < (row.size()/2)+2; rowNum++) 
                    {
                        myRow = mySheet.createRow(rowNum);
                        for (short cellNum = 0; cellNum < dates.size()+2; cellNum++) 
                        {
                            myCell = myRow.createCell(cellNum);
                            if(cellNum==0 || cellNum==1)
                            {
                                myCell.setCellValue(excelData[rowNum-2][cellNum]); 
                            }
                            else
                            {            
                                myCell.setCellValue(Float.parseFloat(excelData[rowNum-2][cellNum]));                 
                                myCell.setCellStyle(cs); 
                            }
                        }
                    }
                    buffer += "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>///";
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    buffer += "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>///";
                }
            }
            else
            {
                if(wind==-1)
                    buffer += " /// ///";
            }
        }
        String st[] = buffer.split("///");
        for(int i=0;i<st.length;i++)
            System.out.println(st[i]); 
        myWorkBook.write(out_file); 
        out_file.close();
        
        String inputFileName="";
        try {
            inputFileName = filename;
            String zipFileName = "E:\\VISHAL\\NetBeansProject\\AWS_DATA_Download\\web\\Data\\AWS_Data_"+finalstr+".zip";
            
            //Create input and output streams
            FileInputStream inStream = new FileInputStream(inputFileName);
            ZipOutputStream outStream = new ZipOutputStream(new FileOutputStream(zipFileName));
            
            // Add a zip entry to the output stream
            outStream.putNextEntry(new ZipEntry("AWS_Data_"+finalstr+".xls"));
            
            byte[] buf = new byte[1024];
            int bytesRead;
            
            //Each chunk of data read from the input stream
            //is written to the output stream
            while ((bytesRead = inStream.read(buf)) > 0) {
                outStream.write(buf, 0, bytesRead);
            }

            //Close zip entry and file streams
            outStream.closeEntry();

            outStream.close();
            inStream.close();
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        File del = new File(inputFileName);
        del.delete();
        
        response.getWriter().println(buffer);
        
%>

