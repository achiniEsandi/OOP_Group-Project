package Report.control;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Report.Model.DbUtil;
import Report.Model.ReportIssueDAO;

@WebServlet("/UpdateReportStatusServlet")
public class UpdateReportStatusServlet extends HttpServlet {
    private ReportIssueDAO reportIssueDAO;

    @Override
    public void init() throws ServletException {
        // Initialize the ReportIssueDAO with a database connection
        Connection connection = DbUtil.getConnection();
        reportIssueDAO = new ReportIssueDAO(connection);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reportId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            // Update the status of the reported issue
            reportIssueDAO.updateReportStatus(reportId, status);
            response.sendRedirect("admin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}