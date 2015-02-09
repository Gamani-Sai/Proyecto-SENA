/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.*;
import Entidad.*;
import java.sql.ResultSet;
import java.util.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Cleiman
 */
public class RegistrarControl extends HttpServlet {

    
    
     int a,b,c; //Estas variables son las que permiten calcular si los días son consecutivos
    int formula;  //Estas variables son las que permiten calcular si los días son consecutivos
    
    entidadControl control=new entidadControl();
    
    
    
    
    ArrayList<entidadControl> lista=new ArrayList<entidadControl>();
    ArrayList<entidadControl> lista2=new ArrayList<entidadControl>();
    
      Date dato=new Date();
       DateFormat hora=new SimpleDateFormat("HH:mm:ss");
   DateFormat fecha= new SimpleDateFormat("YYYY/MM/dd");
       
   public boolean Registrar(String parametro) throws SQLException
   {
    boolean verificar= false;
   String informacion= parametro;
      ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
          
           
           
           
int count = cnx.consulta.executeUpdate("INSERT INTO control_llegada_tarde (Fecha,Hora,Identificacion) VALUES ('"+ fecha.format(dato)+"','"+ hora.format(dato)+"','"+informacion+"')");
   if(count > 0)
   { 
       verificar=true;
       // cnx.conectarse().close();
   }
 return verificar;
 
   }
  
      
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
            
            //Este objeto es usado para saber si la inserción fue exitosa
            Control datoControl=new Control();
            
            //Este objeto es usado para setear
             entidadControl objcontrol=new entidadControl();
            
         
             String Boton=request.getParameter("boton") ;
        String id= request.getParameter("documento");
         
        ConexionBD cnx=new ConexionBD();
        ResultSet  result=null;
       
        boolean Dato= false;//Esta variable captura el resultado del metodo invocado
        
                  objcontrol.setFecha(fecha.format(dato)); 
                   objcontrol.setHora( hora.format(dato));          
                  objcontrol.setIdentificacion(id);
        
     
            
         if(Boton.equals("Guardar")){
         //out.print("Hola");
             
          
             
             //Este metodo consulta si la persona existe en la tabla Control_llegada_tarde
             Dato= datoControl.ConsultarExistencia(objcontrol);
             
             if(Dato){ 
             
             out.print("La persona existe");
             }else
             {
              out.print("La pesrosna no existe, se procedara para registrarla");
              datoControl.RegistrarControl(objcontrol);
             }
             
         }
        
            
            
            
            
            
            
            
            
        //-------------
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
          try {
              processRequest(request, response);
          } catch (SQLException ex) {
              Logger.getLogger(RegistrarControl.class.getName()).log(Level.SEVERE, null, ex);
          }
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
          try {
              processRequest(request, response);
          } catch (SQLException ex) {
              Logger.getLogger(RegistrarControl.class.getName()).log(Level.SEVERE, null, ex);
          }
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
