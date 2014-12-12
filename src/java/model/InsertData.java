/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author igis_test
 */
@WebServlet(name = "InsertData", urlPatterns = {"/InsertData"})
public class InsertData extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       String queryForCities="";
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
         querySelect = "SELECT \"Station\".\"Station_Name\",\"State\".\"State_Name\"," + selectedColumn[0]
                            + " FROM \"Station\" , \"State\" , " + tableName[0]
                            + " WHERE \"Station\".\"State_Id\"=\"State\".\"State_Id\" AND \"Station\".\"Station_Id\"=" + tableName[0] + ".\"Station_Id\" AND \"Station_Name\" = '" + station + "'";
                           System.out.println("querySelect");
 }
               
             }          
            catch (Exception e) {
                    out.println(e.getMessage());
                }
         
        finally {            
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
