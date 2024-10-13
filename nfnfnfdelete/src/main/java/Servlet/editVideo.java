package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.VideoDBUtil;
import control.Video;

/**
 * Servlet implementation class editVideo
 */
@WebServlet("/editVideo")
public class editVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		
		Video existingVideo;
		try {
			existingVideo = VideoDBUtil.getVideoById(id);
		    RequestDispatcher dis = request.getRequestDispatcher("videoUpload.jsp");
		    request.setAttribute("videosX", existingVideo);
	        dis.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

	

}
