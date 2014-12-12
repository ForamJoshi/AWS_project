package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class check_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html >\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    <ul>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t  <form name=\"form1\" method=\"post\"  >\r\n");
      out.write("\t\t\t<h2>LOGIN</h2>\r\n");
      out.write("\t\t   <p> &nbsp;USERNAME :\r\n");
      out.write("\t\t      <input name=\"uid\" type=\"text\"/>\r\n");
      out.write("\t\t      <br  />\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t      <br />\r\n");
      out.write("               &nbsp;\r\n");
      out.write("               PASSWORD:\r\n");
      out.write("\t\t        <input name=\"pass\" type=\"password\"  />\r\n");
      out.write("\t\t    </p>\r\n");
      out.write("            \t\t     &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type=\"submit\" name=\"Submit\" value=\"LOGIN\"  align=\"middle\" />\r\n");
      out.write("\t\t    \t\t &nbsp; &nbsp;  &nbsp; &nbsp;  \r\n");
      out.write("             \r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t   \r\n");
      out.write("              </form>\r\n");

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
                        response.sendRedirect("mix.jsp");                                
                        }               
                      }
                catch(Exception ee)
                        {
                    out.println(ee);
                    } 
            
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
