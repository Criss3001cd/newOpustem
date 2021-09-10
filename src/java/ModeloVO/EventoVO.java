/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author juanc
 */
public class EventoVO { 
    
    private String IdEvento; 
    private String IdUsuarioFK; 
    private String FechaEvento; 
    private String HoraEvento; 
    private String IdTipoEventoFK;
    private String Descripcion; 

    public EventoVO() { 
    } 
    public EventoVO(String IdEvento, String IdUsuarioFK, String FechaEvento, String HoraEvento, String IdTipoEventoFK, String Descripcion) { 
        this.IdEvento = IdEvento; 
        this.IdUsuarioFK = IdUsuarioFK; 
        this.FechaEvento = FechaEvento; 
        this.HoraEvento = HoraEvento; 
        this.IdTipoEventoFK = IdTipoEventoFK; 
        this.Descripcion = Descripcion; 
    } 
     
public String getIdEvento() { 
        return IdEvento; 
    } 
  
    public void setIdEvento(String IdEvento) { 
        this.IdEvento = IdEvento; 
    } 
  
    public String getIdUsuarioFK() { 
        return IdUsuarioFK; 
    } 
  
    public void setIdUsuarioFK(String IdUsuarioFK) { 
        this.IdUsuarioFK = IdUsuarioFK; 
    } 
  
    public String getFechaEvento() { 
        return FechaEvento; 
    } 
  
    public void setFechaEvento(String FechaEvento) { 
        this.FechaEvento = FechaEvento; 
    } 
  
    public String getHoraEvento() { 
        return HoraEvento; 
    } 
  
    public void setHoraEvento(String HoraEvento) { 
        this.HoraEvento = HoraEvento; 
    } 
  
    public String getIdTipoEventoFK() { 
        return IdTipoEventoFK; 

    } 
  
    public void setIdTipoEventoFK(String IdTipoEventoFK) { 
        this.IdTipoEventoFK = IdTipoEventoFK; 

    } 
  
    public String getDescripcion() { 
       return Descripcion; 

    } 
  
    public void setDescripcion(String Descripcion) { 
        this.Descripcion = Descripcion; 

    } 
    
}
