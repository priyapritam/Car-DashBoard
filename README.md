# Car Management System 🚗

A feature-rich **web-based application** for managing car details, built using **Java (JSP & Servlets)** and **MySQL**. This project implements full CRUD operations and provides an intuitive interface for adding, viewing, updating, and deleting car records.

---

## 🚀 Features

- **Add Cars**: Input car details like model, brand, color, and price.
- **View Cars**: Display all stored car records dynamically.
- **Update Cars**: Edit existing car details seamlessly.
- **Delete Cars**: Remove unwanted car records with ease.
- **Error Handling**: Ensures robust interactions and database integrity.

---

## 🛠️ Tech Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Java (JSP, Servlets)
- **Database**: MySQL
- **Web Server**: Apache Tomcat

---

## 📂 Folder Structure

Car-DashBoard/
├── src/
│   ├── com.jsp.car/
│   │   ├── AddCarServlet.java
│   │   ├── DisplayCarServlet.java
│   │   ├── FindCarByIdServlet.java
│   │   ├── SaveUpdatedCarServlet.java
│   │   └── DeleteCarByIdServlet.java
├── web/
│   ├── index.html
│   ├── addcar.jsp
│   ├── displaycar.jsp
│   ├── updatecar.jsp
├── sql/
│   └── servlet_cardb.sql (Database schema)
└── README.md

---

## 📦 How to Run

### Prerequisites
1. Java Development Kit (JDK) installed
2. Apache Tomcat server
3. MySQL database
4. IDE (e.g., Eclipse, IntelliJ IDEA)

### Steps
1. Clone the repository:  
   ```bash
   git clone https://github.com/priyapritam/Car-DashBoard.git

2. Import the project into your IDE.
3. Set up the database:
Create a database named servlet_cardb.
Import the servlet_cardb.sql file to create the car table.
4. Update database credentials in the servlets:

conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "yourUsername", "yourPassword");

6. Deploy the project to Apache Tomcat.
7. Start the server and access the app at:
http://localhost:8080/Car-DashBoard

---
## 📚Database Schema
CREATE DATABASE servlet_cardb;
CREATE DATABASE servlet_cardb;

USE servlet_cardb;

CREATE TABLE car (
    car_id INT PRIMARY KEY,
    car_model VARCHAR(50),
    car_brand VARCHAR(50),
    car_color VARCHAR(30),
    car_price INT
);

---

## 🌟 Highlights
* Robust CRUD functionality.
* Real-time database interaction.
* User-friendly interface.
* Designed for scalability and maintainability.

---

## 🤝 Contributions
Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.
