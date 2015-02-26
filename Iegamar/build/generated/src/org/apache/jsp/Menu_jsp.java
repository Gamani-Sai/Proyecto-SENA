package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Controlador.ControladorElemento;

public final class Menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"es\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <meta http-equiv=\"Cache-control\" content=\"no-cache\">\r\n");
      out.write("        <meta http-equiv=\"Cache-control\" content=\"no-store\">\r\n");
      out.write("\r\n");
      out.write("        <title>IEGAMAR</title>\r\n");
      out.write("\r\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/navbar-fixed-top.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container-fluid\" id=\"formulario\">\r\n");
      out.write("\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("                <section class=\"container\">\r\n");
      out.write("                    <form role=\"form\" action=\"RegistrarCuenta\" method=\"POST\" class=\"payment-form\">\r\n");
      out.write("                        <div class=\"container-page\">        \r\n");
      out.write("                            <div class=\"col-md-6\">\r\n");
      out.write("                                <h3 class=\"dark-grey\">Registro De Cuentas </h3>\r\n");
      out.write("                                <div class=\"radio col-lg-6\">\r\n");
      out.write("                                    <label>\r\n");
      out.write("                                        <input type=\"radio\" name=\"opciones\" value=\"Estudiante\" onchange=\"recibir()\" checked=\"recibir()\">\r\n");
      out.write("                                        Estudiante\r\n");
      out.write("                                    </label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"radio col-lg-6\">\r\n");
      out.write("                                    <label>\r\n");
      out.write("                                        <input type=\"radio\" name=\"opciones\" value=\"Profesores\" onchange=\"recibir()\">\r\n");
      out.write("                                        Profesores                            \r\n");
      out.write("                                    </label>\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"form-group col-lg-12\">\r\n");
      out.write("                                    <label for=\"disabledSelect\" >Nombre</label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"form-group col-lg-12\" id=\"traer\" onkeypress=\"return validarn(event)\" >\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"form-group col-lg-6\">\r\n");
      out.write("                                    <label>Nombre de usuario</label>\r\n");
      out.write("                                    <input type=\"\" name=\"nombreU\" class=\"form-control\" id=\"nombreU\" onkeypress=\"return validarn(event)\">\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"form-group col-lg-6\">\r\n");
      out.write("                                    <label>Contraseña</label>\r\n");
      out.write("                                    <input type=\"password\" name=\"contra\" class=\"form-control\" id=\"contra\" value=\"\">\r\n");
      out.write("                                </div>   \r\n");
      out.write("\r\n");
      out.write("                                <button type=\"submit\" id=\"Guardar\" name=\"guardar\" value=\"insertar\" class=\"btn btn-success\" style=\"margin-left: 360px;\">Guardar</button>\r\n");
      out.write("                                <button type=\"reset\" class=\"btn btn-default\">Cancelar</button>                        \r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </section>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-1.6.min.js\"></script>\r\n");
      out.write("        <script src=\"bootstrap/js/bootstrap.js\"></script>\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("\r\n");
      out.write("                                var actualizacion = setInterval(function () {\r\n");
      out.write("                                    actualizar_anomalias()\r\n");
      out.write("                                }, 3000);\r\n");
      out.write("\r\n");
      out.write("                                function actualizar_anomalias() {\r\n");
      out.write("\r\n");
      out.write("                                    var serial = $(\"#Serial\").val();\r\n");
      out.write("\r\n");
      out.write("                                    $.ajax({\r\n");
      out.write("                                        dataType: \"html\",\r\n");
      out.write("                                        data: {\r\n");
      out.write("                                            proceso: \"actualizar_anom\"\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                        },\r\n");
      out.write("                                        type: \"POST\",\r\n");
      out.write("                                        url: \"ControladorElemento\",\r\n");
      out.write("                                        statusCode: {\r\n");
      out.write("                                            404: function () {\r\n");
      out.write("                                                alert(\"page not found\");\r\n");
      out.write("                                            }\r\n");
      out.write("                                        }\r\n");
      out.write("                                    }).done(function (datos) {\r\n");
      out.write("                                        $(\"#actualizar\").empty();\r\n");
      out.write("                                        $(\"#actualizar\").append(datos);\r\n");
      out.write("                                    });\r\n");
      out.write("                                }\r\n");
      out.write("\r\n");
      out.write("                                function list_anomalias() {\r\n");
      out.write("\r\n");
      out.write("                                    var serial = $(\"#Serial\").val();\r\n");
      out.write("\r\n");
      out.write("                                    $.ajax({\r\n");
      out.write("                                        dataType: \"html\",\r\n");
      out.write("                                        data: {\r\n");
      out.write("                                            proceso: \"listar_anom\",\r\n");
      out.write("                                            Serial: serial\r\n");
      out.write("\r\n");
      out.write("                                        },\r\n");
      out.write("                                        type: \"POST\",\r\n");
      out.write("                                        url: \"ControladorElemento\",\r\n");
      out.write("                                        statusCode: {\r\n");
      out.write("                                            404: function () {\r\n");
      out.write("                                                alert(\"page not found\");\r\n");
      out.write("                                            }\r\n");
      out.write("                                        }\r\n");
      out.write("                                    }).done(function (datos) {\r\n");
      out.write("                                        $(\"#traer1\").empty();\r\n");
      out.write("                                        $(\"#traer1\").append(datos);\r\n");
      out.write("                                    });\r\n");
      out.write("                                }\r\n");
      out.write("\r\n");
      out.write("                                var x;\r\n");
      out.write("                                x = $(document);\r\n");
      out.write("                                x.ready(inicializar);\r\n");
      out.write("\r\n");
      out.write("                                function inicializar() {\r\n");
      out.write("                                    var x = $(\"#mostrar\");\r\n");
      out.write("                                    x.click(muestrame);\r\n");
      out.write("\r\n");
      out.write("                                }\r\n");
      out.write("\r\n");
      out.write("                                function muestrame() {\r\n");
      out.write("                                    var x = $(\"#objetivo\");\r\n");
      out.write("                                    x.slideToggle(\"slow\");\r\n");
      out.write("                                }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
