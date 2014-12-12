package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Aboutus_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Aboutus</title>\n");
      out.write("        <link type=\"text/css\" href=\"./js/ui.all.css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.4.2.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.core.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.tabs.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            \n");
      out.write("            $(function() {\n");
      out.write("                $(\"#tabs\").tabs({\n");
      out.write("                    collapsible: false\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table border=\"0\">\n");
      out.write("            <tr>\t\n");
      out.write("                <td><input type=\"image\" src=\"./Images/sac.JPG\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        <table width=\"100%\">\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <div id=\"tabs\">\n");
      out.write("                    <ul><li><a href=\"#tabs-3\">About Us</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <div id=\"tabs-3\">\n");
      out.write("\n");
      out.write("        <table height=\"385px\" align=\"center\" style=\"color: blue;\" cellpadding=\"5\">\n");
      out.write("                        <tr>\n");
      out.write("                        <td align=\"center\">\n");
      out.write("                            <img src=\"./Images/isro.png\"/> \n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td align=\"center\">\n");
      out.write("                            <h3>Welcome to IMD-AWS Weather data retrival system</h3> \n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td>\n");
      out.write("                            India Meteorological Department(IMD)(www.imd.gov.in)is the nodal agency in India to provide weather data for the country.\n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td>\n");
      out.write("                            It gives data regarding temprature,rainfall,sunshine,wind speed,dew point etc.The raw wether data obtained from manned and \n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td>\n");
      out.write("                            Automatic Weather Station are regularly downloaded from IMD website and stored in local RDBMS.So you can view and/or \n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td>download daily Data from 2012 onwards.This data are very useful to scientists for various scientific studies.\n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td>\n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td>\n");
      out.write("                            </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                            Users are requested to send technical problems/suggestions to <b>Shashikant A. Sharma</b> on 4335 or sasharma@sac.isro.gov.in\n");
      out.write("                        </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("                 \n");
      out.write("        </td>\n");
      out.write("    </tr>\n");
      out.write("    \n");
      out.write("</table>\n");
      out.write("          <table>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <input type=\"image\" src=\"./Images/footer.png\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("\n");
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
