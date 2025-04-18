<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Book Requests</title>
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body class="container mt-5">
    <h2>📚 Manage Book Requests</h2>
    <table class="table table-bordered mt-4">
        <thead class="table-dark">
            <tr>
                <th>Request ID</th>
                <th>Username</th>
                <th>Book Title</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

                String query = "SELECT r.request_id, u.username, b.title, r.status FROM requests r " +
                               "JOIN users u ON r.user_id = u.user_id " +
                               "JOIN books b ON r.book_id = b.book_id";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int requestId = rs.getInt("request_id");
                    String username = rs.getString("username");
                    String title = rs.getString("title");
                    String status = rs.getString("status");
        %>
            <tr>
                <td><%= requestId %></td>
                <td><%= username %></td>
                <td><%= title %></td>
                <td><%= status %></td>
                <td>
                    <form action="updateRequestStatus.jsp" method="post" style="display:inline-block;">
                        <input type="hidden" name="request_id" value="<%= requestId %>">
                        <select name="new_status" class="form-select d-inline" style="width: auto; display: inline;">
                            <option <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                            <option <%= status.equals("Approved") ? "selected" : "" %>>Approved</option>
                            <option <%= status.equals("Rejected") ? "selected" : "" %>>Rejected</option>
                        </select>
                        <button type="submit" class="btn btn-sm btn-primary">Update</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<tr><td colspan='5' class='text-danger'>Close Error: " + e.getMessage() + "</td></tr>");
                }
            }
        %>
        </tbody>
    </table>
    <a href="librarianDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    
    
<!--     ==========js for status update================= -->
	<%
    String update = request.getParameter("update");
    if ("true".equals(update)) {
%>
    <div class="alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-4 shadow" role="alert" style="z-index: 9999; min-width: 300px;">
        ✅ Status updated successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
    }
%>


</body>
</html>
