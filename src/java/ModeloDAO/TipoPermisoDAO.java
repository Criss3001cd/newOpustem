/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Util.Conexion;
import ModeloVO.TipoPermisoVO;
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
 * @author jaime
 */
public class TipoPermisoDAO extends Conexion implements Crud{
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    
    private boolean operacion = false;
    private String sql;

  

    
    
    
    
   

    

    //2. Conectarse y traer datos del VO
    
     public TipoPermisoVO consultarId(String IdTipoPermiso){
        TipoPermisoVO TiPeVO = null;
        
        try {
            conexion = this.nuevaConexion();
            sql="select * from TipoPermiso where IdTipoPermiso=?";
            puente=conexion.prepareStatement(sql);
            puente.setString(1, IdTipoPermiso);
            mensajero= puente.executeQuery();
            while (mensajero.next()){
                TiPeVO = new TipoPermisoVO(mensajero.getString(1),mensajero.getString(2)
                                        ,mensajero.getString(3));
            }
        } catch (Exception e) {
            Logger.getLogger(TipoPermisoDAO.class.getName()).log(Level.SEVERE, null, e); 
        }finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(TipoPermisoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }
        return TiPeVO;
    }
    
    
    public ArrayList<TipoPermisoVO> listar(){
    
        ArrayList<TipoPermisoVO>ListaPermiso = new ArrayList<>();
        try {
            conexion=this.nuevaConexion();
            sql="select * from tipopermiso";
            puente=conexion.prepareStatement(sql);
            mensajero=puente.executeQuery();
            while(mensajero.next()){
                
                TipoPermisoVO  tiPeVO = new  TipoPermisoVO(mensajero.getString(1), mensajero.getString(2)
                                                            , mensajero.getString(3));
                ListaPermiso.add(tiPeVO);
            }
        } catch (Exception e) {
            Logger.getLogger(TipoPermisoDAO.class.getName()).log(Level.SEVERE, null, e);
        }/*finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(TipoSancionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }*/
        return ListaPermiso;
    
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

