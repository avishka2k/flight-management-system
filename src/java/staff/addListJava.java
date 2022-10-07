/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package staff;

import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author avish
 */
class addListJava {
    Statement st;
    void listItem(String add_from, String add_to, String add_depart_date, String add_return_date, String add_calss, String add_price) {
        String url = "jdbc:mysql://localhost:3306/flight_management_system";
        String sql = "INSERT INTO taransport(country_from, country_to, depart_date, return_date, flight_class, price) VALUES('"+add_from+"', '"+add_to+"', '"+add_depart_date+"', '"+add_return_date+"', '"+add_calss+"', '"+add_price+"')";       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,"root","");
            st = con.createStatement();
            st.executeUpdate(sql);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(addListJava.class.getName()).log(Level.SEVERE, null, ex);
        }
    }     
}