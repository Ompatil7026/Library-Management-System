<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Browse Books</title>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2>📚 Browse Books</h2>

    <table class="table table-bordered table-hover mt-4">
        <thead class="table-dark">
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Publication Year</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM books");

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getString("isbn") %></td>
                <td><%= rs.getInt("publication_year") %></td>
                <td><%= rs.getInt("quantity") %></td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="6" class="text-danger">Error: <%= e.getMessage() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="userDashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
</body>
</html>
