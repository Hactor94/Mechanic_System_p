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
				
				<form action="/insurance_registration">
				
					<h3> Insurance Company Registration </h3>
					
					<div class="form-group">
						<input type="text" placeholder="Registration number" name="reg_number" id="reg_number" class="form-control">
						<input type="text" placeholder="Campany Name" name="company_name" id="cname" class="form-control">
					</div>
					
					<div class="form-wrapper">
						<input type="text" placeholder="Username" name="admin_name" id="username" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					
					<div class="form-wrapper">
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
							<option value="" disabled selected> City </option>
							<option value="Pretoria"> Pretoria </option>
							<option value="Johannesburg"> Johannesburg </option>
							<option value="Piet Retief"> Piet Retief </option>
							<option value="Other"> Other </option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper">
						<select name="country" id="state" class="form-control">
							<option value="" disabled selected> State </option>
							<option value="South Africa"> South Africa </option>
							<option value="Other State"> Other State </option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="text" placeholder="Zip Code" name="zip_code" id="zip" class="form-control">
						<i class="zmdi zmdi-accountl"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="password" placeholder="Password" name="password" id="password" id="password" class="form-control">
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