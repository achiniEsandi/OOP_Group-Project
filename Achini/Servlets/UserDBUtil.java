package com.videolane;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UserDBUtil {
	public static List<user> validate(String userName, String pwd){
		
		ArrayList<user> users = new ArrayList<>();
		
		//create database connection
		String url = "jdbc:mysql://localhost:3306/videolane";
		String user = "root";
		String password = "Pajerov78";
		
		
		
		 Connection cons = null;
	     PreparedStatement stmts = null;
	     ResultSet res = null; 
		
		//validate
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");

			
			Connection con = DriverManager.getConnection(url,user,password);
			Statement stmt = con.createStatement();
			 	
			String sql = "SELECT * FROM users where name = '"+userName+"' and  password='"+pwd+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String Userpassword = rs.getString(4);
				//String confirmPwd = rs.getString(5);
				
				user u = new user(id,name,email,Userpassword);
				users.add(u);
				
				
			}
			
		} 
		
		catch(Exception e){
			e.printStackTrace();
		}
		
		finally {
			try {
				if (res != null) res.close();
                if (stmts != null) stmts.close();
                if (cons != null) cons.close();
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return users;
	
	}
	
	public static boolean testConnection() {
	    String url = "jdbc:mysql://localhost:3306/videolane";
	    String user = "root";
	    String password = "Pajerov78";

	    try {
	        // Load the JDBC driver
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        System.out.println("Driver loaded successfully."); // Confirm driver loading

	        try (Connection con = DriverManager.getConnection(url, user, password)) {
	            return true; // Connection successful
	        }
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        System.out.println("Failed to load the driver."); // Driver loading failed
	        return false; // Connection failed
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false; // Connection failed
	    }
	}

	
	public static boolean insertUser(String name,String email, String password) {
		
		boolean isSuccess = false;
		
		//create db connection
		String url = "jdbc:mysql://localhost:3306/videolane";
		String user = "root";
		String pwd = "Pajerov78";
		
		
		
		try (Connection con = DriverManager.getConnection(url, user, pwd)){
			
			String sql = "INSERT INTO users (name, email, password, confirm_password) VALUES (?, ?, ?, ?)";
			/*Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection cons = DriverManager.getConnection(url,user,password);
			Statement stmts = con.createStatement();
			
			//String sql = "insert into users values(0,'"+name+"','"+email+"','"+password+"')";*/
			
			try(PreparedStatement pstmt = con.prepareStatement(sql)){
				 pstmt.setString(1, name);
			     pstmt.setString(2, email);
			     pstmt.setString(3, password);
			     pstmt.setString(4, password); // confirm_password can be the same as password
			     
			     int rowsAffected = pstmt.executeUpdate();

		         isSuccess = rowsAffected > 0;

			}
			
			/*
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else {
				isSuccess = false;
			}*/
		        
		  
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	
		
		return isSuccess;
	}
	
	
	public static user getUserById(int userId) {
	    user user = null;
	    
	    // Database connection parameters
	    String url = "jdbc:mysql://localhost:3306/videolane";
	    String userName = "root";
	    String password = "Pajerov78";

	    try (Connection con = DriverManager.getConnection(url, userName, password)) {
	        // SQL query to get user details by ID
	        String sql = "SELECT * FROM users WHERE id = ?";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, userId);

	        ResultSet rs = pstmt.executeQuery();
	        
	        // If user is found
	        if (rs.next()) {
	            int id = rs.getInt("id");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String pwd = rs.getString("password");

	            // Create a new user object and populate it with DB values
	            user = new user(id, name, email, pwd);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return user;
	}
	
	public static boolean updateUser(int userId, String name, String email, String password) {
	    boolean isSuccess = false;

	    String url = "jdbc:mysql://localhost:3306/videolane";
	    String user = "root";
	    String pwd = "Pajerov78";

	    try (Connection con = DriverManager.getConnection(url, user, pwd)) {
	        String sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE id = ?";
	        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	            pstmt.setString(1, name);
	            pstmt.setString(2, email);
	            pstmt.setString(3, password);
	            pstmt.setInt(4, userId);

	            int rowsAffected = pstmt.executeUpdate();
	            isSuccess = rowsAffected > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	// Method to authenticate user
    public static user authenticateUser(String email, String password) {
        user user = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password); // Ideally, use hashed password for comparison
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new user();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                // Set other user fields as needed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
	
    
 // Method to update user details
    public static boolean updateUser(int userId, String firstName, String lastName, String age, String gender,
                                      String phone, String address) {
        boolean isUpdated = false;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE users SET firstName = ?, lastName = ?, age = ?, gender = ?, phone = ?, " +
                         "address = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, age);
            stmt.setString(4, gender);
            stmt.setString(5, phone);
            stmt.setString(6, address);
            stmt.setInt(7, userId);

            int rows = stmt.executeUpdate();
            isUpdated = (rows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
	
	
	

	
}
