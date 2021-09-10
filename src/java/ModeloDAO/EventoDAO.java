/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.EventoVO; 
import Util.Conexion; 
import Util.Crud;
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import java.util.logging.Level; 
import java.util.logging.Logger; 

public class EventoDAO extends Conexion implements Crud{ 

     
    private Connection conexion; 
    private PreparedStatement puente; 
    private ResultSet mensajero; 
    private boolean operacion = false; 
    private String sql; 
     private String sqlMaxEvento; 


     private String IdEvento = ""; 
     private String IdUsuarioFK = "";  
     private String FechaEvento = "";  
     private String HoraEvento =""; 
     private String IdTipoEventoFK = "";  
     private String Descripcion = ""; 
    

    public EventoDAO (){ 

    } 

    public EventoDAO(EventoVO eveVO){ 

        super(); 
         
        try { 
             

            conexion = this.nuevaConexion(); 
            IdEvento = eveVO.getIdEvento(); 
            IdUsuarioFK = eveVO.getIdUsuarioFK(); 
            FechaEvento = eveVO.getFechaEvento(); 
            HoraEvento = eveVO.getHoraEvento();        
            IdTipoEventoFK = eveVO.getIdTipoEventoFK(); 
            Descripcion = eveVO.getDescripcion();                 

        } catch (Exception e) {  

             Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, e); 

        }  

    } 

     
   @Override 

    public boolean agregarRegistro() { 
       
        try { 

            sqlMaxEvento = "SELECT max(IdEvento) FROM evento"; 
            puente = conexion.prepareStatement(sqlMaxEvento); 
            mensajero=puente.executeQuery(); 
           
            int max = 0; 

            while(mensajero.next()){ 
                 
                max = mensajero.getInt(1); 

            } 

            max++;            

            sql = "insert into evento ( IdEvento, IdUsuarioFK, FechaEvento, HoraEvento," 
                    + "IdTipoEventoFK, Descripcion) values(?,?,?,?,?,?)"; 

            puente=conexion.prepareStatement(sql); 
            puente.setString(1, Integer.toString(max)); 
            puente.setString(2, IdUsuarioFK); 
            puente.setString(3, FechaEvento); 
            puente.setString(4, HoraEvento); 
            puente.setString(5, IdTipoEventoFK);  
            puente.setString(6, Descripcion); 
            puente.executeUpdate(); 
            operacion=true; 

            

        } catch (SQLException e) { 
            Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, e); 
        } finally { 
            try { 
                this.cerrarConexion(); 
 
            } catch (SQLException e) { 

            } 

        } 

        return operacion; 

    } 
     
     public ArrayList<EventoVO> listar(){ 

        ArrayList<EventoVO>listaEventos = new ArrayList<>(); 

        try { 

            conexion=this.nuevaConexion(); 
            sql="select * from evento"; 
            puente=conexion.prepareStatement(sql); 
            mensajero=puente.executeQuery(); 
            while(mensajero.next()){ 

                 
                EventoVO eveVO = new EventoVO(mensajero.getString(1),mensajero.getString(2) 
                                        ,mensajero.getString(3),mensajero.getString(4) 
                                        ,mensajero.getString(5), mensajero.getString(6)); 
                listaEventos.add(eveVO); 
            } 

        } catch (Exception e) { 
            Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, e); 

        }finally { 

            try { 

                this.cerrarConexion(); 
                 
            } catch (SQLException e) { 
                Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, e); 

            } 

      } 
        return listaEventos; 
  } 
    

    public EventoVO consultarIdEvento(String IdEvento){ 

        EventoVO eveVO = null; 
         
        try { 

            conexion = this.nuevaConexion(); 
            sql="select * from evento where IdEvento=?"; 
            puente=conexion.prepareStatement(sql);   
            puente.setString(1, IdEvento); 
            mensajero= puente.executeQuery(); 
            while(mensajero.next()){                 

                eveVO = new EventoVO(IdEvento,mensajero.getString(2), 
                        mensajero.getString(3),mensajero.getString(4), 
                        mensajero.getString(5),mensajero.getString(6)); 

            } 
           
        } catch (SQLException e) { 
            Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, sql); 
        }finally{ 

            try {                

                this.cerrarConexion(); 

            } catch (SQLException e) { 

                Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, sql); 

            } 

        } 

         

        return eveVO; 

  

}  
         
    @Override 
    public boolean actualizarRegistro() { 

        try { 

            sql = "update evento set IdUsuarioFK=?, FechaEvento=?, HoraEvento=?, " 
                    + "IdTipoEventoFK=?, Descripcion=? where IdEvento=?"; 
            puente = conexion.prepareStatement(sql); 
            puente.setString(1, IdUsuarioFK); 
            puente.setString(2, FechaEvento); 
            puente.setString(3, HoraEvento); 
            puente.setString(4, IdTipoEventoFK); 
            puente.setString(5, Descripcion); 
            puente.setString(6, IdEvento); 
            puente.executeUpdate(); 
            operacion = true; 

        } catch (SQLException e) { 
            Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, e); 
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