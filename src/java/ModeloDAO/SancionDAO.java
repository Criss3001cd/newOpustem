/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.SancionVO;
import Util.Conexion;
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
public class SancionDAO extends Conexion implements Crud{

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    
    private boolean operacion = false;
    private String sql;
    private String sqlMaxSancion;
    
    
    private String IdSancion = "";
    private String IdTipoSancionFK = "";
    private String IdUsuarioFK = "";
    private String IdEventoFK = "";
    private String FechaSancion = "";
    private String HoraSancion = "";
    private String Descripcion = "";

    public SancionDAO() {
    }
    
    
    public SancionDAO(SancionVO SanVO) {
        super();

        try {
            conexion = this.nuevaConexion();
            IdSancion = SanVO.getIdSancion();
            IdTipoSancionFK = SanVO.getIdTipoSancionFK();
            IdUsuarioFK = SanVO.getIdUsuarioFK();
            IdEventoFK = SanVO.getIdEventoFK();
            FechaSancion = SanVO.getFechaSancion();
            HoraSancion = SanVO.getHoraSancion();
            Descripcion = SanVO.getDescripcion();
        } catch (Exception e) {
            Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    
    @Override
    public boolean agregarRegistro() {
        try {
            sqlMaxSancion = "SELECT max(IdSancion)  FROM Sancion";
            puente = conexion.prepareStatement(sqlMaxSancion);
            mensajero=puente.executeQuery();
            
            int max = 0;
            while(mensajero.next()){
                
                max = mensajero.getInt(1);
            }
            max++;
            sql = "insert into Sancion ( IdSancion,IdTipoSancionFK, IdUsuarioFK,"
                + "IdEventoFK, FechaSancion, HoraSancion, Descripcion) values(?,?,?,?,?,?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Integer.toString(max));
            puente.setString(2, IdTipoSancionFK);
            puente.setString(3, IdUsuarioFK);
            puente.setString(4, IdEventoFK);
            puente.setString(5, FechaSancion);
            puente.setString(6, HoraSancion);
            puente.setString(7, Descripcion);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {

                this.cerrarConexion();

            } catch (SQLException e) {
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update Sancion set IdTipoSancionFK=?, IdUsuarioFK=?, IdEventoFK=?, FechaSancion=?, "
                    + "HoraSancion=?, Descripcion=? where IdSancion=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, IdTipoSancionFK);
            puente.setString(2, IdUsuarioFK);
            puente.setString(3, IdEventoFK);
            puente.setString(4, FechaSancion);
            puente.setString(5, HoraSancion);
            puente.setString(6, Descripcion);
            puente.setString(7, IdSancion);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {

                this.cerrarConexion();

            } catch (SQLException e) {
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public ArrayList<SancionVO> listar(){
    
        ArrayList<SancionVO>ListaSanciones = new ArrayList<>();
        try {
            conexion=this.nuevaConexion();
            sql="select * from sancion";
            puente=conexion.prepareStatement(sql);
            mensajero=puente.executeQuery();
            while(mensajero.next()){
                
                SancionVO  SanVO= new SancionVO(mensajero.getString(1),mensajero.getString(2)
                                        ,mensajero.getString(3),mensajero.getString(4)
                                        ,mensajero.getString(5),mensajero.getString(6),mensajero.getString(7));
                ListaSanciones.add(SanVO);
            }
        } catch (Exception e) {
            Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }
        return ListaSanciones;
    
    }
    
     public SancionVO consultarId(String IdSancion){
        SancionVO sanVO = null;
        
        try {
            conexion = this.nuevaConexion();
            sql="select * from Sancion where IdSancion=?";
            puente=conexion.prepareStatement(sql);
            puente.setString(1, IdSancion);
            mensajero= puente.executeQuery();
            while (mensajero.next()){
                sanVO = new SancionVO(IdSancion,mensajero.getString(2)
                                        ,mensajero.getString(3), mensajero.getString(4),
                                           mensajero.getString(5), mensajero.getString(6),
                                            mensajero.getString(7));
            }
        } catch (Exception e) {
            Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e); 
        }finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(SancionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }
        return sanVO;
    }
}
