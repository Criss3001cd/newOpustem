/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Util.Conexion;
import Util.Crud;
import ModeloVO.UsuarioVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JUAN DAVID PACHON
 */
public class UsuarioDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    
    private boolean operacion = false;
    private String sql;
    private String sqlMaxSancion;
    
     private String IdUsuario="";
     private String AliasUsuario="";
     private String NombreUsuario="";
     private String ApellidoUsuario="";
     private String FechaNacimiento="";
     private String CorreoUsuario="";
     private String ClaveUsuario="";
     private String TipoDocumento="";
     private String NumeroDocumento="";
     private String DireccionUsuario="";
     private String Telefono="";
     private String  IdCargoFK="";
     private String IdTurnoFK="";
      private String Estado="";

    public UsuarioDAO() {
    }
     
     
     
     public UsuarioDAO(UsuarioVO usuVO){
         super();
         
        try {
            conexion = this.nuevaConexion();
            IdUsuario= usuVO.getIdUsuario();
            AliasUsuario= usuVO.getAliasUsuario();
            NombreUsuario= usuVO.getNombreUsuario();
            ApellidoUsuario= usuVO.getApellidoUsuario();
            FechaNacimiento= usuVO.getFechaNacimiento();
            CorreoUsuario= usuVO.getCorreoUsuario();
            ClaveUsuario= usuVO.getClaveUsuario();
            TipoDocumento= usuVO.getTipoDocumento();
            NumeroDocumento = usuVO.getNumeroDocumento();
            DireccionUsuario= usuVO.getDireccionUsuario();
            Telefono= usuVO.getTelefono();
            IdCargoFK= usuVO.getIdCargoFK();
            IdTurnoFK= usuVO.getIdTurnoFK();
            Estado= usuVO.getEstado();
            

        } catch (Exception e) {
            //logger captura lo que me esta pasando y como se comporta
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
     }
     

    @Override
    public boolean agregarRegistro() {
         try {
            sqlMaxSancion = "SELECT max(IdUsuario)  FROM Usuario";
            puente = conexion.prepareStatement(sqlMaxSancion);
            mensajero=puente.executeQuery();
            
            int max = 0;
            while(mensajero.next()){
                
                max = mensajero.getInt(1);
            }
            max++;
             
            sql = "insert into usuario (IdUsuario, AliasUsuario, NombreUsuario, ApellidoUsuario, FechaNacimiento,"
                    +"CorreoUsuario, ClaveUsuario, TipoDocumento, NumeroDocumento, DireccionUsuario, Telefono,"
                    +"IdCargoFK, IdTurnoFK, Estado) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Integer.toString(max));
            puente.setString(2, AliasUsuario);
            puente.setString(3, NombreUsuario );
            puente.setString(4, ApellidoUsuario);
            puente.setString(5, FechaNacimiento);
            puente.setString(6, CorreoUsuario);
            puente.setString(7, ClaveUsuario);
            puente.setString(8, TipoDocumento);
            puente.setString(9, NumeroDocumento);
            puente.setString(10,DireccionUsuario);
            puente.setString(11,Telefono);
            puente.setString(12,IdCargoFK );
            puente.setString(13,IdTurnoFK );
            puente.setString(14,Estado );
            //mando la sentencia
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
                
            
            }
        }
        return operacion; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        
         try {
            //?? para que no sea inyetado
           sql="update usuario set AliasUsuario=?,NombreUsuario=?,ApellidoUsuario=?,FechaNacimiento=?,CorreoUsuario=?,ClaveUsuario=?,TipoDocumento=?,NumeroDocumento=?,DireccionUsuario=? ,Telefono=?,IdCargoFK=?,IdTurnoFK=?  where IdUsuario =?";
            //preparo la sentencia
            puente = conexion.prepareStatement(sql);
            puente.setString(1, AliasUsuario);
            puente.setString(2, NombreUsuario );
            puente.setString(3, ApellidoUsuario);
            puente.setString(4, FechaNacimiento);
            puente.setString(5, CorreoUsuario);
            puente.setString(6, ClaveUsuario);
            puente.setString(7, TipoDocumento);
            puente.setString(8, NumeroDocumento);
            puente.setString(9,DireccionUsuario);
            puente.setString(10,Telefono);
            puente.setString(11,IdCargoFK );
            puente.setString(12,IdTurnoFK );
            puente.setString(13, IdUsuario );
           
            //mando la sentencia
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;//To change body of generated methods, choose Tools | Templates.
    }
    
  

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean Inactivar(){
     UsuarioVO usuVO = new UsuarioVO();
        try {
            //?? para que no sea inyetado
          
            conexion=this.nuevaConexion();
            sql="UPDATE Usuario SET Estado = \"Inactivo\"+'"+usuVO.getEstado()+"' WHERE IdUsuario='"+usuVO.getIdUsuario()+"'";
            puente=conexion.prepareStatement(sql);
        //mando la sentencia
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
        return operacion;
    
          
 }

    public boolean iniciarSesion(String usuario, String clave){
    
        try {
            conexion=this.nuevaConexion();
            sql="select * from Usuario where AliasUsuario=? and ClaveUsuario=?";
            puente=conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            puente.setString(2, clave);
            mensajero=puente.executeQuery();
            if(mensajero.next()){
                operacion=true;
            }
                    
        } catch (Exception e) {
             Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {

                this.cerrarConexion();

            } catch (SQLException e) {
            }
        }
        return operacion;
        
        
        
    }
    
    public UsuarioVO consultarDatos(String idUsuario){
        UsuarioVO usuVO = null;
        
        try {
            conexion = this.nuevaConexion();
            sql="select * from Usuario where IdUsuario=?";
            puente=conexion.prepareStatement(sql);
            puente.setString(1, idUsuario);
            mensajero= puente.executeQuery();
            while (mensajero.next()){
                usuVO = new UsuarioVO(mensajero.getString(1),mensajero.getString(2)
                                        ,mensajero.getString(3),mensajero.getString(4)
                                        ,mensajero.getString(5),mensajero.getString(6)
                                        ,mensajero.getString(7),mensajero.getString(8)
                                        ,mensajero.getString(9),mensajero.getString(10)
                                        ,mensajero.getString(11),mensajero.getString(12)
                                        ,mensajero.getString(13),mensajero.getString(14));
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e); 
        }finally {
            try {
                this.cerrarConexion();
                
            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
      }
        return usuVO;
    }
    
    public ArrayList<UsuarioVO>listar(){
          ArrayList<UsuarioVO>listaUsuarios = new ArrayList<>();
            try {
            conexion=this.nuevaConexion();
            sql="select * from usuario";
            puente=conexion.prepareStatement(sql);
            mensajero=puente.executeQuery();
            
            while(mensajero.next()){  
                UsuarioVO usuVO=new UsuarioVO(
                        mensajero.getString(1),
                        mensajero.getString(2),
                        mensajero.getString(3),
                        mensajero.getString(4),
                        mensajero.getString(5),
                        mensajero.getString(6),
                        mensajero.getString(7),
                        mensajero.getString(8),
                        mensajero.getString(9),
                        mensajero.getString(10),
                        mensajero.getString(11),
                        mensajero.getString(12),
                        mensajero.getString(13),
                        mensajero.getString(14));
                        listaUsuarios.add(usuVO);
            }
                
            } catch (SQLException e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        
        }finally{
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
      return listaUsuarios;
    
        
         }
    
    public UsuarioVO consultarCedula(String NumeroDocumento){
    
    UsuarioVO usuVO =null;
    
        try {
            conexion=this.nuevaConexion();
            sql="select * from usuario where NumeroDocumento=?";
            puente=conexion.prepareStatement(sql);
             puente.setString(1, NumeroDocumento);
             mensajero=puente.executeQuery();
             while(mensajero.next()){
             usuVO=new UsuarioVO(
                     mensajero.getString(1),
                     mensajero.getString(2), 
                     mensajero.getString(3), 
                     mensajero.getString(4), 
                     mensajero.getString(5),
                     mensajero.getString(6), 
                     mensajero.getString(7),
                     mensajero.getString(8),
                     mensajero.getString(9),
                     mensajero.getString(10),
                     mensajero.getString(11),
                     mensajero.getString(12),
                     mensajero.getString(13),
                     mensajero.getString(14));
             
             }
        } catch (SQLException e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        
        }finally{
            try {
                
                this.cerrarConexion();
            } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
      return usuVO;
    }
    
    public int existeUsuario( String NumeroDocumento) {
         try {
             
            sql="select count(NumeroDocumento) from usuario where NumeroDocumento=? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, NumeroDocumento);
            mensajero=puente.executeQuery();
            
            if(mensajero.next()){
                return mensajero.getInt(1);
            }
            
           return 1;
            //mando la sentencia
            
           
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
        return 1;
        
    }
    
    public int existeCorreo( String CorreoUsuario) {
         try {
             
            sql="select count(CorreoUsuario) from usuario where CorreoUsuario=? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, CorreoUsuario);
            mensajero=puente.executeQuery();
            
            if(mensajero.next()){
                return mensajero.getInt(1);
            }
            
           return 1;
            //mando la sentencia
            
           
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
        return 1;
        
    }
    
    public int existeTel( String Telefono) {
         try {
             
            sql="select count(Telefono) from usuario where Telefono=? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Telefono);
            mensajero=puente.executeQuery();
            
            if(mensajero.next()){
                return mensajero.getInt(1);
            }
            
           return 1;
            //mando la sentencia
            
           
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
        return 1;
        
    }
}
