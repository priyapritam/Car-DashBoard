<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Record Page</title>
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
            animation: zoomIn 1.5s ease forwards;
        }

        @keyframes zoomIn {
            from {
                transform: scale(0.5);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
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
<div class="container">	
	<h1>Enter Car Details</h1>
	<h3>*Please fill all the details.</h3>
	<form action="add-car" method="post">
		<input type="number" placeholder="Enter Car ID" name="carId">
		 <input type="text" placeholder="Enter Car Model" name="carModel">
		 <input type="text" placeholder="Enter Car Brand" name="carBrand">
		 <input type="text" placeholder="Enter Car Color" name="carColor">
		 <input type="number" placeholder="Enter Car Price" name="carPrice">
		 <input type="submit" value="ADD">
	</form>
</div>
</body>
</html>
