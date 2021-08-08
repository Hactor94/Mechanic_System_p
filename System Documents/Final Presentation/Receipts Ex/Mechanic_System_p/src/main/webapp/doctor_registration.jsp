<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title> Doctor Registration </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- Vendor CSS Files -->
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/RegStyle.css">
		<link rel="stylesheet" href="css/style_password.css" type="text/css">
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
	
<div class="wrapper">
			<div class="inner">
				<div class="image-holder">
					<img src="assets/img/reg-bg.jpg" alt="" height="750" width="600">
				</div>
				
				<form action="/doctor_registration" method="post" id="registration_form">
				
					<h3> Doctor Registration </h3>
					
					<div class="form-group" style="font-size: 14px;">
						<input type="text" placeholder="First Name" name="fname" id="fname" class="form-control">
						<input type="text" placeholder="Last Name" name="lname" id="lname" class="form-control">
					</div>
					<div class="form-wrapper" style="font-size: 14px;"> 
						<input type="text" placeholder="staff number" name="staffNumber" id="stuff_number" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<input type="date" placeholder="Date Of Birth" name="dob" id="date_of_birth" class="form-control" style="font-size: 13px;">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					<div class="form-wrapper" style="font-size: 14px;">
						<input type="text" placeholder="Phone Number" name="phone" id="phone" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					<div class="form-wrapper" style="font-size: 14px;">
						<span class="error_form" id="email_error_message"></span>
						<input type="text" placeholder="Email Address" name="email" id="email" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
					
					<div class="form-wrapper">
						<select name="gender" id="gender" class="form-control" style="font-size: 14px;">
							<option value=""> select gender </option>
							<option value="Male"> Male </option>
							<option value="Female"> Female </option>
							<option value="Other"> Other </option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper">
						<select name="services" id="services" class="form-control" style="font-size: 14px;">
							<option value=""> Select Service  </option>
							<c:forEach items="${services}" var = "service">
							<option value="${service.ID}"> ${service.serviceType} </option>
							</c:forEach>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper" style="font-size: 14px;">
						<input type="password" placeholder="Password" name="password" id="password" class="form-control">
						
					</div>
					
					<div class="form-wrapper" style="font-size: 14px;">
						<span class="error_form" id="retype_password_error_message"></span>
						<input type="password" placeholder="Retype Password" name="retype_password" id="retype_password" class="form-control">
						
					</div>
					
					<div class="checkbox">
						<label>
							<input type="checkbox" name="terms" id="terms"> I accept the Terms of Use and Privacy Policy.
							<span class="checkmark"></span>
						</label>
					</div> 
					
					<button> Register
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
					
				</form>
			</div>
		</div>
<script>
      $(function() {
    	//$("#terms").prop('checked', true);  // Checks the box
    	//$("#terms").prop('checked', false); // Unchecks the box
    	// Set initial state 
            $('#terms').val($(this).is(':checked')); 
  
            // It gets checked to false as uncheck 
            // is the default 
            $('#terms').click(function() { 
                $('#terms').val($(this).is(':checked')); 
            }); 
    	
		$("#retype_password_error_message").hide();
		$("#email_error_message").hide();
          
         var error_fname = false;
         var error_lname = false;
         var error_stuff_number = false;
         var error_date = false;
         var error_phone = false;
         var error_email = false;
         var error_gender = false;
         var error_terms = false;
         var error_password = false;
         var error_retype_password = false;
         var error_services = false;

         $("#fname").focusout(function(){
            check_fname();
         });
         $("#lname").focusout(function() {
            check_lname();
         });
         $("#stuff_number").focusout(function() {
             check_stuff_number();
          });
         $("#date_of_birth").focusout(function() {
             check_date();
          });
         $("#phone").focusout(function() {
             check_phone();
          });
         $("#email").focusout(function() {
            check_email();
         });
         $("#gender").focusout(function() {
             check_gender();
          });
         $("#terms").focusout(function() {
             check_terms();
          });
         $("#password").focusout(function() {
            check_password();
         });
         $("#retype_password").focusout(function() {
            check_retype_password();
         });
         $("#services").focusout(function() {
             check_services();
          });

         function check_fname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#fname").val();
            if (pattern.test(fname) && fname !== '') {
               $("#fname").css("border-bottom","2px solid #34F458");
               error_fname = false;
            } else {
               $("#fname").css("border-bottom","2px solid #F90A0A");
               error_fname = true;
            }
         }

         function check_lname() {
            var pattern = /^[a-zA-Z]*$/;
            var lname = $("#lname").val()
            if (pattern.test(lname) && lname !== '') {
               $("#lname").css("border-bottom","2px solid #34F458");
               error_lname = false;
            } else {
               $("#lname").css("border-bottom","2px solid #F90A0A");
               error_lname = true;
            }
         }
         
         function check_stuff_number() {
             var pattern = /^[0-9]*$/;
             var stuff_number = $("#stuff_number").val();
             if (pattern.test(stuff_number) && stuff_number !=='') {
                $("#stuff_number").css("border-bottom","2px solid #34F458");
                error_stuff_number = false;
             } else {
                $("#stuff_number").css("border-bottom","2px solid #F90A0A");
                error_stuff_number = true;
             }
          }
         
         function check_date() {
        	 var today = new Date();
        	 var dob = new Date($("#date_of_birth").val()); 
             if (today.getFullYear() > dob.getFullYear() && dob !== '' && (today.getFullYear() - dob.getFullYear()) > 16) {
                $("#date_of_birth").css("border-bottom","2px solid #34F458");
                error_date = false;
             } else {
                $("#date_of_birth").css("border-bottom","2px solid #F90A0A");
                error_date = true;
             }
          }
         
         function check_phone() {
             var pattern = /^[0-9]*$/;
             var phone_number = $("#phone").val();
             if (pattern.test(phone_number) && phone_number !=='' && phone_number.length === 10 && phone_number.substr(0, 1) == 0) {
                $("#phone").css("border-bottom","2px solid #34F458");
                error_phone = false;
             } else {
                $("#phone").css("border-bottom","2px solid #F90A0A");
                error_phone = true;
             }
          }
         
         function check_email() {
             var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
             var email = $("#email").val();
             if (pattern.test(email) && email !== '') {
                $("#email").css("border-bottom","2px solid #34F458");
                $("#email_error_message").hide();
                error_email = false;
             } else if (email == ''){
            	 $("#email").css("border-bottom","2px solid #F90A0A");
                 error_email = true;
             } else {
            	$("#email_error_message").html("Invalid email");
            	$("#email_error_message").css("color", "red");
                $("#email_error_message").show();
                $("#email").css("border-bottom","2px solid #F90A0A");
                error_email = true;
             }
          }
         
         function check_gender() {
             var gender = $("#gender").val();
             if (gender !=='') {
                $("#gender").css("border-bottom","2px solid #34F458");
                error_gender = false;
             } else {
                $("#gender").css("border-bottom","2px solid #F90A0A");
                error_gender = true;
             }
          }
         
         function check_services() {
             var services = $("#services").val();
             if (services !=='') {
                $("#services").css("border-bottom","2px solid #34F458");
                error_services = false;
             } else {
                $("#services").css("border-bottom","2px solid #F90A0A");
                error_services = true;
             }
          }
         
         function check_terms() {
        	 var terms = $("#terms").val(); 
             if (terms === 'true') {
            	 error_terms = false;
             } else {
            	 error_terms = true;
             }
          }
         
         $("#password").passwordStrength();
         function check_password() {
             var password = $("#password").val();
             if (password.match(/[a-z]/g) && password.match(/[A-Z]/g) && password.match(/[0-9]/g) && password.match(/[^a-zA-Z\d]/g) && password.length >= 8){
            	 $("#password").css("border-bottom","2px solid #34F458");
            	 error_password = false;
             }else {
            	 $("#password").css("border-bottom","2px solid #F90A0A");
                 error_password = true;
             }
         }
         
          function check_retype_password() {
             var password = $("#password").val();
             var retype_password = $("#retype_password").val();
             if (password !== retype_password || retype_password === '') {
                $("#retype_password_error_message").html("Password not match");
                $("#retype_password_error_message").css("color", "red");
                $("#retype_password_error_message").show();
                $("#retype_password").css("border-bottom","2px solid #F90A0A");
                error_retype_password = true;
             } else {
                $("#retype_password_error_message").hide();
                $("#retype_password").css("border-bottom","2px solid #34F458");
                error_retype_password = false;
             }
          }
          
         $("#registration_form").submit(function() {
        	 error_fname = false;
             error_lname = false;
             error_stuff_number = false;
             error_date = false;
             error_phone = false;
             error_email = false;
             error_gender = false;
             error_terms = false;
             error_password = false;
             error_retype_password = false;
             error_services = false;
             
        	 check_fname();
             check_lname();
             check_stuff_number();
             check_date();
             check_phone();
             check_email();
             check_gender();
             check_terms();
             check_services();
             check_password();
             check_retype_password();
             
            if (error_fname === false && error_lname === false && error_stuff_number === false && error_email === false && 
            		error_password === false && error_retype_password === false && error_date === false && error_phone === false
            		&& error_gender === false && error_terms === false && error_services === false) {
            	alert("Click 'Ok' to complete registration");
               return true;
            } else {
            	alert("Please fill the form correctly");
            	return false;
            }
         });
      });
</script>
</body>
</html>