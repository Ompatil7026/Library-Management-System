<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String userIdParam = request.getParameter("user_id");
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        if (userIdParam == null || userIdParam.trim().isEmpty()) {
            throw new Exception("Missing user ID.");
        }

        int userId = Integer.parseInt(userIdParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

        ps = conn.prepareStatement("DELETE FROM users WHERE user_id = ?");
        ps.setInt(1, userId);
        int affectedRows = ps.executeUpdate();

        if (affectedRows > 0) {
            response.sendRedirect("viewUsers.jsp");
        } else {
            out.println("<div class='alert alert-warning'>No user found with ID: " + userId + "</div>");
        }

    } catch (NumberFormatException nfe) {
        out.println("<div class='alert alert-danger'>Invalid user ID format.</div>");
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
