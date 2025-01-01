package com.jsp.car;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Servlet for fetching product details by ID
@WebServlet("/find-car-by-id")
public class FindCarByIdServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int car_id = Integer.parseInt(req.getParameter("car_id"));
		Connection conn = null;
		
		try {
			// Load JDBC driver and establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "Priyaan#100%");
			
			// Prepare and execute SQL statement for fetching product details by ID
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM car WHERE car_id = ?");
			pst.setInt(1, car_id);
			
			ResultSet rs = pst.executeQuery();
			
			req.setAttribute("resultSet", rs);
			
			// Redirect to the update car page after successful fetching product details by ID
			RequestDispatcher rd = req.getRequestDispatcher("updatecar.jsp");
			rd.forward(req, resp);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			// Ensure database connection is closed
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
