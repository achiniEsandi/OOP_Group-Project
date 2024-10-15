package Feedback.Model;

import java.sql.Connection;

import java.sql.DriverManager;

public class TestDBConnection {
    public static void main(String[] args) {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

            // Test if the connection is successful
            if (conn != null) {
                System.out.println("Connected to the database successfully!");
            }

            // Close the connection
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

