package Payment.Model;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
	
	private static boolean isSuccess; // boolean variable to track if payment successful
	private static Connection con = null; //DB connection object
	private static Statement stmt = null; // sql statement object
	private static ResultSet rs = null; // resultset object to store query results
    

	
	//method to validate user based on name and email
	public static  List<User> validate(String cardholdername, String email) {
		
           ArrayList<User> cus = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//sql query to fetch details with matching name and email
			String sql = "select * from payment where cardholdername='"+cardholdername+"' and email='"+email+"'";
			rs = stmt.executeQuery(sql);
			
			//create object and add to the list
			if (rs.next()) {
				int id = rs.getInt(1);
				String cardHolderName1 = rs.getString(2);
				String email1 = rs.getString(3);
				String cardNumber = rs.getString(4);
				String expireDate = rs.getString(5);
				String CVVcode = rs.getString(6);
				String Amount = rs.getString(7);
				
				User c = new User(id,cardHolderName1,email1,cardNumber ,expireDate,CVVcode,Amount);
				cus.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return cus;
	}
	
	
    //method to insert user details into the DB
    public static boolean insertcustomer(String cardHolderName1, String email1 , String cardNumber,String expireDate ,String CVVcode,String Amount) {
    	
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//sql query to insert user details
    	    String sql = "insert into payment values (0,'"+cardHolderName1+"','"+email1 +"','"+cardNumber+"','"+expireDate +"','"+CVVcode+"','"+Amount+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
    
    //method to update user details in DB
    public static boolean updatecustomer(String id, String cardHolderName1, String email1, String cardNumber,String expireDate,String CVVcode,String Amount ) {
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//sql query to update user details based on id
    		String sql = "update payment set cardholdername='"+cardHolderName1+"',email='"+email1+"',cardnumber='"+cardNumber+"',expiredate='"+expireDate+"',cvvcode='"+CVVcode+"',amount='"+Amount+"' "
    				+ "where id='"+id+"'";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
    
    //method to get details by id
    public static List<User> getCustomerDetails(String Id) {
    	
    	//convert string id into integer
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<User> cus = new ArrayList<>();
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//sql query to select details based on id
    		String sql = "select * from payment where id='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		//loop through the result set and add each user to the list
    		while(rs.next()) {
    			int id = rs.getInt(1);
    			String cardHolderName1 = rs.getString(2);
				String email1 = rs.getString(3);
				String cardNumber = rs.getString(4);
				String expireDate = rs.getString(5);
				String CVVcode = rs.getString(6);
				String Amount = rs.getString(7);
    			
    			User c = new User(id,cardHolderName1,email1,cardNumber,expireDate,CVVcode,Amount);
    			cus.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return cus;	
    }
    
    //method to delete a user record from DB by id
    public static boolean deleteCustomer(String id) {
    	
    	//convert string id into integer
    	int convId = Integer.parseInt(id);
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//sql query to delete user record with given id
    		String sql = "delete from payment where id='"+convId+"'";
    		int r = stmt.executeUpdate(sql);
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }


}



