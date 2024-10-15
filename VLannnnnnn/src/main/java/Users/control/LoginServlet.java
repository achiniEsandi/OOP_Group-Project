package Users.control;

import Users.Model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Check if the database connection is successful
            if (!UserDBUtil.testConnection()) {
                response.sendRedirect("login.jsp?error=Database connection failed");
                return;
            }

            // Authenticate the user using UserDBUtil
            user loggedInUser = UserDBUtil.authenticateUser(email, password);

            if (loggedInUser != null) {
                // Store the user object in the session
                HttpSession session = request.getSession();
                session.setAttribute("user", loggedInUser);

                // Redirect to the home page or profile page
                response.sendRedirect("videos2.jsp");
            } else {
                // If credentials are invalid
                response.sendRedirect("login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}
