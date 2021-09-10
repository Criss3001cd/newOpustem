/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author motta
 */
public class TipoPermisoVO {
    private String IdTipoPermiso;
    private String NombrePermiso;
    private String Descripcion;

    public TipoPermisoVO() {
    }

    public TipoPermisoVO(String IdTipoPermiso, String NombrePermiso, String Descripcion) {
        this.IdTipoPermiso = IdTipoPermiso;
        this.NombrePermiso = NombrePermiso;
        this.Descripcion = Descripcion;
    }

    public String getIdTipoPermiso() {
        return IdTipoPermiso;
    }

    public void setIdTipoPermiso(String IdTipoPermiso) {
        this.IdTipoPermiso = IdTipoPermiso;
    }

    public String getNombrePermiso() {
        return NombrePermiso;
    }

    public void setNombrePermiso(String NombrePermiso) {
        this.NombrePermiso = NombrePermiso;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
}
