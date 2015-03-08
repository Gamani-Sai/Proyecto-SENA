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
    int formula;  //Esta variable obtienen el tamaño del Arraylist que permite extraer los días solicitados
    int formula2 =0;//Esta variable obtienen el tamaño del Arraylist que permite extraer los días solicitados
    entidadControl control=new entidadControl();
       
    
    
    
     ArrayList<String> lista=new ArrayList<>();
    ArrayList<String> lista2=new ArrayList<>();
     ArrayList<String> lista3=new ArrayList<>();
   
      Date dato=new Date();
       DateFormat hora=new SimpleDateFormat("HH:mm:ss");// Variable que captura el tiempo
     DateFormat fecha= new SimpleDateFormat("YYYY/MM/dd"); // Variable que captura el Fecha
       DateFormat Mes= new SimpleDateFormat("MM");   
  
  
      
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
             int i=0;
            //Este objeto es usado para saber si la inserción fue exitosa
            Control datoControl=new Control();
            
            //Este objeto es usado para setear
             entidadControl objcontrol=new entidadControl();
            
         
             String Boton=request.getParameter("boton") ;
        String id= request.getParameter("documento");
         
        ConexionBD cnx=new ConexionBD();
        ResultSet  result=null;
       
                    boolean Dato= false;//Esta variable captura el resultado del metodo invocado
                   String mes=  Mes.format(dato);//Variable del que captura el mes  
        
                  objcontrol.setFecha(fecha.format(dato)); 
                   objcontrol.setHora( hora.format(dato)); 
                   objcontrol.setMes(mes);//Envia el valor a la clase EntidadControl
                   objcontrol.setIdentificacion(id);
                   
                  int cont=0;// Captura la operación matematica que se le realiza el mes
                  String valor="";//Toma el mes que fue parceado
                  int numero_mes= Integer.parseInt(mes);//Covierte el mes en un número
                  String alerta="";
               
         
     
            
         if(Boton.equals("Guardar")){  
         //out.print("Hola");
             
               Dato=datoControl.RegistrarControl(objcontrol);
          
           
                         if(Dato){ 
        
                     alerta += "<script type=\"text/javascript\">";
                    alerta += "alertify.alert(\"Registro Exitoso\");";
                    alerta += "</script>";
             }
         }
             
           try
           {
       ResultSet correr;
               
            correr = datoControl.ConsultarExistencia(mes,id);
           
           while(correr.next())
           { 
               
           
            
             lista.add(correr.getString("Fecha"));
         
         
           }
           
             formula=lista.size() -3;
             
             if(formula >= 0)//Tres datos días o más
                 
             {
                for( i=lista.size()-1;i >= formula; i --)
                    
        {
         lista2.add(lista.get(i));
        
        } 
             a=Integer.parseInt( lista2.get(0));
          b= Integer.parseInt(lista2.get(1));
         c= Integer.parseInt(lista2.get(2));    
            
         if( a -1 == b &&  b -1== c)
         {
         //Aqui los 3 días del mes actual son consecutivos
         
             out.print("Alerta");
             
         
         } 
         else if(datoControl.DiaSemana().equals("Martes"))
             
         {
         //El martes pero del mes actual
         if(a -1 == b &&  b -3== c)
         {
          out.print("Alerta de Martes");
         }
         
         
         }
         
         else if(datoControl.DiaSemana().equals("Lunes"))
         {
         
             if(a -3 == b &&  b -1== c)
             { 
                 //El Lunes pero del mes actual
                  out.print("Alerta  Lunes");
                 
             }
             
         }
         
             } //  <<---Con esta llave Se cierra el if principal
             
            
  /* ---> */   else if(formula == -1)//La formula es la que nos indica si se deben tomar días del mes anterior (2 días)
            
             {
              cont= numero_mes -1;
             valor= Integer.toString(cont);//El mes que vuelve hacer String
             
            correr = datoControl.ConsultarExistencia(valor,id);
             if(correr.last())
           { 
               
              lista2.add(correr.getString("Fecha"));
                   
         
           }
                
           a=Integer.parseInt( lista.get(0));//Este es el valor Menor
           b= Integer.parseInt(lista.get(1)); //Este es el valor mayor          
           c= Integer.parseInt(lista2.get(0));//Toma el valor y le hace un casting 
           
          
           
           if(b -1 == a & datoControl.DiaSemana()== "Martes")
           {
                
            
           
           if(b == 4 & c==31 & valor == "3" & valor =="5"  & valor == "7"  & valor =="8" & valor =="10")
           {
           
               out.print("Alerta martes del mes (31) anterior  martes 4");
           }
           
           else if(b == 4 & c==30 & valor == "4" & valor == "6" & valor == "9" & valor == "11")
             
           {
              out.print("Alerta martes del mes (30) anterior  martes 4");
           }
           else if(b == 3 & c==30 & valor == "3" & valor =="5"  & valor == "7"  & valor =="8" &  valor =="10")
           {
               
            out.print("Alerta martes del mes (31) anterior  martes 3");
           }
           else if(b == 3 & c==29 & valor == "4" & valor == "6" & valor == "9" & valor == "11")
             
           {
              out.print("Alerta martes del mes (30) anterior  martes 3");
           }
            
           else if(b == 2 & c==29 & valor == "3" & valor =="5"  & valor== "7"  & valor =="8" &  valor =="10")
           {
           
               out.print("Alerta martes del mes (31) anterior  martes 2");
           } 
            else if(b == 2 & c==28 & valor == "4" & valor == "6" & valor == "9" & valor == "11")
             
           {
              out.print("Alerta martes del mes (30) anterior  martes 2");
           }
            else if ( b == 4 & c==28  & valor == "2")
            {
            
                out.print("Alerta martes del mes (Febrero) anterior  martes 2");
            }
            else if(b == 3 & c== 27 & valor == "2")
            {
             out.print("Alerta martes del mes (30) anterior  martes 2");
            }
           
            
          
            
          
           }
            else if(datoControl.DiaSemana()== "Lunes" & b == 4  & b -3 == a  )
            {
            
                if(c == 31 &  valor == "3" & valor =="5"  & valor == "7"  & valor =="8" &  valor =="10")
                {
                    
                        out.print("Alerta martes del mes (31) anterior  lunes 3");
                }
                
                else if(c == 30 & valor == "4" & valor == "6" & valor == "9" & valor == "11")
            {
             out.print("Alerta martes del mes (30) anterior  lunes 3");
            
            }
                else if(c== 28 & valor =="2")
                {
                
                  out.print("Alerta martes del mes (Febrero) anterior  lunes 3");
                }
            
            }
             else if(datoControl.DiaSemana().equals("Miercoles") || datoControl.DiaSemana().equals("Jueves")||datoControl.DiaSemana().equals("Viernes") & b == 2  & b -1 == a )
            {
            
            if(c == 31 &  valor == "3" & valor =="5"  & valor == "7"  & valor =="8" &  valor =="10")
            {
              out.print("Alerta martes del mes (31) anterior  m,j,v = 2");
            }
            else if(c == 30 & valor == "4" & valor == "6" & valor == "9" & valor == "11")
            {
                   out.print("Alerta martes del mes (30) anterior  m,j,v = 2");
            
            }
            else if(c ==28 & valor.equals("2"))
            {
                out.print("Alerta martes del mes (Febrero) anterior  m,j,v = 2");
            }
            }
           
           
            } 
  
             else if(formula == -2)// Días tomados del mes anterior, valor tomados  1
             {
                  
                 cont= numero_mes -1;
                 valor= Integer.toString(cont);//El mes que vuelve hacer String
              
                 correr = datoControl.ConsultarExistencia(valor,id);
                 while(correr.next()  )
                 {
                 lista2.add(correr.getString("Fecha"));//Los días del mes anterior
                     
                 }
                  formula2=lista2.size() - 2;
            
                  if(formula2 > -2)
             {
           
                  a= Integer.parseInt(lista.get(0));
                for( i=lista2.size()-1;i >= formula2; i--)
                    
        {
                 lista3.add(lista2.get(i));//Aqui se obtiene los días del mes anterior especificos
        
        } 
              
                b = Integer.parseInt(lista3.get(0));//Día mayor
                c = Integer.parseInt(lista3.get(1));//Día menor
                
                
                if(datoControl.DiaSemana().equals("Lunes")  && a== 3)
                
                {
                if(b ==31 & c == 30 & valor == "3" & valor =="5"  & valor == "7"  & valor =="8" &  valor =="10" )
                {
                out.print("Alerta mes 31 con días 1 lunes 3");
                }
                else if(b ==30 & c == 29  & valor.equals("4") & valor == "6" & valor == "9" & valor == "11" )
                {
                    out.print("Alerta mes 30 con días 1  lunes 3");
                }
                else if( valor.equals("2") & b ==28 & c == 27 )
                {
                 out.print("Alerta mes Febrero con días 1 lunes 3");
                    
                }
                }
                else if(datoControl.DiaSemana().equals("Lunes")  && a== 2)
                {
                
                    if(b ==30 & c == 29 & valor == "3" & valor =="5"  & valor == "7"  & valor =="8" &  valor =="10")
                    {
                        out.print("Alerta mes 31 con días 1 lunes 2");
                    }
                    else if(b ==29 & c == 28  & valor.equals("4") & valor.equals("6")  & valor == "9" & valor == "11")
                    {
                      out.print("Alerta mes 30 con días 1 lunes 2");
                    
                    }
                    else if(valor.equals("2") & b ==27 & c == 28)
                    {
                       out.print("Alerta mes Febrero con días 1 lunes 2");
                    
                    }
                    
                    
                } 
                 else if(datoControl.DiaSemana().equals("Lunes")  && a== 1)
                 {
                   
                     if(b ==29 & c == 28 & valor == "3" & valor =="5"  & valor == "7"  & valor =="8" &  valor =="10" )
                     {
                        out.print("Alerta mes 31 con días 1 lunes 1");
                     }
                     else if(b ==28 & c == 27  & valor.equals("4") & valor.equals("6")  & valor == "9" & valor == "11")
                     {
                         out.print("Alerta mes 30 con días 1 lunes 1");
                     
                     }
                     else if(valor.equals("2") & b ==26 & c == 25)
                     {
                     
                       out.print("Alerta mes Febrero con días 1 lunes 1");
                     }
                 
                 }
                
                 else if(datoControl.DiaSemana().equals("Martes")  && a== 1)
                        {
                        if( b ==31 & b-3 == c & valor.equals("3")  & valor.equals("5")  & valor.equals("7")  & valor.equals("8") & valor.equals("10"))
                        {
                            out.print("Alerta mes 31 con días 1 Martes 1");
                        }
                        else if( b ==30 & b-3 == c & valor.equals("4") & valor.equals("6")  & valor == "9" & valor == "11")
                        {
                            out.print("Alerta mes 30 con días 1 Martes 1");
                        }
                        else if(valor.equals("2") & b ==28 & b -3 == c )
                        {
                           out.print("Alerta mes Febrero con días 1 Martes 1");
                            
                        }
                        
                        }
                 else if(datoControl.DiaSemana().equals("Miercoles") || datoControl.DiaSemana().equals("Jueves") || datoControl.DiaSemana().equals("Viernes") & a==1)
                 {
                 
                     if(b ==31 &  c == 28  & valor.equals("3")  & valor.equals("5")  & valor.equals("7")  & valor.equals("8") & valor.equals("10"))
                     {
                       out.print("Alerta mes 31 con días 1 m,j,v = 1");
                     }
                     else if(b ==30 & c == 29 & valor.equals("4") & valor.equals("6")  & valor.equals("9") & valor.equals("11"))
                             {
                                out.print("Alerta mes 30 con días 1 m,j,v = 1");
                             }
                     else if(valor.equals("2") & b == 28 & c == 27  )
                     {
                              out.print("Alerta mes Febrero con días 1 m,j,v = 1");
                     }
                 }
                
             }     
             
             }
             
             }catch(Exception mnj)
             {
             out.print("Error pero esta controlado!!!");
             }
                    
               request.setAttribute("alerta", alerta);
        
                  getServletConfig().getServletContext().getRequestDispatcher("/registarcontrol.jsp").forward(request, response);
             
//              String[] dias={"Domingo","Lunes","Martes", "Miércoles","Jueves","Viernes","Sábado"};
//        Date hoy=new Date();
//        int numeroDia=0;
//       Calendar cal= Calendar.getInstance();
//      cal.setTime(hoy);
//      numeroDia=cal.get(Calendar.DAY_OF_WEEK);
//      int n=0;
//      n= Integer.parseInt(Mes.format(dato));
//      out.println("hoy es "+ dias[numeroDia-1] +  "Mes:"+  Mes.format(dato));
             
             
             
         
        
            
            
            
            
            
            
            
            
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
