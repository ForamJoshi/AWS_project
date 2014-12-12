package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index111_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<!-- ..//JQuery Source\\\\.. -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"JS/jquery-1.4.2.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link type=\"text/css\" href=\"../js/ui.all.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/jquery-1.3.2.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.core.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.tabs.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.datepicker.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/ui.accordion.js\"></script>\r\n");
      out.write("        <link type=\"text/css\" href=\"../js/demos.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link type=\"text/css\" href=\"../js/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("<!-- ..//JavaScript Code for this page\\\\.. -->\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("     \r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\t$(\"#login_frm\").submit(function(){\r\n");
      out.write("\r\n");
      out.write("\t\t\t //remove previous class and add new \"myinfo\" class\r\n");
      out.write("\t        $(\"#msgbox\").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(1000);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tthis.timer = setTimeout(function () {\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t          \turl: 'check.jsp',\r\n");
      out.write("\t\t          \tdata: 'un='+ $('#login_id').val() +'&pw=' + $('#password').val(),\r\n");
      out.write("\t\t          \ttype: 'post',\r\n");
      out.write("\t\t   \t\t\tsuccess: function(msg){\r\n");
      out.write("\t\t\t\t\t\tif(msg != 'ERROR') // Message Sent, check and redirect\r\n");
      out.write("\t\t\t\t\t\t{\t\t\t\t// and direct to the success page\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#msgbox\").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,\r\n");
      out.write("\t\t\t                  function()\r\n");
      out.write("\t\t\t                  {\r\n");
      out.write("\t\t\t                     //redirect to secure page\r\n");
      out.write("\t\t\t                     document.location='login.jsp?user='+msg;\r\n");
      out.write("\t\t\t                  });\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\telse\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#msgbox\").fadeTo(200,0.1,function() //start fading the messagebox\r\n");
      out.write("\t\t                \t{\r\n");
      out.write("\t\t\t                  //add message and change the class of the box and start fading\r\n");
      out.write("\t\t\t                  $(this).html('Sorry, Wrong Combination Of Username And Password.').removeClass().addClass('myerror').fadeTo(900,1);\r\n");
      out.write("\t\t\t                });\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}, 200);\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write(" \t\t});\t\t\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" </script>  \r\n");
      out.write("<link type=\"text/css\" href=\"./js/ui.all.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.3.2.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.4.2.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.core.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.tabs.js\"></script> \r\n");
      out.write("\r\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.datepicker.js\"></script>\r\n");
      out.write("        <link type=\"text/css\" href=\"./js/demos.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link type=\"text/css\" href=\"./js/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"./js1/ui.tabs.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            \r\n");
      out.write("            $(function() {\r\n");
      out.write("                $(\"#tabs\").tabs({\r\n");
      out.write("                    collapsible: false\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Login Form</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <table border=\"0\">\r\n");
      out.write("            <tr>\t\r\n");
      out.write("                <td><input type=\"image\" src=\"./Images1/m1.JPG\"/>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("    <table width=\"100%\">\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td>\r\n");
      out.write("                <div id=\"tabs\">\r\n");
      out.write("                    <ul><li><a href=\"#tabs-3\">LogIn</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                <div id=\"tabs-3\">\r\n");
      out.write("\r\n");
      out.write("<form name=\"login_frm\" id=\"login_frm\" action=\"\" method=\"post\">\r\n");
      out.write("    <table style=\"background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;\" align=\"center\" width=\"750px\">  \r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <center><h3 style=\"font-size:18px;\r\n");
      out.write("                font-family: Verdana, Arial, Helvetica, sans-serif;\r\n");
      out.write("                color: royalblue; font-weight:bold\">Admin Login ! </h3></center>\r\n");
      out.write("                            \r\n");
      out.write("                            <table border=\"0\" align=\"center\" cellspacing=\"3\">\r\n");
      out.write("                                \r\n");
      out.write("                                <tbody>\r\n");
      out.write("                                    \r\n");
      out.write("\r\n");
      out.write("                                            <div id=\"login_box\">\r\n");
      out.write("      <div id=\"login_header\">\r\n");
      out.write("            \r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"form_val\">\r\n");
      out.write("        <div class=\"label\">User Id :</div>\r\n");
      out.write("        <div class=\"control\"><input type=\"text\" name=\"login_id\" id=\"login_id\"/></div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"label\">Password:</div>\r\n");
      out.write("        <div class=\"control\"><input type=\"password\" name=\"password\" id=\"password\"/></div>\r\n");
      out.write("        <div style=\"clear:both;height:0px;\"></div>\r\n");
      out.write("      \r\n");
      out.write("      \t<div id=\"msgbox\"></div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"login_footer\">\r\n");
      out.write("          &nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("         \r\n");
      out.write("          \r\n");
      out.write("        <label>\r\n");
      out.write("        <input type=\"submit\" name=\"login\" id=\"login\" value=\"Login\" class=\"send_button\" />\r\n");
      out.write("        </label>\r\n");
      out.write("          \r\n");
      out.write("       \r\n");
      out.write("       \r\n");
      out.write("                                               \r\n");
      out.write("    </div>\r\n");
      out.write("                            </table>\r\n");
      out.write("    </table>\r\n");
      out.write("                                \r\n");
      out.write("</form>\r\n");
      out.write("                    <tr></tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>\r\n");
      out.write("                    \r\n");
      out.write("                        </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        </tbody>\r\n");
      out.write("</table>\r\n");
      out.write("               \r\n");
      out.write("                     <table>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td>\r\n");
      out.write("                <input type=\"image\" src=\"./Images1/footer.png\"/>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
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
