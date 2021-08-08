<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title> Mechanic Registration </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style.css" type="text/css">
		<link rel="stylesheet" href="css/RegStyle.css">
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
					<img src="images/registration-form-1.jpg" alt="" height="550" width="450">
				</div>
				
				<form action="/mechanic_registration" method="post">
				
					<h3> Mechanic Registration </h3>
					
					<div class="form-group">
						<input type="text" placeholder="First Name" name="fname" id="fname" class="form-control">
						<input type="text" placeholder="Last Name" name="lname" id="lname" class="form-control">
					</div>
					<div class="form-wrapper"> 
						<input type="text" placeholder="stuff number" name="stuff_number" id="username" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" placeholder="Date Of Birth" name="date_of_birth" id="phone" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" placeholder="Phone Number" name="phone" id="phone" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" placeholder="Email Address" name="email" id="email" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
					
					<div class="form-wrapper">
						<select name="genger" id="gender" class="form-control">
							<option value="" disabled selected> Gender </option>
							<option value="male"> Male </option>
							<option value="femal"> Female </option>
							<option value="other"> Other </option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="password" placeholder="Password" name="password" id="password" id="password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="password" placeholder="Confirm Password" name="password1" id="password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					
					<div class="checkbox">
						<label>
							<input type="checkbox" name="terms" id="terms"> I accept the Terms of Use & Privacy Policy.
							<span class="checkmark"></span>
						</label>
					</div> 
					
					<button> Register
						<i class="zmdi zmdi-arrow-right"></i>
					</button> 
					
				</form>
			</div>
		</div>>
	</body>
	
</html>