/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Entidad.*;
import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cleiman
 */
public class Foto extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           String id=request.getParameter("documento");
           
          
             String consulta="";
            
             String imagen="";//Captura la foto de la persona
            
            String radio=request.getParameter("opciones"); //Captura la opcion para saber si es estudiante o profesor
         
            consulta="select Foto from  tbl_estudiante where Identificacion = '"+id+"'";
            
            if(radio.equals("Estudiante"))
            {
             consulta="select Foto from  tbl_estudiante where Identificacion = '"+id+"'";;
           
            }else if(radio.equals("Profesores"))
            
            {
            
              consulta="select Foto from tbl_empleado  where Identificacion = '"+id+"'";
            
            }
               
          ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
          cnx.resultado= cnx.consulta.executeQuery( consulta);
        
            if( cnx.resultado.next())
            {
                
               imagen= cnx.resultado.getString("Foto");
            
                
              
            }
            
          
             
            
             out.print("  <input type=\"Hidden\" name=\"documento\" value='"+id+"'/> ");
          
               
             
             out.print("<Center> <img  src='"+imagen+"'  width='250' height='250' </Center> ");
              
             
             
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
            Logger.getLogger(Foto.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Foto.class.getName()).log(Level.SEVERE, null, ex);
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
