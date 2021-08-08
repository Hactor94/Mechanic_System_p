<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title> Contact us </title>
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
				<li class="selected">
					<a href="contact.jsp"> contact </a>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="body">
		<div class="content">
			<div class="section">
				<div class="contact">
					<h2> get in touch with us! </h2>
					<p>
					
					</p>
					
					<form action="index.html">
						<label for="name"> <span>name</span>
							<input type="text" name="name" id="name">
						</label>
						<label for="email"> <span>email</span>
							<input type="text" name="email" id="email">
						</label>
						<label for="subject"> <span>subject</span>
							<input type="text" name="subject" id="subject">
						</label>
						<label for="message"> <span>comment</span>
							<textarea name="message" id="message"></textarea>
						</label>
						<input type="submit" name="send" id="send" value="">
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
							<b> address: </b> <span> 155 Troye Street, Sunnyside, Pretoria, 0002 </span>
						</li>
						<li>
							<b> phone: </b> <span> 021 587 2589 </span>
						</li>
						<li>
							<b> email: </b> <span><a href=" "> info@mechanicshop.com </a></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>