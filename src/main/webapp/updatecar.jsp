<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Update Page</title>
<style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        /* Center Content */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: zoomIn 1s ease-out; /* Adding the zoom-in animation */
        }

        /* Zoom In Animation */
        @keyframes zoomIn {
            from {
                transform: scale(0.5); /* Start smaller */
                opacity: 0; /* Make it invisible initially */
            }
            to {
                transform: scale(1); /* End at normal size */
                opacity: 1; /* Fully visible at the end */
            }
        }

        h1 {
            color: #005dff;
            margin-bottom: 10px;
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #ff0000;
            font-weight: normal;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="number"], input[type="text"] {
            width: 70%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"] {
            background: linear-gradient(90deg, #4E54C8, #8F94FB);
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin: 20px 0;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<%
ResultSet rs = (ResultSet) request.getAttribute("resultSet");
rs.next();
%>
<div class="container">    
    <h1>Update Car Details</h1>
    <h3>*The ID field cannot be changed.</h3>
    <form action="save-updated-car" method="post">
        <input type="number" value="<%=rs.getInt("car_id")%>" name="car_id" readonly="readonly">
        <input type="text" value="<%=rs.getString("car_model")%>" name="car_model">
        <input type="text" value="<%=rs.getString("car_brand")%>" name="car_brand">
        <input type="text" value="<%=rs.getString("car_color")%>" name="car_color">
        <input type="number" value="<%=rs.getInt("car_Price")%>" name="car_price">
        <input type="submit" value="UPDATE">
    </form>
</div>
</body>
</html>
