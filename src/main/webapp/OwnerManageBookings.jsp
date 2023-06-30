<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Mr Hotel a Hotel Category Flat Bootstrap Responsive  Website Template | Rooms :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mr Hotel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Hind:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Aladin' rel='stylesheet' type='text/css'>
<!--google fonts-->
<!-- animated-css -->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
<!-- animated-css -->
<script src="js/bootstrap.min.js"></script>
    <script>
         function go() {
               
            var url = "./OwnerManageBookings";
            
            
            fetch(url, {method: "POST"})
                    .then(response => response.text())
                    .then(ans => renderAns(ans));
            }
             function renderAns(ans) {
                
                 var mainobj = JSON.parse(ans);
                        var arr = mainobj["ans"];
                 
                 var s = '<div class="container">';

                for (var j = 0; j < arr.length; j++)
                {
                    var obj = arr[j];
                    s = s + '<table class=\"table table-striped\">';
                    s = s + '<div class="col-sm-12">';
                    
                    s = s + '<thead>';
                    s = s + '<tr>';
                    s = s + '<th><h6>Property Booked Address:</h6></th>';
                    s = s + '<th><h6>User Email:</h6></th>';
                    s = s + '<th><h6>Mode of Payment:</h6></th>';
                    s = s + '<th><h6>Grand Total:</h6></th>';
                    s = s + '<th><h6>From:</h6></th>';
                    s = s + '<th><h6>To:</h6></th>';
                    s = s + '</tr>';
                    s = s + '</thead>';

                    s = s + '</tbody>';
                    s = s + '<tr>';
                    s = s + '<td>' + obj.address + '</td>';
                    s = s + '<td>' + obj.useremail + '</td>';
                    s = s + '<td>' + obj.payment_type + '</td>';
                    s = s + '<td>' + obj.totalprice + '</td>';
                    s = s + '<td>' + obj.start_date + '</td>';
                    s = s + '<td>' + obj.end_date + '</td>';
                    s = s + '</tr>';
                    s = s + '</tbody>';
                    
                    s = s + '</div>';
                    s = s + '</table><br><br>';


                }
                s = s + "</div>";

                document.getElementById("data").innerHTML = s;
                document.getElementById("data").style.fontFamily = "Georgia, serif";
             }
             
        </script>
        <style>
            .inner-border {
                border: 10px solid #d9dbda;
                box-sizing: border-box;
            }
        </style>
</head>
<body onload="go()">
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
</div>-->    <%@include file="OwnerNavbar.jsp" %>
<!--header end here-->
<!--room start here-->
<!--<div class="rooms">
-->	<div class="container">
		<div class="rooms-main">
			 <div class="room-head">
                             <br><br><h3>Your Booked Airbnbs</h3>
			 </div>
			 <div class="rooms-top">
			    <div class="rooms-left wow slideInLeft" data-wow-delay="0.3s">
				 	<div class="col-md-4 rooms-text">
                                            <!--<h2>Select Mode of payment</h2><br><br>-->
                                            <div id="data">
                                            </div>
                                            
<!--                                            <div class="col-sm-6" >
                                                <input type="button" value="OnSpot Payment" class="btn btn-primary" onclick="cashpayment()"><br><br>
                                                  
                                            </div>  
                                             <div class="col-sm-6">
                                                <input type="button" value="Online Payment" class="btn btn-primary" onclick="onlinepayment()"><br><br>
                                                  
                                            </div>  -->
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
	</div><!--
</div>-->
<!--gallery start here-->
<!--<div class="gallery" id="gallery">
	<div class="container">
	  <div class="gallery-main wow zoomIn" data-wow-delay="0.3s">
	  	<div class="gallery-top">
	  		<h1>Other Rooms</h1>
	  	</div>
		<div class="gallery-bott">
			<div class="col-md-4 col1 gallery-grid">
				<a href="images/r3.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">

						<figure class="effect-bubba">
							<img class="img-responsive" src="images/r3.jpg" alt="">
							<figcaption>
								<h4 class="gal"> Nemo voluptatem</h4>
								<p class="gal1">In sit amet sapien eros Integer dolore magna aliqua</p>	
							</figcaption>			
						</figure>
					</a>
					</div>
					<div class="col-md-4 col1 gallery-grid">
						<a href="images/r4.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
						<figure class="effect-bubba">
							<img class="img-responsive" src="images/r4.jpg" alt="">
							<figcaption>
								<h4 class="gal">Nemo voluptatem</h4>
								<p class="gal1">In sit amet sapien eros Integer dolore magna aliqua</p>	
							</figcaption>			
						</figure>
						</a>
					</div>
					<div class="col-md-4 col1 gallery-grid">
						<a href="images/r5.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
						<figure class="effect-bubba">
							<img class="img-responsive" src="images/r5.jpg" alt="">
							<figcaption>
								<h4 class="gal">Nemo voluptatem</h4>
								<p class="gal1">In sit amet sapien eros Integer dolore magna aliqua</p>	
							</figcaption>			
						</figure>
						</a>
					</div>
			     <div class="col-md-4 col1 gallery-grid">
				  <a href="images/r6.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
						<figure class="effect-bubba">
							<img class="img-responsive" src="images/r6.jpg" alt="">
							<figcaption>
								<h4 class="gal">Nemo voluptatem</h4>
								<p class="gal1">In sit amet sapien eros Integer dolore magna aliqua</p>	
							</figcaption>			
						</figure>
					</a>
					</div>
					<div class="col-md-4 col1 gallery-grid">
						<a href="images/r7.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
						<figure class="effect-bubba">
							<img class="img-responsive" src="images/r7.jpg" alt="">
							<figcaption>
								<h4 class="gal">Nemo voluptatem</h4>
								<p class="gal1">In sit amet sapien eros Integer dolore magna aliqua</p>	
							</figcaption>			
						</figure>
						</a>
					</div>
					<div class="col-md-4 col1 gallery-grid">
						<a href="images/r8.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
						<figure class="effect-bubba">
							<img class="img-responsive" src="images/r8.jpg" alt="">
							<figcaption>
								<h4 class="gal">Nemo voluptatem</h4>
								<p class="gal1">In sit amet sapien eros Integer dolore magna aliqua</p>	
							</figcaption>			
						</figure>
						</a>
					</div>
			     <div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>-->
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
<!--<div class="footer">
	<div class="container">
		<div class="footer-main">
			<div class="col-md-3 ftr-grid wow zoomIn" data-wow-delay="0.3s">
				<div class="ftr-logo">
				<img src="images/ftr-logo.png"  alt="">
				</div>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
				<a href="single.html" class="ftr-btn">Read More</a>
			</div>
			<div class="col-md-3 ftr-grid ftr-mid wow zoomIn" data-wow-delay="0.3s">
				 <h3>Address</h3>
				 <span class="ftr-line flm"> </span>
				<p>Eye Associates Of Virginia?</p>
				<p>5875 Bremo Road </p>
				<p>Richmond, VA(Virginia) 23226 </p>
				<p>(804) 287-4216 </p>
				<p>Alice Merriman</p>
				
			</div>
			<div class="col-md-3 ftr-grid ftr-rit wow zoomIn" data-wow-delay="0.3s">
				 <h3>Contact Us</h3>
				 <form>
				 	<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
				 	<input type="submit" value="Send" />
				 </form>
				  <ul class="ftr-icons">
				 	<li><a href="#"><span class="fa"> </span></a></li>
				 	<li><a href="#"><span class="tw"> </span></a></li>
				 	<li><a href="#"><span class="link"> </span></a></li>
				 	<li><a href="#"><span class="gmail"> </span></a></li>
				 </ul>
			</div>
			<div class="col-md-3 ftr-grid ftr-last-gd ftr-rit wow zoomIn" data-wow-delay="0.3s">
				 <h3>Quick Link</h3>
				  <ul class="ftr-nav">
				 	<li><a href="index.html">Home</a></li>
				 	<li><a href="about.html">About</a></li>
				 	<li><a href="services.html">Services </a></li>
				 	<li><a href="room.html">Rooms</a></li>
				 	<li><a href="contact.html">Contact</a></li>
				 </ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>--><%@include file="footer.jsp" %>
<!--footer end here-->
<!--copy rights start here-->

</body>
</html>