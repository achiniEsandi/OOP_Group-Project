package Report.Model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReportIssueDAO {
    private Connection connection;

    public ReportIssueDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to add a new report
    public boolean addReport(ReportIssue report) throws SQLException {
        String query = "INSERT INTO reported_issues (video_name, issue_type, status) VALUES (?, ?, 'pending')";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, report.getVideoName());
            statement.setString(2, report.getIssueType());
            return statement.executeUpdate() > 0;
        }
    }

    // Method to retrieve all reports
    public List<ReportIssue> getAllReports() throws SQLException {
        List<ReportIssue> reports = new ArrayList<>();
        String query = "SELECT * FROM reported_issues";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                ReportIssue report = new ReportIssue();
                report.setId(resultSet.getInt("id"));
                report.setVideoName(resultSet.getString("video_name"));
                report.setIssueType(resultSet.getString("issue_type"));
                report.setStatus(resultSet.getString("status"));
                report.setReportDate(resultSet.getString("report_date"));
                reports.add(report);
            }
        }
        return reports;
    }

    // Method to retrieve a report by its ID
    public ReportIssue getReportById(int id) throws SQLException {
        String query = "SELECT * FROM reported_issues WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    ReportIssue report = new ReportIssue();
                    report.setId(resultSet.getInt("id"));
                    report.setVideoName(resultSet.getString("video_name"));
                    report.setIssueType(resultSet.getString("issue_type"));
                    report.setStatus(resultSet.getString("status"));
                    report.setReportDate(resultSet.getString("report_date"));
                    return report;
                }
            }
        }
        return null; // Return null if no report is found with the given ID
    }

    // Method to update the status of a report by its ID
    public boolean updateReportStatus(int id, String status) throws SQLException {
        String query = "UPDATE reported_issues SET status = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, status);
            statement.setInt(2, id);
            return statement.executeUpdate() > 0;
        }
    }

    // Method to delete a report by its ID
    public boolean deleteReport(int id) throws SQLException {
        String query = "DELETE FROM reported_issues WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        }
    }

    // Method to search reports by video name
    public List<ReportIssue> searchReportsByVideoName(String videoName) throws SQLException {
        List<ReportIssue> reports = new ArrayList<>();
        String query = "SELECT * FROM reported_issues WHERE video_name LIKE ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, "%" + videoName + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ReportIssue report = new ReportIssue();
                    report.setId(resultSet.getInt("id"));
                    report.setVideoName(resultSet.getString("video_name"));
                    report.setIssueType(resultSet.getString("issue_type"));
                    report.setStatus(resultSet.getString("status"));
                    report.setReportDate(resultSet.getString("report_date"));
                    reports.add(report);
                }
            }
        }
        return reports;
    }
}
