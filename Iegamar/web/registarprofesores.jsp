<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

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
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/themes/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
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

        <div class="container-fluid" id="formulario">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="registarprofesores.jsp">Registar Profesores</a></li>
                        <li><a href="consultarprofesores.jsp">Consutar Profesores</a></li>
                    </ul>

                </div>



                <section class="container" >
                    <form action="RegistrarProfesores" method="POST" role="form">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Profesores</h3>

                                <div class="form-group col-lg-12">
                                    <label for="disabledSelect">Nombre</label>
                                    <input type="text" id="Nombre" name="Nombre" class="form-control" placeholder="" onkeypress="sololetras()">
                                    <div id="validaNombre">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Apellido</label>
                                    <input type="text" id="Apellido" name="Apellido" class="form-control" placeholder="" onkeypress="sololetras()">
                                    <div id="validaApellido">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Identificación</label>
                                    <input type="text" id="Identificacion" name="Identificacion" class="form-control" placeholder="" onkeypress="ValidaSoloNumeros()" maxlength="11">
                                    <div id="validaIdentificacion">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Dirección</label>
                                    <input type="text" id="Dirección" name="Direccion" class="form-control" placeholder="">
                                    <div id="validaDirecion">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <div class="form-group">

                                    <label for="disabledSelect" style="margin-left: 19px;">Fecha nacimiento</label>
                                    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" size="16" type="text" id="Fecha_Nacimiento" name="Fecha_Nacimiento" readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                    <div id="validaFecha">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Telefono</label>
                                    <input type="text" id="Telefono" name="Telefono" class="form-control" placeholder="" onkeypress="ValidaSoloNumeros()">
                                    <div id="validaTelefono">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Area</label>
                                    <input type="text" id="Perfil_Profesional" name="Perfil_Profesional" class="form-control" placeholder="" onkeypress="sololetras()">
                                    <div id="validaPerfil_Profesional">
                                        <p>Campo nesesario</p>
                                    </div>
                                </div>       

                                <button type="submit" class="btn btn-success" id="Guardar" style="margin-left: 360px;">Guardar</button>
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
        <script type="text/javascript">
                                        // override defaults
                                        // alertify.defaults.transition = "slide";
                                        alertify.defaults.theme.ok = "btn btn-success";
                                        alertify.defaults.theme.cancel = "btn btn-danger";
                                        alertify.defaults.theme.input = "form-control";
                                        $(document).ready(function validar() {
                                            $("#validaNombre").hide();
                                            $("#validaApellido").hide();
                                            $("#validaIdentificacion").hide();
                                            $("#validaDirecion").hide();
                                            $("#validaFecha").hide();
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
                                                            if (($("#Dirección").val()) == "") {
                                                                $("#validaDirecion").show();
                                                                return false;
                                                            } else {
                                                                $("#validaDirecion").hide();
                                                                if (($("#Fecha_Nacimiento").val()) == "") {
                                                                    $("#validaFecha").show();
                                                                    return false;
                                                                } else {
                                                                    $("#validaFecha").hide();
                                                                    if (($("#Telefono").val()) == "") {
                                                                        $("#validaTelefono").show();
                                                                        return false;
                                                                    }
                                                                    else {
                                                                        $("#validaTelefono").hide();
                                                                        if (($("#Perfil_Profesional").val()) == "") {
                                                                            $("#validaPerfil_Profesional").show();
                                                                            return false;
                                                                        }
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

        <%
            String alerte = (String) request.getAttribute("alert");
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

