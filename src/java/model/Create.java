/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.*;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.joda.time.DateTime;

/**
 *
 * @author sac
 */
public class Create extends HttpServlet {

    /** 
     * Processes requests Nikhil for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean MinTemp = false;
        boolean MaxTemp = false;
        boolean Rainfall = false;
        boolean DewPoint = false;
        boolean SunShine = false;
        boolean WindSpeed = false;
        boolean certainCities = false;
        String queryForCities = " WHERE ";
        String parameterToGet[]=request.getParameterValues("Parameter");

        if (request.getParameter("allcities") == null) {
            certainCities = true;
        }
        if (request.getParameterValues("MinTemp") != null) {
            MinTemp = true;
        }
        if (request.getParameter("MaxTemp") != null) {
            MaxTemp = true;
        }
        if (request.getParameter("Rainfall") != null) {
            Rainfall = true;
        }
        if (request.getParameter("DewPoint") != null) {
            DewPoint = true;
        }
        if (request.getParameter("SunShine") != null) {
            SunShine = true;
        }
        if (request.getParameter("WindSpeed") != null) {
            WindSpeed = true;
        }

        try {
            String state= request.getParameter("State");
            String station=request.getParameter("cities");
            String fromDate = request.getParameter("txtFromDate");
            String toDate = request.getParameter("txtToDate");

            if (!(fromDate.equalsIgnoreCase("") | toDate.equalsIgnoreCase(""))) {

                if (certainCities) {
                    String listOfCities[] = request.getParameterValues("cities");
                    for (int x = 0; x < listOfCities.length; x++) {
                        queryForCities = queryForCities + "\"Station\".Station_name = '" + listOfCities[x] + "'";
                    }
                    
                }
                else
                {
                    queryForCities ="SELECT \"Station_Name\",\"State_Id\" FROM \"Station\" WHERE \"Station_Name\" = '" + station + "'";
                }
                queryForCities = queryForCities.substring(0, (queryForCities.length() - 4));

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

                if (fromDate.substring(4).equalsIgnoreCase(toDate.substring(4))) {
                    //System.out.println("Same Year");
                    GetCalendar gc = new GetCalendar();

                    String fileName = gc.getDate();
                    String link = "";
                    FileOutputStream fos = new FileOutputStream("E:\\foram\\AWS_project\\web\\data\\AWS_Data" + fileName + ".xls");
                    //FileOutputStream fos = new FileOutputStream("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 6.0\\webapps\\IMDCitiesData\\IMD_Data_" + fileName + ".xls");
                    Workbook wb = new HSSFWorkbook();
                    CreationHelper createHelper = wb.getCreationHelper();

                    if (MinTemp) {
                        listOfDates0 = ld0.getListOfDates();

                        Sheet MinTemp_sheet = wb.createSheet("MinTemp");
                        if (certainCities) {
                            querySelect =querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[0]
                            + " FROM \"Station\" , \"State\" , " + tableName[0]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[0] + ".\"Station_Id\" AND \"Station_Name\" = + queryForCities";
out.println(querySelect);
                        } else {
                            querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\",\"Station\".\"Latitude\",\"Station\".\"Longitude\"," + selectedColumn[0]
                            + " FROM \"Station\" , \"State\" , " + tableName[0]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[0] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                            
                            
                        }
                        System.out.println(querySelect);

                        ResultSet rs0 = dbc.selectData(querySelect);
                        Row row = null;
                        Cell cell = null;
                        //for headings
                        row = MinTemp_sheet.createRow((short) 0);
                        for (int k = 0; k < (listOfDates0.size() + 2); k++) {
                            cell = row.createCell(k);
                            if (k == 0) {
                                cell.setCellValue("Station_Name");
                            }
                            if (k == 1) {
                                cell.setCellValue("State_Name");
                            }
                            if (k > 1) {
                                cell.setCellValue(listOfDates0.get(k - 2));
                            }
                        }
                        //no. of stations
                        i = 1;
                        while (rs0.next()) {
                            row = MinTemp_sheet.createRow(i);
                            //no of dates
                            for (int j = 0; j < (listOfDates0.size() + 2); j++) {
                                cell = row.createCell(j);
                                if (j < 2) {
                                    cell.setCellValue(rs0.getString(j + 1));
                                } else {
                                    if (rs0.getString(j + 1) == null) {
                                        cell.setCellValue(-999);
                                    } else {
                                        cell.setCellValue(Double.parseDouble(rs0.getString(j + 1)));
                                    }
                                }
                            }
                            i++;
                        }
                        //wb.write(fos);
                    }

                    if (MaxTemp) {
                        listOfDates1 = ld1.getListOfDates();

                        Sheet MaxTemp_sheet = wb.createSheet("MaxTemp");
                        if (certainCities) {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[1]
                                    + " FROM " + tableName[1]
                                    + " INNER JOIN \"IMDCities\""
                                    + "ON " + tableName[1] + ".station_code = \"IMDCities\".station_code"
                                    + " " + queryForCities;

                        } else {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[1]
                                    + " FROM " + tableName[1] + ", \"IMDCities\""
                                    + " WHERE " + tableName[1] + ".station_code = \"IMDCities\".station_code";
                        }
                        System.out.println(querySelect);

                        ResultSet rs1 = dbc.selectData(querySelect);
                        Row row = null;
                        Cell cell = null;
                        //for headings
                        row = MaxTemp_sheet.createRow((short) 0);
                        for (int k = 0; k < (listOfDates1.size() + 2); k++) {
                            cell = row.createCell(k);
                            if (k == 0) {
                                cell.setCellValue("Station_Name");
                            }
                            if (k == 1) {
                                cell.setCellValue("State_Name");
                            }
                            if (k > 1) {
                                cell.setCellValue(listOfDates1.get(k - 2));
                            }
                        }
                        //no. of stations
                        i = 1;
                        while (rs1.next()) {
                            row = MaxTemp_sheet.createRow(i);
                            //no of dates
                            for (int j = 0; j < (listOfDates1.size() + 2); j++) {
                                cell = row.createCell(j);
                                if (j < 2) {
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
                        if (certainCities) {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[2]
                                    + " FROM " + tableName[2]
                                    + " INNER JOIN \"IMDCities\""
                                    + "ON " + tableName[2] + ".station_code = \"IMDCities\".station_code"
                                    + " " + queryForCities;

                        } else {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[2]
                                    + " FROM " + tableName[2] + ", \"IMDCities\""
                                    + " WHERE " + tableName[2] + ".station_code = \"IMDCities\".station_code";
                        }
                        System.out.println(querySelect);

                        ResultSet rs2 = dbc.selectData(querySelect);
                        Row row = null;
                        Cell cell = null;
                        //for headings
                        row = Rainfall_sheet.createRow((short) 0);
                        for (int k = 0; k < (listOfDates2.size() + 2); k++) {
                            cell = row.createCell(k);
                            if (k == 0) {
                                cell.setCellValue("Station_Name");
                            }
                            if (k == 1) {
                                cell.setCellValue("State_Name");
                            }
                            if (k > 1) {
                                cell.setCellValue(listOfDates2.get(k - 2));
                            }
                        }
                        //no. of stations
                        i = 1;
                        while (rs2.next()) {
                            row = Rainfall_sheet.createRow(i);
                            //no of dates
                            for (int j = 0; j < (listOfDates2.size() + 2); j++) {
                                cell = row.createCell(j);
                                if (j < 2) {
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
                        if (certainCities) {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[3]
                                    + " FROM " + tableName[3]
                                    + " INNER JOIN \"IMDCities\""
                                    + "ON " + tableName[3] + ".station_code = \"IMDCities\".station_code"
                                    + " " + queryForCities;

                        } else {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[3]
                                    + " FROM " + tableName[3] + ", \"IMDCities\""
                                    + " WHERE " + tableName[3] + ".station_code = \"IMDCities\".station_code";
                        }
                        System.out.println(querySelect);

                        ResultSet rs3 = dbc.selectData(querySelect);
                        Row row = null;
                        Cell cell = null;
                        //for headings
                        row = DewPoint_sheet.createRow((short) 0);
                        for (int k = 0; k < (listOfDates3.size() + 2); k++) {
                            cell = row.createCell(k);
                            if (k == 0) {
                                cell.setCellValue("Station_Name");
                            }
                            if (k == 1) {
                                cell.setCellValue("State_Name");
                            }
                            if (k > 1) {
                                cell.setCellValue(listOfDates3.get(k - 2));
                            }
                        }
                        //no. of stations
                        i = 1;
                        while (rs3.next()) {
                            row = DewPoint_sheet.createRow(i);
                            //no of dates
                            for (int j = 0; j < (listOfDates3.size() + 2); j++) {
                                cell = row.createCell(j);
                                if (j < 2) {
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
                        if (certainCities) {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[4]
                                    + " FROM " + tableName[4]
                                    + " INNER JOIN \"IMDCities\""
                                    + "ON " + tableName[4] + ".station_code = \"IMDCities\".station_code"
                                    + " " + queryForCities;

                        } else {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[4]
                                    + " FROM " + tableName[4] + ", \"IMDCities\""
                                    + " WHERE " + tableName[4] + ".station_code = \"IMDCities\".station_code";
                        }
                        System.out.println(querySelect);

                        ResultSet rs4 = dbc.selectData(querySelect);
                        Row row = null;
                        Cell cell = null;
                        //for headings
                        row = SunShine_sheet.createRow((short) 0);
                        for (int k = 0; k < (listOfDates4.size() + 2); k++) {
                            cell = row.createCell(k);
                            if (k == 0) {
                                cell.setCellValue("Station_Name");
                            }
                            if (k == 1) {
                                cell.setCellValue("State_Name");
                            }
                            if (k > 1) {
                                cell.setCellValue(listOfDates4.get(k - 2));
                            }
                        }
                        //no. of stations
                        i = 1;
                        while (rs4.next()) {
                            row = SunShine_sheet.createRow(i);
                            //no of dates
                            for (int j = 0; j < (listOfDates4.size() + 2); j++) {
                                cell = row.createCell(j);
                                if (j < 2) {
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

                        Sheet WindSpeed_sheet = wb.createSheet("WindSpeed");
                        if (certainCities) {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[5]
                                    + " FROM " + tableName[5]
                                    + " INNER JOIN \"IMDCities\""
                                    + "ON " + tableName[5] + ".station_code = \"IMDCities\".station_code"
                                    + " " + queryForCities;

                        } else {
                            querySelect = "SELECT \"IMDCities\".station_code,\"IMDCities\".station_name," + selectedColumn[5]
                                    + " FROM " + tableName[5] + ", \"IMDCities\""
                                    + " WHERE " + tableName[5] + ".station_code = \"IMDCities\".station_code";
                        }
                        System.out.println(querySelect);

                        ResultSet rs5 = dbc.selectData(querySelect);
                        Row row = null;
                        Cell cell = null;
                        //for headings
                        row = WindSpeed_sheet.createRow((short) 0);
                        for (int k = 0; k < (listOfDates4.size() + 2); k++) {
                            cell = row.createCell(k);
                            if (k == 0) {
                                cell.setCellValue("Station_Name");
                            }
                            if (k == 1) {
                                cell.setCellValue("State_Name");
                            }
                            if (k > 1) {
                                cell.setCellValue(listOfDates4.get(k - 2));
                            }
                        }
                        //no. of stations
                        i = 1;
                        while (rs5.next()) {
                            row = WindSpeed_sheet.createRow(i);
                            //no of dates
                            for (int j = 0; j < (listOfDates4.size() + 2); j++) {
                                cell = row.createCell(j);
                                if (j < 2) {
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
                }


            } else {
                out.println("Invalid Date Selected");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
