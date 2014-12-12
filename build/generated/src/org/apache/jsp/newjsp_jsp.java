package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.swing.JOptionPane;
import java.sql.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("      \n");
      out.write("        ");

        //Connection con;
        //ResultSet rs;
        //Statement smt;
        String u1="",u2="",u3="",u4="";
        
        String url="jdbc:postgresql://10.61.51.27:5432/AWS";
        String username="postgres";
        String password="postgres";
        
                         
        
      out.write("\n");
      out.write("        \n");
      out.write("       \n");
      out.write("        <form method=\"get\" action=\"newjsp.jsp\">\n");
      out.write("            \n");
      out.write("            <p>User Name:<input type=\"text\" size=\"10\" name=\"t1\"/></p>\n");
      out.write("                <p>Password:<input type=\"password\" size=\"10\" name=\"t2\"/></p>\n");
      out.write("                <p>Old Password:<input type=\"password\" size=\"10\" name=\"t3\"/></p>\n");
      out.write("                <p>Confirm Password:<input type=\"password\" size=\"10\" name=\"t4\"/></p>\n");
      out.write("                <p><input type=\"submit\" value=\"Change\"/></p>\n");
      out.write("                ");

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
                        
      out.write("\n");
      out.write("                        alert(\"Password Successfully updated\");\n");
      out.write("                                               }\n");
      out.write("                    else\n");
      out.write("                                               {\n");
      out.write("                alert(\"New Password and Confirm Password Does not match\");\n");
      out.write("                      \n");
      out.write("                        \n");
      out.write("                    }\n");
      out.write("                    ");

                                       }
                                       }
                catch(Exception e)
                                               {
                    System.out.println(e);
                                       }
                    
                                              
                    
                
                
      out.write("\n");
      out.write("                \n");
      out.write("                    \n");
      out.write("                \n");
      out.write("        </form>       \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
