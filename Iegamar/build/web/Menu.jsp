<%-- 
    Document   : Menu
    Created on : 11-ago-2014, 10:56:47
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
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache-control" content="no-store">

        <title>Menu</title>

        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/navbar-fixed-top.css" rel="stylesheet">


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
                        <li><a href="consultarcuentas.jsp">Administar cuentas</a></li>
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



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

