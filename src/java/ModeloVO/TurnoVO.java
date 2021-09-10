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
public class TurnoVO {
    private   String IdTurnoFK;
   private String HoraEntrada;
   private String HoraSalida;

    public TurnoVO() {
    }
   public TurnoVO (String IdTurnoFK,String HoraEntrada,String HoraSalida ){
       this.IdTurnoFK=IdTurnoFK;
       this.HoraEntrada=HoraEntrada;
       this.HoraSalida=HoraSalida;
   }

    public String getIdTurnoFK() {
        return IdTurnoFK;
    }

    public void setIdTurnoFK(String IdTurnoFK) {
        this.IdTurnoFK = IdTurnoFK;
    }

    public String getHoraEntrada() {
        return HoraEntrada;
    }

    public void setHoraEntrada(String HoraEntrada) {
        this.HoraEntrada = HoraEntrada;
    }

    public String getHoraSalida() {
        return HoraSalida;
    }

    public void setHoraSalida(String HoraSalida) {
        this.HoraSalida = HoraSalida;
    }

    
    
}
