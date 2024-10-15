package Report.control;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Report.Model.DbUtil;
import Report.Model.ReportIssueDAO;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/DeleteReportServlet")
public class DeleteReportServlet extends HttpServlet {
    private ReportIssueDAO reportIssueDAO;

    @Override
    public void init() throws ServletException {
        // Initialize the ReportIssueDAO with a database connection
        Connection connection = DbUtil.getConnection();
        reportIssueDAO = new ReportIssueDAO(connection);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the report ID from the request
        int reportId = Integer.parseInt(request.getParameter("id"));

        try {
            // Delete the reported issue using the DAO
            reportIssueDAO.deleteReport(reportId);

            // Redirect to the admin dashboard after successful deletion
            response.sendRedirect("admin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}