package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Feedbackinsert.Feedback;
import Feedbackinsert.Feedbackuril;

/**
 * Servlet implementation class showfeedbackservlet
 */
@WebServlet("/showfeedbackservlet")
public class showfeedbackservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String custmerID = request.getParameter("cusid");
		//String feedbackId = request.getParameter("feedbackID");
		
		try {
		List<Feedback> cusDetails = Feedbackuril.getFeedback();
		request.setAttribute("feedbackDetails", cusDetails);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("servalte ek wrdi bn ");
		}
		RequestDispatcher dis = request.getRequestDispatcher("Feedback.jsp");
		dis.forward(request, response);
	}

}
