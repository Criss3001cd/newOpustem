/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author duban
 */
public class SancionVO {
    
    private String IdSancion;
    private String IdTipoSancionFK;
    private String IdUsuarioFK;
    private String IdEventoFK;
    private String FechaSancion;
    private String Descripcion;

    public SancionVO() {
    }

    public SancionVO(String IdSancion, String IdTipoSancionFK, String IdUsuarioFK, String IdEventoFK, String FechaSancion, String Descripcion) {
        this.IdSancion = IdSancion;
        this.IdTipoSancionFK = IdTipoSancionFK;
        this.IdUsuarioFK = IdUsuarioFK;
        this.IdEventoFK = IdEventoFK;
        this.FechaSancion = FechaSancion;
        this.Descripcion = Descripcion;
    }

    public String getIdSancion() {
        return IdSancion;
    }

    public void setIdSancion(String IdSancion) {
        this.IdSancion = IdSancion;
    }

    public String getIdTipoSancionFK() {
        return IdTipoSancionFK;
    }

    public void setIdTipoSancionFK(String IdTipoSancionFK) {
        this.IdTipoSancionFK = IdTipoSancionFK;
    }

    public String getIdUsuarioFK() {
        return IdUsuarioFK;
    }

    public void setIdUsuarioFK(String IdUsuarioFK) {
        this.IdUsuarioFK = IdUsuarioFK;
    }

    public String getIdEventoFK() {
        return IdEventoFK;
    }

    public void setIdEventoFK(String IdEventoFK) {
        this.IdEventoFK = IdEventoFK;
    }

    public String getFechaSancion() {
        return FechaSancion;
    }

    public void setFechaSancion(String FechaSancion) {
        this.FechaSancion = FechaSancion;
    }


    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
    
    
}
