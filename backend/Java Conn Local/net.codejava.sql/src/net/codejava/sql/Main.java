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
    
    //Connecion JDBC a SQL Server
        public static final String url = "jdbc:sqlserver://DESKTOP-OH1JKVL\\SQLEXPRESS;"+ 
                "databaseName = reservas_p1;"+"encrypt=true;trustServerCertificate=true";        
        public static final String user = "dan";
        public static final String password = "?s0pI02j_nfD";
    
        public static Connection connection;
        
        
    public static void main(String[] args) {
        
        try {
            String url = "jdbc:sqlserver://DESKTOP-OH1JKVL\\SQLEXPRESS;"+ 
                "databaseName = reservas_p1;"+"encrypt=true;trustServerCertificate=true";
            String user = "dan";
            String password = "?s0pI02j_nfD";
            connection = DriverManager.getConnection(url, user, password);
            
            // Then create and show your Window
            java.awt.EventQueue.invokeLater(() -> {
                //new Window().setVisible(true);
            });
            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
               
        //Ventana del programa    
        Window window = new Window();//declara la clase en main
        window.setVisible(true);//Have visible la ventana
        
        window.setSize(1000,600);
        window.setLocationRelativeTo(null);//Centra la ventana
        window.setResizable(false);
        
        
        
    }
    
    public static boolean insertReserva(String carnet,String selec, String selecLab,String pcname,String HoraInicio,Integer TiempoUsoInt) {
        Connection connection = null;
        PreparedStatement pstmt = null;
  
        
        try {
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion exitosa");
            
            String sql = "INSERT INTO reservas (carnet, edificio, laboratorio, pcname, hora_inicio, hora_salida) " +
                     "VALUES (?, ?, ?, ?, CAST(? AS TIME), DATEADD(HOUR, ?, CAST(? AS TIME)))";
        
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, carnet);
            pstmt.setString(2, selec);
            pstmt.setString(3, selecLab);
            pstmt.setString(4, pcname);
            pstmt.setString(5, HoraInicio);
            pstmt.setInt(6, TiempoUsoInt); 
            pstmt.setString(7, HoraInicio);
            
            int rowsAffected = pstmt.executeUpdate();
            
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
    public static boolean checkCarnetExists(String carnet) {
    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        connection = DriverManager.getConnection(url, user, password);
        System.out.println("Conexion exitosa para verificar carnet");
        
        String sql = "SELECT carnet FROM estudiantes WHERE carnet = ?";
        pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, carnet);
        
        rs = pstmt.executeQuery();
        
        return rs.next();
        
    } catch (SQLException e) {
        System.err.println("Database error: " + e.getMessage());
        return false;
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    
}

