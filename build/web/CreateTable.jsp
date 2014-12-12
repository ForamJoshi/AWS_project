<%-- 
    Document   : CreateTable
    Created on : May 29, 2013, 3:16:44 PM
    Author     : igis_test
--%>

<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.GetCalendar"%>
<%@page import="model.ListOfDates"%>
<%@page import="model.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
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
        DatabaseConnection dbc = new DatabaseConnection();
                    dbc.openConnection();
        String querystate="";
            String querytable = "";
            //String MinTemp = "";
            String chartdate="";
            String stateName="";
            int i1=0;

            try {
                String state = request.getParameter("State");
                String station = request.getParameter("cities");
                String fromDate = request.getParameter("txtFromDate");
                String toDate = request.getParameter("txtToDate");
                String station_id = "0101";
                //out.println(state);
                if (!(fromDate.equalsIgnoreCase("") | toDate.equalsIgnoreCase(""))) {

      querystate ="SELECT \"State_Name\" FROM \"State\" WHERE \"State_Id\" = '" + state + "'";
      //out.println(querystate);
      ResultSet rs6 = dbc.selectData(querystate);
      if(rs6.next()){
          stateName=rs6.getString(1);
      }

                    //querystate ="SELECT \"State_Name\" FROM \"State\" WHERE \"State_Id\" = '" + state + "'";
                    //queryForCities ="SELECT \"State_Name\" FROM \"State\" WHERE \"State_Name\"='" + state + "'";
                    //out.println(queryForCities);

                    

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
                    
                    ArrayList<String> mintemp = new ArrayList<String>();
                    ArrayList<String> maxtemp = new ArrayList<String>();
                    ArrayList<String> rainfall = new ArrayList<String>();
                    ArrayList<String> dewpoint = new ArrayList<String>();
                    ArrayList<String> sunshine = new ArrayList<String>();
                    ArrayList<String> windspeed = new ArrayList<String>();

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
                    String buffer = "";
                    Date da = new Date();
                    String sp[] = da.toString().split(" ");
                    String ti[] = sp[3].split(":");
                    String finalstr = sp[2] + sp[1] + sp[5] + "_" + ti[0] + ti[1] + ti[2];

                    String q1 = "SELECT "
                            + selectedColumn[0] + "," + selectedColumn[1] + "," + selectedColumn[2] + "," + selectedColumn[3] + "," + selectedColumn[4] + "," + selectedColumn[5]
                            + " FROM "
                            + tableName[0] + "," + tableName[1] + "," + tableName[2] + "," + tableName[3] + "," + tableName[4] + "," + tableName[5]
                            + " WHERE "
                            + tableName[0] + ".\"Station_Id\"='" + station_id + "' AND "
                            + tableName[1] + ".\"Station_Id\"='" + station_id + "' AND "
                            + tableName[2] + ".\"Station_Id\"='" + station_id + "' AND "
                            + tableName[3] + ".\"Station_Id\"='" + station_id + "' AND "
                            + tableName[4] + ".\"Station_Id\"='" + station_id + "' AND "
                            + tableName[5] + ".\"Station_Id\"='" + station_id + "' ";
                    //out.println(q1);
                     //ResultSet rs0 = dbc.selectData(querystate);
                    //Cell cell = null;
                   //out.println("State_Name");
                    
                    ResultSet rs1 = dbc.selectData(q1);
                    listOfDates0 = ld0.getListOfDates();
                   
                    int j = 0;
                    int p = 0;
                    if (rs1.next()) {
                         //String value="";
                     for(i1=0;i1<listOfDates0.size();i1++)
                    {
                        String tempDay="",tempMonth="",tempYear="",tempDate="";
                       
                        tempDay=listOfDates0.get(i1).substring(0,2);
                        tempMonth=listOfDates0.get(i1).substring(3,6);
                        tempYear=listOfDates0.get(i1).substring(7,9);
                        tempDate=tempDay+"/"+tempMonth+"/"+tempYear;
                        chartdate=chartdate+""+tempDate;
                      //out.println(listOfDates0.get(i1));
                      
                    }
                    // chartdate=chartdate.substring(1);
                     //out.println("chartdate="+chartdate);
                    
                        while (p < 6) {
                            for (int d = 0; d < listOfDates0.size(); d++) {
                                //out.println(rs1.getString(j + 1));
                                if(p==0){
                                    mintemp.add(rs1.getString(j + 1));
                                }
                                if(p==1){
                                    maxtemp.add(rs1.getString(j + 1));
                                
                                }
                                if(p==2){
                                    rainfall.add(rs1.getString(j + 1));
                                
                                }
                                if(p==3){
                                    dewpoint.add(rs1.getString(j + 1));
                                
                                }
                                if(p==4){
                                    sunshine.add(rs1.getString(j + 1));
                                
                                }
                                if(p==5){
                                    windspeed.add(rs1.getString(j + 1));
                                
                                }
                                j++;
                                
                            }
                            p++;
                            //out.println("----------------------------------");
                        }
                    }
                    
                    %>
                    <table border="1" bordercolor="#1b75bb">
                        
                       <th>State</th><th>Station</th> <th>Dates</th><%
                               if(MinTemp){
                                    %><th>
                            MinTemp</th><%}%><%
                               if(MaxTemp){
                                    %><th> MaxTemp</th><%}%><%
                               if(Rainfall){
                                    %><th> Rainfall</th><%}%><%
                               if(DewPoint){
                                    %><th> DEWPoint</th><%}%><%
                               if(SunShine){
                                    %><th> SunShine</th><%}%><%
                               if(WindSpeed){
                                    %> <th>WindSpeed
                            </th><%}%>
                   
                    
                            
                    <%
                    for (int i = 0; i < (listOfDates0.size()); i++) {
                        %>
                       <tr>
                           <td>
                               <%
                               out.println(stateName);
                                %>
                               </td>
                           
                           <td>
                               <%
                               out.println(station);
                               %>
                               </td>
                          
                           <td>
                               <%out.println(listOfDates0.get(i));
                                    %>
                               </td><%
                               if(MinTemp){
                                    %>
                            <td>
                                <%
                                out.println(mintemp.get(i));
                                %>
                                </td>
                        <%}%>
                        <%
                               if(MaxTemp){
                                    %>
                                <td>
                                    <%
                                    out.println(maxtemp.get(i));
                                    %>
                                    </td>
                                      <%}%>
                                       <%
                               if(Rainfall){
                                    %>
                                    <td>
                                    <%
                                    out.println(rainfall.get(i));
                                    %>
                                    </td>
                                      <%}%>
                                       <%
                               if(DewPoint){
                                    %>
                                    <td>
                                    <%
                                    out.println(dewpoint.get(i));
                                    %>
                                    </td>
                                      <%}%>
                                       <%
                               if(SunShine){
                                    %>
                                    <td>
                                    <%
                                    out.println(sunshine.get(i));
                                    %>
                                    </td>
                                      <%}%>
                                       <%
                               if(WindSpeed){
                                    %>
                                    <td>
                                    <%
                                    out.println(windspeed.get(i));
                                    %>
                                    </td>
                                      <%}%>
                                </tr>
                    
                                <%
                    } %>
                    </table>
                        
                    
                        
                    <%
            }
                               }
                               
                               




                
             catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
    </body>
</html>
