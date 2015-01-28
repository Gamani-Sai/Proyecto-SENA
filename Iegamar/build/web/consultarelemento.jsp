<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

<%@page import="Controlador.ControladorElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    HttpSession sesionOk = request.getSession();
    String usuario = "";
    if (sesionOk.getAttribute("usuario") != null) {
        usuario = sesionOk.getAttribute("usuario").toString();
    } else {
        response.sendRedirect("index.jsp");
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
        <title>IEGAMAR</title>
        <link rel="stylesheet" type="text/css" href="css/easyui.css">
        <link rel="stylesheet" type="text/css" href="css/icon.css">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_light.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" >IEGAMAR</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">      

                        <%-- 
                       <div id="actualizar">
                           <%
                               ControladorElemento crt = new ControladorElemento();
                               out.println(crt.anomaliacont());
                           %>
                       </div>
                        --%>

                        <%
                            ControladorElemento crt = new ControladorElemento();
                            out.println(crt.anomaliacont());
                        %>

                        <li><a href="consultarcuentas.jsp">Administar Cuentas</a></li>
                        <li><a href="registargradoygrupo.jsp">Grados</a></li>
                        <li><a href="consultarestudiante.jsp">Estudiantes</a></li>
                        <li><a href="consultarprofesores.jsp">Profesores</a></li>
                        <li class="active"><a href="consultarelemento.jsp">Elementos</a></li>
                        <li><a href="consultarprestamo.jsp">Préstamo</a></li>
                        <li><a href="consultarreserva.jsp">Reserva</a></li>  
                        <li ><a href="consultarcontrol.jsp">Control de llegadas</a></li>                           
                    </ul>
                    <ul class="nav navbar-nav navbar-right">


                        <li class="active"><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>

            <div hidden="true" class="notification-list-wrapper" id="objetivo" style="top: 65px; left: 100px; opacity: 1;">

                <ul class="notification-list-menu">
                </ul>

                <ul class="notification-list" data-type="unread">

                    <table id="tblArea" class="table2 table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th class="text-center">Seriales</th>
                                <th class="text-center">Anomalia</th>
                            </tr>
                        </thead>
                        <tbody id="traer1">
                            <%
                                out.println(crt.listaranom());
                            %>
                        </tbody>
                    </table>



                </ul>
            </div>

            <div class="modal fade bs-example-modal-sm"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header" >
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Anomalia</h4>
                        </div>

                        <div class="modal-body"  >
                            <div class="form-group">
                                <label for="disabledSelect">Serial</label>
                                <input type="text"  class="form-control" name="Serial" id="Serial" readonly="readonly" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Descripción</label>

                                <textarea rows="4" name="Anomalia" id="Anomalia" cols="50" class="form-control" readonly="readonly">

                                </textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" onclick="list_anomalias();"  class="btn btn-success">Guardar</button>
                        </div>
                    </div>

                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="registarelemento.jsp">Registar Elemento</a></li>
                        <li class="active"><a href="consultarelemento.jsp">Consutar Elemento</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Consultar Elemento</h1>
                </div>
            </div>             
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="area">
                <table id="tblArea" class="table table-hover" cellspacing="0">
                    <thead>
                        <tr>
                            <th class="text-center" Style="display:none"></th>
                            <th class="text-center">Nombre elemento</th>
                            <th class="text-center">Descripcion</th>
                            <th class="text-center">Seriales</th>
                            <th class="text-center">Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ControladorElemento ls = new ControladorElemento();
                            out.println(ls.listarElementos());
                        %>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modificar Elemento</h4>
                    </div>
                    <form  role="form" action="ControladorElemento" method="POST" >
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="hidden" name="proceso" value="modificar">
                                <label for="disabledSelect">Nombre de elemento</label>
                                <input type="hidden"  class="form-control" id="codigo" name="codigo" placeholder="">
                                <input type="text" id="nom_elemento"  name="nom_elemento" class="form-control" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Descripción</label>
                                <input type="text" id="descripcion" name="descripcion" class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="Guardar" value="modificar" class="btn btn-success" name="mod_element">Guardar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" >
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Seriales</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group col-lg-6">
                            <input type="hidden" id="id_codigo"  name="id_codigo"  class="form-control" >
                            <input type="text" id="agrega_serial"  name="agrega_serial"  class="form-control" >
                        </div>
                        <div class="form-group col-lg-6">
                            <button type="button" class="btn btn-success" style="margin-left: 172px;" onclick="agg_ser()">Agregar</button>
                        </div>

                        <table id="tblArea" class="table2 table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="text-center">Seriales</th>
                                    <th class="text-center">Estado</th>
                                </tr>
                            </thead>
                            <tbody id="traer">

                            </tbody>
                        </table>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>



            <script type="text/javascript" src="js/jquery-1.6.min.js"></script>

            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="bootstrap/js/bootstrap.js"></script>


            <!-- En esta parte incluyo la libreria general del dataTables -->
            <script src="bootstrap/js/jquery.dataTables.min.js"></script>
            <!--       <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script> -->
            <script src="bootstrap/js/dataTables.bootstrap.js" type="text/javascript"></script>
            <script src="js/mapeomod.js" type="text/javascript"></script>
            <script>


                                var actualizacion = setInterval(function () {
                                    actualizar_anomalias()
                                }, 3000);

                                function actualizar_anomalias() {

                                    var serial = $("#Serial").val();

                                    $.ajax({
                                        dataType: "html",
                                        data: {
                                            proceso: "actualizar_anom"


                                        },
                                        type: "POST",
                                        url: "ControladorElemento",
                                        statusCode: {
                                            404: function () {
                                                alert("page not found");
                                            }
                                        }
                                    }).done(function (datos) {
                                        $("#actualizar").empty();
                                        $("#actualizar").append(datos);
                                    });
                                }

                                function list_anomalias() {

                                    var serial = $("#Serial").val();

                                    $.ajax({
                                        dataType: "html",
                                        data: {
                                            proceso: "listar_anom",
                                            Serial: serial

                                        },
                                        type: "POST",
                                        url: "ControladorElemento",
                                        statusCode: {
                                            404: function () {
                                                alert("page not found");
                                            }
                                        }
                                    }).done(function (datos) {
                                        $("#traer1").empty();
                                        $("#traer1").append(datos);
                                    });
                                }

                                var x;
                                x = $(document);
                                x.ready(inicializar);

                                function inicializar() {
                                    var x = $("#mostrar");
                                    x.click(muestrame);

                                }

                                function muestrame() {
                                    var x = $("#objetivo");
                                    x.slideToggle("slow");
                                }


                                $(document).ready(function () {
                                    $("#serial").click(function () {
                                        recibir(codigo);
                                    });
                                });

                                function recibir(codigo) {

                                    var valor = codigo;
                                    localStorage.setItem("codigoElm", valor);
                                    $.ajax({
                                        dataType: "html",
                                        data: {
                                            proceso: "listar_ser",
                                            codigo: valor

                                        },
                                        type: "POST",
                                        url: "ControladorElemento",
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
                                function agg_ser() {

                                    var cod = $("#id_codigo").val();
                                    $.ajax({
                                        dataType: "html",
                                        data: {
                                            proceso: "agregar_serial",
                                            codigo_agg: $("#id_codigo").val(),
                                            serial: $("#agrega_serial").val()
                                        },
                                        type: "POST",
                                        url: "ControladorElemento",
                                        statusCode: {
                                            404: function () {
                                                alert("page not found");
                                            }
                                        }
                                    }).done(function (datos) {

                                        recibir(cod);
                                    });
                                    document.getElementById("agrega_serial").value = "";
                                }
                                function Estado_disponible(cod) {


                                    $.ajax({
                                        dataType: "html",
                                        data: {
                                            proceso: "Cambio_estado",
                                            serial: cod,
                                            estado: "No disponible"
                                        },
                                        type: "POST",
                                        url: "ControladorElemento",
                                        statusCode: {
                                            404: function () {
                                                alert("page not found");
                                            }
                                        }
                                    }).done(function (datos) {
                                        $("#cambio_est").empty();
                                        $("#cambio_est").append(datos);
                                        recibir(localStorage.getItem("codigoElm"));
                                    });

                                }
                                function Estado_noDisponible(cod) {


                                    $.ajax({
                                        dataType: "html",
                                        data: {
                                            proceso: "Cambio_estado",
                                            serial: cod,
                                            estado: "Disponible"
                                        },
                                        type: "POST",
                                        url: "ControladorElemento",
                                        statusCode: {
                                            404: function () {
                                                alert("page not found");
                                            }
                                        }
                                    }).done(function (datos) {
                                        $("#cambio_est").empty();
                                        $("#cambio_est").append(datos);
                                        recibir(localStorage.getItem("codigoElm"));
                                    });

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


