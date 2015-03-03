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
    
    
   
    //Este metodo permite buscar si el documento pertenece al estudiante o al profesor
    public boolean BuscarControl(String parametro) throws SQLException
{ 
    
   
    String dato = parametro;
      // ResultSet rs = null;
    String Consultar= "SELECT Identificacion FROM   tbl_empleado WHERE Identificacion= "+dato+"";
  
    
    boolean booleano = false;
     /*ConexionBD cnx=new ConexionBD();
            cnx.conectarse();
           cnx.consulta = cnx.conector.createStatement();
          cnx.resultado= cnx.consulta.executeQuery(Query);*/
         conectarse();
                consulta = conector.createStatement();
                resultado= consulta.executeQuery(Consultar);    
              
                if(resultado.first())
                {
                 resultado.getString("Identificacion");
                 
                 booleano = true;
                  
                }
              
               return  booleano;

} 
    
      public ResultSet ControlProfesor(String parametro) throws SQLException
{ 
    
   
    String datos = parametro;
      // ResultSet rs = null;
    String Query= "SELECT c.Identificacion,CONCAT(e.Nombre,e.Apellido),e.Perfil_profesional,c.Fecha,c.Hora from control_llegada_tarde c INNER JOIN tbl_empleado e  ON c.Identificacion = e.Identificacion WHERE c.Identificacion = "+datos+" ORDER BY c.Fecha DESC, c.Hora DESC "; 
   
    
       
     
         conectarse();
                consulta = conector.createStatement();
                resultado= consulta.executeQuery(Query);    
              
               
              
               return  resultado;

}   
      
      
      public ResultSet ControlEstudiante(String parametro) throws SQLException
{ 

   
    String datos = parametro;
      // ResultSet rs = null;
    String Query= "SELECT c.Identificacion,CONCAT(e.Nombre,e.Apellido),g.Grado,c.Fecha,c.Hora from control_llegada_tarde c INNER JOIN tbl_estudiante e  ON c.Identificacion = e.Identificacion INNER JOIN    tbl_grado g  ON g.Id_grado = e.Id_grado WHERE c.Identificacion = "+datos+" ORDER BY c.Fecha DESC, c.Hora DESC "; 
   
    
       
     
         conectarse();
                consulta = conector.createStatement();
                resultado= consulta.executeQuery(Query);    
              
               
              
               return  resultado;

}  
    
    
    
    
    
    
//    public ResultSet listarCantidad() throws SQLException
//{ 
//    
//      // ResultSet rs = null;
//    String Query="Select Identificacion ,Fecha,Hora from control_llegada_tarde";
//  
//     /*ConexionBD cnx=new ConexionBD();
//            cnx.conectarse();
//           cnx.consulta = cnx.conector.createStatement();
//          cnx.resultado= cnx.consulta.executeQuery(Query);*/
//         conectarse();
//                consulta = conector.createStatement();
//                resultado= consulta.executeQuery(Query);    
//                
//                
//return  resultado;
//
//} 
    
    
    
    

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
