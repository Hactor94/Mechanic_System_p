<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title> Book An Appointment </title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
	<!-- Core plugin JavaScript-->
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/"> Health Center </a></h1>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/"> Home </a></li>
        </ul>
      </nav><!-- .nav-menu -->

     <a href="registration.jsp" class="appointment-btn scrollto"> Register </a>
	<a href="/direct_to_dashboard" class="appointment-btn scrollto"> Login </a>
    </div>
  </header> <!-- End Header -->

	<div id="body">
		<div class="content">
			<div class="section">
				<div class="booking">
					<h2> BOOK AN APPOINTMENT </h2> 
					<span style="float:right; color:red"> ( * ) Required</span>  
					<form action="/book_appointment" id="booking_form">
						<h4> Your details </h4>
						<div class="form1">
							<label for="fname"> <span> first name * </span>
								<input type="text" name="fname" id="fname">
							</label>
							<label for="lname"> <span>last name * </span>
								<input type="text" name="lname" id="lname">
							</label>
							<label for="email3"> <span> email address * </span>
								<input type="email" name="email" id="email3">  
							</label>
							<label for="phone"> <span> Date of Birth *</span>
								<input type="Date" name="dob" id="dob">
							</label>
							<label for="address1"> <span> Phone Number * </span>
								<input type="text" name="phone" id="address1">
							</label>
							
							<label for="address1"> <span> Alt Phone Number (Optional) </span>
								<input type="text" name="alt_phone" id="alt_phone">
							</label>
							
							<label for="zip"> <span> File Number (Optional) </span> 
								<input type="text" name="fileNumber" id="file_number"> 
							</label>
						</div>
						<h4> Appointment Details </h4>
						<div class="form1">
							<label for="address1"> <span> Appointment Date * </span>
								<input type="Date" name="appointmentDate" id="address2">
							</label>
							<label for="address1"> <span> Select  Doctor * </span>
								<select name="doctor" id="schedule">
									<option value=""> </option>
									<c:forEach items="${ doctors }" var="doctor">
										<option value="${ fn:substring(doctor.fname,0,1)} ${ doctor.lname }"> Dr ${ fn:substring(doctor.fname,0,1)} ${ doctor.lname }</option>
									</c:forEach>
							</select>
							</label>
							
							<label for="message2"> <span>Leave us a short message (Optional)</span>
								<textarea name="message" id="message2" cols="30" rows="10"></textarea>
							</label>
						</div>
						<button type="submit" class="btn btn-primary btn-round mt-4"> Book Appointment </button>
					</form>
				</div>
			</div>
			<div class="sidebar">
				<div class="contact">
					<div>
						<a href="gallery.html"><img src="assets/img/General.jfif" alt=""></a>
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
							<b> email: </b> <span> info@healthcenter.com </span>
						</li>
					</ul>
				</div>
				<div class="featured">
					<h3> services </h3>
					<ul>
						<li>
							 * General Practitioner 
						</li>
						<li>
							  * Dentist
						</li>
						<li>
							 * Nephrologist
						</li>
						<li>
							 * Neurologist
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
         var error_fname = false;
         var error_lname = false;
         var error_email3 = false;
         var error_dob = false;
         var error_address1_phone = false;
         var error_alt_phone = false;
         var error_address2_Date = false;
         var error_schedule_Doctor = false;
         var error_file_number = false;

         $("#fname").focusout(function(){
             check_fname();
          });
          $("#lname").focusout(function() {
             check_lname();
          });
          $("#email3").focusout(function() {
              check_email3();
          });
          $("#dob").focusout(function() {
              check_dob();
          });
         $("#address1").focusout(function() {
             check_phone();
          });
         $("#alt_phone").focusout(function() {
             check_alt_phone();
          });
         $("#file_number").focusout(function() {
             check_file_number();
          });
         $("#address2").focusout(function() {
             check_appointment_date();
          });
         $("#schedule").focusout(function() {
             check_doctor();
          });

         function check_fname() {
             var pattern = /^[a-zA-Z]*$/;
             var fname = $("#fname").val();
             if (pattern.test(fname) && fname !== '') {
                $("#fname").css("border-bottom", "none");
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
                $("#lname").css("border-bottom","none");
                error_lname = false;
             } else {
                $("#lname").css("border-bottom","2px solid #F90A0A");
                error_lname = true;
             }
          }
          
          function check_email3() {
              var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
              var email = $("#email3").val();
              if (pattern.test(email) && email !=='') {
                 $("#email3").css("border-bottom","none");
                 error_email3 = false;
              } else {
                $("#email3").css("border-bottom","2px solid #F90A0A");
                error_email3 = true;
              }
           }
          
          function check_dob() {
         	 var today = new Date();
         	 var dob = new Date($("#dob").val()); 
              if (today.getFullYear() > dob.getFullYear() && dob !== '') {
                 $("#dob").css("border-bottom","2px solid #34F458");
                 error_date = false;
              } else {
                 $("#dob").css("border-bottom","2px solid #F90A0A");
                 error_date = true;
              }
           }
          
          function check_appointment_date() {
          	 var today = new Date();
          	 var dob = new Date($("#address2").val()); 
               if (today <= dob && dob !== '') {
                  $("#address2").css("border-bottom","2px solid #34F458");
                  error_address2_Date = false;
               } else {
                  $("#address2").css("border-bottom","2px solid #F90A0A");
                  error_address2_Date = true;
               }
            }
          
           function check_phone() {
             var pattern = /^[0-9]*$/;
             var phone_number = $("#address1").val();
             if (pattern.test(phone_number) && phone_number !=='' && phone_number.length === 10 && phone_number.substr(0, 1) == 0) {
                $("#address1").css("border-bottom","none");
                error_address1_phone = false;
             } else {
                $("#address1").css("border-bottom","2px solid #F90A0A");
                error_address1_phone = true;
             }
          }
          
           function check_alt_phone() {
               var pattern = /^[0-9]*$/;
               var phone_number = $("#alt_phone").val();
               if (pattern.test(phone_number) && phone_number.length === 10 && phone_number.substr(0, 1) == 0) {
                  $("#alt_phone").css("border-bottom","none");
                  error_alt_phone = false;
               } else if (phone_number === '') {
            	   $("#alt_phone").css("border-bottom","none");
                   error_alt_phone = false;
               } 
               else  {
                  $("#alt_phone").css("border-bottom","2px solid #F90A0A");
                  error_alt_phone = true;
               }
            }
         
           function check_file_number() {
               var pattern = /^[a-zA-Z0-9]*$/;
               var address2 = $("#file_number").val();
               if (pattern.test(address2)) {
                  $("#file_number").css("border-bottom","none");
                  error_file_number = false;
               } else {
                  $("#file_number").css("border-bottom","2px solid #F90A0A");
                  error_file_number = true;
               }
            }
         
         function check_doctor() {
             var doctor = $("#schedule").val();
             if (doctor !=='') {
                $("#schedule").css("border-bottom","none");
                error_schedule_Doctor = false;
             } else {
                $("#schedule").css("border-bottom","2px solid #F90A0A");
                error_schedule_Doctor = true;
             }
          }
     
         $("#booking_form").submit(function() {
        	 error_fname = false;
             error_lname = false;
             error_email3 = false;
             error_dob = false;
             error_address1_phone = false;
             error_alt_phone = false;
             error_address2_Date = false;
             error_schedule_Doctor = false;
             error_file_number = false;
             
             check_fname();
             check_lname();
             check_email3();
             check_dob();
             check_phone();
             check_alt_phone();
             check_file_number();
             check_appointment_date();
             check_doctor();
                 
            if (error_fname === false && error_lname === false && error_email3 === false && error_dob === false && 
            		error_address1_phone === false && error_alt_phone === false && error_address2_Date === false && 
            		error_schedule_Doctor === false && error_file_number === false) {
            	alert("Click 'Ok' to complete booking");
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