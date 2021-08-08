<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> Home </title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="m_css/bootstrap.min.css"/>
	<link rel="stylesheet" href="m_css/font-awesome.min.css"/>
	<link rel="stylesheet" href="m_css/flaticon.css"/>
	<link rel="stylesheet" href="m_css/owl.carousel.css"/>
	<link rel="stylesheet" href="m_css/magnific-popup.css"/>
	<link rel="stylesheet" href="m_css/style.css"/>
	
	<!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  
	<!-- plugins:css -->
    <link rel="stylesheet" href="../../../assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../assets/vendors/iconfonts/ionicons/css/ionicons.css">
    <link rel="stylesheet" href="../../../assets/vendors/iconfonts/typicons/src/font/typicons.css">
    <link rel="stylesheet" href="../../../assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="../../../assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../../assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../../assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="../../../assets/images/favicon.png" />
</head>

<body>
	<div id="header"> 
		<div class="row">
			<div class="col-md-8">
				<a href="view.jsp"><img src="images/logo" alt=""></a>
			</div>
			<div class="col-md-4 text-right">
				<a type="button" href="registration.jsp" class="btn btn-light btn-fw">
					<i class="fa fa-user"></i> Register
				</a>
				<a type="button" href="/direct_to_dashboard" class="btn btn-light btn-fw">
					<i class="fa fa-sign-in"></i> Login 
				</a>
			</div>
		</div>
		<div class="navigation">
			<ul>
				<li class="selected">
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
			<img src="images/insurance.jpg" width="450px" height="550px" alt="">
			<div>
				<h1> <span> Get a comprehensive car insurance quote. </span></h1>
				<p>
					We understand how important your privacy is and will protect your personal information. By providing your personal information you are agreeing that we may process it to furnish you with a quote. Also note that some advisors work under supervision.
				</p>
				<a href="/appointment"> Start Quote </a>
				<br>
			</div>
			
		</div>
		
		<div class="footer">
			<div> 
				<h2><span></span></h2>
				<ul>
					<li>
						<p class="figure"></p>
						<div>
							<h3> Comprehensive car insurance </h3>
							<p style="color:#3CB371"> Cover your car and enjoy our full range of great benefits, such as a fixed excess, 12-month guaranteed premiums. </p>
						</div>
					</li>
					<li>
						<p class="figure"></p>
						<div>
							<h3> Essential car insurance </h3>
							<p style="color:#3CB371"> Get the insurance solution specifically designed for unfinanced cars that are over five-years old, and take advantage of even more affordable premiums. </p>
						</div>
					</li>
					<li>
						<p class="figure"></p>
						<div>
							<h3> Motor warranty insurance </h3>
							<p style="color:#3CB371"> Cover the costs of repairing your vehicle following a sudden or unexpected mechanical or electrical breakdown. </p>
						</div>
					</li>
					<li>
						<p class="figure"></p>
						<div>
							<h3> Make a claim </h3>
							<p style="color:#3CB371"> Making a claim is easy via the website or our friendly call centre. Find out everything you need to know in our How to claim section. </p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
<!-- javascript
    ================================================== -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
  
  <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../../assets/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="../../../assets/js/shared/off-canvas.js"></script>
    <script src="../../../assets/js/shared/misc.js"></script>
    <!-- endinject -->
</body>
</html>