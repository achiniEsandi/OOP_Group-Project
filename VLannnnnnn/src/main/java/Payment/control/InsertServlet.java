package Payment.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Payment.Model.UserDBUtil;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//handle the post request
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//retrieve data from the request using parameter names 
		String cardHolderName1 = request.getParameter("cardholder");
		String email1 = request.getParameter("email");
		String cardNumber = request.getParameter("cardnumber");
		String expireDate = request.getParameter("expiredate");
		String CVVcode= request.getParameter("cvv");
		String Amount = request.getParameter("amount");
		
		//set the retrieved values as attributes
		request.setAttribute("name", cardHolderName1);
		request.setAttribute("email", email1);
		request.setAttribute("phone", cardNumber);
		request.setAttribute("section", expireDate);
		request.setAttribute("method", CVVcode);
		request.setAttribute("amount", Amount);
		
		
		boolean isTrue;
		//insert user data into database
		isTrue = UserDBUtil.insertcustomer(cardHolderName1, email1, cardNumber, expireDate, CVVcode, Amount);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("Search.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}




	
	}


