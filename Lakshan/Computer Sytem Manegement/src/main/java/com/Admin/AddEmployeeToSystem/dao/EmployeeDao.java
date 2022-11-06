package com.Admin.AddEmployeeToSystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Admin.AddEmployeeToSystem.model.Employee;


public class EmployeeDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/computersytemmanegement";
	private String jdbcUsername = "root";
	private String jdbcPassword = "isu@12357";

	private static final String INSERT_USERS_SQL = "INSERT INTO admin"
			+ "  (first_name,last_name,email,password) VALUES " + " (?, ?, ? ,?);";

	private static final String SELECT_USER_BY_ID = "select admin_id,first_name,last_name,email,password from admin where admin_id =?";
	private static final String SELECT_ALL_USERS = "select * from admin";
	private static final String DELETE_USERS_SQL = "delete from admin where admin_id= ?;";
	private static final String UPDATE_USERS_SQL = "update admin set first_name = ?,last_name=?,email= ?, password =? where admin_id = ?;";

	public EmployeeDao() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertUser(Employee user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getFirst_name());
			preparedStatement.setString(2, user.getLast_name());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPassword());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Employee selectUser(int admin_id) {
		Employee user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, admin_id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String Firstname = rs.getString("first_name");
				String Larstname = rs.getString("last_name");
				String email = rs.getString("email");
				String Password = rs.getString("password");
				user = new Employee(admin_id, Firstname, Larstname, email, Password);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public List<Employee> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Employee> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int admin_id = rs.getInt("admin_id");
				String Firstname = rs.getString("first_name");
				String Larstname = rs.getString("last_name");
				String email = rs.getString("email");
				String Password = rs.getString("password");
				users.add(new Employee(admin_id, Firstname, Larstname, email, Password));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public boolean deleteUser(int admin_id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, admin_id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateUser(Employee user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			System.out.println("updated USer:" + statement);
			statement.setString(1, user.getFirst_name());
			statement.setString(2, user.getLast_name());
			statement.setString(3, user.getEmail());
			statement.setString(4, user.getPassword());
			statement.setInt(5, user.getAdmin_id());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
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
