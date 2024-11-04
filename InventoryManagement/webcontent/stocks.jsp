<%@ page import="java.util.List" %>
<%@ page import="StockItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Stocks - Inventory Management System</title>
    <link rel="stylesheet" type="text/css" href="stocks.css"> <!-- Link to the CSS file -->
</head>
<body>
    <h1>Available Stocks</h1>

    <!-- Links to Suppliers and Transactions pages -->
    <div class="links">
        <a href="suppliers.jsp">View Suppliers</a>
        <a href="transactions.jsp">View Transactions</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
        <%
            List<StockItem> stockList = (List<StockItem>) request.getAttribute("stockList");
            for (StockItem item : stockList) {
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getPrice() %></td>
        </tr>
        <% } %>
        <%
            String loggedInUser = (String) session.getAttribute("username");
            if (loggedInUser == null) {
                response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
            }
        %>
    </table>
</body>
</html>