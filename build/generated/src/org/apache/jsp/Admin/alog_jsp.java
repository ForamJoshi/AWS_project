package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class alog_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script type=\"text/javascript\" src=\"JS/jquery-1.4.2.min.js\"></script>\n");
      out.write("\n");
      out.write("<link type=\"text/css\" href=\"../js/ui.all.css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/jquery-1.3.2.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.core.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.tabs.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.datepicker.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.accordion.js\"></script>\n");
      out.write("        <link type=\"text/css\" href=\"../js/demos.css\" rel=\"stylesheet\" />\n");
      out.write("        <link type=\"text/css\" href=\"../js/style.css\" rel=\"stylesheet\" />\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    <script type=\"text/javascript\" src=\"./js1/ui.tabs.js\"></script>\n");
      out.write("        <link type=\"text/css\" href=\"./js/ui.all.css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.3.2.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.4.2.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.core.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.tabs.js\"></script> \n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.datepicker.js\"></script>\n");
      out.write("        <link type=\"text/css\" href=\"./js/demos.css\" rel=\"stylesheet\" />\n");
      out.write("        <link type=\"text/css\" href=\"./js/style.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            \n");
      out.write("            $(function() {\n");
      out.write("                $(\"#tabs\").tabs({\n");
      out.write("                    collapsible: false\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("         \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("       <table border=\"0\">\n");
      out.write("            <tr>\t\n");
      out.write("                <td><input type=\"image\" src=\"./Images1/sac.JPG\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    <table width=\"100%\">\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <div id=\"tabs\">\n");
      out.write("                    <ul><li><a href=\"#tabs-3\">LogIn</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <div id=\"tabs-3\">\n");
      out.write("\n");
      out.write("<form name=\"login_frm\" id=\"login_frm\" action=\"\" method=\"post\">\n");
      out.write("    <table style=\"background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;\" align=\"center\" width=\"750px\">  \n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            <center><h3 style=\"font-size:18px;\n");
      out.write("                font-family: Verdana, Arial, Helvetica, sans-serif;\n");
      out.write("                color: royalblue; font-weight:bold\">Admin Login ! </h3></center>\n");
      out.write("                            \n");
      out.write("                            <table border=\"0\" align=\"center\" cellspacing=\"3\">\n");
      out.write("                                \n");
      out.write("                                <tbody>\n");
      out.write("                                    \n");
      out.write("\n");
      out.write("                                            <div id=\"login_box\">\n");
      out.write("      <div id=\"login_header\">\n");
      out.write("            \n");
      out.write("      </div>\n");
      out.write("      <div id=\"form_val\">\n");
      out.write("        <div class=\"label\">User Id :</div>\n");
      out.write("        <div class=\"control\"><input type=\"text\" name=\"uid\" id=\"login_id\"/></div>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <div class=\"label\">Password:</div>\n");
      out.write("        <div class=\"control\"><input type=\"password\" name=\"pass\" id=\"password\"/></div>\n");
      out.write("        <div style=\"clear:both;height:0px;\"></div>\n");
      out.write("      \n");
      out.write("      \t<div id=\"msgbox\"></div>\n");
      out.write("      </div>\n");
      out.write("      <div id=\"login_footer\">\n");
      out.write("          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("          \n");
      out.write("        <label>\n");
      out.write("        <input type=\"submit\" name=\"login\" id=\"login\" value=\"Login\" class=\"send_button\" />\n");
      out.write("        </label>\n");
      out.write("          \n");
      out.write("       \n");
      out.write("       \n");
      out.write("          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("          <label>\n");
      out.write("              <a href=\"ForgetPassword.jsp\">Change Password</a>\n");
      out.write("          </label>\n");
      out.write("      </div>\n");
      out.write("                                               \n");
      out.write("    </div>\n");
      out.write("                            </table>\n");
      out.write("                <tr>\n");
      out.write("                                <td colspan=\"4\">&nbsp;</td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"4\">&nbsp;</td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"4\">&nbsp;</td>\n");
      out.write("                            </tr>\n");
      out.write("    </table>\n");
      out.write("                                \n");
      out.write("</form>\n");
      out.write("                    <tr></tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                    \n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        </tbody>\n");
      out.write("</table>\n");
      out.write("        <table>\n");
      out.write("        <tr>\n");
      out.write("                                <td colspan=\"4\">&nbsp;</td>\n");
      out.write("                            </tr>\n");
      out.write("        <tr>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("               <a href=\"index.jsp\"> <input type=\"image\" src=\"./Images1/h.JPG\"/></a>\n");
      out.write("               </td>\n");
      out.write("            <td>\n");
      out.write("                   </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                <a href=\"aws.jsp\"><input type=\"image\" src=\"./Images1/a1.jpg\"/></a>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                <a href=\"Admin/alog.jsp\"><input type=\"image\" src=\"./Images1/admin.jpg\"/></a>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("             <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                </td>\n");
      out.write("            <td>\n");
      out.write("                <a href=\"Aboutus.jsp\"><input type=\"image\" src=\"./Images1/aboutus.jpg\"/></a>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("               \n");
      out.write("                     <table>\n");
      out.write("                         <tr>\n");
      out.write("                                <td colspan=\"4\">&nbsp;</td>\n");
      out.write("                            </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <input type=\"image\" src=\"./Images1/footer.png\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");

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
            
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("    \n");
      out.write("\n");
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
