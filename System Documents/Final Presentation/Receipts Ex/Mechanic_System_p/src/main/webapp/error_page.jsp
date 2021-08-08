</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> Registration error </title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/" style="font-size: 40px;"> Health Center </a></h1>

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
			<img src="images/doctor_tool.jpg" width="466px" height="420px" alt="">
			<c:choose>
			<c:when test="${ booking_message == null }">
			<div>
				<h1> error: </h1>
				<p style="color:red; font-size: 15px;" > ${ message } </p>
				<br> 
				<a href="doctor_reg_page"> Doctor </a>
			</div>
			<div>
				<a href="clerk_registration.jsp"> Clerk </a>
			</div>
			</c:when>
			<c:when test="${ booking_message != null }">
			<div>
				<h1> error: </h1>
				<p style="color:red; font-size: 15px;" > ${ booking_message } </p>
				<br>
				<a href="/book_appointment_page"> Book an appointment </a>
			</div>
			</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>