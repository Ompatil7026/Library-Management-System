<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Check login
    Integer userId = (Integer) session.getAttribute("user_id");
    String username = (String) session.getAttribute("username");

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%-- <%@ page import="java.sql.*" %> --%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Libray Management System</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
  
  <style>
    
    
</style>
</head>

<body class="index-page">

<!-- Header section -->
	  <header id="header" class="header d-flex align-items-center fixed-top">
	    <div class="container-fluid position-relative d-flex align-items-center justify-content-between">
	
	      <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
	        <!-- Uncomment the line below if you also wish to use an image logo -->
	        <!-- <img src="assets/img/logo.png" alt=""> -->
	        <h1 class="sitename">Library Management System</h1><span>.</span>
	      </a>
	
	      <nav id="navmenu" class="navmenu">
	
	        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
	      </nav>
	
	    </div>
	  </header>
  
  
  <main class="main">
  

    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">

      <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in">

<!-- =======mainnnnnn=========== -->

      <div class="container testing-toall">
<!--       <h2>User Login</h2> -->

		
		<h2 class="mb-4">📖 Borrow Book</h2>
    <p>Welcome, <strong><%= username %></strong>! Choose a book to request.</p>

    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

            String sql = "SELECT * FROM books WHERE quantity > 0";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
    %>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Year</th>
                <th>Available</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            boolean hasBooks = false;
            while (rs.next()) {
                hasBooks = true;
        %>
            <tr>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getInt("publication_year") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td>
                    <form action="borrowRequestAction.jsp" method="post" style="margin:0;">
                        <input type="hidden" name="user_id" value="<%= userId %>">
                        <input type="hidden" name="book_id" value="<%= rs.getInt("book_id") %>">
                        <button type="submit" class="btn btn-sm btn-success">Request</button>
                    </form>
                </td>
            </tr>
        <%
            }

            if (!hasBooks) {
        %>
            <tr>
                <td colspan="6" class="text-center">No books available for request.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <%
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    %>

    <a href="userDashboard.jsp" class="btn btn-primary mt-3">Back to Dashboard</a>     
          
          
          
          
        </div>
     
    </section><!-- /Hero Section -->



















<!-- Footer -->
  </main>

  <footer id="footer" class="footer position-relative light-background">

<!--     <div class="container footer-top"> -->
<!--       <div class="row gy-4"> -->
<!--         <div class="col-lg-5 col-md-12 footer-about"> -->
<!--           <a href="index.html" class="logo d-flex align-items-center"> -->
<!--             <span class="sitename">Library Management System</span> -->
<!--           </a> -->
<!--           <p>Library Management System â Your Gateway to Knowledge! Effortlessly explore, borrow, and manage books with our user-friendly platform. Stay organized, discover new reads, and enhance your learning experience with just a click!</p> -->
<!--           <div class="social-links d-flex mt-4"> -->
<!--             <a href=""><i class="bi bi-twitter-x"></i></a> -->
<!--             <a href=""><i class="bi bi-facebook"></i></a> -->
<!--             <a href=""><i class="bi bi-instagram"></i></a> -->
<!--             <a href=""><i class="bi bi-linkedin"></i></a> -->
<!--           </div> -->
<!--         </div> -->

<!--         <div class="col-lg-2 col-6 footer-links"> -->
<!--           <h4>Useful Links</h4> -->
<!--           <ul> -->
<!--             <li><a href="#">Home</a></li> -->
<!--             <li><a href="#">About us</a></li> -->
<!--             <li><a href="#">Services</a></li> -->
<!--             <li><a href="#">Terms of service</a></li> -->
<!--             <li><a href="#">Privacy policy</a></li> -->
<!--           </ul> -->
<!--         </div> -->

<!--         <div class="col-lg-2 col-6 footer-links"> -->
<!--           <h4>Our Services</h4> -->
<!--           <ul> -->
<!--             <li><a href="#">Web Design</a></li> -->
<!--             <li><a href="#">Web Development</a></li> -->
<!--             <li><a href="#">Product Management</a></li> -->
<!--             <li><a href="#">Marketing</a></li> -->
<!--             <li><a href="#">Graphic Design</a></li> -->
<!--           </ul> -->
<!--         </div> -->

<!--         <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start"> -->
<!--           <h4>Contact Us</h4> -->
<!--           <p>A108 Adam Street</p> -->
<!--           <p>New York, NY 535022</p> -->
<!--           <p>United States</p> -->
<!--           <p class="mt-4"><strong>Phone:</strong> <span>+1 5589 55488 55</span></p> -->
<!--           <p><strong>Email:</strong> <span>info@example.com</span></p> -->
<!--         </div> -->

<!--       </div> -->
<!--     </div> -->

<!--     <div class="container copyright text-center mt-4"> -->
<!--       <p>Â© <span>Copyright</span> <strong class="sitename">Append</strong> <span>All Rights Reserved</span></p> -->
<!--       <div class="credits"> -->
<!--         All the links in the footer should remain intact. -->
<!--         You can delete the links only if you've purchased the pro version. -->
<!--         Licensing information: https://bootstrapmade.com/license/ -->
<!--         Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
<!--         Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
<!--       </div> -->
<!--     </div> -->


<!-- ====footer section===== -->

		<div class="footer copyright text-center mt-4">
		      <p>© <span>Copyright</span> <strong class="sitename">Append</strong> <span>All Rights Reserved</span></p>
		      <div class="credits">
		        All the links in the footer should remain intact.
		        You can delete the links only if you've purchased the pro version.
		        Licensing information: https://bootstrapmade.com/license/
		        Purchase the pro version with working PHP/AJAX contact form: [buy-url]
		        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		      </div>
		    </div>
		    
  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>