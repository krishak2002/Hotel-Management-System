<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Mr Hotel a Hotel Category Flat Bootstrap Responsive  Website Template | Rooms :: w3layouts</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="js/Razorpay.js" type="text/javascript"></script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>



<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

<script src="js/jquery-1.11.0.min.js"></script>

<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mr Hotel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> 
<link href='//fonts.googleapis.com/css?family=Hind:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Aladin' rel='stylesheet' type='text/css'>


                
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>

        
<script src="js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@include file="Header.jsp" %>

<%
        String detailid = (String) request.getParameter("detailid");
        String stdate = (String) request.getParameter("from");
        String enddate = (String) request.getParameter("to");
        String grandtotal = (String) request.getParameter("grandtotal");

%>
       <script>
           var detailid = "<%=detailid%>";
            var grandtotal = "<%=grandtotal%>";
            var stdate = "<%=stdate%>";
            var enddate = "<%=enddate%>";
            
            function onlinepayment()
            {
            var formdata = new FormData();
            formdata.append("detailid", detailid);
            formdata.append("grandtotal", grandtotal);
            formdata.append("stdate", stdate);
            formdata.append("enddate", enddate);
            
            var url = "./onlinepayment";
            
            fetch(url, {method: "POST", body: formdata})
                    .then(response => response.text())
                    .then(ans => renderAns(ans));
            }
             
           function renderAns(ans){
        if(ans === "success")
        {
             Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Payment done successfully!'
                            }).then(function () {
                                 window.location = "payment_done_icon.jsp";
                            });
        }
        
        else
        {
           Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Payment not successfull !'
                    });
        }            
    }
       </script>
       <script>
           var detailid = "<%=detailid%>";
            var grandtotal ="<%=grandtotal%>";
            var stdate = "<%=stdate%>";
            var enddate = "<%=enddate%>";
            
            function cashpayment()
            {
            var formdata = new FormData();
            formdata.append("detailid", detailid);
            formdata.append("grandtotal", grandtotal);
            formdata.append("stdate", stdate);
            formdata.append("enddate", enddate);
            
            var url = "./cashpayment";
            
            fetch(url, {method: "POST", body: formdata})
                    .then(response => response.text())
                    .then(ans => renderCash(ans));
            }
             function renderCash(ans)
            {
                
                 if(ans === "success"){
          Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Pament Done Successfully!'
                            }).then(function () {
                                 window.location = "index.jsp";
                            });
        }
        else{
            Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Payment not done !'
                    });
        }
            }
       </script>
       
       <script>


            function paymentlogic()
            {

                var options = {
                    "key": "rzp_test_96HeaVmgRvbrfT",
                    "amount": grandtotal + "00",
                    "name": "Project Name",
                    "description": "",
                    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOmghn1er2yRA0yXfMRmroSSpWEdAGNV5KHg&usqp=CAU",
                    "handler": function (response) {

                        if (response.razorpay_payment_id == "" || response.razorpay_payment_id == undefined) {

                            window.location.href = "payment_action?status=failed";
                            // paymentfail(authormobile,"Payment failed!");

                            alert("Payment Failed")

                        } else {
//success
onlinepayment();
                            //payment success
                            //call your book payment function here
                        }
                    },
                    "prefill": {
                        "name": "",
                        "email": ""
                    },
                    "notes": {
                        "address": ""
                    },
                    "theme": {
                        "color": "#F37254"
                    },
                    "modal": {
                        "ondismiss": function () {
                            $("#statusmodal").modal("show");
                            document.getElementById("status").innerHTML = "Payment failed ! Try again";
                        }
                    }
                };



                var rzp1 = new Razorpay(options);
                rzp1.on('payment.failed', function (response) {
                    console.log("a2");
                    console.log(response.error.code);

                    alert("Payment Failed");


                    // paymentfail(authormobile,"Payment failed!");
                    // rzp1.close();
                    // alert(response.error.code);
                    // alert(response.error.description);
                    // alert(response.error.source);
                    // alert(response.error.step);
                    // alert(response.error.reason);
                    // alert(response.error.metadata.order_id);
                    // alert(response.error.metadata.payment_id);

                });
                rzp1.open();
            }

        </script>
        
        <script>
            function checkDates()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        if (res == "success")
                        {
                            Swal.fire(
                                    'Choose Mode of payment!'
                                    );
                        } else
                        {
                            Swal.fire(
                                    'Dates Already Booked',
                                    'Choose Another Dates...',
                                    'Error Occured!'
                                    ).then(function () {
                               window.location.href="userShowSingleAirbnbDetails.jsp?detailid=" + detailid;
                            });
                        }

                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./UserCheckDatesServlet?detailid=" + detailid + "&startdate=" + stdate + "&enddate=" + enddate, true);

                //3. Send Request
                xhttp.send();
            }
        </script>
       
</head>
<body onload="checkDates()" >
<!--header-top start here-->
<!--<div class="top-header">
	<div class="container">
		<div class="top-header-main">
			<div class="col-md-4 top-social wow bounceInLeft" data-wow-delay="0.3s">
			    <ul>
			    	<li><h5>Follow Us :</h5></li>
			    	<li><a href="#"><span class="fb"> </span></a></li>
			    	<li><a href="#"><span class="tw"> </span></a></li>
			    	<li><a href="#"><span class="in"> </span></a></li>
			    	<li><a href="#"><span class="gmail"> </span></a></li>
			    </ul>
			</div>
			<div class="col-md-8 header-address wow bounceInRight" data-wow-delay="0.3s">
				<ul>
					<li><span class="phone"> </span> <h6>(220) 280-31589</h6></li>
					<li><span class="email"> </span><h6><a href="mailto:info@example.com">Youremail@gmail.com</a></h6></li>
				</ul>
			</div>
		  <div class="clearfix"> </div>
		</div>
	</div>
</div>-->
<!--header-top end here-->

<!--        <div class="top-header">
                <div class="container">
                        <div class="top-header-main">
                                <div class="col-md-4 top-social wow bounceInLeft" data-wow-delay="0.3s">
                                    <ul>
                                        <li><h5>Follow Us :</h5></li>
                                        <li><a href="#"><span class="fb"> </span></a></li>
                                        <li><a href="#"><span class="tw"> </span></a></li>
                                        <li><a href="#"><span class="in"> </span></a></li>
                                        <li><a href="#"><span class="gmail"> </span></a></li>
                                    </ul>
                                </div>
                                <div class="col-md-8 header-address wow bounceInRight" data-wow-delay="0.3s">
                                        <ul>					
                                                <li><span class="phone"> </span> <h6>(220) 280-31589</h6></li>
                                                <li><span class="email"> </span><h6><a href="mailto:info@example.com">Youremail@gmail.com</a></h6></li>
                                        </ul>
                                </div>
                          <div class="clearfix"> </div>
                        </div>
                </div>
        </div>-->
<!--header start here-->
	<!-- NAVBAR
		================================================== -->
<!--<div class="header">
	<div class="fixed-header">	

		    <div class="navbar-wrapper">
		      <div class="container">
		        <nav class="navbar navbar-inverse navbar-static-top">
		             <div class="navbar-header">
			              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			                <span class="sr-only">Toggle navigation</span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			              </button>
			              <div class="logo wow slideInLeft" data-wow-delay="0.3s">
			                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" /></a>
			              </div>
			          </div>
		            <div id="navbar" class="navbar-collapse collapse">
		            <nav class="cl-effect-16" id="cl-effect-16">
		              <ul class="nav navbar-nav">
		               <li><a  href="index.html" data-hover="Home">Home</a></li>
		                <li><a href="about.html" data-hover="About">About</a></li>
						<li><a href="services.html" data-hover="Services">Services</a></li>
						<li><a class="active" href="room.html" data-hover="Rooms">Rooms</a></li>
						<li><a href="shortcodes.html" data-hover="Shortcodes">Shortcodes</a></li>
						<li><a href="contact.html" data-hover="Contact">Contact</a></li>						
		              </ul>
		            </nav>

		            </div>
		            <div class="clearfix"> </div>
		             </nav>
		          </div>
		           <div class="clearfix"> </div>
		    </div>
	 </div>
</div>-->    
<!--header end here-->
<!--room start here-->
<!--<div class="rooms">
-->	<div class="container">
		<div class="rooms-main">
			 <div class="room-head">
                             <br><br><h3 style='font-family:Brush Script'><b>Select Mode Of Payment</b></h3>
			 </div>
			 <div class="rooms-top">
			    <div class="rooms-left wow slideInLeft" data-wow-delay="0.3s">
				 	<div class="col-md-4 rooms-text">
                                            <!--<h2>Select Mode of payment</h2><br><br>-->
                                            <div class="col-sm-6">
                                                <input type="button" value="OnSpot Payment" class="btn btn-primary"  onclick="cashpayment()"><br><br> 
                                                  
                                            </div>  
                                             <div class="col-sm-6">
                                                 <input type="button" value="Online Payment" class="btn btn-primary" onclick="paymentlogic()"><br><br>
                                                  
                                            </div>  
				 		<!--<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias</p>-->
<!--				 	    <div class="room-btn">
				 	     <a href="single.html" class="hvr-push">Read More</a>	
				 	    </div>		 	    -->
				 	</div>
<!--				 	<div class="col-md-8 rooms-img">
				 		<div class="luxury-block">
				 		 <a href="single.html"> <img src="images/r1.jpg" alt="" class="img-responsive"></a>		
						</div>
-->				 	</div>				 
				  <div class="clearfix"> </div>
			    </div>
			     <div class="rooms-left1 wow slideInRight" data-wow-delay="0.3s">
				 	<div class="col-md-8 rooms-img ulta-img">
				 	 <!--<a href="single.html"> <img src="images/r2.jpg" alt="" class="img-responsive"></a>-->
				 	</div>
				 	<div class="col-md-4 rooms-text ulta-text"><!--
				 		<h3><a href="single.html">Vero accusamus</a></h3>
				 		<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias</p>
				 	    <div class="room-btn">
				 	      <a href="single.html" class="hvr-push">Read More</a>	
				 	    </div>	
-->				 	</div>
				  <div class="clearfix"> </div>
			    </div>
			 </div>
			<div class="clearfix"> </div>
		</div>

<!--gallery start here-->

<!--gallery end here-->
<!--<script src="js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
		light-box-files 
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('.gallery-grid a').Chocolat();
		});
		</script>-->

<!--room end here-->
<!--footer start here-->

<%@include file="footer.jsp" %>
<!--footer end here-->
<!--copy rights start here-->

</body>
</html>