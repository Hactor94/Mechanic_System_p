<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> Registration </title>
	
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
	<link href="css/style.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/"> Health Center </a></h1>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/"> Home </a></li>
        </ul>
      </nav><!-- .nav-menu -->

     <a href="registration.jsp" class="appointment-btn scrollto"> Register </a>
	<a href="/direct_to_dashboard" class="appointment-btn scrollto"> Login </a>
    </div>
  </header> <!-- End Header -->
	<div id="body">	
		<div class="body">
			<img src="assets/img/reg-bg.jpg" width="466px" alt="">
			<div>
				<h1 style="font-size: 55px"> Register AS: </h1>
				<p></p>
				<br>
				<a href="/doctor_reg_page"> Doctor </a>
			</div>
			<div>
				<a href="clerk_registration.jsp"> Clerk </a>
			</div>
		</div>
	</div>
</body>
</html>