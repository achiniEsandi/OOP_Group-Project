package Studio.Model;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 

public class VideoDBUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// Insert Videos and details
	public static boolean insertVideo(String title, String catogary, String filePath, String fVideo, String disc,
			String formattedDateTime) {
		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO video_upload VALUES (0,'" + title + "','" + catogary + "','" + filePath + "','"
					+ fVideo + "','" + disc + "','" + formattedDateTime + "')";
			int rs = stmt.executeUpdate(sql);

			System.out.println("Insert DBUtil is Work!!!");
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException e) {
			printSQLException(e);
		}

		return isSuccess;
	}

	// select video by id
	public static Video getVideoById(int id) {

		String sqlGetVideoById = "SELECT * FROM video_upload WHERE id= ?";

		try (Connection connection = DBConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sqlGetVideoById)) {

			preparedStatement.setInt(1, id);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {

					String title = resultSet.getString("Title");
					String category = resultSet.getString("Catogary");
					String filePath = resultSet.getString("filePath");
					String videoUrl = resultSet.getString("video_url");
					String description = resultSet.getString("Description");
					String date = resultSet.getString("date");

					System.out.println(" GetVideoById DBUtil is work!!!");

					return new Video(id, title, category, filePath, videoUrl, description, date);
				} else {
					return null;
				}
			}
		} catch (SQLException e) {
			printSQLException(e);
			return null;
		}
	}

	// get all videos
	public static List<Video> getAllVideo() {
		ArrayList<Video> Vid = new ArrayList<>();

		try {

			con = DBConnect.getConnection();// Connection
			stmt = con.createStatement();// Connection c
			String sql = "SELECT * FROM video_upload";
			rs = stmt.executeQuery(sql);// Connection

			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String catogary = rs.getString("catogary");
				String filePath = rs.getString("filePath");
				String video_url = rs.getString("video_url");
				String description = rs.getString("description");
				String date = rs.getString("date");

				Video video = new Video(id, title, catogary, filePath, video_url, description, date);

				Vid.add(video);
				
				System.out.println(id+ title+ catogary+ filePath+ video_url+ description+ date);
				System.out.println("Get all video DBUtil is work!!! ");
			}

		} catch (SQLException e) {
			printSQLException(e);
		}

		return Vid;
	}

	// update video
	public static boolean updateVideo(int id, String title, String catogary, String filePath, String fVideo,
			String disc) {
		String sqlUpdateVideo = "UPDATE video_upload SET title = ?, catogary = ?, filePath = ?, video_url = ?, description = ? WHERE id = ?";

		try (Connection connection = DBConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sqlUpdateVideo)) {

			preparedStatement.setString(1, title);
			preparedStatement.setString(2, catogary);
			preparedStatement.setString(3, filePath);
			preparedStatement.setString(4, fVideo);
			preparedStatement.setString(5, disc);
			preparedStatement.setInt(6, id);

			System.out.println("UpdateVideo DBUtill work!!!");

			int rowsUpdated = preparedStatement.executeUpdate();
			return rowsUpdated > 0;
		} catch (SQLException e) {
			printSQLException(e);
			return false;
		}
	}

	// delete video
	public static boolean deleteVideo(int id) {
		String sqlDeleteVideo = "DELETE FROM video_upload WHERE id = ?";

		try (Connection con = DBConnect.getConnection();
				PreparedStatement stmt2 = con.prepareStatement(sqlDeleteVideo)) {

			// Delete the video
			stmt2.setInt(1, id);
			int rowsAffected = stmt2.executeUpdate();
			System.out.println("Delete DBUtil is work!!! ");
			return rowsAffected > 0;
		} catch (SQLException e) {
			printSQLException(e);
			return false;
		}

	}

	// for exception
	private static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());

				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
