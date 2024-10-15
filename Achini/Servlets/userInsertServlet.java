package com.videolane;

import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userInsert")
public class userInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public userInsertServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPwd = request.getParameter("confirm_password");;
		
		// Check if passwords match
	    if (!password.equals(confirmPwd)) {
	        request.setAttribute("errorMessage", "Passwords do not match!");
	        RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
	        dis2.forward(request, response);
	        return;
	    }
		
	    if (!UserDBUtil.testConnection()) {
	        request.setAttribute("errorMessage", "Database connection failed!");
	        RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
	        dis2.forward(request, response);
	        return;
	    }
	    
		boolean isTrue;
		
		isTrue = UserDBUtil.insertUser(name, email, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request,response);
		}

		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("userInsert.jsp");
			dis2.forward(request,response);
		}
	}

}
