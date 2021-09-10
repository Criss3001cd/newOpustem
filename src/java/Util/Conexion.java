/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author duban
 */
public class Conexion {
     private String user;
    private String password;
    private String db;
    private String url;
    private String puerto;
    private String driver;

    private Connection conexion;

    public Conexion() {
        driver = "com.mysql.jdbc.Driver";
        user = "root";
        password = "";
        db = "opustem";
        puerto = "3306";
        url = "jdbc:mysql://localhost:" + puerto + "/" + db;
        try {

            Class.forName(driver).newInstance();

            conexion = DriverManager.getConnection(url, user, password);
            System.out.println("Conexión OK");

        } catch (Exception e) {
            System.out.println("Error de Conexión" + e.toString());
        }
    }

    public Connection nuevaConexion() {
        return conexion;
    }

    
    public Connection cerrarConexion() throws SQLException{
    conexion.close();
    conexion= null;
    return conexion;
    }
    public static void main(String[] args) {
        new Conexion();
    }
}
