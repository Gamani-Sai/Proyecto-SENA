/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Entidad.entidadElemento;
import Modelo.Elemento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 519649
 */
@WebServlet(name = "ControladorElemento", urlPatterns = {"/ControladorElemento"})
public class ControladorElemento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    entidadElemento datos_elemento = new entidadElemento();
    Elemento ele = new Elemento();

    public ArrayList llenararray(String seriales) {

        String[] rrecorrercadena = seriales.split("-");
        ArrayList listar = new ArrayList();
        for (int i = 0; i < rrecorrercadena.length; i++) {
            listar.add(rrecorrercadena[i]);
        }
        return listar;
    }
  public String listarElementos() throws SQLException{
     String Recorrertbl = "";
     ResultSet listElemen = ele.consultarElementos();
      try {
            while (listElemen.next()) {
                Recorrertbl += "<tr>";
                Recorrertbl += "<td Style='display:none'><center>" + listElemen.getString("Codigo").toString().trim() + "</center></td>";
                Recorrertbl += "<td><center>" + listElemen.getString("Nombre_elemento").toString().trim() + "</center></td>";
                Recorrertbl += "<td><center>" + listElemen.getString("Descripcion").toString().trim() + "</center></td>";
                Recorrertbl += " <td><center><button onclick ='recibir(" + listElemen.getString("Codigo").toString().trim() + ");mapear.serial(" + listElemen.getString("Codigo").toString().trim() + ")' class='btn btn-default glyphicon glyphicon-eye-open'  data-toggle='modal' data-target='#myModal1'></button></center></td>";
                Recorrertbl += " <td><center><button  class='btn btn-primary glyphicon glyphicon-pencil' data-toggle='modal' data-target='#myModal' onclick = 'mapear.Elementos(" + listElemen.getString("Codigo").toString().trim() + "," + '\"'+listElemen.getString("Nombre_elemento").toString().trim()+ '\"' + "," + '\"'+listElemen.getString("Descripcion").toString().trim()+ '\"' + ")' ></button></center></td>";
                Recorrertbl += "</tr>";
            }
        } catch (Exception e) {
            Recorrertbl = "error" + e.getMessage();
        }
     
return Recorrertbl;
}
  public String listarSeriales(){
    String Recorrer_seriales = "";
    
      try {
    ResultSet list_SER = ele.consultarSeriales(datos_elemento);
         String colorEstado = "";
         String  iconoEstado = "";
         String nomFuncion = "";
            while (list_SER.next()) {
                Recorrer_seriales += "<tr>";
                Recorrer_seriales += "<td><center>" + list_SER.getString("Seriales").toString().trim() + "</center></td>";
                    if(list_SER.getString("Estado").toString().trim().equals("Disponible"))
                {
                colorEstado = "success";
                iconoEstado = "ok-circle";
                nomFuncion = "Estado_disponible("+'"'+list_SER.getString("Seriales").toString().trim()+'"'+")";
                } else if (list_SER.getString("Estado").toString().trim().equals("No disponible"))
                {
                 colorEstado = "danger";
                iconoEstado = "remove-circle";
                nomFuncion = "Estado_noDisponible("+'"'+list_SER.getString("Seriales").toString().trim()+'"'+")";
                }
                Recorrer_seriales += " <td><div id='cambio_est'><button  class='btn btn-"+ colorEstado +" glyphicon glyphicon-"+iconoEstado+"' onclick ='"+nomFuncion+"'></button></center></div></td>";
                Recorrer_seriales += "</tr>";

            }
        } catch (Exception e) {
            Recorrer_seriales = "error" + e.getMessage();
        }
    
    return Recorrer_seriales;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String proceso = request.getParameter("proceso");

            if (proceso != null) {

                if (proceso.equals("Registrar")) {
                    String evento = request.getParameter("Guardar");

                    if (evento.equals("insertar")) {
                        String Nombre = request.getParameter("nombre");
                        String Descripcion = request.getParameter("descripcion");
                        String seriales = request.getParameter("serial");
                        ArrayList arraySeri = llenararray(seriales);
                        String estado = "Disponible";
                        datos_elemento.setNombreEle(Nombre);
                        datos_elemento.setDescripcion(Descripcion);
                        datos_elemento.setSeriales(arraySeri);
                        datos_elemento.setEstado(estado);
                        ele.registrarElemento(datos_elemento);
                        ele.registrarSeriales(datos_elemento);
                    }
                     response.sendRedirect("registarelemento.jsp");
                }else if(proceso.equals("modificar"))
                {
                    String evento = request.getParameter("Guardar");
                    if(evento.equals("modificar")){
                        String codigo = request.getParameter("codigo");
                        String nombre_ele = request.getParameter("nom_elemento");
                        String descripcion = request.getParameter("descripcion");
                        datos_elemento.setCodigo(Integer.parseInt(codigo));
                        datos_elemento.setNombreEle(nombre_ele);
                        datos_elemento.setDescripcion(descripcion);
                        ele.actualizarElemento(datos_elemento);
                        
                    }
                     response.sendRedirect("consultarelemento.jsp");
                }else if (proceso.equals("listar_ser"))
                {
                    String codigo = request.getParameter("codigo");
                    datos_elemento.setCodigo(Integer.parseInt(codigo));
                      out.println(listarSeriales()); 
                
                }else if (proceso.equals("agregar_serial"))
                {
                String codigo = request.getParameter("codigo_agg");
                String serial = request.getParameter("serial");
                String Estado = "Disponible";
                datos_elemento.setCodigo(Integer.parseInt(codigo));
                datos_elemento.setSerial(serial);
                datos_elemento.setEstado(Estado);
                ele.agregarSeriales(datos_elemento);
                }else if(proceso.equals("Cambio_estado"))
                {
                    String serial = request.getParameter("serial");
                    String estado = request.getParameter("estado");
                    datos_elemento.setSerial(serial);
                    datos_elemento.setEstado(estado);
                    ele.cambio_estadoSerial(datos_elemento);
                
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
