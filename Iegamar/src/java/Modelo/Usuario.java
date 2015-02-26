/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import Entidad.entidadUsuario;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Gamani
 */
public class Usuario extends ConexionBD {

    entidadUsuario ent = new entidadUsuario();
    private PreparedStatement estament;

    public ResultSet validar(entidadUsuario datosUsuario) {
        conectarse();
        ResultSet rs = null;
        String consulta_tipo = "select  Id_cuenta ,Tipo_rol from tbl_cuentas_usuario where Login= ? and Password= ? and Estado='Habilitado'";

        try {
            Stmp();

            estament = conector.prepareStatement(consulta_tipo);
            estament.setString(1, datosUsuario.getLogin());
            estament.setString(2, datosUsuario.getPassword());           
            rs = estament.executeQuery();

        } catch (Exception er) {

        }
        return rs;
    }
    
     public ResultSet Ingreso(entidadUsuario datosUsuario) {
        conectarse();
        ResultSet rs = null;
        String consulta_tipo = "select  Id_cuenta from tbl_cuentas_usuario ";

       try {
            consulta = conector.createStatement();
            rs = consulta.executeQuery(consulta_tipo);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return rs;
    }
    
}
