<%-- 
    Document   : newjsp
    Created on : May 28, 2013, 10:36:08 AM
    Author     : igis_test
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <%
        //Connection con;
        //ResultSet rs;
        //Statement smt;
        String u1="",u2="",u3="",u4="";
        
        String url="jdbc:postgresql://10.61.51.27:5432/AWS";
        String username="postgres";
        String password="postgres";
        
                         
        %>
        
       
        <form method="get" action="newjsp.jsp">
            
            <p>User Name:<input type="text" size="10" name="t1"/></p>
                <p>Password:<input type="password" size="10" name="t2"/></p>
                <p>Old Password:<input type="password" size="10" name="t3"/></p>
                <p>Confirm Password:<input type="password" size="10" name="t4"/></p>
                <p><input type="submit" value="Change"/></p>
                <%
                u1=request.getParameter("t1");
                u2=request.getParameter("t2");
                u3=request.getParameter("t3");
                u4=request.getParameter("t4");
               try{
                   Class.forName("org.postgresql.Driver");
            Connection con=DriverManager.getConnection(url,username,password);
            Statement smt=con.createStatement();
            ResultSet rs=smt.executeQuery("select * from \"admin\"");
                    //con=null;
                    //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    //con=DriverManager.getConnection("Jdbc:Odbc:mydsn");
                    //smt=con.createStatement();
                    //rs=null;
                    //rs=smt.executeQuery("select * from Table1");
            
                    System.out.println("ok");
                    if(u3.equals(u4)==true)
                                               {
                        rs=smt.executeQuery("update \"admin\" set pass='"+u3+"' where fname='"+u1+"'");
                        System.out.println("jj");
                        %>
                        alert("Password Successfully updated");
                                               }
                    else
                                               {
                alert("New Password and Confirm Password Does not match");
                      
                        
                    }
                    <%
                                       }
                                       }
                catch(Exception e)
                                               {
                    System.out.println(e);
                                       }
                    
                                              
                    
                
                %>
                
                    
                
        </form>       
    </body>
</html>
