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
            <c:if test="${ mechanic_user.roles == 'ADMIN, MECHANIC'}">
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${ mechanic_user.fname } ${ mechanic_user.lname } </span>
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

          <div class="row">
          <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"> Profile Summary </h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="author">
                  <a href="/user_profile">
                    <img class="img-profile rounded-circle mx-auto d-block mb-4" src="img/user_img.png" width="150" height="150">
                    <h5 class="title text-center"> ${ mechanic_user.fname } ${ mechanic_user.lname } </h5>
                  </a>
                  <p class="description text-center">
                    ${ mechanic_user.stuff_number }
                  </p>
                </div>
                <p class="description text-center">
                  I like the way you work it
                  No diggity 
                  I wanna bag it up
                </p>
                </div>
              </div>
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"> Team Members </h6>
                </div> 
                <!-- Card Body -->
                <div class="card-body">
                        <ul class="list-unstyled team-members">
                <c:forEach items="${mechanic_list}" var = "m">
                  <li>
                    <div class="row mb-2">
                      <div class="col-md-2 col-2">
                        <div class="avatar">
                          <img class="img-profile rounded-circle" src="img/user_img.png" width="50" height="50">
                        </div>
                      </div>
                      <div class="col-md-7 col-7">
                        ${ m.fname } ${ m.lname }
                        <br />
                        <span class="text-muted"><small> Offline </small></span>
                      </div>
                      <div class="col-md-3 col-3 text-right">
                        <button type="button" class="btn btn-icons btn-rounded btn-outline-success">
                            <i class="mdi mdi-email"></i>
                        </button>
                      </div>
                    </div>
                  </li>
					</c:forEach>
                </ul>                
                </div>
              </div>
            </div>
          
            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"> Edit Profile </h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <p style="color:red; font-size: 13px;"> ${ message } </p>
                  <form action="/edit_mechanic_profile" method="post" id="mechanic_profile">
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label> Company </label>
                        <input type="text" class="form-control" disabled placeholder="Company" name="company_name" value="Car-Repair-Shop Inc.">
                      </div>
                    </div>
                    <div class="col-md-3 px-1">
                      <div class="form-group">
                        <label> Staff Number </label>
                        <input type="hidden" class="form-control" placeholder="Stuff Number" name="stuff_number" id="stuff_number" value="${ mechanic_user.stuff_number }">
                        <input type="text" class="form-control" disabled placeholder="Stuff Number" name="stuff_number" id="stuff_number" value="${ mechanic_user.stuff_number }">
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" placeholder="Email" name="email" id="email" value="${ mechanic_user.email }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="fname" id ="fname" value="${ mechanic_user.fname }">
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lname" id="lname" value="${ mechanic_user.lname }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label> Date Of Birth </label>
                        <input type="date" class="form-control" placeholder="Date Of Birth " name="date_of_birth" id="date_of_birth" value="${ mechanic_user.date_of_birth }">
                      </div>
                    </div>
                    <div class="col-md-4 px-5">
                        <label> Gender
							<select class="form-control" name="gender" id="gender">
								<option value="${ mechanic_user.gender }" selected>${ mechanic_user.gender }</option>
								<option value="Male"> Male </option>
								<option value="Female"> Female </option>
								<option value="Other"> Other </option>
							</select>
						</label>
                      </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label> Phone Number </label>
                        <input type="text" class="form-control" placeholder="Phone Number" name="phone" id="phone" value="${ mechanic_user.phone }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label> About Me </label>
                        <textarea class="form-control textarea"> </textarea>
                      </div>
                    </div>
                  </div>
                  <input type="hidden" name="password" id="password" value="${ mechanic_user.password }">
                  <input type="hidden" name="roles" id="roles" value="${ mechanic_user.roles }">
                  <input type="hidden" name="permissions" id="permissions" value="${ mechanic_user.permissions }">
                  <input type="hidden" name="active" id="active" value="${ mechanic_user.active }">
                  <input type="hidden" name="terms" id="terms" value="${ mechanic_user.terms }">
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round"> Update Profile </button>
                    </div>
                  </div>
                </form>
                </div>
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
</div>
</div>
<script>
      $(function() {
         var error_fname = false;
         var error_lname = false;
         var error_stuff_number = false;
         var error_date = false;
         var error_phone = false;
         var error_email = false;
         var error_gender = false;

         $("#fname").focusout(function(){
            check_fname();
         });
         $("#lname").focusout(function() {
            check_lname();
         });
         $("#stuff_number").focusout(function() {
             check_stuff_number();
          });
         $("#date_of_birth").focusout(function() {
             check_date();
          });
         $("#phone").focusout(function() {
             check_phone();
          });
         $("#email").focusout(function() {
            check_email();
         });
         $("#gender").focusout(function() {
             check_gender();
          });

         function check_fname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#fname").val();
            if (pattern.test(fname) && fname !== '') {
               error_fname = false;
            } else {
               $("#fname").css("border-bottom","2px solid #F90A0A");
               error_fname = true;
            }
         }

         function check_lname() {
            var pattern = /^[a-zA-Z]*$/;
            var lname = $("#lname").val()
            if (pattern.test(lname) && lname !== '') {
               error_lname = false;
            } else {
               $("#lname").css("border-bottom","2px solid #F90A0A");
               error_lname = true;
            }
         }
         
         function check_stuff_number() {
             var pattern = /^[0-9]*$/;
             var stuff_number = $("#stuff_number").val();
             if (pattern.test(stuff_number) && stuff_number !=='') {
                error_stuff_number = false;
             } else {
                $("#stuff_number").css("border-bottom","2px solid #F90A0A");
                error_stuff_number = true;
             }
          }
         
         function check_date() {
        	 var today = new Date();
        	 var dob = new Date($("#date_of_birth").val()); 
             if (today.getFullYear() > dob.getFullYear() && dob !== '' && (today.getFullYear() - dob.getFullYear()) > 16) {
                error_date = false;
             } else {
                $("#date_of_birth").css("border-bottom","2px solid #F90A0A");
                error_date = true;
             }
          }
         
         function check_phone() {
             var pattern = /^[0-9]*$/;
             var phone_number = $("#phone").val();
             if (pattern.test(phone_number) && phone_number !=='' && phone_number.length === 10 && phone_number.substr(0, 1) == 0) {
                error_phone = false;
             } else {
                $("#phone").css("border-bottom","2px solid #F90A0A");
                error_phone = true;
             }
          }
         
         function check_email() {
             var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
             var email = $("#email").val();
             if (pattern.test(email) && email !== '') {
                error_email = false;
             } else if (email == ''){
            	 $("#email").css("border-bottom","2px solid #F90A0A");
                 error_email = true;
             } else {
            	$("#email_error_message").html("Invalid email");
            	$("#email_error_message").css("color", "red");
                $("#email_error_message").show();
                $("#email").css("border-bottom","2px solid #F90A0A");
                error_email = true;
             }
          }
         
         function check_gender() {
             var gender = $("#gender").val();
             if (gender !== '') {
                error_gender = false;
             } else {
                $("#gender").css("border-bottom","2px solid #F90A0A");
                error_gender = true;
             }
          }
          
         $("#mechanic_profile").submit(function() {
        	 error_fname = false;
             error_lname = false;
             error_stuff_number = false;
             error_date = false;
             error_phone = false;
             error_email = false;
             error_gender = false;
             
        	 check_fname();
             check_lname();
             check_stuff_number();
             check_date();
             check_phone();
             check_email();
             check_gender();
             
            if (error_fname === false && error_lname === false && error_stuff_number === false && error_email === false 
            		&& error_date === false && error_phone === false && error_gender === false) {
            	alert("Click 'Ok' to confirm");
               return true;
            } else {
            	alert("Please fill the form correctly");
            	return false;
            }
         });
      });
</script>
</body>
</html>
