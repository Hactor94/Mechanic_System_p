<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title> Book An Appointment </title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
	<!-- Core plugin JavaScript-->
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
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
					<span style="float:right; color:red"> ( * ) Required</span>  
					<form action="/book_appointment" id="booking_form">
						<h4>fill in your contact details </h4>
						<div class="form1">
							<label for="fname"> <span>first name * </span>
								<input type="text" name="fname" id="fname">
							</label>
							<label for="lname"> <span>last name * </span>
								<input type="text" name="lname" id="lname">
							</label>
							<label for="email3"> <span>email address * </span>
								<input type="email" name="email" id="email3">  
							</label>
							<label for="phone"> <span>phone number *</span>
								<input type="text" name="phone" id="phone">
							</label>
							<label for="address1"> <span>address line 1 * </span>
								<input type="text" name="address_line1" id="address1">
							</label>
							<div>
								<label for="city"> <span>city * </span>
									<select name="city" id="city">
										<option value=""> </option>
										<option value="Pretoria"> Pretoria </option>
										<option value="Johannesburg"> Johannesburg </option>
										<option value="Piet Retief"> Piet Retief </option>
										<option value="Other"> Other </option>
									</select>
								</label>
								<label for="state"> <span>state * </span>
									<select name="state" id="state">
										<option value="">  </option>
										<option value="South Africa"> South Africa </option>
										<option value="Other State"> Other State </option>
									</select>
								</label>
							</div>
							<label for="address2"> <span>address line 2</span>
								<input type="text" name="address_line2" id="address2">
							</label>
							<label for="zip"> <span> zip code * </span> 
								<input type="text" name="zip" id="zip_code"> 
							</label>
						</div>
						<h4>fill in details about your vehicle</h4>
						<div class="form2">
							<div>
								<label for="brand"> <span>brand * </span>
									<input type="text" name="brand" id="brand">
								</label>
								<label for="model"> <span>model * </span>
									<input type="text" name="model" id="model">
								</label>
								<label for="year"> <span>year * </span>
									<input type="text" name="car_year" id="year">
								</label>
								
								<label for="state"> <span> Insurance </span>
									<select name="insurance" id="state">
										<option value="0"> </option>
										<c:forEach items="${insurance}" var = "value">
											<option value="${ value.reg_number }"> ${ value.company_name } </option>
										</c:forEach>
									</select>
								</label>
							</div>
							<label for="confirm" id="confirm2"> <span>If needed, are you ok with leaving your vehicle for the day? (Yes or No) * </span>
								<input type="text" name="sleep_over" id="confirm">
							</label>
							<label> <span>Type Of Service</span>
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
<script>
	$(function() {
         var error_fname = false;
         var error_lname = false;
         var error_phone = false;
         var error_email3 = false;
         var error_address1 = false;
         var error_address2 = false;
         var error_city = false;
         var error_state = false;
         var error_zip_code = false;
         var error_brand = false;
         var error_model = false;
         var error_year = false;
         var error_confirm = false;

         $("#fname").focusout(function(){
             check_fname();
          });
          $("#lname").focusout(function() {
             check_lname();
          });
         $("#phone").focusout(function() {
             check_phone();
          });
         $("#email3").focusout(function() {
            check_email3();
         });
         $("#address1").focusout(function() {
             check_address1();
          });
         $("#address2").focusout(function() {
             check_address2();
          });
         $("#city").focusout(function() {
             check_city();
          });
         $("#state").focusout(function() {
             check_state();
          });
         $("#zip_code").focusout(function() {
             check_zip_code();
          });
         $("#brand").focusout(function() {
             check_brand();
          });
         $("#model").focusout(function() {
             check_model();
          });
         $("#year").focusout(function() {
             check_year();
          });
         $("#confirm").focusout(function() {
             check_confirm();
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
          
           function check_phone() {
             var pattern = /^[0-9]*$/;
             var phone_number = $("#phone").val();
             if (pattern.test(phone_number) && phone_number !=='' && phone_number.length === 10 && phone_number.substr(0, 1) == 0) {
                $("#phone").css("border-bottom","none");
                error_phone = false;
             } else {
                $("#phone").css("border-bottom","2px solid #F90A0A");
                error_phone = true;
             }
          }
         
          function check_address1() {
             var pattern = /^[a-zA-Z0-9\s]*$/;
             var address1 = $("#address1").val();
             if (pattern.test(address1) && address1 !=='') {
                $("#address1").css("border-bottom","none");
                error_address1 = false;
             } else {
                $("#address1").css("border-bottom","2px solid #F90A0A");
                error_address1 = true;
             }
          }
          
          function check_address2() {
              var pattern = /^[a-zA-Z0-9\s]*$/;
              var address2 = $("#address2").val();
              if (pattern.test(address2)) {
                 $("#address2").css("border-bottom","none");
                 error_address2 = false;
              } else {
                 $("#address2").css("border-bottom","2px solid #F90A0A");
                 error_address2 = true;
              }
           }
         
         function check_city() {
             var city = $("#city").val();
             if (city !=='') {
                $("#city").css("border-bottom","none");
                error_city = false;
             } else {
                $("#city").css("border-bottom","2px solid #F90A0A");
                error_city = true;
             }
          }
         
         function check_state() {
             var state = $("#state").val();
             if (state !=='') {
                $("#state").css("border-bottom","none");
                error_state = false;
             } else {
                $("#state").css("border-bottom","2px solid #F90A0A");
                error_state = true;
             }
          }
         
         function check_zip_code() {
             var pattern = /^[0-9]*$/;
             var zip_code = $("#zip_code").val();
             if (pattern.test(zip_code) && zip_code !=='' && zip_code.length === 4) {
                $("#zip_code").css("border-bottom","none");
                error_zip_code = false;
             } else {
                $("#zip_code").css("border-bottom","2px solid #F90A0A");
                error_zip_code = true;
             }
          }
         
         function check_brand() {
             var pattern = /^[a-zA-Z\s]{1,30}[-]{0,1}[_]{0,1}[\s]*$/;
             var brand = $("#brand").val();
             if (pattern.test(brand) && brand !=='') {
                $("#brand").css("border-bottom", "none");
                error_brand = false;
             } else {
                $("#brand").css("border-bottom","2px solid #F90A0A");
                error_brand = true;
             }
          }
         
         function check_model() {
             var pattern = /^[a-zA-Z0-9\s]{1,30}[-]{0,1}[_]{0,1}[\s]*$/;
             var model = $("#model").val();
             if (pattern.test(model) && model !=='') {
                $("#model").css("border-bottom", "none");
                error_model = false;
             } else {
                $("#model").css("border-bottom","2px solid #F90A0A");
                error_model = true;
             }
          }
         
         function check_year() {
             var pattern = /^[0-9]*$/;
             var year = $("#year").val();
             if (pattern.test(year) && year !=='' && year.length === 4) {
                $("#year").css("border-bottom","none");
                error_year = false;
             } else {
                $("#year").css("border-bottom","2px solid #F90A0A");
                error_year = true;
             }
          }
         
         function check_confirm() {
        	 var confirm = $("#confirm").val();
             if (confirm === 'Yes' || confirm === 'No' || confirm === 'yes' || confirm === 'no' || confirm === 'YES' || confirm === 'NO') {
            	 $("#confirm").css("border-bottom","none");
            	 error_confirm = false;
             } else {
            	 $("#confirm").css("border-bottom","2px solid #F90A0A");
            	 error_confirm = true;
             }
          }
          
         $("#booking_form").submit(function() {
        	 error_fname = false;
             error_lname = false;
             error_phone = false;
             error_email3 = false;
             error_address1 = false;
             error_city = false;
             error_state = false;
             error_zip_code = false;
             error_brand = false;
             error_model = false;
             error_year = false;
             error_confirm = false;

             check_fname();
             check_lname();
             check_phone();
             check_email3();
             check_address1();
             check_city();
             check_state();
             check_zip_code();
             check_brand();
             check_model();
             check_year();
             check_confirm();
             
            if (error_fname === false && error_lname === false && error_phone === false && error_email3 === false && 
            		error_address1 === false && error_city === false && error_state === false && error_zip_code === false && 
            		error_brand === false && error_model === false && error_year === false && error_confirm === false) {
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