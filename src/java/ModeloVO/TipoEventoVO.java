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
public class TipoEventoVO {
    
    private String IdTipoEvento; 
    private String NombreEvento; 
    private String Descripcion; 

  

    public TipoEventoVO() { 

    }  
     
    public TipoEventoVO(String IdTipoEvento, String NombreEvento, String Descripcion) { 

        this.IdTipoEvento = IdTipoEvento; 
        this.NombreEvento = NombreEvento; 
        this.Descripcion = Descripcion; 

    } 

  

    public String getIdTipoEvento() { 
        return IdTipoEvento; 
    } 

    public void setIdTipoEvento(String IdTipoEvento) { 
        this.IdTipoEvento = IdTipoEvento; 

    } 

    public String getNombreEvento() { 
        return NombreEvento; 

    } 
    public void setNombreEvento(String NombreEvento) { 
        this.NombreEvento = NombreEvento; 
    } 
  
    public String getDescripcion() { 
        return Descripcion; 
    } 

    public void setDescripcion(String Descripcion) { 
        this.Descripcion = Descripcion; 

    } 
    
}
