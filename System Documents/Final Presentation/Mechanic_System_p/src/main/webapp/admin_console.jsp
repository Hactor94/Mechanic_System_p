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
                    <a class="nav-link" href="/appointment"> Book Appointment </a>
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

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a id="bookings">
              <div class="card border-left-primary shadow h-100 py-2" id="b_hover">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-2"> New Cars </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"> ${ total_new_cars } </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-book fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>
            

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a id="consideration">
              <div class="card border-left-success shadow h-100 py-2" id="u_hover">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-2"> Under Consideration </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"> ${ total_under_con } </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-wrench fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a id="payments">
              <div class="card border-left-info shadow h-100 py-2" id="p_hover">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-2"> Pending Payments </div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"> ${ total_pending_payment } </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-window-close fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a id="collections">
              <div class="card border-left-warning shadow h-100 py-2" id="r_hover">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-2"> Ready To Collect </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"> ${ total_ready_cars } </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-car fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"> Client Overview </h6>
                </div>
                <!-- Card Body -->
                
                <div class="card-body" id="new_booking">
                  <div class="d-flex justify-content-between">
                     <h2 class="text-xs font-weight-bold text-primary text-uppercase mb-2"> New Cars </h2>
                  </div>
                  <div class="table-responsive">
                     <table class="table" id="table_bookings">
                       <thead class="thead-dark">
                         <tr>
                           <th> #ID </th>
                           <th> Client Name </th>
                           <th> Phone Number</th>
                           <th> Email </th>
                           <th id="address_new_th"> Address </th>
                           </tr>
                       </thead>
                       <c:forEach items="${new_cars}" var = "car">
                       <tbody>
                         <tr>
                           <td>${ car.carId }</td>
                           <td>${ car.booking.fname } ${ car.booking.lname }</td>
                           <td>${ car.booking.phone }</td>
                           <td>${ car.booking.email }</td>
                           <td id="address_new_td">${ car.booking.address_line1 }, ${ car.booking.city }, ${ car.booking.state }, ${ car.booking.zip }</td>
                         </tr>
                       </tbody>
                       </c:forEach>
                     </table>
                   </div>
                  </div>
                  
                  <div class="card-body mt-4" id="under_consideration">
                  <div class="d-flex justify-content-between">
                     <h2 class="text-xs font-weight-bold text-success text-uppercase mb-2"> Under Consideration </h2>
                  </div>
                  <div class="table-responsive">
                     <table class="table" id="table_consideration">
                       <thead class="thead-dark">
                         <tr>
                           <th> #ID </th>
                           <th> Client Name </th>
                           <th> Phone Number</th>
                           <th> Email </th>
                           <th id="address_under_th"> Address </th>
                           </tr>
                       </thead>
                       <c:forEach items="${car_consideration}" var = "considered">
                       <tbody>
                         <tr>
                           <td>${ considered.carId }</td>
                           <td>${ considered.booking.fname } ${ considered.booking.lname }</td>
                           <td>${ considered.booking.phone }</td>
                           <td>${ considered.booking.email }</td>
                           <td id="address_under_td">${ considered.booking.address_line1 }, ${ considered.booking.city }, ${ considered.booking.state }, ${ considered.booking.zip }</td>
                         </tr>
                       </tbody>
                       </c:forEach>
                     </table>
                   </div>
                  </div>
                    
                   <div class="card-body mt-4" id="pending_payment">
                  <div class="d-flex justify-content-between">
                     <h2 class="text-xs font-weight-bold text-info text-uppercase mb-2"> Pending Payments </h2>
                  </div>
                  <div class="table-responsive">
                     <table class="table" id="table_pending">
                       <thead class="thead-dark">
                         <tr>
                           <th> #ID </th>
                           <th> Client Name </th>
                           <th> Phone Number</th>
                           <th> Email </th>
                           <th id="address_pay_th"> Address </th>
                           </tr>
                       </thead>
                       <c:forEach items="${car_pending_payment}" var = "payment">
                       <tbody>
                         <tr>
                           <td>${ payment.carId }</td>
                           <td>${ payment.booking.fname } ${ payment.booking.lname }</td>
                           <td>${ payment.booking.phone }</td>
                           <td>${ payment.booking.email }</td>
                           <td id="address_pay_td">${ payment.booking.address_line1 }, ${ payment.booking.city }, ${ payment.booking.state }, ${ payment.booking.zip }</td>
                         </tr>
                       </tbody>
                       </c:forEach>
                     </table>
                   </div>
                  </div>
                   
                   <div class="card-body mt-4" id="ready_to_collect">
                  <div class="d-flex justify-content-between">
                     <h2 class="text-xs font-weight-bold text-warning text-uppercase mb-2"> Ready To Collect </h2>
                  </div>
                  <div class="table-responsive">
                     <table class="table" id="table_ready">
                       <thead class="thead-dark">
                         <tr>
                           <th> #ID </th>
                           <th> Client Name </th>
                           <th> Phone Number</th>
                           <th> Email </th>
                           <th id="address_ready_th"> Address </th>
                           </tr>
                       </thead>
                       <c:forEach items="${car_ready_for_collect}" var = "collect">
                       <tbody>
                         <tr>
                           <td>${ collect.carId }</td>
                           <td>${ collect.booking.fname } ${ collect.booking.lname }</td>
                           <td>${ collect.booking.phone }</td>
                           <td>${ collect.booking.email }</td>
                           <td id="address_ready_td">${ collect.booking.address_line1 }, ${ collect.booking.city }, ${ collect.booking.state }, ${ collect.booking.zip }</td>
                         </tr>
                       </tbody>
                       </c:forEach>
                     </table>
                   </div>
                  </div>
                </div>
              </div>
            
            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div id="placeholder">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary"> Car Overview </h6>
				</div>
				</div>
            <c:forEach items="${car}" var = "value">
            <div id="car${ value.carId }">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary"> Car Overview </h6>
					<form action="/assign_mechanic">
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<input type="hidden" name="carId" id="carId" value="${ value.carId }">
						<div class="dropdown-menu" aria-labelledby="userDropdown">
							<div class="dropdown-header text-center"> Status Actions </div>
							<c:if test="${ value.carStatus == 'New Car'}">
								<button class="dropdown-item" type="submit"> Take Job </button>
							</c:if>
							<c:if test="${ value.carStatus == 'Under Consideration'}">
								<button class="dropdown-item" type="submit" formaction="/send_report"> Send Report </button>
							</c:if>
							<c:if test="${ value.carStatus == 'Pending Payment'}">
								<button class="dropdown-item" type="submit" formaction="/confirm_payment"> Confirm Payment </button>
							</c:if>
							<c:if test="${ value.carStatus == 'Ready For Collection'}">
								<button class="dropdown-item" type="submit" formaction="/car_is_collected"> Collected </button>
							</c:if>
							<div class="dropdown-divider"></div>
							<button class="dropdown-item" type="submit" formaction="/remove_car"> Remove Car (Unfixed) </button>
						</div>
					</div>
					</form>
				</div>
				
				<!-- Card Body -->
					<div class="card-body">
						<h4 class="card-title text-center"> ${ value.booking.brand } ${ value.booking.model } ${ value.booking.car_year } </h4>
						<img class="img-profile mx-auto d-block" src="images/car_holder.jpg" alt="alt">
						<div class="wrapper">
                          <div class="d-flex w-100 pt-2 mt-4">
                            <p class="mb-0 font-weight-semibold"> Car Status </p>
                            <div class="wrapper ml-auto d-flex align-items-center">
                              <p class="mb-0"> ${ value.carStatus } </p>
                            </div>
                          </div>
                          <div class="d-flex w-100 pt-2">
                            <p class="mb-0 font-weight-semibold"> Service </p>
                            <div class="wrapper ml-auto d-flex align-items-center">
                              <p class="mb-0"> ${ value.booking.service_type } </p>
                            </div>
                          </div>
                          <div class="d-flex w-100 pt-2">
                            <p class="mb-0 font-weight-semibold"> Total Cost </p>
                            <div class="wrapper ml-auto d-flex align-items-center">
                              <p class="mb-0"> R${ value.total_cost } </p>
                            </div>
                          </div>
                          <div class="d-flex w-100 pt-2">
                            <p class="mb-0 font-weight-semibold"> Mechanic </p>
                            <div class="wrapper ml-auto d-flex align-items-center">
                              <p class="mb-0"> ${ value.mechanic.fname }</p>
                            </div>
                          </div>
                          <c:if test="${ value.proof != null}">
                          <div class="d-flex w-100 pt-2">
                            <p class="mb-0 font-weight-semibold"> Payment Proof </p>
                            <div class="wrapper ml-auto d-flex align-items-center">
                            <form action="/files" method="get">
                            <input type="hidden" name="file" id="file" value="${ value.proof }">
                              <button type="submit" class="btn btn-light btn-fw text-right">
								${ value.proof } <i class="fa fa-download text-right"></i>
							  </button>
							</form>
                            </div>
                          </div>
                          </c:if>
                        </div>	
						</div>
					</div>
				</c:forEach>
              </div>
            </div>
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
	$(document).ready(function(){
		$("#under_consideration").hide(); $("#pending_payment").hide(); $("#ready_to_collect").hide(); $("[id*='car']").hide();
		$("[id*='address']").hide();
		
		$("#bookings").click(function(){
			$("#new_booking").show();
			$("#under_consideration").hide(); $("#pending_payment").hide(); $("#ready_to_collect").hide();
		});
		$("#consideration").click(function(){
			$("#under_consideration").show(); 
			$("#new_booking").hide(); $("#pending_payment").hide(); $("#ready_to_collect").hide();
		});
		$("#payments").click(function(){
			$("#pending_payment").show(); 
			$("#new_booking").hide(); $("#under_consideration").hide(); $("#ready_to_collect").hide();
		});
		$("#collections").click(function(){
			$("#ready_to_collect").show(); 
			$("#new_booking").hide(); $("#under_consideration").hide(); $("#pending_payment").hide();
		});
		
		$("[id*='table'] tbody tr").click(function () {
			//get current row contents into an array
			var tableData = $(this).children("td").map(function() {
				return $(this).text();
			}).get();
			var id = tableData[0];
			
			$("#placeholder").hide();
			$("[id*='car']").hide();
			$("#car"+id).show();
		});
		
		$("[id*='table'] tbody tr").on("mouseenter", function(){
			$(this).css("background", "#cad1d9")
		});
		$("[id*='table'] tbody tr").on("mouseleave", function(){
			$(this).css("background", "white")
		});
		$("#b_hover").on("mouseenter", function(){
			$(this).css("background", "#cad1d9")
		});
		$("#b_hover").on("mouseleave", function(){
			$(this).css("background", "white")
		});
		$("#u_hover").on("mouseenter", function(){
			$(this).css("background", "#cad1d9")
		});
		$("#u_hover").on("mouseleave", function(){
			$(this).css("background", "white")
		});
		$("#p_hover").on("mouseenter", function(){
			$(this).css("background", "#cad1d9")
		});
		$("#p_hover").on("mouseleave", function(){
			$(this).css("background", "white")
		});
		$("#r_hover").on("mouseenter", function(){
			$(this).css("background", "#cad1d9")
		});
		$("#r_hover").on("mouseleave", function(){
			$(this).css("background", "white")
		});
	})
</script>
</body>
</html>
