<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
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
			<a href="index.html" class="logo"><img src="images/logo.pg" alt=""></a>
			<form action="index.html">
				<input type="text" name="search" id="search" value="">
				<input type="submit" name="searchBtn" id="searchBtn" value="">
			</form>
		</div>
		
		<div class="navigation">
			<ul>
				<li class="selected">
					<a href="view.jsp">home</a>
				</li>
				<li>
					<a href="about.html">about</a>
					<ul>
						<li>
							<a href="team.html">the team</a>
						</li>
						<li>
							<a href="testimonials.html">testimonials</a>
						</li>
						<li>
							<a href="gallery.html">gallery</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="services.html">services</a>
					<ul>
						<li>
							<a href="services.html">engine maintenance</a>
						</li>
						<li>
							<a href="services.html">wheel allignment</a>
						</li>
						<li>
							<a href="services.html">air condition services</a>
						</li>
						<li>
							<a href="services.html">transmission</a>
						</li>
						<li>
							<a href="promo.html"> promos &amp; discounts</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="contact.jsp"> contact------> </a>
				</li>
				<li class="booking">
					<a href="MechanicReg.jsp"> Mechanic </a>
				</li>
				<li class="booking">
					<a href="PartnerReg.jsp"> Partner </a>
				</li>
			</ul>
		</div>
	</div>
	
<div class="wrapper">
			<div class="inner">
				<div class="image-holder">
					<img src="images/registration-form-1.jpg" alt="" height="550" width="450">
				</div>
				
				<form action="addMechanic">
				
					<h3> Mechanic Registration </h3>
					
					<div class="form-group">
						<input type="text" placeholder="First Name" name="fname" id="fname" class="form-control">
						<input type="text" placeholder="Last Name" name="lname" id="lname" class="form-control">
					</div>
					
					<div class="form-wrapper">
						<input type="text" placeholder="staff number" name="reg_number" id="username" class="form-control">
						<i class="zmdi zmdi-account"></i>
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
						<input type="password" placeholder="Password" name="password1" id="password" id="password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="password" placeholder="Confirm Password" name="password2" id="cpassword" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					
					<div class="checkbox">
						<label>
							<input type="checkbox" name="terms" id="terms"> I caccept the Terms of Use & Privacy Policy.
							<span class="checkmark"></span>
						</label>
					</div> 
					
					<button> Register
						<i class="zmdi zmdi-arrow-right"></i>
					</button> 
					
				</form>
			</div>
		</div>
		
	</body>
</html>