</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

      <h1 class="logo mr-auto"><a href="view.jsp" style="font-size: 40px;"> Health Center </a></h1>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="view.jsp"> Home </a></li>
        </ul>
      </nav><!-- .nav-menu -->

     <a href="registration.jsp" class="appointment-btn scrollto"> Register </a>
	<a href="Login.jsp" class="appointment-btn scrollto"> Login </a>
    </div>
  </header> <!-- End Header -->
  
	<div id="body">	
		<div class="body">
			<img src="images/doctor_tool.jpg" width="466px" alt="">
			<div>
				<h1> ${ title }: </h1>
				<p style="color:red; font-size: 15px;" > ${ message } </p>
				<br>
			</div>
			<div>
				
			</div>
		</div>
	</div>
</body>
</html>