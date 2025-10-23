/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package net.codejava.sql;

import java.sql.*; // Paquetes de jdbc
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dan
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        //ventana del programa    
        Window window = new Window();
        window.setVisible(true);
        window.setLocationRelativeTo(null);
        
        
        //Connecion JDBC a SQL Server
        String url = "jdbc:sqlserver://DESKTOP-OH1JKVL\\SQLEXPRESS;"+ 
                "databaseName = prueba_reservas;"+"encrypt=true;trustServerCertificate=true";        
        String user = "dan";
        String password = "?s0pI02j_nfD";
        
        try {
            Connection connection = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion exitosa");
            
            
            //Query Consola
//            String sql = "select nombre from edificios;";
//            Statement statement = connection.createStatement();
//            
//            ResultSet result = statement.executeQuery(sql);
//            
//            int count = 0;
//            System.out.println("ROW | Edificio ID  | Nombre Edificio ");
//            
//            while(result.next()){
//                count++;
//                int edificio_id = result.getInt("edificio_id");
//                String nombre = result.getString("nombre");
//                
//                
//                System.out.println(" "+count+"        "+ edificio_id+"            "+ nombre);
//            }
            
            connection.close();
            
        } catch (SQLException ex) {
            System.out.println("Conexion Fallida");
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //Termina JDBC
        
        
        
    }
    
}
