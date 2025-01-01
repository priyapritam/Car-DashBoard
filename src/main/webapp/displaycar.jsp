<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Page</title>
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
    max-width: 1000px;
    margin: 50px auto;
    padding: 20px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    animation: slideDown 1s ease-out forwards;
}

@keyframes slideDown {
    from {
        transform: translateY(-30px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

h1 {
    color: #005dff;
    margin-bottom: 20px;
    font-size: 2em;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    background-color: #fff;
}

th, td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    text-align: center;
    background-color: #4E54C8;
    color: #fff;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Center buttons inside table cells */
td {
    text-align: center; /* Centers the content (including buttons) in the table cells */
}

/* Button Styling */
input[type="submit"] {
    background: linear-gradient(90deg, #4E54C8, #8F94FB);
    color: #fff;
    border: none;
    padding: 10px 20px;
    margin: 15px;
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

.update {
    text-decoration: none;
}

.delete {
    text-decoration: none;
}

.update input[type="submit"], .delete input[type="submit"] {
    padding: 5px 10px; /* Smaller padding for reduced button size */
    font-size: 0.8em;  /* Smaller font size */
}

.delete input[type="submit"] {
    background: linear-gradient(90deg, #8B0000, #FF6347); /* Gradient from dark red to light red */
    color: #fff;
    border: none;
    padding: 5px 10px; /* Smaller padding */
    font-size: 0.8em;  /* Smaller font size */
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease; /* Smooth transition */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.delete input[type="submit"]:hover {
    background-color: #FF0000; /* Solid red on hover */
    box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
    transform: scale(1.05); /* Slightly larger size on hover */
}

/* Footer Styles */
footer {
    margin-top: 30px;
    padding: 20px;
    background: linear-gradient(90deg, #4E54C8, #8F94FB);
    color: #fff;
    border-radius: 0 0 10px 10px;
}

footer h2 {
    margin-bottom: 10px;
}

footer ul {
    list-style: none;
    padding: 0;
}

footer li {
    margin: 5px 0;
}

footer a {
    color: #ffdd57;
    text-decoration: none;
}

footer a:hover {
    text-decoration: underline;
}

/* Row Animation */
table tr {
    animation: rowFade 0.5s ease-out forwards;
    opacity: 0;
}

table tr:nth-child(n) {
    animation-delay: calc(0.2s * var(--row-index));
}

@keyframes rowFade {
    from {
        transform: translateY(-20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}
</style>
</head>
<body>
<%
ResultSet rs = (ResultSet) request.getAttribute("resultSet");
%>

<div class="container">
    <h1>Car Details</h1>

    <table>
        <thead>
            <tr>
                <th>Car Id</th>
                <th>Car Model</th>
                <th>Car Brand</th>
                <th>Car Color</th>
                <th>Car Price</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>

        <%
        int rowIndex = 0;
        while(rs.next()) {
        %>
        <tr style="--row-index: <%= rowIndex++ %>;">
            <td><%=rs.getInt("car_id")%></td>
            <td><%=rs.getString("car_model")%></td>
            <td><%=rs.getString("car_brand")%></td>
            <td><%=rs.getString("car_color")%></td>
            <td><%=rs.getInt("car_Price")%></td>
            <td><a class="update" href="find-car-by-id?car_id=<%=rs.getInt(1)%>"><input type="submit" value="UPDATE"></a></td>
            <td><a class="delete" href="delete-car-by-id?car_id=<%=rs.getInt(1)%>"><input type="submit" value="DELETE"></a></td>
        </tr>
        <%
        }
        %>
        </tbody>
    </table>

    <a href="index.html"><input type="submit" value="Home"></a>

    <!-- Author Section -->
    <footer>
        <h2>Author</h2>
        <ul>
            <li><strong>Name:</strong> Priya Pritam Behera</li>
            <li><strong>GitHub:</strong> <a href="https://github.com/priyapritam" target="_blank">https://github.com/priyapritam</a></li>
            <li><strong>LinkedIn:</strong> <a href="https://www.linkedin.com/in/priyapritam" target="_blank">https://www.linkedin.com/in/priyapritam</a></li>
        </ul>
    </footer>
</div>
</body>
</html>
