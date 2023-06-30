<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Mr Hotel a Hotel Category Flat Bootstrap Responsive  Website Template | Contact :: w3layouts</title>
<!--<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
 jQuery (necessary for Bootstrap's JavaScript plugins) 
<script src="js/jquery-1.11.0.min.js"></script>
 Custom Theme files 
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
 Custom Theme files 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mr Hotel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
Google Fonts
<link href='//fonts.googleapis.com/css?family=Hind:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Aladin' rel='stylesheet' type='text/css'>
google fonts
 animated-css 
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
 animated-css 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" 
<script src="js/bootstrap.min.js"></script>-->
<%@include file="Header.jsp" %>

<script>
    
    function UserLogin(){
       
     
         var email = document.getElementById("email").value;
          var password = document.getElementById("ps1").value;
                 if (email == "" || password == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly !'
                    });
                }
                    else if (email.indexOf("@") == -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                }
       
            else{
        var formdata = new FormData();
         formdata.append("email",email);
          formdata.append("password",password);
      
        
        
        var url="./UserLogin";
        
        fetch(url,{method: "POST", body: formdata})
                .then(response => response.text())
                .then(ans => renderAns(ans));        
    }
                }
    function renderAns(ans){
        if(ans === "success"){
       Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Signed in successfully!'
                            }).then(function () {
                                window.location = "index.jsp";
                            });
        }
   
        else{
          
Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error While Signing in  !'
                    });
        }
     
    }
    
</script>



</head>
<body>
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
		                <li><a href="about.html" data-hover="User Login">User Login</a></li>
						<li><a href="services.html" data-hover="Services">Services</a></li>
						<li><a href="room.html" data-hover="Rooms">Rooms</a></li>
						<li><a href="shortcodes.html" data-hover="Shortcodes">Shortcodes</a></li>
						<li><a class="active" href="contact.html" data-hover="Contact">Contact</a></li>						
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
<%@include file="Navbar.jsp" %>
<!--header end here-->
<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="contact-top">
                            <h2 style='font-family:Brush Script'><b>User Login</b></h2>
			</div>
			<div class="contact-bottom">
				<div class="col-md-9 contact-left"> 
                                
                                    <form>
                                        <div style="text-align: center">
                                    <!--   <input type="text" id="username" class="form-control" placeholder="username"><br><br>-->
                                                <input type="text" id="email" class="form-control" placeholder="Email"><br><br>
                                                <input type="text" id="ps1" class="form-control" placeholder="Enter password"><br><br>
<!--                                               <input type="text" id="ps2" placeholder="confirm password" class="form-control"><br><br>                                              
                                                <input type="file"id="photo" class="form-control" placeholder="choose photo"><br><br>                                            
                                                  <input type="text" id="contact" placeholder="Contact" class="form-control"><br><br>-->
                                                  <input type="button" onclick="UserLogin()" value="Send" class="btn btn-primary form-control"><br><br>
					
                                    </form>
				</div>
				
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
</div>
<!--contact end here-->
<!--map start here-->

<!--map end here-->
<!--footer start here-->
<%@include file="footer.jsp" %>
<!--footer end here-->
<!--copy rights start here-->

</body>
</html>