<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title> Insurance Company Registration </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style.css" type="text/css">
		<link rel="stylesheet" href="css/RegStyle.css">
		<link rel="stylesheet" href="css/style_password.css" type="text/css">
		
		<!-- Core plugin JavaScript-->
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<script type="text/javascript" src="js/jquery.passwordstrength.js"></script>
	</head>

	<body>

<div id="header">
		<div>
			<a href="view.jsp" class="logo"><img src="images/logo1.png" alt=""></a>
		</div>
		
		<div class="navigation">
			<ul>
				<li class="selected">
					<a href="view.jsp">home</a>
				</li>
				<li>
					<a href="about.jsp">about</a>
				</li>
				<li>
					<a href="services.jsp">services</a>
				</li>
				<li>
					<a href="contact.jsp"> contact </a>
				</li>	
			</ul>
		</div>
	</div>
	
<div class="wrapper">
			<div class="inner">
				<div class="image-holder">
					<img src="images/registration-form-2.jpg" alt="" height="850" width="450">
				</div>
				
				<form action="/insurance_registration" id="registration_form">
				
					<h3> Insurance Company Registration </h3>
					
					<div class="form-group">
						<input type="text" placeholder="Registration number" name="reg_number" id="reg_number" class="form-control">
						<input type="text" placeholder="Campany Name" name="company_name" id="company_name" class="form-control">
					</div>
					
					<div class="form-wrapper">
						<input type="text" placeholder="Username" name="admin_name" id="username" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					
					<div class="form-wrapper">
						<span class="error_form" id="email_error_message"></span>
						<input type="text" placeholder="Email Address" name="email" id="email" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
		
					<div class="form-wrapper">
						<input type="text" placeholder="Phone Number" name="phone" id="phone" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="text" placeholder="Address" name="address" id="address" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
			
					<div class="form-wrapper">
						<select name="city" id="city" class="form-control">
							<option value=""> City </option>
							<option value="Pretoria"> Pretoria </option>
							<option value="Johannesburg"> Johannesburg </option>
							<option value="Piet Retief"> Piet Retief </option>
							<option value="Other"> Other </option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper">
						<select name="country" id="state" class="form-control">
							<option value=""> State </option>
							<option value="South Africa"> South Africa </option>
							<option value="Other State"> Other State </option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="text" placeholder="Zip Code" name="zip_code" id="zip_code" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="password" placeholder="Password" name="password" id="password" id="password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					
					<div class="form-wrapper">
						<span class="error_form" id="retype_password_error_message"></span>
						<input type="password" placeholder="Confirm Password" name="retype_password" id="retype_password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
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
    	// Set initial state 
            $('#terms').val($(this).is(':checked')); 
  
            // It gets checked to false as uncheck 
            // is the default 
            $('#terms').click(function() { 
                $('#terms').val($(this).is(':checked')); 
            }); 
    	
		$("#retype_password_error_message").hide();
		$("#email_error_message").hide();
          
         var error_company_name = false;
         var error_username = false;
         var error_reg_number = false;
         var error_phone = false;
         var error_email = false;
         var error_address = false;
         var error_city = false;
         var error_state = false;
         var error_zip_code = false;
         var error_terms = false;
         var error_password = false;
         var error_retype_password = false;

         $("#company_name").focusout(function(){
            check_company_name();
         });
         $("#username").focusout(function() {
            check_username();
         });
         $("#reg_number").focusout(function() {
             check_reg_number();
          });
         $("#phone").focusout(function() {
             check_phone();
          });
         $("#email").focusout(function() {
            check_email();
         });
         $("#address").focusout(function() {
             check_address();
          });
         $("#city").focusout(function() {
             check_city();
          });
         $("#state").focusout(function() {
             check_state();
          });
         $("#zip_code").focusout(function() {
             check_zip_code();
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

         function check_company_name() {
            var pattern = /^[a-zA-Z0-9\s]*$/;
            var company_name = $("#company_name").val();
            if (pattern.test(company_name) && company_name !=='') {
               $("#company_name").css("border-bottom","2px solid #34F458");
               error_company_name = false;
            } else {
               $("#company_name").css("border-bottom","2px solid #F90A0A");
               error_company_name = true;
            }
         }
         
         function check_username() {
             var pattern = /^[a-zA-Z0-9]*$/;
             var username = $("#username").val();
             if (pattern.test(username) && username !=='') {
                $("#username").css("border-bottom","2px solid #34F458");
                error_username = false;
             } else {
                $("#username").css("border-bottom","2px solid #F90A0A");
                error_username = true;
             }
          }
         
         function check_reg_number() {
             var pattern = /^[0-9]*$/;
             var reg_number = $("#reg_number").val();
             if (pattern.test(reg_number) && reg_number !=='') {
                $("#reg_number").css("border-bottom","2px solid #34F458");
                error_reg_number = false;
             } else {
                $("#reg_number").css("border-bottom","2px solid #F90A0A");
                error_reg_number = true;
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
         
         function check_address() {
             var pattern = /^[a-zA-Z0-9\s]*$/;
             var address = $("#address").val();
             if (pattern.test(address) && address !=='') {
                $("#address").css("border-bottom","2px solid #34F458");
                error_address = false;
             } else {
                $("#address").css("border-bottom","2px solid #F90A0A");
                error_address = true;
             }
          }
         
         function check_city() {
             var city = $("#city").val();
             if (city !== '') {
                $("#city").css("border-bottom","2px solid #34F458");
                error_city = false;
             } else {
                $("#city").css("border-bottom","2px solid #F90A0A");
                error_city = true;
             }
          }
         
         function check_state() {
             var state = $("#state").val();
             if (state !== '') {
                $("#state").css("border-bottom","2px solid #34F458");
                error_state = false;
             } else {
                $("#state").css("border-bottom","2px solid #F90A0A");
                error_state = true;
             }
          }
         
         function check_zip_code() {
             var pattern = /^[0-9]*$/;
             var zip_code = $("#zip_code").val();
             if (pattern.test(zip_code) && zip_code !=='' && zip_code.length === 4) {
                $("#zip_code").css("border-bottom","2px solid #34F458");
                error_zip_code = false;
             } else {
                $("#zip_code").css("border-bottom","2px solid #F90A0A");
                error_zip_code = true;
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
        	 error_company_name = false;
             error_username = false;
             error_reg_number = false;
             error_phone = false;
             error_email = false;
             error_address = false;
             error_city = false;
             error_state = false;
             error_zip_code = false;
             error_terms = false;
             error_password = false;
             error_retype_password = false;
             
             check_company_name();
             check_username();
             check_reg_number();
             check_phone();
             check_email();
             check_address();
             check_city();
             check_state();
             check_zip_code();
             check_terms();
             check_password();
             check_retype_password();
             
            if (error_company_name === false && error_username === false && error_reg_number === false && error_phone === false && 
            		error_email === false && error_address === false && error_retype_password === false && error_terms === false && 
            		error_city === false && error_state === false && error_zip_code === false && error_password === false) {
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