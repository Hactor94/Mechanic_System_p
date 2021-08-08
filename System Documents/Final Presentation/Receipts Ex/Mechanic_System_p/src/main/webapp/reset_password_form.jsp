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
	<link rel="stylesheet" href="css/style_password.css" type="text/css">
	
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	
	<!-- Core plugin JavaScript-->
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<script type="text/javascript" src="js/jquery.passwordstrength.js"></script>
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
						Change Password
					</span>
				</div>

				<form method="post" action="${contextPath}/reset_password" class="login100-form validate-form" id="reset_password_form">
					<input type="hidden" name="token" value="${ token }">
					<span class="error_form" id="username_error_message"></span>
					<div class="wrap-input100 validate-input m-b-26" data-validate="Password is required">
						<span class="label-input100"> Password </span>
						<input class="input100" type="password" placeholder="New Password" id="new_password" name="new_password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-18" data-validate="Retype password is required">
						<span class="label-input100"> Retype </span>
						<input class="input100" type="password" placeholder="Retype Password" id="retype_password" name="retype_password">
						<span class="focus-input100"></span>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<div class="container-login100-form-btn m-b-12">
						<button type="submit" class="login100-form-btn" style="background-color: blue;">
							Change Password
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- /container -->
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
<script type="text/javascript">
      $(function() {
    	  var error_password = false;
          var error_retype_password = false;
          
    	  $("#new_password").focusout(function() {
              check_password();
           });
           $("#retype_password").focusout(function() {
              check_retype_password();
           });
           
          $("#new_password").passwordStrength();
          function check_password() {
              var password = $("#new_password").val();
              if (password.match(/[a-z]/g) && password.match(/[A-Z]/g) && password.match(/[0-9]/g) && password.match(/[^a-zA-Z\d]/g) && password.length >= 8){
             	 $("#new_password").css("border-bottom","none");
             	 error_password = false;
              }else {
             	 $("#new_password").css("border-bottom","2px solid #F90A0A");
                  error_password = true;
              }
          }
          
           function check_retype_password() {
              var password = $("#new_password").val();
              var retype_password = $("#retype_password").val();
              if (password !== retype_password || retype_password === '') {
                 $("#retype_password_error_message").html("Password not match");
                 $("#retype_password_error_message").css("color", "red");
                 $("#retype_password_error_message").show();
                 $("#retype_password").css("border-bottom","2px solid #F90A0A");
                 error_retype_password = true;
              } else {
                 $("#retype_password_error_message").hide();
                 $("#retype_password").css("border-bottom","none");
                 error_retype_password = false;
              }
           }
          
         $("#reset_password_form").submit(function() {
        	 error_password = false;
             error_retype_password = false;
             
             check_password();
             check_retype_password();
             
            if (error_password === false && error_retype_password === false) {
               return true;
            } else {
            	return false;
            }
         });
      });
</script>
</body>
</html>