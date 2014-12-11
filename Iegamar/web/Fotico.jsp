<%-- 
    Document   : Fotico
    Created on : 05-dic-2014, 1:36:06
    Author     : Cleiman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         
        <% 
            String ruta=(String)request.getAttribute("imagen")  ; 
            
           
        %>
        
        <img    width='250' height='250'  >
        <form action="RegistrarControl" method="POST" > 
            
         <input type="hidden" name="documento" value="${id}"  />
          
          <br>    <br>
          <input type="submit" value="Aceptar"  name="boton"/>
          <input type="submit" value="Cancelar" name="boton"/>
          </form>
    </body>
</html>
