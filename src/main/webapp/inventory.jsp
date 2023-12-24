<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Inventory Management System</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        h1 {
            margin: 0;
            font-size: 36px;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        form {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            padding: 10px;
            margin-bottom: 10px;
            width: calc(100% - 22px);
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <header>
        <h1>Inventory Management System</h1>
    </header>

    <div class="container">
        <form method="post" action="update">
            <label for="supplierName">Supplier name:</label>
            <input type="text" id="supplierName" name="supplierName" required><br><br>
            <label for="itemName">Item Name:</label>
            <input type="text" id="itemName" name="itemName" required><br><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required><br><br>
            <input type="submit" value="Add/Update">
        </form>
        <hr>

        <h2>Current Inventory</h2>
        <table>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
            </tr>
            <c:forEach var="item" items="${inventory}">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
