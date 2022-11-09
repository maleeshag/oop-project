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
 * Servlet implementation class DeleteFeedbackservlet
 */
@WebServlet("/DeleteFeedbackservlet")
public class DeleteFeedbackservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String feedbackid = request.getParameter("feedbackid");
		String coustomerID = request.getParameter("coustomerID");
		String feedback = request.getParameter("feedback");
		String feedbackrate = request.getParameter("feedbackrate");
		
		
boolean isTrue = false;
		
		isTrue = Feedbackuril.deletefeedback(feedbackid, coustomerID, feedback, feedbackrate);
		
		if(isTrue == true) {			
					
					showfeedbackservlet n1 =new showfeedbackservlet();
					
					n1.doPost(request, response);
					
		
					
				}
				else {
					
		            showfeedbackservlet n1 =new showfeedbackservlet();			
					n1.doPost(request, response);
				}
	}
}
