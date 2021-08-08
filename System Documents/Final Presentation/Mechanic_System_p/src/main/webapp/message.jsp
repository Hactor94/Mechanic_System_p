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
</head>

<body>
	<div id="header">
		<div>
			<a href="view.jsp" class="logo"><img src="images/logo1.png" alt=""></a>
		</div>
		
		<div class="navigation">
			<ul>
				<li>
					<a href="view.jsp"> home </a>
				</li>
				<li>
					<a href="about.jsp"> about </a>
				</li>
				<li>
					<a href="services.jsp"> services </a>
				</li>
				<li>
					<a href="contact.jsp"> contact </a>
				</li>	
			</ul>
		</div>
	</div>
	<div id="body">	
		<div class="body">
			<img src="images/repairs.jpg" alt="">
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