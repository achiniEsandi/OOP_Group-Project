package Report.control;

//import com.example.model.ReportIssue;
 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Report.Model.DbUtil;
import Report.Model.ReportIssue;
import Report.Model.ReportIssueDAO;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/reportIssue")
public class ReportIssueServlet extends HttpServlet {
    private ReportIssueDAO reportIssueDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DbUtil.getConnection();
        reportIssueDAO = new ReportIssueDAO(connection);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoName = request.getParameter("video_name");
        String issueType = request.getParameter("issue_type");

        ReportIssue report = new ReportIssue();
        report.setVideoName(videoName);
        report.setIssueType(issueType);

        try {
            reportIssueDAO.addReport(report);
            response.sendRedirect("studio.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ReportIssue> reports = reportIssueDAO.getAllReports();
            request.setAttribute("reports", reports);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reportId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            reportIssueDAO.updateReportStatus(reportId, status);
            response.getWriter().write("Update successful");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error in updating");
        }
    }
}