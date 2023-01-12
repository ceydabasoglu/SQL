/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package toylibrary;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author pc
 */
public class DB {

   public static void main(String[] args) {
    // Load the JDBC driver
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      System.out.println("Error loading JDBC driver: " + e.getMessage());
      return;
    }
    Connection connection = null;
    try {
      connection = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/mydb",
        "root",
        "ceyda12345"
      );
    } catch (SQLException e) {
      System.out.println("Error establishing connection: " + e.getMessage());
      return;
    }

    try {
      connection.close();
    } catch (SQLException e) {
      System.out.println("Error closing connection: " + e.getMessage());
    }

   }
   
   
   public static void List()
   {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb",
        "root",
        "ceyda12345");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select *from Toy");
            }catch(Exception e){
            System.out.print(e);
            }
   }

    static Object getConneciton() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    static Object getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

