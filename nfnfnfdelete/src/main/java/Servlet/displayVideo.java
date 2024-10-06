package Servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Video;
import Util.VideoDBUtil;

/**
 * Servlet implementation class VideoAllServlet
 */
@WebServlet("/displayVideo")
@MultipartConfig
public class displayVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Video> videosX = null;

		try {
			videosX = VideoDBUtil.getAllVideo();
			System.out.println("Number of videos retrieved: " + videosX.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("Display servlet is work!!! ");
		// Pass
		request.setAttribute("videosX", videosX);
		request.getRequestDispatcher("studio.jsp").forward(request, response);

		response.sendRedirect(request.getContextPath() + "/retrieveVideoServlet");
		System.out.println("Forwarding to videoUpload.jsp.");

		doGet(request, response);
	}

}
