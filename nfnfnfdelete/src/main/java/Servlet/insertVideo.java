package Servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Util.VideoDBUtil;

/**
 * Servlet implementation class insertVideo
 */
@WebServlet("/insertVideo")
@MultipartConfig
public class insertVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// private static final String UPLOAD_DIR = "uploads";
	/**
	 * @see HttpServlet#HttpServlet()
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// newfile path
		System.out.println("in do post method of add image servlate.");
		Part file = request.getPart("fVideo");
		String imageFileName = file.getSubmittedFileName();
		System.out.println("file name" + imageFileName);
		// String uploadPath =
		// "C:/Users/ravin/eclipse-workspace/nfnfnfdelete/src/main/webapp/UploadVideo/"+imageFileName;
		String uploadPath = "C:/Users/ravin/eclipse-workspace/nfnfnfdelete/src/main/webapp/" + imageFileName;

		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// TODO Auto-generated method stub

		// Retrieve other form data
		String title = request.getParameter("title");
		String category = request.getParameter("catogary");
		String description = request.getParameter("description");
		String fVideo = request.getParameter("fVideo");
		// String videoPath = UPLOAD_DIR + File.separator + fileName;

		// System.out.println("MIME Type: " + filePart.getContentType());
		System.out.println("fVideo fVideo: " + fVideo);
		System.out.println("uploadPath uploadPath: " + uploadPath);

		// new
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = currentDateTime.format(formatter);

		// Save video details to database
		boolean isTrue = VideoDBUtil.insertVideo(title, category, imageFileName, fVideo, description,
				formattedDateTime);

		if (isTrue) {
			RequestDispatcher dis = request.getRequestDispatcher("studio.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsucess.jsp");
			dis2.forward(request, response);
		}
	}

}
