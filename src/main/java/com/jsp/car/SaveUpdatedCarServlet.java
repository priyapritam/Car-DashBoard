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

//Servlet for updated product details by ID
@WebServlet("/save-updated-car")
public class SaveUpdatedCarServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int car_id = Integer.parseInt(req.getParameter("car_id"));
		String car_model = req.getParameter("car_model");
		String car_brand = req.getParameter("car_brand");
		String car_color = req.getParameter("car_color");
		int car_price = Integer.parseInt(req.getParameter("car_price"));

		Connection conn = null;
		
		try {
			// Load JDBC driver and establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "Priyaan#100%");
			
			// Prepare and execute SQL statement for update product data
			PreparedStatement pst = conn.prepareStatement("UPDATE car SET car_model = ?, car_brand = ?, car_color = ?, car_price = ? WHERE car_id = ?");
			pst.setString(1, car_model);
			pst.setString(2, car_brand);
			pst.setString(3, car_color);
			pst.setInt(4, car_price);
			pst.setInt(5, car_id);
			
			pst.executeUpdate();
			
			// Redirect to the display page after successful update data
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
