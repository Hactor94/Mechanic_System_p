<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title> Home </title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Medilab - v2.0.0
  * Template URL: https://bootstrapmade.com/medilab-free-medical-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/"> Health Center </a></h1>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/"> Home </a></li>
          <li><a href="#services"> Services </a></li>
          <li><a href="#about"> About us </a></li>
        </ul>
      </nav><!-- .nav-menu -->

     <a href="registration.jsp" class="appointment-btn scrollto"> Register </a>
	<a href="/direct_to_dashboard" class="appointment-btn scrollto"> Login </a>
    </div>
  </header> <!-- End Header --> 
  
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1> Welome To Health Center </h1>
      <h2> We are team of medical professionals </h2>
      <a href="/book_appointment_page" class="btn-get-started scrollto"> Book Appointment </a>
    </div>
  </section> <!-- End Hero -->

  <main id="main">
    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2> Our Services </h2>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><img src="./assets/img/General.jfif" width="90px"></div>
              <h4><a href="book_appointment.jsp"> General Practitioner </a></h4>
			  <p> Provide healthcare to patients of any sex or age. </p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><img src="./assets/img/Dentist.png" width="90px"></i></div>
              <h4><a href="book_appointment.jsp"> Dentist </a></h4>
			  <p> Treat diseases and other conditions that affect the teeth and gums. </p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><img src="./assets/img/Nephrologist.png" width="90px"></div>
              <h4><a href="book_appointment.jsp"> Nephrologist </a></h4>
			  <p> Nephrology is a specialty that focuses on diseases of the kidneys.  </p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><img src="./assets/img/Neurologist.png" width="90px"></div>
              <h4><a href="book_appointment.jsp"> Neurologist </a></h4>
			  <p> focuses on the anatomy, functions, and disorders of the nerves and nervous systems. </p>
            </div>
          </div>
        </div>
      </div>
    </section> <!-- End Services Section -->
    
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container-fluid">
		<div class="section-title">
          <h2> About us </h2>
        </div>
        <div class="row">
          <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch">
            <img src="assets/img/departments-1.jpg" width="500px" alt="">
          </div>

          <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
            <h3> How We Work </h3>
            <p>Health centers overcome geographic, cultural, linguistic, and other barriers to care by delivering coordinated and comprehensive primary and preventive services. This care reduces health disparities by emphasizing care management of patients with multiple health care needs and the use of key quality improvement practices, including health information technology.</p>

            <div class="icon-box">
              <h4 class="title"><a href="book_appointment.jsp"> *We are in this to make our patients better </a></h4>
            </div>

            <div class="icon-box">
              <h4 class="title"><a href="book_appointment.jsp"> *Affordable cost of care </a></h4>
            </div>

            <div class="icon-box">
              <h4 class="title"><a href="book_appointment.jsp"> *Adequate insurance coverage </a></h4>
            </div>

          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    
  </main> <!-- End #main -->
  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>