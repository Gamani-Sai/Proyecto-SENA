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
import Modelo.Control;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelo.ConexionBD;

/**
 *
 * @author Cleiman
 */
public class ConsultarControl extends HttpServlet {
  
    Control objcontrol=new Control();
    ResultSet correr;
     String tabla="";
     String saludo="";
     
ConexionBD bd=new ConexionBD();
     
    
     
     public ResultSet listarCantidad() throws SQLException
{ 
    
      // ResultSet rs = null;
    String Query="SELECT Identificacion ,Fecha,Hora,count(Identificacion) AS Cantidad FROM control_llegada_tarde  GROUP BY Identificacion  ORDER BY Fecha desc";
  
   
     bd.conectarse();
         bd.conectarse();
              bd.consulta = bd.conector.createStatement();
                bd.resultado= bd.consulta.executeQuery(Query);    
                
                
return  bd.resultado;

} 
       

     
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            /*                             IMPORTANTE 
                          Para obtener más información sobre los metodos
           invocados en esta clase debes ir a la RUTA que se expecifica al lado de los metodos*/
            
            boolean booleano=false;
                  String Tipo ="";//Declara si es un estuidante o profesor
                String x= request.getParameter("documento");
           
                   booleano = objcontrol.BuscarControl(x);//RUTA: Modelo:Control
   
                   if(booleano == true)
                   {
                   correr = objcontrol.ControlProfesor(x);//RUTA: Modelo:Control
                   Tipo = "Perfil Profesional";
                  }
                   else
                   {
                    correr = objcontrol.ControlEstudiante(x);//RUTA: Modelo:Control
                     Tipo = "Grado";
                   }
   

          out.print("<table id=\"tblArea\" class=\"table table-hover\" cellspacing=\"0\" >");
               out.print("<thead>");
           out.print("<tr>");
      
           out.print("<th class=\"text-center\">");
           out.print("Documento");
           out.print("</th>");
              out.print("<th class=\"text-center\">");
           out.print("Nombre");
           out.print("</th>");
              out.print("<th class=\"text-center\">");
           out.print(Tipo);
           out.print("</th>"); 
           
             out.print("<th class=\"text-center\">");
           out.print("Fecha");
           out.print("</th>");
           
           out.print("<th class=\"text-center\">");
           out.print("Hora");
           out.print("</th>");
          
            
           out.print("</tr>");
             out.print("</thead>");         
         
               out.print("<tbody>"); 
                while( correr.next())
                {
       
          
             
           out.print("<tr>");
             out.print("<td class=\"text-center\">");
          
               out.print(correr.getString(1));
       
               out.print("</td class=\"text-center\">");
               out.print("<td>");
            
               out.print(correr.getString(2));
                out.print("</td>");
             
               out.print("<td  class=\"text-center\">");
               
               out.print(correr.getString(3));
                 out.print("</td>");
            
                out.print("<td  class=\"text-center\">");
               
               out.print(correr.getString(4));
              
               out.print("</td>");
               
               out.print("<td  class=\"text-center\">");
               
               out.print(correr.getString(5));
              
               out.print("</td>");
               
               
              
         
               
            
            out.print("</tr>");
             }
             out.print("</tbody>"); 
              out.print("</table>");
       
                
                 
                              
             //getServletConfig().getServletContext().getRequestDispatcher("/consultarcontrol.jsp").forward(request, response);
//                         
  
            
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
            Logger.getLogger(ConsultarControl.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConsultarControl.class.getName()).log(Level.SEVERE, null, ex);
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
