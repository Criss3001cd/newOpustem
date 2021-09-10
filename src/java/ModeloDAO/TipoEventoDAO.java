/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.EventoVO;
import ModeloVO.TipoEventoVO; 
import Util.Conexion; 
import Util.Crud;
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException;
import java.util.ArrayList; 
import java.util.logging.Level; 
import java.util.logging.Logger; 

public class TipoEventoDAO extends Conexion implements Crud{ 

    private Connection conexion; 
    private PreparedStatement puente; 
    private ResultSet mensajero; 
    private boolean operacion = false; 
    private String sql;   
    private String sqlMaxTipoEvento; 

    private String IdTipoEvento = ""; 
    private String NombreEvento = "";  
    private String Descripcion = ""; 
    

    public TipoEventoDAO (){ 

    } 

    public TipoEventoDAO(TipoEventoVO tieveVO){ 

        super(); 
         
        try { 
             

            conexion = this.nuevaConexion(); 
            IdTipoEvento = tieveVO.getIdTipoEvento(); 
            NombreEvento = tieveVO.getNombreEvento();           
            Descripcion = tieveVO.getDescripcion();                 

        } catch (Exception e) {  

             Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, null, e); 

        }  

    } 


    @Override
    public boolean agregarRegistro() { 
       
        try { 

            sqlMaxTipoEvento = "SELECT max(IdTipoEvento) FROM tipoevento"; 
            puente = conexion.prepareStatement(sqlMaxTipoEvento); 
            mensajero=puente.executeQuery(); 
           
            int max = 0; 

            while(mensajero.next()){ 
                 
                max = mensajero.getInt(1); 

            } 

            max++;            

            sql = "insert into tipoevento ( IdTipoEvento, NombreEvento, Descripcion) values(?,?,?)"; 

            puente=conexion.prepareStatement(sql); 
            puente.setString(1, Integer.toString(max)); 
            puente.setString(2, NombreEvento);   
            puente.setString(3, Descripcion); 
            puente.executeUpdate(); 
            operacion=true; 

            

        } catch (SQLException e) { 
            Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, null, e); 
        } finally { 
            try { 
                this.cerrarConexion(); 
            } catch (SQLException e) { 
            } 
        } 
        return operacion; 
    } 
     
    
         public ArrayList<TipoEventoVO> listar(){ 
     
        ArrayList<TipoEventoVO>ListaEvento = new ArrayList<>(); 
        try { 
            conexion=this.nuevaConexion(); 
            sql="select * from tipoevento"; 
            puente=conexion.prepareStatement(sql); 
            mensajero=puente.executeQuery(); 
            while(mensajero.next()){ 
                 
                TipoEventoVO  tieveVO = new  TipoEventoVO(mensajero.getString(1), mensajero.getString(2) 
                                                            , mensajero.getString(3)); 
                ListaEvento.add(tieveVO); 
            } 
        } catch (SQLException e) { 
            Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, null, e); 
        }finally { 
            try { 
                this.cerrarConexion(); 
                 
            } catch (SQLException e) { 
                Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, null, e); 
            } 
      } 
        return ListaEvento; 
     
    }
    
    public TipoEventoVO consultarIdTipoEvento(String IdTipoEvento){ 

        TipoEventoVO tieveVO = null; 
         
        try { 

            conexion = this.nuevaConexion(); 
            sql="select * from tipoevento where IdTipoEvento=?"; 
            puente=conexion.prepareStatement(sql);   
            puente.setString(1, IdTipoEvento); 
            mensajero= puente.executeQuery(); 
            while(mensajero.next()){                 

            tieveVO = new TipoEventoVO(IdTipoEvento,mensajero.getString(2),mensajero.getString(3)); 
            } 
           
        } catch (SQLException e) { 
            Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, sql); 
        }finally{ 
            try {                
                this.cerrarConexion(); 
            } catch (SQLException e) { 
                Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, sql); 
            } 
        } 
         
        return tieveVO; 

  

}  
      
    @Override
    public boolean actualizarRegistro() { 

        try { 

            sql = "update tipoevento set NombreEvento=?, Descripcion=? where IdTipoEvento=?"; 
            puente = conexion.prepareStatement(sql); 
            puente.setString(1, NombreEvento); 
            puente.setString(2, Descripcion); 
            puente.setString(3, IdTipoEvento); 
            puente.executeUpdate(); 
            operacion = true; 

        } catch (SQLException e) { 
            Logger.getLogger(TipoEventoDAO.class.getName()).log(Level.SEVERE, null, e); 
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
     
       
} 
