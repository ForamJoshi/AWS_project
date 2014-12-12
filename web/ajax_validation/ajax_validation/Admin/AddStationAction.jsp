<%-- 
    Document   : AddStationDatabase
    Created on : Sep 20, 2012, 5:04:46 PM
    Author     : IGIS_TEST
--%>


<%
    String state[] = request.getParameterValues("state");
    String station[] = request.getParameterValues("station");
    String lat[] = request.getParameterValues("lat");
    String lon[] = request.getParameterValues("lon");
    
    for(int i=0;i<state.length;i++)
    {
        String insertQuery = "";
        System.out.println(state[i]+"\t"+station[i]+"\t"+lat[i]+"\t"+lon[i]); 
    }
    response.sendRedirect("Admin.jsp"); 
%>
