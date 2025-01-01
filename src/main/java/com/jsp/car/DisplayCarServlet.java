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

//Servlet for displaying product details
@WebServlet("/displaycar")
public class DisplayCarServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn = null;
		try {
			// Load JDBC driver and establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "Priyaan#100%");
			
			// Prepare and execute SQL statement for select all product data
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM car");
			ResultSet rs = pst.executeQuery();
			
			req.setAttribute("resultSet", rs);
			
			// Redirect to the display page after successful fetching data
			RequestDispatcher rd = req.getRequestDispatcher("displaycar.jsp");
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
