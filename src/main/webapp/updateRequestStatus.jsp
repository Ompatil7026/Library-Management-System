<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String requestIdParam = request.getParameter("request_id");
    String newStatus = request.getParameter("new_status");

    try {
        int requestId = Integer.parseInt(requestIdParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

        PreparedStatement ps = conn.prepareStatement("UPDATE requests SET status=? WHERE request_id=?");
        ps.setString(1, newStatus);
        ps.setInt(2, requestId);
        ps.executeUpdate();

        ps.close();
        conn.close();

        response.sendRedirect("manageRequests.jsp?update=true");
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    }
%>
