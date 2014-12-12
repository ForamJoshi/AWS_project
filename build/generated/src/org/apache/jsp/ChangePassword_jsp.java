package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ChangePassword_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("<!-- ..//JQuery Source\\\\.. -->\n");
      out.write("<script type=\"text/javascript\" src=\"JS/jquery-1.4.2.min.js\"></script>\n");
      out.write("<!-- ..//JavaScript Code for this page\\\\.. -->\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("     \n");
      out.write("\t$(document).ready(function(){\n");
      out.write("\t\t$(\"#login_frm\").submit(function(){\n");
      out.write("\n");
      out.write("\t\t\t //remove previous class and add new \"myinfo\" class\n");
      out.write("\t        $(\"#msgbox\").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(1000);\n");
      out.write("\n");
      out.write("\t\t\t\n");
      out.write("\t\t\tthis.timer = setTimeout(function () {\n");
      out.write("\t\t\t\t$.ajax({\n");
      out.write("\t\t          \turl: 'check.jsp',\n");
      out.write("\t\t          \tdata: 'un='+ $('#login_id').val() +'&pw=' + $('#password').val(),\n");
      out.write("\t\t          \ttype: 'post',\n");
      out.write("\t\t   \t\t\tsuccess: function(msg){\n");
      out.write("\t\t\t\t\t\tif(msg != 'ERROR') // Message Sent, check and redirect\n");
      out.write("\t\t\t\t\t\t{\t\t\t\t// and direct to the success page\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t$(\"#msgbox\").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,\n");
      out.write("\t\t\t                  function()\n");
      out.write("\t\t\t                  {\n");
      out.write("\t\t\t                     //redirect to secure page\n");
      out.write("\t\t\t                     document.location='login.jsp?user='+msg;\n");
      out.write("\t\t\t                  });\n");
      out.write("\t\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\telse\n");
      out.write("\t\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\t\t$(\"#msgbox\").fadeTo(200,0.1,function() //start fading the messagebox\n");
      out.write("\t\t                \t{\n");
      out.write("\t\t\t                  //add message and change the class of the box and start fading\n");
      out.write("\t\t\t                  $(this).html('Sorry, Wrong Combination Of Username And Password.').removeClass().addClass('myerror').fadeTo(900,1);\n");
      out.write("\t\t\t                });\n");
      out.write("\t\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t});\n");
      out.write("\t\t\t}, 200);\n");
      out.write("\t\t\treturn false;\n");
      out.write(" \t\t});\t\t\n");
      out.write("\n");
      out.write("\t});\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" </script>  \n");
      out.write("<link type=\"text/css\" href=\"./js/ui.all.css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.3.2.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/jquery-1.4.2.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.core.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.tabs.js\"></script> \n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"./js/ui.datepicker.js\"></script>\n");
      out.write("        <link type=\"text/css\" href=\"./js/demos.css\" rel=\"stylesheet\" />\n");
      out.write("        <link type=\"text/css\" href=\"./js/style.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"./js1/ui.tabs.js\"></script>\n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            \n");
      out.write("            $(function() {\n");
      out.write("                $(\"#tabs\").tabs({\n");
      out.write("                    collapsible: false\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<title>Login Form</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <table border=\"0\">\n");
      out.write("            <tr>\t\n");
      out.write("                <td><input type=\"image\" src=\"./Images/m1.JPG\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    <table width=\"100%\">\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <div id=\"tabs\">\n");
      out.write("                    <ul><li><a href=\"#tabs-3\">Download</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <div id=\"tabs-3\">\n");
      out.write("\n");
      out.write("<form name=\"login_frm\" id=\"login_frm\" action=\"\" method=\"post\">\n");
      out.write("    <table style=\"background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;\" align=\"center\" width=\"750px\">  \n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><center><h3 style=\"font-size:18px;\n");
      out.write("                font-family: Verdana, Arial, Helvetica, sans-serif;\n");
      out.write("                color: royalblue; font-weight:bold\">User Login ! </h3></center>\n");
      out.write("                            \n");
      out.write("                            <table border=\"0\" align=\"center\" cellspacing=\"3\">\n");
      out.write("                                \n");
      out.write("                                <tbody>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>\n");
      out.write("\n");
      out.write("                                            <div id=\"login_box\">\n");
      out.write("      <div id=\"login_header\">\n");
      out.write("            \n");
      out.write("      </div>\n");
      out.write("      <div id=\"form_val\">\n");
      out.write("        <div class=\"label\">User Id :</div>\n");
      out.write("        <div class=\"control\"><input type=\"text\" name=\"login_id\" id=\"login_id\"/></div>\n");
      out.write("        \n");
      out.write("        <div class=\"label\"> Old Password:</div>\n");
      out.write("        <div class=\"control\"><input type=\"password\" name=\"password\" id=\"password\"/></div>\n");
      out.write("        <div style=\"clear:both;height:0px;\"></div>\n");
      out.write("        <div class=\"label\"> New Password:</div>\n");
      out.write("        <div class=\"control\"><input type=\"password\" name=\"password\" id=\"password\"/></div>\n");
      out.write("        <div style=\"clear:both;height:0px;\"></div>\n");
      out.write("        <div class=\"label\">Confirm New Password:</div>\n");
      out.write("        <div class=\"control\"><input type=\"password\" name=\"password\" id=\"password\"/></div>\n");
      out.write("        <div style=\"clear:both;height:0px;\"></div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \t<div id=\"msgbox\"></div>\n");
      out.write("      </div>\n");
      out.write("      <div id=\"login_footer\">\n");
      out.write("        <label>\n");
      out.write("        <input type=\"submit\" name=\"Change\" id=\"login\" value=\"Change\" class=\"send_button\" />\n");
      out.write("        </label>\n");
      out.write("         \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("           </td></tr>\n");
      out.write("                    \n");
      out.write("                        </tbody>\n");
      out.write("                        </table> \n");
      out.write("                        </td></tr></tbody></table>\n");
      out.write("</form>\n");
      out.write("                </table>\n");
      out.write("                            \n");
      out.write("                       \n");
      out.write("                  <table>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <input type=\"image\" src=\"./Images/footer.png\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("\n");
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
