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
  
  <title> Doctor Console </title>
  
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
                    <a class="nav-link" href="book_appointment_page"> Book Appointment </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/doctor_payments"> My Payments </a>
                  </li>
                </ul>
              </div>
            </li>
            <c:if test="${ user.roles == 'ADMIN, DOCTOR'}">
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <i class="menu-icon typcn typcn-document-add"></i>
                <span class="menu-title"> Registration </span>
                
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="/add_new_doctor"> Doctor </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/add_new_clerk"> Clerk </a>
                  </li>
                </ul>
              </div>
            </li>
            </c:if>
            <li class="nav-item">
              <a class="nav-link" href="/view_doctors">
                <i class="menu-icon typcn typcn-th-large-outline"></i>
                <span class="menu-title"> Doctors </span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/view_clerks">
                <i class="menu-icon typcn typcn-bell"></i>
                <span class="menu-title"> Clerk(s) </span>
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

          <a class="fa fa-home fa-10px text-gray-150 mt-2" style="text-decoration: none;" href="/"> Home </a>

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
            <h1 class="h3 mb-0 text-gray-800"> Health Center Management Console </h1>
          </div>
          <h6 class="m-0 font-weight-bold text-primary"> Send Patient Report (html or pdf) </h6>
          <hr>
          <form action="/files" method="post" id="send_report_form">
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label> Company </label>
                        <input type="text" class="form-control" placeholder="Company" name="company_name" value="Health Center Inc." disabled>
                      </div>
                    </div>
                    <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label> Doctor </label>
                        <input type="text" class="form-control" placeholder="Patient's Doctor" name="fname" value="${ appointment.doctor.fname }" disabled>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1"> Clerk </label>
                        <input type="text" class="form-control" placeholder="Clerk" name="clerk" value="${ appointment.clerk.fname }" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  	<div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label> Service Type </label>
                        <input type="text" class="form-control" placeholder="Service Type" name="service_type" value="${ services.serviceType }" disabled>
                      </div>
                    </div>
                    <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label> Patient's First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="fname" value="${ appointment.patient.fname }" disabled>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label>Patient's Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lname" value="${ appointment.clerk.fname }" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                     <textarea class="form-control" name="massage" id="doctor_massage" rows="5" placeholder="Doctor's prescription"></textarea>
                     <div class="validate"></div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label> Report Name () </label>
                        <input type="text" class="form-control" placeholder="Car Brand" name="report_name" id="report_name" value="${ appointment.patient.fname }${ appointment.appointmentId }">
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label> Total Cost </label>
                        <input type="text" class="form-control" placeholder="Total Cost" name="total_cost" id="total_cost" value="${ car.total_cost }">
                      </div>
                    </div>
                  </div>
                  <br>
                  
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <input type="hidden" class="btn btn-light btn-fw" name="appointmentId" value="${ appointment.appointmentId }">
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
            <span aria-hidden="true">×</span>
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
	var error_report_name = false;
	var error_message = false;
	
	$("#report_name").focusout(function() {
        check_report_name();
     });
	$("#total_cost").focusout(function() {
        check_total_cost();
     });
	$("#doctor_massage").focusout(function() {
        check_message();
     });
	
	function check_report_name() {
        var pattern = /^[0-9a-zA-Z\s]{1,30}[-]{0,1}[_]{0,1}[\s]*$/;
        var report_name = $("#report_name").val();
        if (pattern.test(report_name) && report_name !=='') {
           $("#report_name").css("border-bottom", "2px solid #34F458");
           error_report_name = false;
        } else {
           $("#report_name").css("border-bottom","2px solid #F90A0A");
           error_report_name = true;
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
	function check_message() {
		var message = $("#doctor_massage").val();
        if (message !=='') {
           $("#doctor_massage").css("border-bottom","2px solid #34F458");
           error_message = false;
        } else {
           $("#doctor_massage").css("border-bottom","2px solid #F90A0A");
           error_message = true;
        }
     }
	$("#send_report_form").submit(function() {
		error_total_cost = false;
		error_report_name = false;
		error_message = false;
		
	    check_report_name();
	    check_total_cost();
	    check_message();
		
       if (error_report_name === false && error_total_cost === false && error_message === false) {
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
