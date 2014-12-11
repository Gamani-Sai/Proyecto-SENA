<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

<%@page import="Controlador.ConsultarProfesores"%>
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
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/themes/bootstrap.css" rel="stylesheet" type="text/css"/>
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
                        <li class="active"><a href="consultarprofesores.jsp">Profesores</a></li>
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

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="registarprofesores.jsp">Registar Profesores</a></li>
                        <li class="active"><a href="consultarprofesores.jsp">Consutar Profesores</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Consultar Profesores</h1>
                </div>
            </div>
        </div>


        <div class="tab-content">
            <div class="tab-pane active" id="area">
                <table id="tblArea" class="table table-hover" cellspacing="0">
                    <thead>
                        <tr>

                            <th class="text-center">Identificación</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Apellido</th>
                            <th class="text-center">Direccion</th>
                            <th class="text-center">Telefono</th>
                            <th class="text-center">Fecha de nacimiento</th>
                            <th class="text-center">Area</th>
                            <th class="text-center">Editar</th>
                            <th class="text-center">Estado</th>
                        </tr>
                    </thead>
                    <tbody id="traer">
                        <%
                            ConsultarProfesores verprofesores = new ConsultarProfesores();
                            out.println(verprofesores.listar());
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modificar Cuentas</h4>
                    </div>
                    <form action="ConsultarProfesores" method="POST" >
                        <div class="modal-body"  >

                            <div class="form-group">
                                <label for="disabledSelect">Nombre</label>
                                <input type="text" id="Nombre" class="form-control" name="Nombre" placeholder="" onkeypress="sololetras()">
                                <div id="validaNombre">
                                    <p>Campo nesesario</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Apellido</label>
                                <input type="text" id="Apellido" class="form-control" name="Apellido" placeholder="" onkeypress="sololetras()">
                                <div id="validaApellido">
                                    <p>Campo nesesario</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Identificación</label>
                                <input type="text" id="Identificacion" class="form-control" name="Identificacion" placeholder=""  readonly="readonly">
                                <div id="validaIdentificacion">
                                    <p>Campo nesesario</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Dirección</label>
                                <input type="text" id="Direccion" class="form-control" name="Direccion" placeholder="">
                                <div id="validaDirecion">
                                    <p>Campo nesesario</p>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="disabledSelect">Telefono</label>
                                <input type="text" id="Telefono" class="form-control" name="Telefono" placeholder="" onkeypress="ValidaSoloNumeros()">
                                <div id="validaTelefono">
                                    <p>Campo nesesario</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Area</label>
                                <input type="text" id="Perfil_Profesional" class="form-control" name="Perfil_Profesional" placeholder="" onkeypress="sololetras()">
                                <div id="validaPerfil_Profesional">
                                    <p>Campo nesesario</p>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="Guardar" id="Guardar" value="modificar" class="btn btn-success">Guardar</button>
                            <button type="reset" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>



        <script type="text/javascript" src="js/jquery-1.6.min.js"></script>

        <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.js"></script>


        <!-- En esta parte incluyo la libreria general del dataTables -->
        <script src="bootstrap/js/jquery.dataTables.min.js"></script>
        <!--       <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script> -->
        <script src="bootstrap/js/dataTables.bootstrap.js" type="text/javascript"></script>
        <script src="js/mapeomod.js" type="text/javascript"></script>
        <script src="bootstrap/js/alertify.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    // override defaults
                                    // alertify.defaults.transition = "slide";
                                    alertify.defaults.theme.ok = "btn btn-success";
                                    alertify.defaults.theme.cancel = "btn btn-danger";
                                    alertify.defaults.theme.input = "form-control";


                                    function cargar() {



                                        $.ajax({
                                            dataType: "html",
                                            data: {
                                                recargar: "recargue"

                                            },
                                            type: "POST",
                                            url: "ConsultarProfesores",
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


                                    function Estado_habilitado(identi) {


                                        $.ajax({
                                            dataType: "html",
                                            data: {
                                                identificacion_mod: identi,
                                                estado_mod: "Inhabilitado"
                                            },
                                            type: "POST",
                                            url: "ConsultarProfesores",
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
                                    function Estado_inhabilitado(identi) {


                                        $.ajax({
                                            dataType: "html",
                                            data: {
                                                identificacion_mod: identi,
                                                estado_mod: "Habilitado"
                                            },
                                            type: "POST",
                                            url: "ConsultarProfesores",
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
                                        $("#validaNombre").hide();
                                        $("#validaApellido").hide();
                                        $("#validaIdentificacion").hide();
                                        $("#validaDirecion").hide();
                                        $("#validaTelefono").hide();
                                        $("#validaPerfil_Profesional").hide();
                                        $("#Guardar").click(function () {
                                            if (($("#Nombre").val()) == "") {
                                                $("#validaNombre").show();
                                                return false;
                                            } else {
                                                $("#validaNombre").hide();
                                                if (($("#Apellido").val()) == "") {
                                                    $("#validaApellido").show();
                                                    return false;
                                                } else {
                                                    $("#validaApellido").hide();
                                                    if (($("#Identificacion").val()) == "") {
                                                        $("#validaIdentificacion").show();
                                                        return false;
                                                    } else {
                                                        $("#validaIdentificacion").hide();
                                                        if (($("#Direccion").val()) == "") {
                                                            $("#validaDirecion").show();
                                                            return false;
                                                        } else {
                                                            $("#validaDirecion").hide();
                                                            if (($("#Telefono").val()) == "") {
                                                                $("#validaTelefono").show();
                                                                return false;
                                                            }

                                                            else {
                                                                $("#validaDirecion").hide();
                                                                if (($("#Perfil_Profesional").val()) == "") {
                                                                    $("#validaPerfil_Profesional").show();
                                                                    return false;
                                                                }


                                                            }
                                                        }
                                                    }
                                                }
                                            }




                                        });

                                    });
                                    function ValidaSoloNumeros() {
                                        if ((event.keyCode < 48) || (event.keyCode > 57))
                                            event.returnValue = false;
                                    }
                                    function sololetras() {
                                        if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
                                            event.returnValue = false;
                                    }
                                    function pulsar(e) {
                                        tecla = (document.all) ? e.keyCode : e.which;
                                        return (tecla != 13);
                                    }


        </script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {
                $('#tblArea').dataTable({
                    "oLanguage": {
                        "sUrl": "bootstrap/js/Spanish.json"
                    }
                });
            }
            );
        </script>

        <%
            String alerte = (String) request.getAttribute("alert");
            if (alerte != null) {
                out.print(alerte);
            }

        %>

    </body>
</html>