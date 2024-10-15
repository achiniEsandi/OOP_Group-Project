package Report.Model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/vid_system";
    private static final String USER = "root";
    private static final String PASSWORD = "#Bgb54213#";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database connection error.");
        }
    }
}