<%-- 
    Document   : Menu
    Created on : 11-ago-2014, 10:56:47
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
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache-control" content="no-store">

        <title>IEGAMAR</title>

        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/navbar-fixed-top.css" rel="stylesheet">


    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" >IEGAMAR</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav"> 

                        <div id="actualizar">
                            <%
                                ControladorElemento crt = new ControladorElemento();
                                out.println(crt.anomaliacont());
                            %>
                        </div>

                        <li><a href="consultarcuentas.jsp">Administar cuentas</a></li>
                        <li><a href="registargradoygrupo.jsp">Grados</a></li>
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

            <div class="notification-list-wrapper" id="objetivo" style="top: 124px; left: 507px; display: block; opacity: 1;">

                <ul class="notification-list-menu">

                    <li id="unread-menu-item" class="notification-list-menu-item">
                    </li><li id="all-menu-item" class="notification-list-menu-item">
                    </li><li class="close-notification-list">
                    </li>

                </ul>

                <ul class="notification-list" data-type="unread">
                    <li class="notification-list-item empty-list"></li>
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
                            <h4 class="modal-title" id="myModalLabel">Registrar Anomalia</h4>
                        </div>

                        <div class="modal-body"  >
                            <div class="form-group">
                                <label for="disabledSelect">Serial</label>
                                <input type="text"  class="form-control" name="Serial" id="Serial" readonly="readonly" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Descrición</label>

                                <textarea rows="4" name="Anomalia" id="Anomalia" cols="50" class="form-control" readonly="readonly">

                                </textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" onclick="list_anomalias();"  class="btn btn-success">Guardar</button>
                            <button type="reset" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>

                </div>
            </div>

        </nav>



        <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>

       

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


        </script>

    </body>
</html>

