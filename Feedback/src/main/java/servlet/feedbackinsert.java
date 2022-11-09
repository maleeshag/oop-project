package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Feedbackinsert.Feedbackuril;

/**
 * Servlet implementation class feedbackinsert
 */
@WebServlet("/feedbackinsert")
public class feedbackinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String feedbackid=request.getParameter("feedbackid");
		String feedback=request.getParameter("feedback");
		String feedbackrate=request.getParameter("feedbackrate");
		String coustomerID=request.getParameter("coustomerID");
		String coustomerName=request.getParameter("coustomerName");
		
		boolean insert= true;
		
		Feedbackuril.insertFeedback(coustomerID, feedback, feedbackrate);
		
		if(insert==true) {
			RequestDispatcher dis =request.getRequestDispatcher("cehak.jsp");
			dis.forward(request, response);
		}else{
			RequestDispatcher dis =request.getRequestDispatcher("InsertFeedback.jsp");
			dis.forward(request, response);
		}
		
	}

}
