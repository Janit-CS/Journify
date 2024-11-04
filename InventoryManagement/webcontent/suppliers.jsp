<%@ page import="java.util.List" %>
<%@ page import="Supplier" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Suppliers - Inventory Management System</title>
    <link rel="stylesheet" type="text/css" href="suppliers_transactions.css"> <!-- Link to the CSS file -->
</head>
<body>
    <h1>Suppliers</h1>

    <!-- Links to Stocks and Transactions pages -->
    <div class="links">
        <a href="stocks.jsp">View Stocks</a>
        <a href="transactions.jsp">View Transactions</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact Person</th>
            <th>Phone</th>
            <th>Email</th>
        </tr>
        <%
            List<Supplier> supplierList = (List<Supplier>) request.getAttribute("supplierList");
            for (Supplier supplier : supplierList) {
        %>
        <tr>
            <td><%= supplier.getId() %></td>
            <td><%= supplier.getName() %></td>
            <td><%= supplier.getContactPerson() %></td>
            <td><%= supplier.getPhone() %></td>
            <td><%= supplier.getEmail() %></td>
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