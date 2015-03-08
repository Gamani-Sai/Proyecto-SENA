<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

<%@page import="Controlador.ControladorElemento"%>
<%@page import="Controlador.RegistrarEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    HttpSession sesionOk = request.getSession();
    String usuario = "";
    String tipo = "";

    String OGrado = "<li><a href=\"registargradoygrupo.jsp\" style=\"margin-top: -46px;\">Grados</a></li>";

    String OEstudiante = "<li class=\"active\"><a href=\"consultarestudiante.jsp\" style=\"margin-top: -46px;\">Estudiantes</a></li>";

    String OProfesores = "<li><a href=\"consultarprofesores.jsp\" style=\"margin-top: -46px;\">Profesores</a></li>";

    String OPrestamo = " <li><a href=\"consultarprestamo.jsp\" style=\"margin-top: -46px;\">Préstamo</a></li>";

    String OReserva = "<li><a href=\"consultarreserva.jsp\" style=\"margin-top: -46px;\">Reserva</a></li>  ";

    String OControl = "<li><a href=\"consultarcontrol.jsp\" style=\"margin-top: -46px;\">Control de llegadas</a></li> ";

    String OElementos = "<li><a href=\"consultarelemento.jsp\" style=\"margin-top: -46px;\">Elementos</a></li>";

    String OCuenta = "<li><a href=\"consultarcuentas.jsp\" style=\"margin-left: 55px; margin-top: -46px;\">Administar Cuentas</a></li>";

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


                        <div id="actualizar" style="margin-top: 8px;" >
                            <%
                                ControladorElemento crt = new ControladorElemento();
                                out.println(crt.anomaliacont());
                            %>
                        </div>

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
                                    <input type="text" id="direcion" class="form-control" name="direccion" placeholder="" onkeypress="return validarn(event)">
                                </div>      

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Telefono</label>
                                    <input type="text" id="Telefono" class="form-control" name="Telefono" placeholder="" onkeypress="ValidaSoloNumeros()">

                                </div> 

                                <div class="form-group col-lg-12">
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
        <script src="js/mapeomod.js" type="text/javascript"></script>
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
                                            if (tecla == 32)
                                                return false;
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
                                                inicializar()
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
                                            if ((event.keyCode >= 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
                                                event.returnValue = false;
                                        }
                                        function pulsar(e) {
                                            tecla = (document.all) ? e.keyCode : e.which;
                                            return (tecla != 13);
                                        }
                                        function validarLetrasNumeros() {
                                            if ((event.keyCode < 48) || (event.keyCode > 57))
                                            {
                                                event.returnValue = false;
                                            }
                                            if ((event.keyCode < 41) || (event.keyCode > 90))
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
            $("#datepicker").datetimepicker({
                language: 'es',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0,
                onSelect: function (textoFecha, objDatepicker) {
                    dateDay = textoFecha;

                    Sistema = new Date;
                    function addZero(i) {
                        if (i < 10) {
                            i = "0" + i;
                        }
                        return i;
                    }

                    console.log(dateDay);

                    dia = addZero(Sistema.getDate());
                    mes = addZero(Sistema.getMonth() + 1);
                    anio = Sistema.getFullYear();
                    fechahoy = dia + '/' + mes + '/' + anio;

                    if (dateDay == fechahoy) {
                        new PNotify({
                            title: 'Fecha invalida',
                            text: '',
                            type: 'error'
                        });
                    }

                },
            });

        </script>

        <script>
            Sistema = new Date;
            function addZero(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }

            dia = addZero(Sistema.getDate());
            mes = addZero(Sistema.getMonth() + 1);
            anio = Sistema.getFullYear();
            fechahoy = dia + '/' + mes + '/' + anio;

            //alert(fechahoy)
        </script>

    </body>
</html>

