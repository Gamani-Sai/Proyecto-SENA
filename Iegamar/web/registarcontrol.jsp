<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

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
        <title>Registar Cuenta</title>
        <link rel="stylesheet" type="text/css" href="css/easyui.css">
        <link rel="stylesheet" type="text/css" href="css/icon.css">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet"> 
        <link href="css/select2.css" rel="stylesheet" type="text/css"/>
        <link href="css/select2-bootstrap.css" rel="stylesheet" type="text/css"/> 
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>


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
                        <li><a href="registargradoygrupo.jsp">Grados</a></li>
                        <li><a href="consultarestudiante.jsp">Estudiantes</a></li>
                        <li><a href="consultarprofesores.jsp">Profesores</a></li>
                        <li><a href="consultarelemento.jsp">Elementos</a></li>
                        <li><a href="consultarprestamo.jsp">Préstamo</a></li>
                        <li><a href="consultarreserva.jsp">Reserva</a></li>  
                        <li class="active"><a href="consultarcontrol.jsp">Control de llegadas</a></li>                           
                    </ul>
                    <ul class="nav navbar-nav navbar-right">


                        <li class="active"><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container-fluid" id="formulario" >
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="registarcontrol.jsp">Registar Llegada Tarde</a></li>
                        <li><a href="consultarcontrol.jsp">Consutar Llegada Tarde</a></li>
                    </ul>
                </div>

                <section class="container">
                    <form action="Foto" method="POST">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Llegada Tarde</h3>





                                <div class="radio col-lg-6">
                                    <label>
                                        <input type="radio" name="opciones" value="Estudiante" onchange="recibir2()" checked="recibir2()">
                                        Estudiante
                                    </label>
                                </div> 

                                <div class="radio col-lg-6">
                                    <label>
                                        <input type="radio" name="opciones" value="Profesores" onchange="recibir2()">
                                        Profesores                            
                                    </label>
                                </div>

                                <div class="form-group col-lg-12" id="traer" >
                                </div>


                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Identidicación</label>
                                    <input type="text" id="disabledTextInput" class="form-control" placeholder="">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Fecha</label>
                                    <input type="date" id="disabledTextInput" class="form-control" placeholder="">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Hora</label>
                                    <input type="time" id="disabledTextInput" class="form-control" placeholder="Hora">
                                </div>             

                                <button type="reset" class="btn btn-success" style="margin-left: 360px;" data-toggle='modal' data-target='#myModal'onclick="recibir3()"> Confirmar</button>
                                <button type="reset" class="btn btn-default" >Cancelar</button>
                            </div>
                        </div> 
                    </form >
                </section>
            </div>
        </div>


        <%-- MODAL MODAL MODAL MODAL --%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Confirmar Identidad</h4>
                    </div>
                    <form action="RegistrarControl" method="POST" >

                        <div class="modal-body">


                            <div id="traerr"  class="form-group"> </div>

                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="boton" id="Guardar" value="Guardar" class="btn btn-success">Guardar</button> 
                            <button type="submit" name="boton" class="btn btn-default" data-dismiss="modal" value="Cancelar">Cancelar</button>  
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script src="js/select2.js" type="text/javascript"></script>
        <script src="js/ajax.js" type="text/javascript"></script>


        <script>


                                    function recibir3() {

                                        var variable = $("#ConProEsT").val();

                                        $.ajax({
                                            dataType: "html",
                                            data: {
                                                documento: variable
                                            },
                                            type: "POST",
                                            url: "Foto",
                                            statusCode: {
                                                404: function () {
                                                    alert("page not found");
                                                }
                                            }
                                        }).done(function (datos) {

                                            $("#traerr").empty();
                                            $("#traerr").append(datos);

                                            $("#ConProEsT").select2({
                                                minimumInputLength: 2
                                            });

                                        });

                                    }








        </script>








        <script>

            $(function () {
                recibir2();
            });


        </script>

    </body>
</html>
