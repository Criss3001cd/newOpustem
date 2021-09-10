/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Util.Conexion;
import ModeloVO.TipoSancionVO;
import Util.Crud;
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
public class TipoSancionDAO extends Conexion implements Crud {
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    
    private boolean operacion = false;
    private String sql;

    

    //2. Conectarse y traer datos del VO
    
     public TipoSancionVO consultarId(String IdTipoSancion){
        TipoSancionVO TiSaVO = null;
        
        try {
            conexion = this.nuevaConexion();
            sql="select * from TipoSancion where IdTipoSancion=?";
            puente=conexion.prepareStatement(sql);
            puente.setString(1, IdTipoSancion);
            mensajero= puente.executeQuery();
            while (mensajero.next()){
                TiSaVO = new TipoSancionVO(mensajero.getString(1),mensajero.getString(2)
                                        ,mensajero.getString(3));
            }
        } catch (Exception e) {
            Logger.getLogger(TipoSancionDAO.class.getName()).log(Level.SEVERE, null, e); 
        }finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(TipoSancionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }
        return TiSaVO;
    }
    
    
    public ArrayList<TipoSancionVO> listar(){
    
        ArrayList<TipoSancionVO>ListaSancion = new ArrayList<>();
        try {
            conexion=this.nuevaConexion();
            sql="select * from tiposancion";
            puente=conexion.prepareStatement(sql);
            mensajero=puente.executeQuery();
            while(mensajero.next()){
                
                TipoSancionVO  tiSaVO = new  TipoSancionVO(mensajero.getString(1), mensajero.getString(2)
                                                            , mensajero.getString(3));
                ListaSancion.add(tiSaVO);
            }
        } catch (Exception e) {
            Logger.getLogger(TipoSancionDAO.class.getName()).log(Level.SEVERE, null, e);
        }/*finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(TipoSancionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }*/
        return ListaSancion;
    
    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
