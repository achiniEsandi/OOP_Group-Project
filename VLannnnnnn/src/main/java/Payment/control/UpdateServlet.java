package Payment.control;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Payment.Model.User;
import Payment.Model.UserDBUtil;

//handles updating customer details related to payment
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//retrieving data from the request object
		String id = request.getParameter("id");
		String cardHolderName1 = request.getParameter("cardholdername");
		String email1 = request.getParameter("email");
		String cardNumber = request.getParameter("cardnumber");
		String expireDate = request.getParameter("expiredate");
		String CVVcode= request.getParameter("cvvcode");
		String Amount = request.getParameter("amount");
		
		boolean isTrue;
		//update customer data in database using UserDBUtill
		isTrue = UserDBUtil.updatecustomer(id, cardHolderName1, email1, cardNumber, expireDate, CVVcode, Amount);
		
		if(isTrue == true) {
			//fetch the updates customer details using provided user id
			List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
			request.setAttribute("cusDetails",cusDetails);
		    //display the updates information in Details.jsp page
			RequestDispatcher dis = request.getRequestDispatcher("Details.jsp");
			dis.forward(request, response);
		}
		else {
			List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
			request.setAttribute("cusDetails",cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("Details.jsp");
			dis.forward(request, response);
		}
	}



		
	}


