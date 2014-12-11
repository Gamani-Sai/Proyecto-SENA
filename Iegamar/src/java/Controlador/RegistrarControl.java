/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Entidad.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.*;
import Entidad.*;
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
       DateFormat tiempo=new SimpleDateFormat("HH:mm:ss");
   DateFormat fecha= new SimpleDateFormat("YYYY/MM/dd");
       
   public boolean Registrar(String parametro) throws SQLException
   {
    boolean verificar= false;
   String informacion= parametro;
      ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
          
           
           
           
int count = cnx.consulta.executeUpdate("INSERT INTO control_llegada_tarde (Fecha,Hora,Identificacion) VALUES ('"+ fecha.format(dato)+"','"+ tiempo.format(dato)+"','"+informacion+"')");
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
            
          String Boton=request.getParameter("boton") ;
        String id= request.getParameter("documento");
         
        if(Boton.equals("Cancelar"))
        {
        
        getServletConfig().getServletContext().getRequestDispatcher("/registarcontrol.jsp").forward(request, response);
        
        }
        else if(Boton.equals("Guardar"))
        {
        
       //Aqui el metodo recibe el parametro   
        Registrar(id);
        
            
      ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
           cnx.resultado= cnx.consulta.executeQuery("select Extract(day from Fecha) as Fecha  from control_llegada_tarde where year(Fecha)=2014");
        
        while(cnx.resultado.next())  
        {
            
         control.setFecha( cnx.resultado.getString("Fecha"));
        lista.add(control);
        } 
         formula=lista.size() -3;
         if(formula < 0)
         {
         out.print("Registro exitoso");
         }
         else
         {
         for(int i=lista.size()-1;i >= formula; i --)
        {
         lista2.add(lista.get(i));
        
        } 
        
     a=Integer.parseInt( lista2.get(0).getFecha().toString());
          b= Integer.parseInt(lista2.get(1).getFecha().toString());
         c= Integer.parseInt(lista2.get(2).getFecha().toString());
         
         
         
         if( a -1 == b &&  b -1== c)
         {
         out.print("El estudiante con el numero de documento:" + id +"Tiene 3 o más llegadas tardes consecutivas");
         }
         else 
         {
        
         
//          request.setAttribute( "x1",x1);
//         request.setAttribute( "x",x);
         //getServletConfig().getServletContext().getRequestDispatcher("/Fotico.jsp").forward(request, response);
         out.print("Se Registro con exito");
         }
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
