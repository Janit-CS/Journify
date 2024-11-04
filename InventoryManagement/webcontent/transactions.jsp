<%@ page import="java.util.List" %>
<%@ page import="Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transactions - Inventory Management System</title>
    <link rel="stylesheet" type="text/css" href="suppliers_transactions.css"> <!-- Link to the CSS file -->
</head>
<body>
    <h1>Transactions</h1>

    <!-- Links to Stocks and Suppliers pages -->
    <div class="links">
        <a href="stocks.jsp">View Stocks</a>
        <a href="suppliers.jsp">View Suppliers</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Stock Name</th>
            <th>Supplier Name</th>
            <th>Quantity</th>
            <th>Transaction Date</th>
        </tr>
        <%
            List<Transaction> transactionList = (List<Transaction>) request.getAttribute("transactionList");
            for (Transaction transaction : transactionList) {
        %>
        <tr>
            <td><%= transaction.getId() %></td>
            <td><%= transaction.getStockName() %></td>
            <td><%= transaction.getSupplierName() %></td>
            <td><%= transaction.getQuantity() %></td>
            <td><%= transaction.getTransactionDate() %></td>
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