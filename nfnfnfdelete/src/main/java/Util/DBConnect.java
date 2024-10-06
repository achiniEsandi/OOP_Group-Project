package Util;

import java.sql.Connection;

import java.sql.DriverManager;

public class DBConnect {

	//create data base connection
	private static String url ="jdbc:mysql://127.0.0.1:3306/vid_system";
	private static String user = "root";
	private static String pass = "#Bgb54213#";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
			System.out.println("Database connection is not success!!!");
		}
		
		return con;
	}
}
