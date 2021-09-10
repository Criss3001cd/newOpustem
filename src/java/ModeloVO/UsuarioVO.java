/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;


/**
 *
 * @author JUAN DAVID PACHON
 */
public class UsuarioVO {
     private String IdUsuario;
     private String AliasUsuario;
     private String NombreUsuario;
     private String ApellidoUsuario;
     private String FechaNacimiento;
     private String CorreoUsuario;
     private String ClaveUsuario;
     private String TipoDocumento;
     private String NumeroDocumento;
     private String DireccionUsuario;
     private String Telefono;
     private String IdCargoFK;
     private String IdTurnoFK;
     private String Estado;
  
     
     private String IdCargo;
     private String NombreCargo;

    public UsuarioVO(String IdCargo, String NombreCargo) {
        this.IdCargo = IdCargo;
        this.NombreCargo = NombreCargo;
    }

    public UsuarioVO(String idUsuario, String AliasUsuario, String ClaveUsuario) {
        this.IdCargo = IdCargo;
        this.AliasUsuario = AliasUsuario;
        this.ClaveUsuario = ClaveUsuario;
    }
    
    

    public String getIdCargo() {
        return IdCargo;
    }

    public void setIdCargo(String IdCargo) {
        this.IdCargo = IdCargo;
    }

    public String getNombreCargo() {
        return NombreCargo;
    }

    public void setNombreCargo(String NombreCargo) {
        this.NombreCargo = NombreCargo;
    }

    public UsuarioVO(String IdUsuario, String AliasUsuario, String NombreUsuario, String ApellidoUsuario, String FechaNacimiento, String CorreoUsuario, String ClaveUsuario, String TipoDocumento, String NumeroDocumento, String DireccionUsuario, String Telefono, String IdCargoFK, String IdTurnoFK, String Estado) {
        this.IdUsuario = IdUsuario;
        this.AliasUsuario = AliasUsuario;
        this.NombreUsuario = NombreUsuario;
        this.ApellidoUsuario = ApellidoUsuario;
        this.FechaNacimiento = FechaNacimiento;
        this.CorreoUsuario = CorreoUsuario;
        this.ClaveUsuario = ClaveUsuario;
        this.TipoDocumento = TipoDocumento;
        this.NumeroDocumento = NumeroDocumento;
        this.DireccionUsuario = DireccionUsuario;
        this.Telefono = Telefono;
        this.IdCargoFK = IdCargoFK;
        this.IdTurnoFK = IdTurnoFK;
        this.Estado = Estado;
    }
     
     
     

   

    public UsuarioVO() {
    }


    

    public String getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(String IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getAliasUsuario() {
        return AliasUsuario;
    }

    public void setAliasUsuario(String AliasUsuario) {
        this.AliasUsuario = AliasUsuario;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getApellidoUsuario() {
        return ApellidoUsuario;
    }

    public void setApellidoUsuario(String ApellidoUsuario) {
        this.ApellidoUsuario = ApellidoUsuario;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public String getCorreoUsuario() {
        return CorreoUsuario;
    }

    public void setCorreoUsuario(String CorreoUsuario) {
        this.CorreoUsuario = CorreoUsuario;
    }

    public String getClaveUsuario() {
        return ClaveUsuario;
    }

    public void setClaveUsuario(String ClaveUsuario) {
        this.ClaveUsuario = ClaveUsuario;
    }

    public String getTipoDocumento() {
        return TipoDocumento;
    }

    public void setTipoDocumento(String TipoDocumento) {
        this.TipoDocumento = TipoDocumento;
    }

    public String getNumeroDocumento() {
        return NumeroDocumento;
    }

    public void setNumeroDocumento(String NumeroDocumento) {
        this.NumeroDocumento = NumeroDocumento;
    }

    public String getDireccionUsuario() {
        return DireccionUsuario;
    }

    public void setDireccionUsuario(String DireccionUsuario) {
        this.DireccionUsuario = DireccionUsuario;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getIdCargoFK() {
        return IdCargoFK;
    }

    public void setIdCargoFK(String IdCargoFK) {
        this.IdCargoFK = IdCargoFK;
    }

    public String getIdTurnoFK() {
        return IdTurnoFK;
    }

    public void setIdTurnoFK(String IdTurnoFK) {
        this.IdTurnoFK = IdTurnoFK;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
     
    
}
