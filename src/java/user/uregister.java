/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author avish
 */
class uregister {
Statement st;
    void addregister(String uemail, String upassword) {
        connectTDb(); 
       String query="INSERT INTO user_register(user_email,user_password) VALUES('"+uemail+"','"+upassword+"')";
    try {
        st.executeUpdate(query);
    } catch (SQLException ex) {
        Logger.getLogger(uregister.class.getName()).log(Level.SEVERE, null, ex);
    }
    }
    
    private void connectTDb() {
        String url="jdbc:mysql://localhost:3306/flight_management_system";
    
    try {
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url,"root","");
        st=con.createStatement();
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(uregister.class.getName()).log(Level.SEVERE, null, ex);
    }
   }  
}
