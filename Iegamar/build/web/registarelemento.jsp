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
        </nav>

        <div class="container-fluid" id="formulario">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="registarelemento.jsp">Registar Elemento</a></li>
                        <li><a href="consultarelemento.jsp">Consutar Elemento</a></li>
                    </ul>
                </div>



                <section class="container">
                    <form role="form" action="ControladorElemento" method="POST" class="payment-form">
                        <div class="container-page">        
                            <div class="col-md-6">
                                <h3 class="dark-grey">Registro De Elementos </h3>

                                <div class="form-group col-lg-6">
                                    <input type="hidden" name="proceso" value="Registrar">
                                    <label for="disabledSelect">Nombre de elemento</label>
                                    <input type="text" id="nombre" class="form-control" name="nombre" placeholder="">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="disabledSelect">Descripción</label>
                                    <input type="text" id="descripcion" class="form-control" name="descripcion" placeholder="">
                                </div>

                                <div class="form-group col-lg-12">
                                    <label for="disabledSelect">Seriales</label>
                                    <input type="text"   class="form-control" id="Seriales" name="Seriales" onkeypress="validarLetrasNumeros()">
                                    <button type="button" class="btn btn-default preview-add-button">
                                        <span class="glyphicon glyphicon-plus"></span>Mas
                                    </button>

                                    <table class="table2 preview-table" id="tbl">
                                        <thead>
                                            <tr>
                                                <th>Seriales</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody> <!-- preview content goes here-->
                                    </table>
                                </div> 
                                <button type="submit" name="Guardar" value="insertar" onclick="xd();" class="btn btn-success" style="margin-left: 360px;">Guardar</button>
                                <input type="hidden"  class="form-control2" id="serial" name="serial" placeholder="">
                                <button type="Reset" class="btn btn-default">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </section>

            </div>
            <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
            <script src="bootstrap/js/bootstrap.js"></script>


            <script>


                                    $(document).on('click', '.input-remove-row', function () {
                                        var tr = $(this).closest('tr');
                                        tr.fadeOut(200, function () {
                                            tr.remove();

                                        });
                                    });

                                    $(function () {

                                        $('.preview-add-button').click(function () {
                                            var form_data = {};

                                            if ($('.payment-form input[name="Seriales"]').val() != "")
                                            {


                                                form_data["Seriales"] = $('.payment-form input[name="Seriales"]').val();

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
                                    }
                                    
                                    function validarLetrasNumeros(){
                                        if((event.keyCode < 48) || (event.keyCode > 57) || (event.keyCode < 41) || (event.keyCode > 90))
                                        {
                                            event.returnValue = false;
                                        }
                                    }
            </script>
    </body>
</html>


