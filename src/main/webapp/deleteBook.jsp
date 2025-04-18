<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String bookIdParam = request.getParameter("book_id");
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        if (bookIdParam == null || bookIdParam.trim().isEmpty()) {
            throw new Exception("Missing book ID.");
        }

        int bookId = Integer.parseInt(bookIdParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", 
            "root", "Qwerty@12345"
        );

        ps = conn.prepareStatement("DELETE FROM books WHERE book_id = ?");
        ps.setInt(1, bookId);
        int affectedRows = ps.executeUpdate();

        if (affectedRows > 0) {
            response.sendRedirect("viewBooks.jsp");
        } else {
            out.println("<div class='alert alert-warning'>No book found with ID: " + bookId + "</div>");
        }

    } catch (NumberFormatException nfe) {
        out.println("<div class='alert alert-danger'>Invalid book ID format.</div>");
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            out.println("<div class='alert alert-danger'>Close Error: " + se.getMessage() + "</div>");
        }
    }
%>
