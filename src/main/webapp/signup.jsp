<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Register - Library Management System</title>

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
  
  <style>
    body {
        font-family: 'Open Sans', sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        max-width: 500px;
        margin-top: 100px;
        background: rgba(0, 0, 0, 0.3); /* Dark semi-transparent */
        color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }
    .hero h2 {
	    margin-bottom: 20px;
	    font-size: 44px;
	    font-weight: 700;
	}
    h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    .form-control {
        border-radius: 5px;
    }
    button {
        background: var(--accent-color);
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        width: 40%;
        margin-left: 120px;
    }
    button:hover {
        background: var(--accent-color);
    }
    .login-link {
        text-align: center;
        margin-top: 15px;
    }
  </style>
</head>

<body class="index-page">
<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid position-relative d-flex align-items-center justify-content-between">
      <a href="index.jsp" class="logo d-flex align-items-center me-auto me-xl-0">
        <h1 class="sitename">Library Management System</h1><span>.</span>
      </a>
      <nav id="navmenu" class="navmenu">
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
    </div>
</header>

<main class="main">
  <section id="hero" class="hero section dark-background">
    <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in">
    <div class="container testing-toall">
      <h2>User Registration</h2>
      <form action="RegisterServlet" method="post">
          <div class="mb-3">
              <label class="form-label">Username</label>
              <input type="text" name="username" class="form-control" required>
          </div>
          <div class="mb-3">
              <label class="form-label">Email</label>
              <input type="email" name="email" class="form-control" required>
          </div>
          <div class="mb-3">
              <label class="form-label">Password</label>
              <input type="password" name="password" class="form-control" required>
          </div>
          
          <div class="mb-3">
		    <label class="form-label">Role</label>
		    <select name="role" class="form-control" required>
		        <option value="user">User</option>
		        <option value="librarian">Librarian</option>
		    </select>
		</div>

          <button type="submit">Register</button>
      </form>

      <div class="login-link">
          <p>Already registered? <a href="login.jsp">Login here</a></p>
      </div>
    </div>
  </section>
</main>











<footer id="footer" class="footer position-relative light-background">
  <div class="footer copyright text-center mt-4">
    <p>© <span>Copyright</span> <strong class="sitename">Append</strong> <span>All Rights Reserved</span></p>
    <div class="credits">
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </div>
</footer>

<a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
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
<script src="assets/js/main.js"></script>

</body>
</html>
