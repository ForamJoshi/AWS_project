<%-- 
    Document   : CreateExcel
    Created on : May 29, 2013, 3:11:37 PM
    Author     : igis_test
--%>

<%@page import="model.GetCalendar"%>
<%@page import="model.ListOfDates"%>
<%@page import="model.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.CreationHelper"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.joda.time.DateTime"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            boolean MinTemp = false;
        boolean MaxTemp = false;
        boolean Rainfall = false;
        boolean DewPoint = false;
        boolean SunShine = false;
        boolean WindSpeed = false;
        String queryForCities="";
       
      

        String parametersToGet[] = request.getParameterValues("Parameter");

        if (parametersToGet[0].equalsIgnoreCase("All")) {
            MinTemp = true;
            MaxTemp = true;
            Rainfall = true;
            DewPoint = true;
            SunShine = true;
            WindSpeed = true;
        } else {

            for (int i = 0; i < parametersToGet.length; i++) {
                if (parametersToGet[i].equalsIgnoreCase("MinTemp")) {
                    MinTemp = true;
                }
                if (parametersToGet[i].equalsIgnoreCase("MaxTemp")) {
                    MaxTemp = true;
                }
                if (parametersToGet[i].equalsIgnoreCase("Rainfall")) {
                    Rainfall = true;
                }
                if (parametersToGet[i].equalsIgnoreCase("DewPoint")) {
                    DewPoint = true;
                }
                if (parametersToGet[i].equalsIgnoreCase("SunShine")) {
                    SunShine = true;
                }
                if (parametersToGet[i].equalsIgnoreCase("WindSpeed")) {
                    WindSpeed = true;
                }
            }
        }
        
        try {
            String state= request.getParameter("State");
            String station=request.getParameter("cities");
            String fromDate = request.getParameter("txtFromDate");
            String toDate = request.getParameter("txtToDate");

            if (!(fromDate.equalsIgnoreCase("") | toDate.equalsIgnoreCase(""))) {


               queryForCities ="SELECT \"Station_Name\",\"State_Id\" FROM \"Station\" WHERE \"Station_Name\" = '" + station + "'";
                                //queryForCities ="SELECT \"State_Name\" FROM \"State\" WHERE \"State_Name\"='" + state + "'";
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
                short i;

                GetCalendar gc = new GetCalendar();

                String fileName = gc.getDate();

                String link = "";
                String buffer="";
                Date da = new Date();
                String sp[] = da.toString().split(" ");
        String ti[] = sp[3].split(":");
        String finalstr = sp[2] + sp[1] + sp[5] + "_" + ti[0] + ti[1] + ti[2];

                
                //FileOutputStream fos = new FileOutputStream("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 6.0\\webapps\\IMDCitiesData\\IMD_Data_" + fileName + ".xls");

                FileOutputStream fos = new FileOutputStream("D:\\foram\\AWS_project\\web\\data\\AWS_Data" + fileName + ".xls");
                 Workbook wb = new HSSFWorkbook();
                    CreationHelper createHelper = wb.getCreationHelper();

               
                //CreationHelper createHelper = wb.getCreationHelper();
                if (MinTemp) {

                    listOfDates0 = ld0.getListOfDates();
                    String chartdate="";
                    String value="";
                     for(int i1=0;i1<listOfDates0.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates0.get(i1).substring(0,2);
                        tempMonth=listOfDates0.get(i1).substring(3,6);
                        tempYear=listOfDates0.get(i1).substring(7,9);
                        tempDate=tempDay+tempMonth+tempYear;
                        chartdate=chartdate+","+tempDate;
                      //out.println(listOfDates0.get(i1));
                    }
                     chartdate=chartdate.substring(1);
                    //out.println("chartdate="+chartdate);
                    Sheet mintemp_sheet = wb.createSheet("Min_Temp");
                    System.out.println(selectedColumn[0]);
                    
                    querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[0]
                            + " FROM \"Station\" , \"State\" , " + tableName[0]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[0] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           
                   
                   //out.println(querySelect);

                    ResultSet rs0 = dbc.selectData(querySelect);
                    Row row = null;
                    Cell cell = null;
                    
                    //for headings
                    row = mintemp_sheet.createRow((short) 0);
                    for (int k = 0; k < (listOfDates0.size() + 4); k++) {
                        cell = row.createCell(k);
                        if (k == 0) {
                            cell.setCellValue("Station_Name");
                        }
                        if (k == 1) {
                            cell.setCellValue("State_Name");
                        }
                        if (k == 2) {
                cell.setCellValue("Latitude");
                }
                if (k == 3) {
                cell.setCellValue("Longitude");
                }
                        if (k > 3) {
                            cell.setCellValue(listOfDates0.get(k - 4));
                        }
                    }
                    //no. of stations
                    i = 1;
                   
                  
                    while (rs0.next()) {
                        row = mintemp_sheet.createRow(i);
                        //no of dates
                    for (int j = 0; j < (listOfDates0.size() + 4); j++) {
                cell = row.createCell(j);
                if (j < 4) {
                cell.setCellValue(rs0.getString(j + 1));
                } else {
                if (rs0.getString(j + 1) == null) {
                cell.setCellValue(-999);
                } else {
                cell.setCellValue(Double.parseDouble(rs0.getString(j + 1)));
                }
                value=value+","+cell;
                
                            //out.println(cell);
                           value=value.substring(1); 
                     //out.println("value="+value);
                         
               
                        }
               
                
                        }
                        i++;
                         
                        
                    }
                }
                 if (MaxTemp) {
                listOfDates1 = ld1.getListOfDates();
               
                
                Sheet MaxTemp_sheet = wb.createSheet("Max_Temp");
                querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[1]
                            + " FROM \"Station\" , \"State\" , " + tableName[1]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[1] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                
                ResultSet rs1 = dbc.selectData(querySelect);
                Row row = null;
                Cell cell = null;
                //for headings
                row = MaxTemp_sheet.createRow((short) 0);
                for (int k = 0; k < (listOfDates1.size() + 4); k++) {
                cell = row.createCell(k);
                if (k == 0) {
                cell.setCellValue("Station_Name");
                }
                if (k == 1) {
                cell.setCellValue("State_Name");
                }
                if (k == 2) {
                cell.setCellValue("Latitude");
                }
                if (k == 3) {
                cell.setCellValue("Longitude");
                }
                if (k > 3) {
                cell.setCellValue(listOfDates1.get(k - 4));
                }
                }
                //no. of stations
                i = 1;
                while (rs1.next()) {
                row = MaxTemp_sheet.createRow(i);
                //no of dates
                for (int j = 0; j < (listOfDates1.size() + 4); j++) {
                cell = row.createCell(j);
                if (j < 4) {
                cell.setCellValue(rs1.getString(j + 1));
                } else {
                if (rs1.getString(j + 1) == null) {
                cell.setCellValue(-999);
                } else {
                cell.setCellValue(Double.parseDouble(rs1.getString(j + 1)));
                }
                }
                }
                i++;
                }
                //wb.write(fos);
                }
                
               if (Rainfall) {
                listOfDates2 = ld2.getListOfDates();
                
                Sheet Rainfall_sheet = wb.createSheet("Rainfall");
                
                querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[2]
                            + " FROM \"Station\" , \"State\" , " + tableName[2]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[2] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";

                //out.println(querySelect);
                
                ResultSet rs2 = dbc.selectData(querySelect);
                Row row = null;
                Cell cell = null;
                //for headings
                row = Rainfall_sheet.createRow((short) 0);
                for (int k = 0; k < (listOfDates2.size() + 4); k++) {
                cell = row.createCell(k);
                if (k == 0) {
                cell.setCellValue("Station_Name");
                }
                if (k == 1) {
                cell.setCellValue("State_Name");
                }
                if (k == 2) {
                cell.setCellValue("Latitude");
                }
                if (k == 3) {
                cell.setCellValue("Longitude");
                }
                if (k > 3) {
                cell.setCellValue(listOfDates2.get(k - 4));
                }
                }
                //no. of stations
                i = 1;
                while (rs2.next()) {
                row = Rainfall_sheet.createRow(i);
                //no of dates
                for (int j = 0; j < (listOfDates2.size() + 4); j++) {
                cell = row.createCell(j);
                if (j < 4) {
                cell.setCellValue(rs2.getString(j + 1));
                } else {
                if (rs2.getString(j + 1) == null) {
                cell.setCellValue(-999);
                } else {
                cell.setCellValue(Double.parseDouble(rs2.getString(j + 1)));
                }
                }
                }
                i++;
                }
                //wb.write(fos);
                }
                
                if (DewPoint) {
                listOfDates3 = ld3.getListOfDates();
                
                Sheet DewPoint_sheet = wb.createSheet("DewPoint");
                querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[3]
                            + " FROM \"Station\" , \"State\" , " + tableName[3]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[3] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";

                
                //out.println(querySelect);
                
                ResultSet rs3 = dbc.selectData(querySelect);
                Row row = null;
                Cell cell = null;
                //for headings
                row = DewPoint_sheet.createRow((short) 0);
                for (int k = 0; k < (listOfDates3.size() + 4); k++) {
                cell = row.createCell(k);
                if (k == 0) {
                cell.setCellValue("Station_Name");
                }
                if (k == 1) {
                cell.setCellValue("State_Name");
                }
                if (k == 2) {
                cell.setCellValue("Latitude");
                }
                if (k == 3) {
                cell.setCellValue("Longitude");
                }
                if (k > 3) {
                cell.setCellValue(listOfDates3.get(k - 4));
                }
                }
                //no. of stations
                i = 1;
                while (rs3.next()) {
                row = DewPoint_sheet.createRow(i);
                //no of dates
                for (int j = 0; j < (listOfDates3.size() + 4); j++) {
                cell = row.createCell(j);
                if (j < 4) {
                cell.setCellValue(rs3.getString(j + 1));
                } else {
                if (rs3.getString(j + 1) == null) {
                cell.setCellValue(-999);
                } else {
                cell.setCellValue(Double.parseDouble(rs3.getString(j + 1)));
                }
                }
                }
                i++;
                }
                //wb.write(fos);
                }
                
                if (SunShine) {
                listOfDates4 = ld4.getListOfDates();
                
                Sheet SunShine_sheet = wb.createSheet("SunShine");
                querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[4]
                            + " FROM \"Station\" , \"State\" , " + tableName[4]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[4] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";

                
                
                
               //out.println(querySelect);
                
                ResultSet rs4 = dbc.selectData(querySelect);
                Row row = null;
                Cell cell = null;
                //for headings
                row = SunShine_sheet.createRow((short) 0);
                for (int k = 0; k < (listOfDates4.size() + 4); k++) {
                cell = row.createCell(k);
                if (k == 0) {
                cell.setCellValue("Station_Name");
                }
                if (k == 1) {
                cell.setCellValue("State_Name");
                }
                if (k == 2) {
                cell.setCellValue("Latitude");
                }
                if (k == 3) {
                cell.setCellValue("Longitude");
                }
                if (k > 3) {
                cell.setCellValue(listOfDates4.get(k - 4));
                }
                }
                //no. of stations
                i = 1;
                while (rs4.next()) {
                row = SunShine_sheet.createRow(i);
                //no of dates
                for (int j = 0; j < (listOfDates4.size() + 4); j++) {
                cell = row.createCell(j);
                if (j < 4) {
                cell.setCellValue(rs4.getString(j + 1));
                } else {
                if (rs4.getString(j + 1) == null) {
                cell.setCellValue(-999);
                } else {
                cell.setCellValue(Double.parseDouble(rs4.getString(j + 1)));
                }
                }
                }
                i++;
                }
                //wb.write(fos);
                }
                if (WindSpeed) {
                listOfDates5 = ld5.getListOfDates();
                
                Sheet WindSpeed_sheet = wb.createSheet("WindSeed");
                querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[5]
                            + " FROM \"Station\" , \"State\" , " + tableName[5]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[5] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                
                //out.println(querySelect);
                
                ResultSet rs5 = dbc.selectData(querySelect);
                Row row = null;
                Cell cell = null;
                //for headings
                row = WindSpeed_sheet.createRow((short) 0);
                for (int k = 0; k < (listOfDates5.size() + 4); k++) {
                cell = row.createCell(k);
                if (k == 0) {
                cell.setCellValue("Station_Name");
                }
                if (k == 1) {
                cell.setCellValue("State_Name");
                }
                if (k == 2) {
                cell.setCellValue("Latitude");
                }
                if (k == 3) {
                cell.setCellValue("Longitude");
                }
                if (k > 3) {
                cell.setCellValue(listOfDates5.get(k - 4));
                }
                }
                //no. of stations
                i = 1;
                while (rs5.next()) {
                row = WindSpeed_sheet.createRow(i);
                //no of dates
                for (int j = 0; j < (listOfDates5.size() + 4); j++) {
                cell = row.createCell(j);
                if (j < 4) {
                cell.setCellValue(rs5.getString(j + 1));
                } else {
                if (rs5.getString(j + 1) == null) {
                cell.setCellValue(-999);
                } else {
                cell.setCellValue(Double.parseDouble(rs5.getString(j + 1)));
                }
                }
                }
                i++;
                }
                //wb.write(fos);
                }

                wb.write(fos);
                fos.close();     
                link = "<a href=\"http:\\\\localhost:8084\\AWS_project\\data\\AWS_Data" + fileName + ".xls\">Click here to Download File</a>";
                response.getWriter().println(link);


            } else {
                out.println("Invalid Date Selected");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </body>
</html>
