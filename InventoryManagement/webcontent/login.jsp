<%@ page contentType="text/html";charset="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Inventory Management System</title>
    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        
        <form action="login" method="post">
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        
        <!-- Display error message if login fails -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="error-message"><%= errorMessage %></p>
        <%
            }
        %>
    </div>
</body>
</html>