<%-- 
    Document   : alog
    Created on : Jun 10, 2013, 10:38:41 AM
    Author     : FORAM
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>

<link type="text/css" href="../js/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="../js/ui.core.js"></script>
        <script type="text/javascript" src="../js/ui.tabs.js"></script>
        <script type="text/javascript" src="../js/ui.datepicker.js"></script>
        <script type="text/javascript" src="../js/ui.accordion.js"></script>
        <link type="text/css" href="../js/demos.css" rel="stylesheet" />
        <link type="text/css" href="../js/style.css" rel="stylesheet" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script type="text/javascript" src="./js1/ui.tabs.js"></script>
        <link type="text/css" href="./js/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="./js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="./js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="./js/ui.core.js"></script>
        <script type="text/javascript" src="./js/ui.tabs.js"></script> 

        <script type="text/javascript" src="./js/ui.datepicker.js"></script>
        <link type="text/css" href="./js/demos.css" rel="stylesheet" />
        <link type="text/css" href="./js/style.css" rel="stylesheet" />

        <script type="text/javascript">
            
            $(function() {
                $("#tabs").tabs({
                    collapsible: false
                });
            });
        </script>
         
    </head>
    
    <body>
       <table border="0">
            <tr>	
                <td><input type="image" src="./Images1/sac.JPG"/>
                </td>
            </tr>
        </table>
    <table width="100%">
        <tr>
            <td>
                <div id="tabs">
                    <ul><li><a href="#tabs-3">LogIn</a></li>
                </ul>
                <div id="tabs-3">

<form name="login_frm" id="login_frm" action="" method="post">
    <table style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="center" width="750px">  
                <tbody>
                    <tr>
                        <td>
                            <center><h3 style="font-size:18px;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: royalblue; font-weight:bold">Admin Login ! </h3></center>
                            
                            <table border="0" align="center" cellspacing="3">
                                
                                <tbody>
                                    

                                            <div id="login_box">
      <div id="login_header">
            
      </div>
      <div id="form_val">
        <div class="label">User Id :</div>
        <div class="control"><input type="text" name="uid" id="login_id"/></div>
       
        
        <div class="label">Password:</div>
        <div class="control"><input type="password" name="pass" id="password"/></div>
        <div style="clear:both;height:0px;"></div>
      
      	<div id="msgbox"></div>
      </div>
      <div id="login_footer">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        <label>
        <input type="submit" name="login" id="login" value="Login" class="send_button" />
        </label>
          
       
       
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <label>
              <a href="ForgetPassword.jsp">Change Password</a>
          </label>
      </div>
                                               
    </div>
                            </table>
                <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
    </table>
                                
</form>
                    <tr></tr>
                    <tr>
                        <td>
                    
                        </td>
                        </tr>
                        </tbody>
</table>
        <table>
        <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
        <tr>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
               <a href="index.jsp"> <input type="image" src="./Images1/h.JPG"/></a>
               </td>
            <td>
                   </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                <a href="aws.jsp"><input type="image" src="./Images1/a1.jpg"/></a>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                <a href="Admin/alog.jsp"><input type="image" src="./Images1/admin.jpg"/></a>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
             <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                <a href="Aboutus.jsp"><input type="image" src="./Images1/aboutus.jpg"/></a>
                </td>
            </tr>
        </table>
               
                     <table>
                         <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
        <tr>
            <td>
                <input type="image" src="./Images1/footer.png"/>
                </td>
            </tr>
        </table>
<%
           String url="jdbc:postgresql://10.61.51.27:5432/AWS";
        String username="postgres";
        String password="postgres";
        
           
                Connection cn=null;
                Statement st=null,st1=null;
                ResultSet rs=null;
                try
                {
                    Class.forName("org.postgresql.Driver");
             cn=DriverManager.getConnection(url,username,password);
             st=cn.createStatement();
                    
                    //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    //cn=DriverManager.getConnection("Jdbc:Odbc:om");
                    //st=cn.createStatement();
                    String u=request.getParameter("uid");
                    String p=request.getParameter("pass");
                    String d="SELECT fname, pass FROM \"admin\" WHERE fname='"+u+"' AND pass='"+p+"';";
                   
                    rs=st.executeQuery(d);
                    while(rs.next())
                        {
                        
                           String sql="select * from login where un='"+u+"'";
        
                        session.setAttribute("uid",rs.getString(1));
                        session.setAttribute("pass",rs.getString(2));
                        response.sendRedirect("Admin.jsp");                                
                        }               
                      }
                catch(Exception ee)
                        {
                    out.println(ee);
                    } 
            %>
</body>
</html>
    

