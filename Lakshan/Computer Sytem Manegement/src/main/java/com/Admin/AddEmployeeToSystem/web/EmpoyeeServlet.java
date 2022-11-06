package com.Admin.AddEmployeeToSystem.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Admin.AddEmployeeToSystem.dao.EmployeeDao;
import com.Admin.AddEmployeeToSystem.model.Employee;



/**
 * Servlet implementation class EmpoyeeServlet
 */
@WebServlet("/")
public class EmpoyeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDao employeeDao;
	
	public void init() {
		employeeDao = new EmployeeDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertUser(request, response);
				break;
			case "/delete":
				deleteUser(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateUser(request, response);
				break;
			default:
				listUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Employee> listUser = employeeDao.selectAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Employee-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Employee-Add.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int admin_id = Integer.parseInt(request.getParameter("admin_id"));
		Employee existingUser = employeeDao.selectUser(admin_id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Employee-Add.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String Firstname = request.getParameter("first_name");
		String Larstname = request.getParameter("last_name");
		String email = request.getParameter("email");
		String Password = request.getParameter("password");
		Employee newUser = new Employee(Firstname,Larstname, email, Password);
		employeeDao.insertUser(newUser);
		response.sendRedirect("list");
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int admin_id = Integer.parseInt(request.getParameter("admin_id"));
		String Firstname = request.getParameter("first_name");
		String Larstname = request.getParameter("last_name");
		String email = request.getParameter("email");
		String Password = request.getParameter("password");
		

		Employee book = new Employee(admin_id, Firstname,Larstname, email, Password);
		employeeDao.updateUser(book);
		response.sendRedirect("list");
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int admin_id = Integer.parseInt(request.getParameter("admin_id"));
		employeeDao.deleteUser(admin_id);
		response.sendRedirect("list");

	}
}
