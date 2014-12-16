<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

<%@page import="Controlador.RegistrarEstudiante"%>
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
        <title>IEGAMAR</title>
        <link rel="stylesheet" type="text/css" href="css/easyui.css">
        <link rel="stylesheet" type="text/css" href="css/icon.css">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/themes/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>

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
                        <li class="active"><a href="consultarestudiante.jsp">Estudiantes</a></li>
                        <li ><a href="consultarprofesores.jsp">Profesores</a></li>
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

        <div class="container-fluid" id="formulario">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="registarestudiante.jsp">Registar Estudiantes</a></li>
                        <li><a href="consultarestudiante.jsp">Consutar Estudiantes</a></li>
                    </ul>

                </div>



                <section class="container" >
                    <form action="RegistrarEstudiante" method="POST" role="form">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Estudiantes</h3>

                                <div class="form-group col-lg-12">
                                    <label>Nombre</label>
                                    <input type="text" id="nombre" class="form-control" name="nombre" placeholder="" onkeypress="sololetras()">

                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Apellido</label>
                                    <input type="text" id="apellido" class="form-control" name="apellido" placeholder="" onkeypress="sololetras()">

                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Identificación</label>
                                    <input type="text" id="identificacion" class="form-control" name="identificacion" placeholder="" onkeypress="ValidaSoloNumeros()"   maxlength="11">

                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Dirección</label>
                                    <input type="text" id="direcion" class="form-control" name="direccion" placeholder="" onkeypress="validarLetrasNumeros()">
                                </div>      


                                <div class="form-group">
                                    <label for="disabledSelect" style="margin-left: 19px;">Fecha nacimiento</label>
                                    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" size="16" type="text"  name="Fecha_Nacimiento" id="Fecha_Nacimiento" readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>


                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Telefono</label>
                                    <input type="text" id="Telefono" class="form-control" name="Telefono" placeholder="" onkeypress="ValidaSoloNumeros()">

                                </div> 

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Grado</label>
                                    <select id="Grado" class="form-control" name="grado">
                                        <%
                                            RegistrarEstudiante gra = new RegistrarEstudiante();
                                            out.println(gra.Traer());

                                        %>
                                    </select>
                                </div> 
                                <button type="submit" name="Guardar" id="Guardar" class="btn btn-success" style="margin-left: 360px;">Guardar</button>
                                <button type="reset" class="btn btn-default">Cancelar</button>
                            </div>


                        </div>
                    </form>
                </section>
            </div>
        </div>

        <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>

        <script src="bootstrap/js/alertify.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap-datetimepicker.es.js" type="text/javascript"></script>
        <script src="js/pnotify.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                        // override defaults
                                        // alertify.defaults.transition = "slide";
                                        alertify.defaults.theme.ok = "btn btn-success";
                                        alertify.defaults.theme.cancel = "btn btn-danger";
                                        alertify.defaults.theme.input = "form-control";
                                        $(document).ready(function validar() {

                                            $("#Guardar").click(function () {
                                                if (($("#nombre").val()) == "") {

                                                    new PNotify({
                                                        title: 'Campo requerido',
                                                        text: 'El nombre es necesario.',
                                                        type: 'error'
                                                    });


                                                    return false;
                                                } else {
                                                    if (($("#apellido").val()) == "") {
                                                        new PNotify({
                                                            title: 'Campo requerido',
                                                            text: 'El apellido es necesario.',
                                                            type: 'error'
                                                        });
                                                        return false;
                                                    } else {

                                                        if (($("#identificacion").val()) == "") {
                                                            new PNotify({
                                                                title: 'Campo requerido',
                                                                text: 'La identificacion es necesaria.',
                                                                type: 'error'
                                                            });
                                                            return false;
                                                        } else {

                                                            if (($("#direcion").val()) == "") {
                                                                new PNotify({
                                                                    title: 'Campo requerido',
                                                                    text: 'La dirección es necesaria.',
                                                                    type: 'error'
                                                                });
                                                                return false;
                                                            } else {

                                                                if (($("#Fecha_Nacimiento").val()) == "") {
                                                                    new PNotify({
                                                                        title: 'Campo requerido',
                                                                        text: 'la fecha de nacimiento es necesaria.',
                                                                        type: 'error'
                                                                    });
                                                                    return false;
                                                                } else {

                                                                    if (($("#Telefono").val()) == "") {
                                                                        new PNotify({
                                                                            title: 'Campo requerido',
                                                                            text: 'El telefono es necesario.',
                                                                            type: 'error'
                                                                        });
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
                                        function validarLetrasNumeros(){
                                        if((event.keyCode < 48) || (event.keyCode > 57))
                                        {
                                            event.returnValue = false;
                                        }
                                        if((event.keyCode < 41) || (event.keyCode > 90))
                                            {
                                            event.returnValue = false;
                                        }
                                    }
        </script>
        <%            String alerte = (String) request.getAttribute("alert");
            if (alerte != null) {
                out.print(alerte);
            }

        %>

        <script type="text/javascript">
            $('.form_datetime').datetimepicker({
                //language:  'fr',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1
            });
            $('.form_date').datetimepicker({
                language: 'es',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            $('.form_time').datetimepicker({
                language: 'es',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0
            });
        </script>

    </body>
</html>

