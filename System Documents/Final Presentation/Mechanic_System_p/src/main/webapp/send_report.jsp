<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title> Admin Console </title>
  
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  
  <!-- plugins:css -->
    <link rel="stylesheet" href="../assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../assets/vendors/iconfonts/ionicons/css/ionicons.css">
    <link rel="stylesheet" href="../assets/vendors/iconfonts/typicons/src/font/typicons.css">
    <link rel="stylesheet" href="../assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.addons.css">
    
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="../assets/images/favicon.png" />
    
    <!-- Core plugin JavaScript-->
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
  
    <!-- Sidebar -->
	<!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
                  <a class="navbar-brand brand-logo" href="view.jsp">
                    <img src="images/logo1.png"  width="180" height="60"> 
                   </a>
               </div>
            </li>
            <li class="nav-item nav-category">Main Menu</li>
            <li class="nav-item">
              <a class="nav-link" href="/direct_to_dashboard">
                <i class="menu-icon typcn typcn-document-text"></i>
                <span class="menu-title"> Dashboard </span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="menu-icon typcn typcn-coffee"></i>
                <span class="menu-title"> Bookings </span>
                
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="book_appointment.jsp"> Book Appointment </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/client_bookings"> All Bookings </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/payments"> Payments </a>
                  </li>
                </ul>
              </div>
            </li>
            <c:if test="${ user.roles == 'ADMIN, MECHANIC'}">
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <i class="menu-icon typcn typcn-document-add"></i>
                <span class="menu-title"> Registration </span>
                
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="/add_new_mechanic"> Mechanic </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/add_new_insurance"> Insurance Company </a>
                  </li>
                </ul>
              </div>
            </li>
            </c:if>
            <li class="nav-item">
              <a class="nav-link" href="/view_mechanics">
                <i class="menu-icon typcn typcn-th-large-outline"></i>
                <span class="menu-title"> Mechanics </span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/view_insurances">
                <i class="menu-icon typcn typcn-bell"></i>
                <span class="menu-title"> Insurance Companies </span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="user_profile">
                <i class="menu-icon typcn typcn-user-outline"></i>
                <span class="menu-title"> My Profile </span>
              </a>
            </li>
            
          </ul>
        </nav>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            

            <!-- Nav Item - Messages -->
            

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${ user.fname } ${ user.lname } </span>
                <img class="img-profile rounded-circle" src="img/user_img.png">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/user_profile">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" type="submit" href="/logout">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>
        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"> Car-Repair-Shop Management Console </h1>
          </div>
          <h6 class="m-0 font-weight-bold text-primary"> Send Report (html or pdf) </h6>
          <hr>
          <form action="/files" method="post" id="send_report_form">
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label> Company </label>
                        <input type="text" class="form-control" placeholder="Company" name="company_name" value="Car-Repair-Shop Inc." disabled>
                      </div>
                    </div>
                    <div class="col-md-3 px-1">
                      <div class="form-group">
                        <label> Mechanic </label>
                        <input type="text" class="form-control" placeholder="Mechanic Name" name="fname" value="${ car.mechanic.fname }" disabled>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1"> Insurance </label>
                        <input type="text" class="form-control" placeholder="Insurance: it can be null" name="company_name" value="${ car.insurance.company_name }" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="fname" value="${ car.booking.fname }" disabled>
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lname" value="${ car.booking.lname }" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label> Service Type </label>
                        <input type="text" class="form-control" placeholder="Service Type" name="service_type" value="${ car.booking.service_type }" disabled>
                      </div>
                    </div>
                    <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label> Report Name (Car Model) </label>
                        <input type="text" class="form-control" placeholder="Car Brand" name="brand" id="brand" value="${ car.booking.brand }">
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label> Total Cost </label>
                        <input type="text" class="form-control" placeholder="Total Cost" name="total_cost" id="total_cost" value="${ car.total_cost }">
                      </div>
                    </div>
                  </div>
                  <br>
                  
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <input type="hidden" class="btn btn-light btn-fw" name="carId" value="${ car.carId }">
                      <button type="submit" class="btn btn-primary btn-round" name="reportFormat" value="pdf"> Send Report (pdf)  </button>
                      <button type="submit" class="btn btn-primary btn-round"name="reportFormat" value="html" > Send Report (html) </button>
                    </div>
                  </div>
                </form>
                <br>
          </div>

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span> Admin Console Footer </span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">�</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>
  
<script>
$(function() {
	var error_total_cost = false;
	var error_brand = false;
	
	$("#brand").focusout(function() {
        check_brand();
     });
	$("#total_cost").focusout(function() {
        check_total_cost();
     });
	
	function check_brand() {
        var pattern = /^[a-zA-Z\s]{1,30}[-]{0,1}[_]{0,1}[\s]*$/;
        var brand = $("#brand").val();
        if (pattern.test(brand) && brand !=='') {
           $("#brand").css("border-bottom", "2px solid #34F458");
           error_brand = false;
        } else {
           $("#brand").css("border-bottom","2px solid #F90A0A");
           error_brand = true;
        }
     }
	function check_total_cost() {
        var pattern = /^[0-9\.]*$/;
        var year = $("#total_cost").val();
        if (pattern.test(year) && year !=='') {
           $("#total_cost").css("border-bottom","2px solid #34F458");
           error_total_cost = false;
        } else {
           $("#total_cost").css("border-bottom","2px solid #F90A0A");
           error_total_cost = true;
        }
     }
	$("#send_report_form").submit(function() {
		error_total_cost = false;
		error_brand = false;
   	 	
	    check_brand();
	    check_total_cost();
		
       if (error_brand === false && error_total_cost === false) {
       	alert("Report Sent Successfully");
          return true;
       } else {
       	alert("Please Enter 'Report Name' and 'Total Cost' Correctly");
       	return false;
       }
    });
});
</script>
</body>
</html>
