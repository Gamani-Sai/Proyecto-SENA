<%-- 
    Document   : cuenta
    Created on : 11-ago-2014, 11:21:05
    Author     : MAÑANA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@page import="Controlador.ConsultarControl"%>

<%
    HttpSession sesionOk = request.getSession();
    String usuario = "";
    String tipo = "";
     ResultSet rs ;
    String OGrado = "<li><a href=\"registargradoygrupo.jsp\">Grados</a></li>";

    String OEstudiante = "<li><a href=\"consultarestudiante.jsp\">Estudiantes</a></li>";

    String OProfesores = "<li><a href=\"consultarprofesores.jsp\">Profesores</a></li>";

    String OPrestamo = " <li><a href=\"consultarprestamo.jsp\">Préstamo</a></li>";

    String OReserva = "<li><a href=\"consultarreserva.jsp\">Reserva</a></li>  ";

    String OControl = "<li class=\"active\"><a href=\"consultarcontrol.jsp\">Control de llegadas</a></li> ";

    String OElementos = "<li><a href=\"consultarelemento.jsp\">Elementos</a></li>";

    String OCuenta = "<li ><a href=\"consultarcuentas.jsp\">Administar Cuentas</a></li>";

    if (sesionOk.getAttribute("usuario") != null && sesionOk.getAttribute("Rol") != null) {
        usuario = sesionOk.getAttribute("usuario").toString();
        tipo = sesionOk.getAttribute("Rol").toString();

        if (tipo.equals("Super")) {
            OPrestamo = "";
        }

        if (tipo.equals("Control")) {
            OCuenta = "";
            OElementos = "";
            OPrestamo = "";
            OReserva = "";
        }

       if (tipo.equals("Profesores")) {

            response.sendRedirect("index.jsp");
        }

        if (tipo.equals("Estudiante")) {

           response.sendRedirect("index.jsp");
        }

    } else {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="jquery,ui,easy,easyui,web">
        <meta name="description" content="easyui help you build your web page easily!">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache-control" content="no-store">
        <title>IEGAMAR</title>
        <link rel="stylesheet" type="text/css" href="css/easyui.css">
        <link rel="stylesheet" type="text/css" href="css/icon.css">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <link href="css/MyScroll.css" rel="stylesheet" type="text/css"/>
        <link href="css/ModalCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">IEGAMAR</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" >IEGAMAR</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">           
                        <%=OCuenta%>
                        <%=OGrado%>
                        <%=OEstudiante%>
                        <%=OProfesores%>
                        <%=OElementos%>
                        <%=OPrestamo%>
                        <%=OControl%>
                        <%=OReserva%>                            
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="active"><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="registarcontrol.jsp">Registar Llegada Tarde</a></li>
                        <li class="active" ><a href="consultarcontrol.jsp">Consutar Llegada Tarde</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Consultar Llegadas Tardes</h1>

                </div>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="area">
          <!--  <form action="ConsultarControl" method="POST">  -->
                <table id="tblArea" class="table table-hover" cellspacing="0">
                    <thead>
                        <tr>
                            <th class="text-center">Identificacion</th>
                              <th class="text-center">Fecha</th>
                            <th class="text-center">Hora</th>
                            <th class="text-center">Cantidad</th>
                              <th class="text-center">Editar</th>
        
                           
                        </tr>
                    </thead>
                    <tbody>
                       
                       <% 
                      
                       ConsultarControl objcontrol = new ConsultarControl();
                      rs = objcontrol.listarCantidad();
                       // out.print(objcontrol.listarCantidad());
                    
                      while(rs.next())
                      {
                       %>
                       
                       <tr>
                           
                           <td>   <center>  <%= rs.getString("Identificacion") %>  </center>   </td>
                           <td> <%= rs.getString("Fecha") %></td> 
                           <td>   <center>  <%= rs.getString("Hora") %>   </center>   </td>
                         <td>   <center>  <%= rs.getString("Cantidad") %>  </center>  </td> 
                <td>   <center>  <a href="#modal1"  onclick=" Cargar(<%= rs.getString("Identificacion")%>);"> Editar  </a> </center> </td>
                                 
                           </tr>
                       <% 
                            
                       
                      }
                       %>

                    </tbody>
                </table>  
                        <input type="Hidden" name="identificador" id ="identificador"  />
                        
            
            </div>
        </div>
                       
     <!-----  MODAL ---->
                   
           <div id="modal1" class="modalmask">
           
    <div class="modalbox movedown">
        <a href="#close" title="Close" class="close"> <Strong> X </Strong>   </a>
              
        
        <div id="mostrar">  </div>
              
             </div>
            </div>         
                       
                       
                       <!----- / MODAL----->
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap/js/bootstrap.js"></script>


<!-- En esta parte incluyo la libreria general del dataTables -->
<script src="bootstrap/js/jquery.dataTables.min.js"></script>
<!--       <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script> -->
<script src="bootstrap/js/dataTables.bootstrap.js" type="text/javascript"></script>
 
   <script src="js/ajax.js" type="text/javascript"></script>
<script>
  function  Cargar(parametro)
    {
      
   
   
      $("#identificador").val(parametro);
      var valor = $("#identificador").val();
  
    $.ajax({
        dataType: "html",
        data: {
            documento: valor 
        },
        type: "POST",
        url: "ConsultarControl",
        statusCode: {
            404: function () {
                alert("page not found");
            }
        }
    }).done(function (datos) {

        $("#mostrar").empty();
        $("#mostrar").append(datos);
    });
    //ConsultarControl
    } 
    
</script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#tblArea').dataTable({
            "oLanguage": {
                "sUrl": "bootstrap/js/Spanish.json"
            }
        });
    });
</script>

</body>
</html>