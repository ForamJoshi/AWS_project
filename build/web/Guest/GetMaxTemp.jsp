<%@page import="InsertData.DownloadGuestData"%>
<%@page import="InsertData.InsertMinTemp"%>
<%@page import="Database.DatabaseConnection"%>
<%@page language="java" import="java.sql.*,java.net.*,java.math.*,javax.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.*" %>

<%
	String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        String stationid = request.getParameter("stationid");
        String stateid = request.getParameter("stateid");
        String outputfile = request.getParameter("outputfile");
        
	response.setContentType("text/html");
	response.setHeader("Cache-Control","no-cache");
	  
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
        for(int i=0;i<dates.size();i++)
        {
            String date = dates.get(i).toString();
            year = "20"+date.substring(5, 7);
            selectString = selectString + "\"MaxTemp_"+year+"\".\"D"+date+"\", ";
        }
        
        String str = selectString.substring(0, selectString.length()-2);
        str = str + " From "+ tableyear + s ;
        System.out.println(str); 
        rs.close();
        db.closeConnection();
        
        boolean boll = down.downloadMinTemp(str, dates,nameid, outputfile); 
        String buffer;
        
        if(boll == true)
        {
            buffer = "<input type=\"image\" src=\"./Images/valid.png\"/>///<label class=\"sucessdownload\">Sucessfully Done !</label>";
        }
        else
        {
            buffer = "<input type=\"image\" src=\"./Images/error.png\"/>///<label class=\"errordownload\">Error in Downloading.. !</label>";
        }    
        response.getWriter().println(buffer);
%>
