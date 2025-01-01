package com.jsp.car;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Servlet for handling product delete operation
@WebServlet("/delete-car-by-id")
public class DeleteCarByIdServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Retrieve product ID from the form
		int car_id = Integer.parseInt(req.getParameter("car_id"));

		Connection conn = null;
		
		try {
			// Load JDBC driver and establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "putYourOwnPassword");
			
			// Prepare and execute SQL statement for deleting product data
			PreparedStatement pst = conn.prepareStatement("DELETE FROM car WHERE car_id = ?");

			pst.setInt(1, car_id);
			
			pst.executeUpdate();
			
			// Redirect to the display page after successful delete
			resp.sendRedirect("displaycar");
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
