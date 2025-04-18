<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - Library Management System</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  
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

		<!--===form========= -->

		
		<h2>📚 Book List</h2>

<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Author</th><th>ISBN</th><th>Year</th><th>Qty</th><th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC", "root", "Qwerty@12345");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM books");

            while(rs.next()) {
    %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getString("isbn") %></td>
            <td><%= rs.getInt("publication_year") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>
                <a href="editBook.jsp?book_id=<%= rs.getInt("book_id") %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="deleteBook.jsp?book_id=<%= rs.getInt("book_id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this book?')">Delete</a>
            </td>
        </tr>
    <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch(Exception e) {
            out.println("<tr><td colspan='7'><div class='alert alert-danger'>Error: " + e.getMessage() + "</div></td></tr>");
        }
    %>
    </tbody>
</table>
    
    
    
    
      
      
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
<!--           <p>Library Management System – Your Gateway to Knowledge! Effortlessly explore, borrow, and manage books with our user-friendly platform. Stay organized, discover new reads, and enhance your learning experience with just a click!</p> -->
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
<!--       <p>© <span>Copyright</span> <strong class="sitename">Append</strong> <span>All Rights Reserved</span></p> -->
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