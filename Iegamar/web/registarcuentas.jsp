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
                        <li class="active"><a href="consultarcuentas.jsp">Administar Cuentas</a></li>
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
                                <div class="form-group col-lg-12" id="traer" >
                                </div>



                                <div class="form-group col-lg-6">
                                    <label>Nombre de usuario</label>
                                    <input type="" name="nombreU" class="form-control" id="nombreU" value="">
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


