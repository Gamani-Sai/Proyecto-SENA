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
    String tipo = "";

    String OGrado = "<li><a href=\"registargradoygrupo.jsp\" style=\"margin-top: -46px;\">Grados</a></li>";

    String OEstudiante = "<li><a href=\"consultarestudiante.jsp\" style=\"margin-top: -46px;\">Estudiantes</a></li>";

    String OProfesores = "<li><a href=\"consultarprofesores.jsp\" style=\"margin-top: -46px;\">Profesores</a></li>";

    String OPrestamo = " <li><a href=\"consultarprestamo.jsp\" style=\"margin-top: -46px;\">Préstamo</a></li>";

    String OReserva = "<li><a href=\"consultarreserva.jsp\" style=\"margin-top: -46px;\">Reserva</a></li>  ";

    String OControl = "<li><a href=\"consultarcontrol.jsp\" style=\"margin-top: -46px;\">Control de llegadas</a></li> ";

    String OElementos = "<li><a href=\"consultarelemento.jsp\" style=\"margin-top: -46px;\">Elementos</a></li>";

    String OCuenta = "<li class=\"active\"><a href=\"consultarcuentas.jsp\" style=\"margin-left: 55px; margin-top: -46px;\">Administar Cuentas</a></li>";

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
            OGrado = "";
            OEstudiante = "";
            OProfesores = "";
            OPrestamo = "";
            OReserva = "";
            OControl = "";
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
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/themes/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/select2.css" rel="stylesheet" type="text/css"/>
        <link href="css/select2-bootstrap.css" rel="stylesheet" type="text/css"/>
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

        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="registarcuentas.jsp">Registar Cuentas</a></li>
                <li><a href="consultarcuentas.jsp">Consutar Cuentas</a></li>
            </ul>
        </div> 

        <div class="container-fluid" id="formulario">

            <div class="row">

                <section class="container">
                    <form role="form" action="RegistrarCuenta" method="POST" class="payment-form">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Cuentas </h3>
                                <div class="radio col-lg-6">
                                    <label>
                                        <input type="radio" name="opciones" value="Estudiante" onchange="recibir()" checked="recibir()">
                                        Estudiante
                                    </label>
                                </div>
                                <div class="radio col-lg-6">
                                    <label>
                                        <input type="radio" name="opciones" value="Profesores" onchange="recibir()">
                                        Profesores                            
                                    </label>
                                </div>

                                <div class="form-group col-lg-12">
                                    <label for="disabledSelect" >Nombre</label>
                                </div>
                                <div class="form-group col-lg-12" id="traer" onkeypress="return validarn(event)" >
                                </div>



                                <div class="form-group col-lg-6">
                                    <label>Nombre de usuario</label>
                                    <input type="" name="nombreU" class="form-control" id="nombreU" onkeypress="return validarn(event)">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label>Contraseña</label>
                                    <input type="password" name="contra" class="form-control" id="contra" value="">
                                </div>   

                                <button type="submit" id="Guardar" name="guardar" value="insertar" class="btn btn-success" style="margin-left: 360px;">Guardar</button>
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
        <script src="js/select2.js" type="text/javascript"></script>      
        <script src="js/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="js/mapeomod.js" type="text/javascript"></script>
        <script>
                                        alertify.defaults.theme.ok = "btn btn-success";
                                        alertify.defaults.theme.cancel = "btn btn-danger";
                                        alertify.defaults.theme.input = "form-control";
        </script>
        <%            String alerte = (String) request.getAttribute("alert");
            if (alerte != null) {
                out.print(alerte);
            }

        %>

        <script>


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
                    if (($("#nombreU").val()) == "") {

                        new PNotify({
                            title: 'Campo requerido',
                            text: 'El nombre de usuario es necesario.',
                            type: 'error'
                        });


                        return false;
                    } else {
                        if (($("#contra").val()) == "") {
                            new PNotify({
                                title: 'Campo requerido',
                                text: 'La contraseña es necesario.',
                                type: 'error'
                            });
                            return false;
                        }

                    }





                });
            });



        </script>

        <script>



            $(function () {
                recibir();

            });

            function recibir() {
                var valor = $("input[name='opciones']:checked").val();
                $.ajax({
                    dataType: "html",
                    data: {
                        opciones: valor
                    },
                    type: "POST",
                    url: "ajaxCuenta",
                    statusCode: {
                        404: function () {
                            alert("page not found");
                        }
                    }
                }).done(function (datos) {

                    $("#traer").empty();
                    $("#traer").append(datos);

                    $("#ConProEsT").select2({
                        minimumInputLength: 2
                    });

                });
            }


        </script>    
    </body>
</html>


