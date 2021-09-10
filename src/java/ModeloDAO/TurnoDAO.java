/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ModeloDAO;


import ModeloVO.TurnoVO;
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
 * @author JUAN DAVID PACHON
 */
public class TurnoDAO  extends Conexion{
    
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private String sql;

    public TurnoDAO() {
    }
    
    
        public ArrayList<TurnoVO> listar(){
    
        ArrayList<TurnoVO>ListaTurnos = new ArrayList<>();
        try {
            conexion=this.nuevaConexion();
            sql="select * from  turno";
            puente=conexion.prepareStatement(sql);
            mensajero=puente.executeQuery();
            while(mensajero.next()){
                
                TurnoVO  turVO = new  TurnoVO(mensajero.getString(1), 
                        mensajero.getString(2),
                        mensajero.getString(3));
                                                            
                ListaTurnos.add(turVO);
            }
        } catch (Exception e) {
            Logger.getLogger(TurnoDAO.class.getName()).log(Level.SEVERE, null, e);
        }/*finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(TipoSancionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }*/
        return ListaTurnos;
    
    }
    
        
    
    }
