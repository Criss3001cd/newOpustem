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
public class TipoSancionVO {
    private String IdTipoSancion;
    private String NombreSancion;
    private String Descripcion;

    public TipoSancionVO() {
    }

    public TipoSancionVO(String IdTipoSancion, String NombreSancion, String Descripcion) {
        this.IdTipoSancion = IdTipoSancion;
        this.NombreSancion = NombreSancion;
        this.Descripcion = Descripcion;
    }

    public String getIdTipoSancion() {
        return IdTipoSancion;
    }

    public void setIdTipoSancion(String IdTipoSancion) {
        this.IdTipoSancion = IdTipoSancion;
    }

    public String getNombreSancion() {
        return NombreSancion;
    }

    public void setNombreSancion(String NombreSancion) {
        this.NombreSancion = NombreSancion;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
}
