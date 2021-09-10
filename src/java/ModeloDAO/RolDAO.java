/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.UsuarioVO;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author duban
 */
public class RolDAO extends Conexion {
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private String sql;
    
    public ArrayList<UsuarioVO> roles (String usuario) {
        
        ArrayList<UsuarioVO> listaRoles = new ArrayList<>();
        
        try {
            conexion = this.nuevaConexion();
            sql = "Select Usuario.IdUsuario, Cargo.NombreCargo FROM Usuario INNER JOIN \n"
                    + " Cargo ON Usuario.IdCargoFK = Cargo.IdCargo WHERE AliasUsuario = ? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            mensajero = puente.executeQuery();
            
            while(mensajero.next()){
                UsuarioVO usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2));
                listaRoles.add(usuVO);
                
            }
            
        } catch (SQLException e) {
        Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return listaRoles;
    }
    
}
