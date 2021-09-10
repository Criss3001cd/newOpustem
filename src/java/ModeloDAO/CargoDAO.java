/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

/**
 *
 * @author JUAN DAVID PACHON
 */
import ModeloVO.CargoVO;
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
public class CargoDAO extends Conexion {
    
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private String sql;

    public CargoDAO() {
    }
    
    
    public ArrayList<CargoVO>listar(){
    
        ArrayList<CargoVO>listaCargos=new ArrayList<>();
        
        try {
           conexion=this.nuevaConexion();
            sql="select * from cargo";
            puente=conexion.prepareStatement(sql);
            mensajero=puente.executeQuery();
            while(mensajero.next()){
             
                CargoVO carVO=new CargoVO(
                        mensajero.getString(1),
                        mensajero.getString(2));
                
                listaCargos.add(carVO);
            
            
            }
            
        } catch (SQLException e) {
        Logger.getLogger(CargoDAO.class.getName()).log(Level.SEVERE, null, e);
        
        }finally{
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
            Logger.getLogger(CargoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
      return listaCargos;
    
        
    
    }
    
    
    
}
