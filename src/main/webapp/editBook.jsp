<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Try to get book_id from request, else from session
    String bookIdParam = request.getParameter("book_id");
    int bookId = 0;
    boolean bookFound = false;

    String title = "", author = "", isbn = "";
    int year = 0, quantity = 0;

    if (bookIdParam != null && !bookIdParam.trim().isEmpty()) {
        try {
            bookId = Integer.parseInt(bookIdParam);
            session.setAttribute("book_id", bookId); // store in session
        } catch (NumberFormatException e) {
            out.println("<div class='alert alert-danger'>Invalid book ID format.</div>");
        }
    } else if (session.getAttribute("book_id") != null) {
        bookId = (Integer) session.getAttribute("book_id"); // fallback to session
    } else {
        out.println("<div class='alert alert-danger'>Missing book ID.</div>");
    }

    // If bookId is valid, fetch book details
    if (bookId > 0) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM books WHERE book_id = ?");
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                title = rs.getString("title");
                author = rs.getString("author");
                isbn = rs.getString("isbn");
                year = rs.getInt("publication_year");
                quantity = rs.getInt("quantity");
                bookFound = true;
            } else {
                out.println("<div class='alert alert-warning'>No book found with ID: " + bookId + "</div>");
            }

            rs.close();
            ps.close();
            conn.close();

        } catch(Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<% if (bookFound) { %>
    <h2>✏️ Update Book</h2>
    <form action="updateBookAction.jsp" method="post">
        <input type="hidden" name="book_id" value="<%= bookId %>">
        <div class="mb-3">
            <label>Title</label>
            <input type="text" name="title" class="form-control" value="<%= title %>" required>
        </div>
        <div class="mb-3">
            <label>Author</label>
            <input type="text" name="author" class="form-control" value="<%= author %>" required>
        </div>
        <div class="mb-3">
            <label>ISBN</label>
            <input type="text" name="isbn" class="form-control" value="<%= isbn %>" required>
        </div>
        <div class="mb-3">
            <label>Publication Year</label>
            <input type="number" name="publication_year" class="form-control" value="<%= year %>" required>
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" value="<%= quantity %>" required>
        </div>
        <button type="submit" class="btn btn-success">Update</button>
        <a href="viewBooks.jsp" class="btn btn-secondary">Cancel</a>
    </form>
<% } %>

</body>
</html>
