package Payment.Model;

import java.sql.Connection;

import java.sql.DriverManager;


public class DBConnect {
	
	private static String url = "jdbc:mysql://127.0.0.1:3306/vid_system";
	private static String userName = "root";
	private static String password = "#Bgb54213#";
	private static Connection con;

	public static Connection getConnection() {
		
		try {
			//load and register the mysql jdbc driver
			Class.forName("com.mysql.jdbc.Driver");
			
			//connection to the database using DriverManager
			con = DriverManager.getConnection(url, userName, password);
			
		}
		catch (Exception e) {
			System.out.println("Database connection is not success!!!");
		}
		
		return con;
	}
}
	
	


