<%-- 
    Document   : registarcuentas
    Created on : 11-ago-2014, 11:14:32
    Author     : MAÑANA
--%>

<%@page import="Controlador.ControladorElemento"%>
<%@page import="Controlador.RegistarPrestamo"%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    HttpSession sesionOk = request.getSession();
    String usuario = "";
    int id_cuenta = 0;
    if (sesionOk.getAttribute("usuario") != null && sesionOk.getAttribute("Id_cuenta") != null) {
        usuario = sesionOk.getAttribute("usuario").toString();
        id_cuenta = Integer.parseInt(sesionOk.getAttribute("Id_cuenta").toString());
    } else {
        response.sendRedirect("index.jsp");
    }
%>

<%
    java.util.Date Fecha = new java.util.Date();
    SimpleDateFormat Formato = new SimpleDateFormat("yyyy-MM-dd");
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
        <link href="css/select2.css" rel="stylesheet" type="text/css"/>
        <link href="css/select2-bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_light.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/themes/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body onload="mueveReloj()">

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
                        <li><a href="consultarelemento.jsp">Elementos</a></li>
                        <li  class="active"><a href="consultarprestamo.jsp">Préstamo</a></li>
                        <li><a href="consultarreserva.jsp">Reserva</a></li>  
                        <li ><a href="consultarcontrol.jsp">Control de llegadas</a></li>                           
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="active"><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>


            <div hidden class="notification-list-wrapper" id="objetivo" style="top: 65px; left: 100px;  opacity: 1;">

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
                        <li class="active"><a href="registarprestamo.jsp">Registar Préstamo</a></li>
                        <li><a href="consultarprestamo.jsp">Consutar Préstamo</a></li>
                    </ul>
                </div>

                <section class="container">
                    <form role="form" action="RegistarPrestamo" method="POST" name="form_reloj" class="payment-form">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Prestamo</h3>

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
                                <div class="form-group col-lg-12" id="traer" >
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Fecha Del Prestamo</label>
                                    <input type="text" id="disabledTextInput" class="form-control" placeholder="" name="Fecha" readonly="readonly" value="<%=Formato.format(Fecha)%>">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Hora</label>
                                    <input type="text" id="disabledTextInput" class="form-control" placeholder="" name="Hora" readonly="readonly" >
                                </div>

                                <div class="form-group col-lg-12">
                                    <label for="disabledSelect">Seriales</label>
                                    <select  id="selectSerial" name="Seriales">
                                        <%
                                            RegistarPrestamo vergrados = new RegistarPrestamo();
                                            out.println(vergrados.Seriales());
                                        %>
                                    </select>
                                    <button type="button" class="btn btn-default preview-add-button">
                                        <span class="glyphicon glyphicon-plus"></span>Mas
                                    </button>     
                                </div> 
                                <div class="form-group col-lg-12">
                                    <table class="table2 preview-table" id="tbl">
                                        <thead>
                                            <tr>
                                                <th>Seriales</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody> <!-- preview content goes here-->
                                    </table>
                                </div>
                                <button type="submit" name="guardar" value="insertar" onclick="xd();" class="btn btn-success" style="margin-left: 360px;">Guardar</button>
                                <input type="hidden"  class="form-control2" id="serial" name="serial" placeholder="">
                                <button type="Reset" class="btn btn-default">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
            <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
            <script src="bootstrap/js/bootstrap.js"></script>
            <script src="js/select2.js" type="text/javascript"></script>
            <script src="js/ajax.js" type="text/javascript"></script>
            <script src="js/mapeomod.js" type="text/javascript"></script>
            <script src="bootstrap/js/alertify.js" type="text/javascript"></script>
            <script src="js/pnotify.custom.min.js" type="text/javascript"></script>

            <%
                String alerte = (String) request.getAttribute("alert");
                if (alerte != null) {
                    out.print(alerte);
                }
            %>
            
            <script>
                alertify.defaults.theme.ok = "btn btn-success";
                alertify.defaults.theme.cancel = "btn btn-danger";
                alertify.defaults.theme.input = "form-control";
            </script>





            <script>
                $("#selectSerial").select2({
                    minimumInputLength: 2
                });
            </script>

            <script language="JavaScript">

                function addZero(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }

                function mueveReloj() {
                    momentoActual = new Date();
                    hora = momentoActual.getHours();
                    minuto = addZero(momentoActual.getMinutes())

                    horaImprimible = hora + ":" + minuto;
                    document.form_reloj.Hora.value = horaImprimible;

                    setTimeout("mueveReloj()", 1000);
                }
            </script> 

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

                $(document).on('click', '.input-remove-row', function () {
                    var tr = $(this).closest('tr');
                    tr.fadeOut(200, function () {
                        tr.remove();

                    });
                });

                $(function () {
                    recibir();

                    $('.preview-add-button').click(function () {
                        var form_data = {};

                        if ($('.payment-form select[name="Seriales"]').val() != "")
                        {


                            form_data["Seriales"] = $('.payment-form select[name="Seriales"]').val();

                            form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
                            var row = $('<tr></tr>');
                            $.each(form_data, function (type, value) {

                                $('<td class="input-' + type + '"></td>').html(value).appendTo(row);

                            });
                            $('.preview-table > tbody:last').append(row);
                        }
                        document.getElementById("Seriales").value = "";
                    });

                });

                function xd() {
                    var textos = '';
                    for (var i = 0; i < document.getElementById('tbl').rows.length; i++) {
                        for (var j = 0; j < document.getElementById('tbl').rows[i].cells.length; j++)
                        {
                            if (j == 0 && i != 0) {
                                textos = textos + document.getElementById('tbl').rows[i].cells[j].innerHTML + '-';
                            }
                        }
                        textos = textos;
                    }
                    $("#serial").val(textos);
                    if (($("#serial").val()) == "") {
                        new PNotify({
                            title: 'No hay seriales',
                            type: 'error'
                        });
                        return false;
                    }
                }


            </script> 
    </body>
</html>


