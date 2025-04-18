<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String userIdParam = request.getParameter("user_id");
    String bookIdParam = request.getParameter("book_id");

    try {
        int userId = Integer.parseInt(userIdParam);
        int bookId = Integer.parseInt(bookIdParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

        // Check if a request already exists
        PreparedStatement check = conn.prepareStatement("SELECT * FROM requests WHERE user_id = ? AND book_id = ? AND status = 'Pending'");
        check.setInt(1, userId);
        check.setInt(2, bookId);
        ResultSet rs = check.executeQuery();

        if (rs.next()) {
            out.println("<script>alert('You have already requested this book.');window.location='borrowRequest.jsp';</script>");
        } else {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO requests (user_id, book_id, status) VALUES (?, ?, 'Pending')");
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            ps.executeUpdate();
            ps.close();
            out.println("<script>alert('Request submitted successfully.');window.location='borrowRequest.jsp';</script>");
        }

        rs.close();
        check.close();
        conn.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    }
%>
