package com.bitirmeProje.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;



public class ConnectionDB {
    
    
    public ConnectionDB(){
        ;
    }
    
    public Connection baglanti() throws SQLException{
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dersyonetimsistemi?characterEncoding=UTF-8", "root", "12345");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
      
        return conn;
    }
    
}
