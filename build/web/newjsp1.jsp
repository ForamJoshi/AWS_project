<%-- 
    Document   : newjsp
    Created on : May 28, 2013, 10:36:08 AM
    Author     : igis_test
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
       
        
       
        
            <p>User Name:<input type="text" size="10" name="username"/></p>
                <p>Password:<input type="password" size="10" name="password"/></p>
                
                <p><input type="submit" value="Login"/></p>
                <%try{
                    String uname="";
                    String upass="";
                    String url="jdbc:postgresql://10.61.51.27:5432/AWS";
        String username="postgres";
        String password="postgres";
                String user2=request.getParameter("username");
                String pass2=request.getParameter("passwod");
                
               
                   Class.forName("org.postgresql.Driver");
            Connection con=DriverManager.getConnection(url,username,password);
            Statement stmt=con.createStatement();
           // ResultSet rs=stmt.executeQuery("select upass from \"User\" where uname='"+user2+"' and upass='"+pass2+"'");
                    //con=null;
                    //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    //con=DriverManager.getConnection("Jdbc:Odbc:mydsn");
                    //smt=con.createStatement();
                    //rs=null;
                    ResultSet rs=stmt.executeQuery("select * from \"User\"");
            if(rs.next())
                               {
                //String pass3=rs.getString("upass");
                //String flag1=rs.getString("flag");
               
                    if(uname.equals(user2)==true)
                                               {
                        if(upass.equals(pass2)==true)
                                                       {
                        //session.putValue("user1", user2);
                        response.sendRedirect("aws.jsp");
                                               }
                    
                               }
            else
                               {%>
                <script>
                    alert("invalid login");
                    //response.sendRedirect("newjsp1.jsp");
                    </script>
                    <%}
            con.close();
                    
                                    }
                       }
                catch(Exception e)
                                               {
                    out.println(e);
                                       }
                    
                                              
                    
                
                %>
                
                    
                
        </form>       
    </body>
</html>
