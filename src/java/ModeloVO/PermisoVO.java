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
public class PermisoVO {

    private String IdPermiso;
    private String IdTipoPermisoFK;

    private String FechaSolicitud;
    private String FechaPermiso;
    private String HoraSalida;
    private String Descripcion;
    private String Regreso;
    private String EstadoPermiso;

    public PermisoVO() {
    }

    public PermisoVO(String IdPermiso,
            String IdTipoPermisoFK,
            String FechaSolicitud,
            String FechaPermiso,
            String Descripcion,
            String HoraSalida,
            String Regreso,
            String EstadoPermiso) {
        this.IdPermiso = IdPermiso;
        this.IdTipoPermisoFK = IdTipoPermisoFK;

        this.FechaSolicitud = FechaSolicitud;
        this.FechaPermiso = FechaPermiso;
        this.Descripcion = Descripcion;
        this.HoraSalida = HoraSalida;
        this.Regreso = Regreso;
        this.EstadoPermiso = EstadoPermiso;
    }

    public String getIdPermiso() {
        return IdPermiso;
    }

    public void setIdPermiso(String IdPermiso) {
        this.IdPermiso = IdPermiso;
    }

    public String getIdTipoPermisoFK() {
        return IdTipoPermisoFK;
    }

    public void setIdTipoPermisoFK(String IdTipoPermisoFK) {
        this.IdTipoPermisoFK = IdTipoPermisoFK;
    }

    public String getFechaSolicitud() {
        return FechaSolicitud;
    }

    public void setFechaSolicitud(String FechaSolicitud) {
        this.FechaSolicitud = FechaSolicitud;
    }

    public String getFechaPermiso() {
        return FechaPermiso;
    }

    public void setFechaPermiso(String FechaPermiso) {
        this.FechaPermiso = FechaPermiso;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getHoraSalida() {
        return HoraSalida;
    }

    public void setHoraSalida(String HoraSalida) {
        this.HoraSalida = HoraSalida;
    }

    public String getRegreso() {
        return Regreso;
    }

    public void setRegreso(String Regreso) {
        this.Regreso = Regreso;
    }

    public String getEstadoPermiso() {
        return EstadoPermiso;
    }

    public void setEstadoPermiso(String EstadoPermiso) {
        this.EstadoPermiso = EstadoPermiso;
    }

}
