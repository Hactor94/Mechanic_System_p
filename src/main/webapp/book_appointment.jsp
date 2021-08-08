<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title> Book An Appointment </title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="header">
		<div>
			<a href="view.jsp" class="logo"><img src="images/logo1.png" alt=""></a>
		</div>
		
		<div class="navigation">
			<ul>
				<li>
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

	<div id="body">
		<div class="content">
			<div class="section">
				<div class="booking">
					<h2> BOOK AN APPOINTMENT </h2> 
					
					<form action="/book_appointment">
						<h4>fill in your contact details</h4>
						<div class="form1">
							<label for="fname"> <span>first name</span>
								<input type="text" name="fname" id="fname">
							</label>
							<label for="lname"> <span>last name</span>
								<input type="text" name="lname" id="lname">
							</label>
							<label for="email3"> <span>email address</span>
								<input type="email" name="email" id="email3">  
							</label>
							<label for="phone"> <span>phone number</span>
								<input type="text" name="phone" id="phone">
							</label>
							<label for="address1"> <span>address line 1</span>
								<input type="text" name="address_line1" id="address1">
							</label>
							<div>
								<label for="city"> <span>city</span>
									<select name="city" id="city">
										<option value=" "> </option>
										<option value="Pretoria"> Pretoria </option>
										<option value="Johannesburg"> Johannesburg </option>
										<option value="Piet Retief"> Piet Retief </option>
										<option value="Other"> Other </option>
									</select>
								</label>
								<label for="state"> <span>state</span>
									<select name="state" id="state">
										<option value=" ">  </option>
										<option value="South Africa"> South Africa </option>
										<option value="Other State"> Other State </option>
									</select>
								</label>
							</div>
							<label for="address2"> <span>address line 2</span>
								<input type="text" name="address_line2" id="address2">
							</label>
							<label for="zip"> <span>zipcode</span> 
								<input type="text" name="zip" id="zip"> 
							</label>
						</div>
						<h4>fill in details about your vehicle</h4>
						<div class="form2">
							<div>
								<label for="brand"> <span>brand</span>
									<input type="text" name="brand" id="brand">
								</label>
								<label for="model"> <span>model</span>
									<input type="text" name="model" id="model">
								</label>
								<label for="year"> <span>year</span>
									<input type="text" name="car_year" id="year">
								</label>
								<label for="state"> <span> Insurance </span>
									<select name="insurance" id="state">
										<option value="0"> </option>
										<option value="218202099"> Car_Insu </option>
										<option value="215667308"> TrioTouch </option>
										<option value="219656541"> InfoSys </option>
										<option value="218202011"> AmazonInsu </option>
										<option value="211505044"> InsuMeNow </option>
										<option value="214252500"> MyCarPlan </option>
									</select>
								</label>
							</div>
							<label for="confirm" id="confirm2"> <span>If needed, are you ok with leaving your vehicle for the day?</span>
								<input type="text" name="sleep_over" id="confirm">
							</label>
							<label for="confirm" id="confirm2"> <span>Type Of Service</span>
								<select name="service_type" id="schedule"> 
										<option value=""> </option>
										<option value="Engine Maintenance"> Engine Maintenance </option>
										<option value="wheel alignment"> wheel alignment </option>
										<option value="Air Condition Services"> Air Condition Services </option>
										<option value="Transmission Repair And Replacement"> Transmission Repair And Replacement </option>
										<option value="Other Service"> Other Service </option> 
								</select>
							</label>
							<label for="message2"> <span>Leave us a short message regarding your concerns and needs.</span>
								<textarea name="message" id="message2" cols="30" rows="10"></textarea>
							</label>
						</div>
						<input type="submit" name="send2" id="send2" value=""> 
					</form>
				</div>
			</div>
			<div class="sidebar">
				<div class="contact">
					<div>
						<a href="gallery.html"><img src="img/user_img.png" alt=""></a>
					</div>
					<h4> contact information </h4>
					<ul>
						<li>
							<b> address: </b> <span> 155 Troye Street, Sunnyside, Pretoria 0002 </span>
						</li>
						<li>
							<b> phone: </b> <span> 021 458 4587 </span>
						</li>
						<li>
							<b> email: </b> <span><a href=" "> info@mechanicshop.com </a></span>
						</li>
					</ul>
				</div>
				<div class="featured">
					<h3> featured services </h3>
					<ul>
						<li>
							 Engine maintenance 
						</li>
						<li>
							 Wheel alignment
						</li>
						<li>
							 Air Condition Services
						</li>
						<li>
							 Transmission Repair And Replacement
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>