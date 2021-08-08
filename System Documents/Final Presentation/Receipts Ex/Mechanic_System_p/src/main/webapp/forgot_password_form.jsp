<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title> login </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	
	<!-- Core plugin JavaScript-->
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
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
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/doctor_tool.jpg);">
					<span class="login100-form-title-1">
						Forgot Password
					</span>
				</div>

				<form method="post" action="${contextPath}/forgot_password" class="login100-form validate-form" id="forgot_password_form">
				<c:if test="${ message == null }">
					<p class="m-b-20" style="color:#7FFF00; font-size: 16px"><b> We will be sending a reset password link to your email. </b></p>
				</c:if>
					<P class="m-b-20" style="color: #7FFF00; font-size: 16px"><b> ${ message } </b></P>
					<P class="m-b-20" style="color: red"> ${ error } </P>
					<span class="error_form" id="username_error_message"></span>
					<div class="wrap-input100 validate-input m-b-26" data-validate="Email is required">
						<span class="label-input100"> Email </span>
						<input class="input100" type="text" placeholder="Enter Email Address" id="email" name="email">
						<span class="focus-input100"></span>
					</div>
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<div class="container-login100-form-btn m-b-12">
						<button type="submit" class="login100-form-btn" style="background-color: blue;">
							Send Email
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<script>
      $(function() {
		$("#username_error_message").hide();
         var error_username = false;
         
         $("#username").focusout(function() {
            check_username();
         });
         
         function check_username() {
             var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
             var username = $("#username").val();
             if (pattern.test(username)) {
                $("#username_error_message").hide();
                error_username = false;
             } else {
            	$("#username_error_message").html("Invalid username");
            	$("#username_error_message").css("color", "red");
                $("#username_error_message").show();
                error_username = true;
             }
          }
          
         $("#login_form").submit(function() {
            if (error_username === false) {
               return true;
            } else {
            	return false;
            }
         });
      });
</script>
</body>
</html>