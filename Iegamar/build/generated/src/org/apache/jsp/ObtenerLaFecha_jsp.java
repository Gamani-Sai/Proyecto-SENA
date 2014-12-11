package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ObtenerLaFecha_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<title>Obtener la fecha en un JSP</title>\n");
      out.write("</head>\n");
      out.write("<body>\r\n");
      out.write("<h1>Obtener la fecha en un JSP</h1>\r\n");
      out.write("\r\n");

 java.util.Calendar cal = java.util.Calendar.getInstance(java.util.Locale.US);
 java.util.Date date = cal.getTime();
 java.text.DateFormat formateadorHora = java.text.DateFormat.getTimeInstance(java.text.DateFormat.FULL);
 java.text.DateFormat formateadorFecha = java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL);

 out.println(formateadorFecha.format(date));
 out.println(formateadorHora.format(date));

      out.write("\n");
      out.write("\r\n");
      out.write("<br><br>\r\n");
      out.write("<hr>\r\n");
      out.write("Art&iacute;culo disponible en: <a href=\"http://lineadecodigo.com/2008/01/16/obtener-la-fecha-en-un-jsp/\">http://lineadecodigo.com/2008/01/16/obtener-la-fecha-en-un-jsp/</a><br/>\r\n");
      out.write("<a href=\"http://lineadecodigo.com\" title=\"Linea de Codigo\">lineadecodigo.com</a>\r\n");
      out.write("\r\n");
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
