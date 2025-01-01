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

//Servlet for handling product addition
@WebServlet("/add-car")
public class AddCarServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Retrieve product details from the form
		int carId = Integer.parseInt(req.getParameter("carId"));
		String carModel = req.getParameter("carModel");
		String carBrand = req.getParameter("carBrand");
		String carColor = req.getParameter("carColor");
		int carPrice = Integer.parseInt(req.getParameter("carPrice"));
		
		//JDBC LOGIC
		Connection conn = null;
		
		try {
			// Load JDBC driver and establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "Priyaan#100%");
			
			// Prepare and execute SQL statement for inserting product data
			PreparedStatement pst = conn.prepareStatement("INSERT INTO car VALUES(?,?,?,?,?)");
			pst.setInt(1, carId);
			pst.setString(2, carModel);
			pst.setString(3, carBrand);
			pst.setString(4, carColor);
			pst.setInt(5, carPrice);
			
			pst.executeUpdate();
			
			// Redirect to the main page after successful addition
			resp.sendRedirect("index.html");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			// Ensure database connection is closed
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
