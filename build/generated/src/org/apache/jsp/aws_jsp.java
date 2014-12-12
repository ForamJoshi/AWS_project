package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class aws_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title> AWS DATABASE </title>\n");
      out.write("        <link type=\"text/css\" href=\"./js/ui.all.css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.3.2.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.4.2.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.core.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.tabs.js\"></script>\n");
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
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    <table border=\"0\">\n");
      out.write("            <tr>\t\n");
      out.write("           <td></td><td></td><td></td> <td><input type=\"image\" src=\"./Images/sac.JPG\"/></td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write("    <table width=\"100%\">\n");
      out.write("        <tr>\n");
      out.write("        <td>\n");
      out.write("            <div id=\"tabs\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#tabs-1\">ViewData</a></li>\n");
      out.write("                    <li><a href=\"#tabs-2\">Plot</a></li>\n");
      out.write("                  \n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("                <div id=\"tabs-1\">\n");
      out.write("\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "download.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div id=\"tabs-2\">\n");
      out.write("\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "plot.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </td>\n");
      out.write("    </tr>\n");
      out.write("  \n");
      out.write("</table>\n");
      out.write("                    <table>\n");
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
      out.write("               <a href=\"index.jsp\"> <input type=\"image\" src=\"./Images/h.JPG\"/></a>\n");
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
      out.write("                <a href=\"aws.jsp\"><input type=\"image\" src=\"./Images/a1.jpg\"/></a>\n");
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
      out.write("                <a href=\"Admin/alog.jsp\"><input type=\"image\" src=\"./Images/admin.jpg\"/></a>\n");
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
      out.write("                <a href=\"Aboutus.jsp\"><input type=\"image\" src=\"./Images/aboutus.jpg\"/></a>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("                     <table>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <input type=\"image\" src=\"./Images/footer.png\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("</body>\n");
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
