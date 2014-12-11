<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>


<%@page import="Controlador.controladorGrados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String usuario = "";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="error" value="Nombre de Usuario Obligatorio"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
    }
%>


<!DOCTYPE html>
<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="jquery,ui,easy,easyui,web">
        <meta name="description" content="easyui help you build your web page easily!">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache-control" content="no-store">
        <title>Registar Cuenta</title>
        <link rel="stylesheet" type="text/css" href="css/easyui.css">
        <link rel="stylesheet" type="text/css" href="css/icon.css">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="bootstrap/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/themes/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
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
                        <li><a href="consultarcuentas.jsp">Administar Cuentas</a></li>
                        <li class="active"><a href="registargradoygrupo.jsp">Grados</a></li>
                        <li><a href="consultarestudiante.jsp">Estudiantes</a></li>
                        <li><a href="consultarprofesores.jsp">Profesores</a></li>
                        <li><a href="consultarelemento.jsp">Elementos</a></li>
                        <li><a href="consultarprestamo.jsp">Préstamo</a></li>
                        <li><a href="consultarreserva.jsp">Reserva</a></li>  
                        <li ><a href="consultarcontrol.jsp">Control de llegadas</a></li>                           
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="active"><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container-fluid" id="GradoForm">
            <div class="row">
                <form  role="form" action="controladorGrados" method="POST" >
                    <section class="container">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Grados</h3>
                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Grado</label>
                                    <input type="text" id="grado" name="grado" id="grado" class="form-control" name="Grado" style="width: 255px;">
                                    <input type="hidden"  class="form-control" id="id_grado" name="id_grado" placeholder="">
                                    <div id="validagrado">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <button type="submit" id="Guardar" name="Guardar" value="insertar"  class="btn btn-success"style="margin-left: 193px;">Guardar</button>

                            </div>
                        </div>
                    </section>
                </form>
            </div>    
        </div>

        <div class="tab-content" style="width: 863px; margin-left: 304px; margin-top: -173px;">
            <div class="tab-pane active" id="area">
                <table id="tblArea" class="table table-hover" cellspacing="0" >
                    <thead>
                        <tr>
                            <th class="text-center" Style="display:none"></th>
                            <th class="text-center">Grado</th>
                            <th class="text-center">Editar</th>
                            <th class="text-center">Estado</th>
                        </tr>
                    </thead>
                    <tbody id="traer">
                        <%
                            controladorGrados list_grados = new controladorGrados();
                            out.println(list_grados.listar_grados());
                        %>
                    </tbody>
                </table>
            </div>

        </div>





        <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
        <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
        <script src="bootstrap/js/alertify.js" type="text/javascript"></script>
        <script type="text/javascript">
            // override defaults
            // alertify.defaults.transition = "slide";
            alertify.defaults.theme.ok = "btn btn-success";
            alertify.defaults.theme.cancel = "btn btn-danger";
            alertify.defaults.theme.input = "form-control";
        </script>
        <script>



            function cargar() {



                $.ajax({
                    dataType: "html",
                    data: {
                        recargar: "recargue"

                    },
                    type: "POST",
                    url: "controladorGrados",
                    statusCode: {
                        404: function () {
                            alert("page not found");
                        }
                    }
                }).done(function (datos) {
                    $("#traer").empty();
                    $("#traer").append(datos);
                });
            }
            function Estado_habilitado(grado) {


                $.ajax({
                    dataType: "html",
                    data: {
                        idGrado_mod: grado,
                        estado_mod: "Inhabilitado"
                    },
                    type: "POST",
                    url: "controladorGrados",
                    statusCode: {
                        404: function () {
                            alert("page not found");
                        }
                    }
                }).done(function (datos) {
                    $("#cambio_est").empty();
                    $("#cambio_est").append(datos);
                    cargar();
                });

            }
            function Estado_inhabilitado(grado) {


                $.ajax({
                    dataType: "html",
                    data: {
                        idGrado_mod: grado,
                        estado_mod: "Habilitado"
                    },
                    type: "POST",
                    url: "controladorGrados",
                    statusCode: {
                        404: function () {
                            alert("page not found");
                        }
                    }
                }).done(function (datos) {
                    $("#cambio_est").empty();
                    $("#cambio_est").append(datos);
                    cargar();
                });

            }
            $(document).ready(function validar() {
                $("#validagrado").hide();
                $("#Guardar").click(function () {
                    if (($("#grado").val()) == "") {
                        $("#validagrado").show();
                        return false;
                    }
                });
                function pulsar(e) {
                    tecla = (document.all) ? e.keyCode : e.which;
                    return (tecla != 13);
                }

            });
        </script>

        <%
            String alerte = (String) request.getAttribute("alert");
            if (alerte != null) {
                out.print(alerte);
            }

        %>



        <script type="text/javascript" src="js/jquery-1.6.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.js"></script>


        <!-- En esta parte incluyo la libreria general del dataTables -->
        <script src="bootstrap/js/jquery.dataTables.min.js"></script>
        <!--       <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script> -->
        <script src="bootstrap/js/dataTables.bootstrap.js" type="text/javascript"></script>

        <script src="js/mapeomod.js" type="text/javascript"></script>


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

