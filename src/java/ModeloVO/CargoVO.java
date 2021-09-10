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
public class CargoVO {
    private String IdCargoFK;
    private String NombreCargo;

    public CargoVO() {
    }
    
    
   public CargoVO(String IdCargoFK,String NombreCargo){
       this.IdCargoFK=IdCargoFK;
       this.NombreCargo=NombreCargo;
   }

    public String getIdCargoFK() {
        return IdCargoFK;
    }

    public void setIdCargoFK(String IdCargoFK) {
        this.IdCargoFK = IdCargoFK;
    }

    public String getNombreCargo() {
        return NombreCargo;
    }

    public void setNombreCargo(String NombreCargo) {
        this.NombreCargo = NombreCargo;
    }

  
    
}
