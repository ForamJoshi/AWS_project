

<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.CreationHelper"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="model.GetCalendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ListOfDates"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>kavachart</title>
    </head>
    <body>
    
        <%
        
        //PrintWriter out = response.getWriter();
        boolean mintemp = false;
        boolean maxtemp = false;
        boolean rainfall = false;
        boolean dewpoint = false;
        boolean sunshine = false;
        boolean windspeed = false;
        boolean certainCities = false;
        //String queryForCities = " WHERE ";
        String chartdate="";  
        String queryForCities="";
        String temp1="";
        
        

       String parametersToGet = request.getParameter("parameter");

        

             
                if (parametersToGet.equalsIgnoreCase("mintemp")) {
                    mintemp = true;
                }
                if (parametersToGet.equalsIgnoreCase("maxtemp")) {
                    maxtemp = true;
                }
                if (parametersToGet.equalsIgnoreCase("rainfall")) {
                    rainfall = true;
                }
                if (parametersToGet.equalsIgnoreCase("dewpoint")) {
                    dewpoint = true;
                }
                if (parametersToGet.equalsIgnoreCase("sunshine")) {
                    sunshine = true;
                }
                if (parametersToGet.equalsIgnoreCase("windspeed")) {
                    windspeed = true;
                }
         //out.println(maxtemp);
            
        

       try {
            String state= request.getParameter("State");
            String station=request.getParameter("cities");
            String fromDate = request.getParameter("txtFromDate");
            String toDate = request.getParameter("txtToDate");

            if (!(fromDate.equalsIgnoreCase("") | toDate.equalsIgnoreCase(""))) {


               queryForCities ="SELECT \"Station_Name\",\"State_Id\" FROM \"Station\" WHERE \"Station_Name\" = '" + station + "'";
                               
                //out.println(queryForCities);

                DatabaseConnection dbc = new DatabaseConnection();
                dbc.openConnection();

                String splitFromDateForYear[] = fromDate.split("/");
                String year = splitFromDateForYear[2];
                String tableName[] = {"\"MinTemp_" + year + "\"",
                    "\"MaxTemp_" + year + "\"",
                    "\"Rainfall_" + year + "\"",
                    "\"DEWPoint_" + year + "\"",
                    "\"SunShine_" + year + "\"",
                    "\"WindSpeed_" + year + "\""
                };
                ListOfDates ld0 = new ListOfDates();
                ListOfDates ld1 = new ListOfDates();
                ListOfDates ld2 = new ListOfDates();
                ListOfDates ld3 = new ListOfDates();
                ListOfDates ld4 = new ListOfDates();
                ListOfDates ld5 = new ListOfDates();

                ArrayList<String> listOfDates0 = new ArrayList<String>();
                ArrayList<String> listOfDates1 = new ArrayList<String>();
                ArrayList<String> listOfDates2 = new ArrayList<String>();
                ArrayList<String> listOfDates3 = new ArrayList<String>();
                ArrayList<String> listOfDates4 = new ArrayList<String>();
                ArrayList<String> listOfDates5 = new ArrayList<String>();

               String selectedColumn[] = {ld0.getConCatListDates(fromDate, toDate, 0, year),
                    ld1.getConCatListDates(fromDate, toDate, 1, year),
                    ld2.getConCatListDates(fromDate, toDate, 2, year),
                    ld3.getConCatListDates(fromDate, toDate, 3, year),
                    ld4.getConCatListDates(fromDate, toDate, 4, year),
                    ld5.getConCatListDates(fromDate, toDate, 5, year)};

                String querySelect = "";
                

                GetCalendar gc = new GetCalendar();

                String fileName = gc.getDate();

                String link = "";
                String buffer="";
                Date da = new Date();
        String sp[] = da.toString().split(" ");
        String ti[] = sp[3].split(":");
        String finalstr = sp[2] + sp[1] + sp[5] + "_" + ti[0] + ti[1] + ti[2];
        


                    
                if (mintemp) {

                    listOfDates0 = ld0.getListOfDates();
                    
                    String value="";
                     for(int i1=0;i1<listOfDates0.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates0.get(i1).substring(0,2);
                        tempMonth=listOfDates0.get(i1).substring(3,6);
                        tempYear=listOfDates0.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+","+tempDate;
                     // out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    
                    System.out.println(selectedColumn[0]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[0]
                            + " FROM \"Station\" , \"State\" , " + tableName[0]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[0] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs0 = dbc.fetchData(querySelect);
                    
                    if(rs0.next()){
                    for(int i=0;i<listOfDates0.size();i++)
                                               {
                        
                        temp1=temp1+","+rs0.getString(i+3);
                                           }
                                                       
                    temp1=temp1.substring(1);
//out.println("temp1="+temp1);                    
                   }
                    
                }
        if (maxtemp) {

                    listOfDates1 = ld1.getListOfDates();
                    
                    String value="";
                     for(int i1=0;i1<listOfDates1.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates1.get(i1).substring(0,2);
                        tempMonth=listOfDates1.get(i1).substring(3,6);
                        tempYear=listOfDates1.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+","+tempDate;
                     // out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    
                    System.out.println(selectedColumn[1]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[1]
                            + " FROM \"Station\" , \"State\" , " + tableName[1]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[1] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs1 = dbc.fetchData(querySelect);
                    
                    if(rs1.next()){
                    for(int i=0;i<listOfDates1.size();i++)
                                               {
                        temp1=temp1+","+rs1.getString(i+3);
                        
                    
                                       /*if(rs0.getString(i+3) == null)
                                                       {
                                           
                                           temp1=" ";
                        
                    }*/
                                           }
                                                       
                    temp1=temp1.substring(1);
//out.println("temp1="+temp1);                    
                   }
                    
                }
        if (rainfall) {

                    listOfDates2 = ld2.getListOfDates();
                    
                    String value="";
                     for(int i1=0;i1<listOfDates2.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates2.get(i1).substring(0,2);
                        tempMonth=listOfDates2.get(i1).substring(3,6);
                        tempYear=listOfDates2.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+","+tempDate;
                     // out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    
                    System.out.println(selectedColumn[1]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[2]
                            + " FROM \"Station\" , \"State\" , " + tableName[2]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[2] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs2 = dbc.fetchData(querySelect);
                    
                    if(rs2.next()){
                    for(int i=0;i<listOfDates2.size();i++)
                                               {
                        temp1=temp1+","+rs2.getString(i+3);
                        
                    
                                       /*if(rs0.getString(i+3) == null)
                                                       {
                                           
                                           temp1=" ";
                        
                    }*/
                                           }
                                                       
                    temp1=temp1.substring(1);
//out.println("temp1="+temp1);                    
                   }
                    
                }
         if (dewpoint) {

                    listOfDates3 = ld3.getListOfDates();
                    
                    String value="";
                     for(int i1=0;i1<listOfDates3.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates3.get(i1).substring(0,2);
                        tempMonth=listOfDates3.get(i1).substring(3,6);
                        tempYear=listOfDates3.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+","+tempDate;
                     // out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    
                    System.out.println(selectedColumn[1]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[3]
                            + " FROM \"Station\" , \"State\" , " + tableName[3]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[3] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs3 = dbc.fetchData(querySelect);
                    
                    if(rs3.next()){
                    for(int i=0;i<listOfDates3.size();i++)
                                               {
                        temp1=temp1+","+rs3.getString(i+3);
                        
                    
                                       /*if(rs0.getString(i+3) == null)
                                                       {
                                           
                                           temp1=" ";
                        
                    }*/
                                           }
                                                       
                    temp1=temp1.substring(1);
//out.println("temp1="+temp1);                    
                   }
                    
                }
         if (sunshine) {

                    listOfDates4 = ld4.getListOfDates();
                    
                    String value="";
                     for(int i1=0;i1<listOfDates4.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates4.get(i1).substring(0,2);
                        tempMonth=listOfDates4.get(i1).substring(3,6);
                        tempYear=listOfDates4.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+","+tempDate;
                     // out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    
                    System.out.println(selectedColumn[1]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[4]
                            + " FROM \"Station\" , \"State\" , " + tableName[4]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[4] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs4 = dbc.fetchData(querySelect);
                    
                    if(rs4.next()){
                    for(int i=0;i<listOfDates4.size();i++)
                                               {
                        temp1=temp1+","+rs4.getString(i+3);
                        
                    
                                       /*if(rs0.getString(i+3) == null)
                                                       {
                                           
                                           temp1=" ";
                        
                    }*/
                                           }
                                                       
                    temp1=temp1.substring(1);
//out.println("temp1="+temp1);                    
                   }
                    
                }
         if (windspeed) {

                    listOfDates5 = ld5.getListOfDates();
                    
                    String value="";
                     for(int i1=0;i1<listOfDates5.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates5.get(i1).substring(0,2);
                        tempMonth=listOfDates5.get(i1).substring(3,6);
                        tempYear=listOfDates5.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+","+tempDate;
                     // out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    
                    System.out.println(selectedColumn[1]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[5]
                            + " FROM \"Station\" , \"State\" , " + tableName[5]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[5] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs5 = dbc.fetchData(querySelect);
                    
                    if(rs5.next()){
                    for(int i=0;i<listOfDates5.size();i++)
                                               {
                        temp1=temp1+","+rs5.getString(i+3);
                        
                    
                                       /*if(rs0.getString(i+3) == null)
                                                       {
                                           
                                           temp1=" ";
                        
                    }*/
                                           }
                                                       
                    temp1=temp1.substring(1);
//out.println("temp1="+temp1);                    
                   }
                    
                }
               }
                       }
               
                       
            catch (Exception e) {
                    out.println(e.getMessage());
                }
         
         
        %>
       
        <form>
 <APPLET CODE="com.ve.kavachart.applet.disDateLineApp"  ARCHIVE="kavachartjars/disDateLineApp.jar" WIDTH="590" HEIGHT="520">
       
     <param name="dwellLabelsOn" value="true">
       <param name="xAxisTitle" value="DATE">
    
     
      <param name="yAxisTitle" value="CENTIGRADE">
     
            
         <param name="xAxisOptions" value="gridOn,bottomAxis">
         <param name="yAxisOptions" value="rotateTitle,gridOn,minTickOn,leftAxis">
         <param name="xAxisTitleColor" value="red">
            <param name="yAxisTitleColor" value="red">
            <param name="auxAxisTitleColor" value="red">
            <param name="xAxisLabelCount" value="5">
            <param name="xAxisLabelFont" value="Times New Roman,11,0">
            <param name="yAxisLabelFont" value="Times New Roman,11,0">
            <param name="auxAxisLabelFont" value="Times New Roman,11,0">
            <param name="xAxisTickColor" value="cccccc">
            <param name="yAxisGridColor" value="cccccc">
            <param name="yAxisLabelColor" value="000000">
            <param name="yAxisLineColor" value="cccccc">
            <param name="outlinePlotarea" value="false">
            <param name="plotAreaGradient" value="2">
            <param name="plotAreaRight" value=".90">
            <param name="plotAreaLeft" value=".09">
             <param name="plotAreaBottom" value="0.40">
          
            
            <param name="legendOn"  value="true" >
            <param name="dataset0Name" value="Date/Value">
            <param name="iconWidth"  value="0.07" >
            <param name="iconGap"  value="0.01" >
            <param name="iconHeight"  value="0.02" >
            
            <param name="dataset0MarkerStyle" value="2" >
            
        <param name="dwellLabelDateFormat" value="dd-MMM">
        <param name="dwellLabelTemplate" value="Value: <y><br>Date: <x>">
       <param name="inputDateFormat" value="dd/MMM/yy">
       <param name="axisDateFormat" value="dd/MMM/yy">
    <param name="dataset0yValues" value="<%=temp1%>">
       <param name="dataset0dateValues" value="<%=chartdate%>">
                            
        
        </APPLET>  
       
</form>
    </body>
</html>
