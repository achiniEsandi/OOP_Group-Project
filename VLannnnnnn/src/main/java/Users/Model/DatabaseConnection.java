package Users.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/vid_system"; // Change to your database URL
    private static final String USER = "root"; 
    private static final String PASSWORD = "#Bgb54213#"; 

    // Method to establish a connection to the database
    public static Connection getConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
        return connection;
    }
    
    public static void main(String[] args) {
        try {
            Connection connection = getConnection();
            if (connection != null) {
                System.out.println("Connection established successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
