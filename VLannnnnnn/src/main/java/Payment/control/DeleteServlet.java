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


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//handles the post request when the form is submitted to delete a customer
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the user id from the form
		String id = request.getParameter("id");
		boolean isTrue;
		//call the method to delete a customer
		isTrue = UserDBUtil.deleteCustomer(id);
		
		if (isTrue == true) {
			//forward the request to insert.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("viedos2.jsp");
			dispatcher.forward(request, response);
			
			

		}
		else {
			
			List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
			request.setAttribute("cusDetails", cusDetails);
			//forward to details.jsp 
			RequestDispatcher dispatcher = request.getRequestDispatcher("Details.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}



	}


