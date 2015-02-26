/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import Entidad.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

/**
 *
 * @author Cleiman
 */
public class Control extends ConexionBD {
    
    
    entidadControl objcontrol=new entidadControl();
    
        int n=0;
    public Control() {
           
           conectarse();
            
         }
        PreparedStatement pstmt;
    
               
        
     /*Recodar que el formato para tiempo del RELOJ del año es ("HH:mm:ss") y para frcha del AÑO ("YYYY/MM/dd")*/
            
             Date dato = new Date();  //Se instacia el Objeto Date
            // DateFormat mes= new SimpleDateFormat("MM");// Aqui se captura el mes con el Objeto Mes 
          
            
            DateFormat anio= new SimpleDateFormat("YYYY");//Objeto dataformt
             String Anio=  anio.format(dato);
               
               
             
             
             
    
        public ResultSet ConsultarExistencia(String parametro,String doc) throws SQLException
        { 
           String Document = doc;
            String Mes= parametro;
        
               //boolean objconsulta= false;
                
              conectarse();
               
            String Query="select Extract(day from Fecha) as Fecha  "
                    + ""
                    + "from control_llegada_tarde where Identificacion= %s and year(Fecha)= %s  and "
                    + "month(Fecha)= %s";
             
                 String Sql= String.format(Query,Document,Anio,Mes);

         
        consulta= conector.createStatement();
          resultado=  consulta.executeQuery(Sql);
          
            
            return resultado;
        
        
        
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
  
     /*ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
          cnx.resultado= cnx.consulta.executeQuery(Query);*/
         conectarse();
                consulta = conector.createStatement();
                resultado= consulta.executeQuery(Query);    
                
                
return  resultado;

} 

     public String DiaSemana() {
            
      String[] dias={"Domingo","Lunes","Martes", "Miercoles","Jueves","Viernes","Sábado"};
        Date hoy=new Date();
        int numeroDia=0;
       Calendar cal= Calendar.getInstance();
      cal.setTime(hoy);
      numeroDia=cal.get(Calendar.DAY_OF_WEEK);
      String dia = dias[numeroDia-1];
        
       return dia;
             
        
    
     }
    
    
    
}
