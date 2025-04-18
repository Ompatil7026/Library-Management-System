<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String bookIdParam = request.getParameter("book_id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String isbn = request.getParameter("isbn");
    String yearParam = request.getParameter("publication_year");
    String quantityParam = request.getParameter("quantity");

    boolean hasError = false;

    if (bookIdParam == null || title == null || author == null || isbn == null ||
        yearParam == null || quantityParam == null ||
        title.trim().isEmpty() || author.trim().isEmpty() || isbn.trim().isEmpty()) {
        hasError = true;
        out.println("<div class='alert alert-danger'>Please fill all required fields properly.</div>");
    }

    if (!hasError) {
        try {
            int bookId = Integer.parseInt(bookIdParam);
            int year = Integer.parseInt(yearParam);
            int quantity = Integer.parseInt(quantityParam);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC",
                "root", "Qwerty@12345"
            );

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE books SET title=?, author=?, isbn=?, publication_year=?, quantity=? WHERE book_id=?"
            );
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, isbn);
            ps.setInt(4, year);
            ps.setInt(5, quantity);
            ps.setInt(6, bookId);

            int rows = ps.executeUpdate();
            ps.close();
            conn.close();

            if (rows > 0) {
                response.sendRedirect("viewBooks.jsp");
            } else {
                out.println("<div class='alert alert-warning'>No book updated. Please check the Book ID.</div>");
            }
        } catch (NumberFormatException nfe) {
            out.println("<div class='alert alert-danger'>Invalid numeric value: " + nfe.getMessage() + "</div>");
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Database Error: " + e.getMessage() + "</div>");
        }
    }
%>
