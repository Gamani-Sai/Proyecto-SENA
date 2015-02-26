package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>IEGAMAR</title>\r\n");
      out.write("        <link href=\"css/signin.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"bootstrap/css/alertify.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <link href=\"bootstrap/css/themes/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>        \r\n");
      out.write("                          \r\n");
      out.write("        <form class=\"form-signin\" role=\"form\" action=\"ValidarUsuario\" method=\"Post\">\r\n");
      out.write("            <h2 class=\"form-signin-heading\">Inicio de Sesión</h2>\r\n");
      out.write("            <input type=\"text\" class=\"form-control\" placeholder=\"Usuario\" name=\"usuario\" required autofocus>\r\n");
      out.write("            <input type=\"password\" class=\"form-control\" name=\"Contra\" placeholder=\"Contraseña\" required>\r\n");
      out.write("\r\n");
      out.write("            <button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\">Ingresar</button>\r\n");
      out.write("\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script src=\"js/jquery-1.6.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"bootstrap/js/alertify.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            // override defaults\r\n");
      out.write("            // alertify.defaults.transition = \"slide\";\r\n");
      out.write("            alertify.defaults.theme.ok = \"btn btn-danger\";\r\n");
      out.write("            alertify.defaults.theme.cancel = \"btn btn-danger\";\r\n");
      out.write("            alertify.defaults.theme.input = \"form-control\";\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("        ");

            String alerte = (String) request.getAttribute("alert");
            if (alerte != null) {
                out.print(alerte);
            }

        
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
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
