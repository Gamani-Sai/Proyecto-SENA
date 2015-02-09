/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import Entidad.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Cleiman
 */
public class Control extends ConexionBD {
    
    
    public Control() {
           
           conectarse();
            
         }
        PreparedStatement pstmt;
    
    
   
    
        public boolean ConsultarExistencia(entidadControl objcontrol) throws SQLException
        {
        
               boolean objconsulta= false;
                
              conectarse();
               
            String Query="SELECT Identificacion FROM  control_llegada_tarde WHERE Identificacion =  %s ";
             
                 String Sql= String.format(Query,objcontrol.getIdentificacion());

         
        consulta= conector.createStatement();
          resultado = consulta.executeQuery(Sql);
          
          if(resultado.first())
          {
            resultado.getString("Identificacion");
         
         objconsulta =  true; 
          
         
         
          }
          
           
            return objconsulta;
        
        
        
        }
        
        
    
    public boolean RegistrarControl(entidadControl objcontrol) throws SQLException
    {
     conectarse();
     
    boolean ObjRegistrar= false;
    
    pstmt=conector.prepareStatement("INSERT INTO control_llegada_tarde(Identificacion,Fecha,Hora) VALUES (?,?,?)");
      pstmt.setString(1, objcontrol.getIdentificacion());
         pstmt.setString(2, objcontrol.getFecha()); 
          pstmt.setString(3, objcontrol.getHora());
    
     int ejecuta = pstmt.executeUpdate();
            if (ejecuta > 0) {
               ObjRegistrar = true;
            }
            return ObjRegistrar;
    }
    
    
   
    
    public ResultSet listarControl() throws SQLException
{ 
    
      // ResultSet rs = null;
    String Query="Select Fecha,Hora,Identificacion from control_llegada_tarde";
  
     ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
          cnx.resultado= cnx.consulta.executeQuery(Query);



return  cnx.resultado;

} 

    
    
    
    
    
    
}
