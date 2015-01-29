<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

<%@page import="Controlador.ControladorElemento"%>
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
            <div hidden="true" class="notification-list-wrapper" id="objetivo" style="top: 65px; left: 100px;  opacity: 1;">

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
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Apellido</label>
                                    <input type="text" id="Apellido" name="Apellido" class="form-control" placeholder="" onkeypress="sololetras()">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Identificación</label>
                                    <input type="text" id="Identificacion" name="Identificacion" class="form-control" placeholder="" onkeypress="ValidaSoloNumeros()" maxlength="11">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Dirección</label>
                                    <input type="text" id="Dirección" name="Direccion" class="form-control" placeholder="" onkeypress="return validarn(event)">
                                </div>

                                <div class="form-group">

                                    <label for="disabledSelect" style="margin-left: 19px;">Fecha nacimiento</label>
                                    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" size="16" type="text" id="Fecha_Nacimiento" name="Fecha_Nacimiento"  readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Telefono</label>
                                    <input type="text" id="Telefono" name="Telefono" class="form-control" placeholder="" onkeypress="ValidaSoloNumeros()" maxlength="10">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Area</label>
                                    <input type="text" id="Perfil_Profesional" name="Perfil_Profesional" class="form-control" placeholder="" onkeypress="sololetras()">
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
        <script src="js/pnotify.custom.min.js" type="text/javascript"></script>

        <script type="text/javascript">
                                        // override defaults
                                        // alertify.defaults.transition = "slide";
                                        alertify.defaults.theme.ok = "btn btn-success";
                                        alertify.defaults.theme.cancel = "btn btn-danger";
                                        alertify.defaults.theme.input = "form-control";


                                        function validarn(e) {
                                            tecla = (document.all) ? e.keyCode : e.which;
                                            if (tecla == 8)
                                                return true;
                                            if (tecla == 9)
                                                return true;
                                            if (tecla == 11)
                                                return true;
                                            patron = /[0-9A-Za-zñÑáéíóúÁÉÍÓÚàèìòùÀÈÌÒÙâêîôûÂÊÎÔÛÑñäëïöüÄËÏÖÜ\s\t]/;
                                            te = String.fromCharCode(tecla);
                                            return patron.test(te);
                                        }

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



                                        $(document).ready(function validar() {
                                            $("#Guardar").click(function () {
                                                if (($("#Nombre").val()) == "") {
                                                    new PNotify({
                                                        title: 'Campo requerido',
                                                        text: 'El nombre es necesario.',
                                                        type: 'error'
                                                    });
                                                    return false;
                                                } else {

                                                    if (($("#Apellido").val()) == "") {
                                                        new PNotify({
                                                            title: 'Campo requerido',
                                                            text: 'El apellido es necesario.',
                                                            type: 'error'
                                                        });
                                                        return false;
                                                    } else {

                                                        if (($("#Identificacion").val()) == "") {
                                                            new PNotify({
                                                                title: 'Campo requerido',
                                                                text: 'La identificación es necesario.',
                                                                type: 'error'
                                                            });
                                                            return false;
                                                        } else {

                                                            if (($("#Dirección").val()) == "") {
                                                                new PNotify({
                                                                    title: 'Campo requerido',
                                                                    text: 'La dirección es necesario.',
                                                                    type: 'error'
                                                                });
                                                                return false;
                                                            } else {

                                                                if (($("#Fecha_Nacimiento").val()) == "") {
                                                                    new PNotify({
                                                                        title: 'Campo requerido',
                                                                        text: 'La fecha es necesario.',
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
                                                                    else {

                                                                        if (($("#Perfil_Profesional").val()) == "") {
                                                                            new PNotify({
                                                                                title: 'Campo requerido',
                                                                                text: 'El area es necesario.',
                                                                                type: 'error'
                                                                            });
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

