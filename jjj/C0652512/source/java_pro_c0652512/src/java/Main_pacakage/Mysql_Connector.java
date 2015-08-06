
package Main_pacakage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Mysql_Connector {
    private Connection conec;

    public Connection getCon() throws SQLException, ClassNotFoundException {
        String err = null;
        try {
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/java_final";
            Class.forName(driver); 
            
            this.conec = DriverManager.getConnection(url, "root", ""); 
        } catch (ClassNotFoundException e) {
            err = e.toString(); 
        } 
        
        
        return conec;
    }
    public static void main(String args[]) throws SQLException, ClassNotFoundException{
        System.out.println("Test....."+new Mysql_Connector().getCon());
    }
}
