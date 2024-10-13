package Servlet;

import java.io.File;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.VideoDBUtil;

/**
 * Servlet implementation class updateVideo
 */
@WebServlet("/updateVideo")
@MultipartConfig
public class updateVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		  int id = Integer.parseInt(request.getParameter("id"));
		    try {
		        String title = request.getParameter("title");
		        String category = request.getParameter("catogary");
		        String description = request.getParameter("description");
		        String fVideo = request.getParameter("fVideo");
		        String fptp = File.separator;

		        System.out.println("UpdateVideo servlet is work!!!");
		        
		        boolean success = VideoDBUtil.updateVideo(id, title, category, fptp, fVideo, description);
		        if (success) {
		            response.sendRedirect("studio.jsp");
		            System.out.println("Update successful");
		        } else {
		            System.out.println("Update failed");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

	}

}
