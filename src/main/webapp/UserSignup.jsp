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
    
    function userSignup(){
       
        var username = document.getElementById("username").value;
         var email = document.getElementById("email").value;
          var password = document.getElementById("ps1").value;
          var confirmPassword = document.getElementById("ps2").value;  
          var photo = document.getElementById("photo").files[0];
            var contact = document.getElementById("contact").value;
            
                if (username == "" || email == "" || password == "" || confirmPassword == "" || contact == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly !'
                    });
                } else if (contact.length != 10)
                
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter the Phone Number Properly !'
                    });
                } else if (email.indexOf("@") == -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                } else if (document.getElementById("photo").files.length[0])
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select the Display Picture !'
                    });
                } else if (password != confirmPassword)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Password & Confirm Passowrd must match !'
                    });
                }
                else{
            
        var formdata = new FormData();
        formdata.append("username",username);
         formdata.append("email",email);
          formdata.append("password",password);
           formdata.append("password",confirmPassword);
            formdata.append("photo",photo);
             formdata.append("contact",contact);
          
        
        var url="./userSignup";
        
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
                        text: 'Sign Up Successfull!'
                    })
                    
                 
        }
        
        else{
            alert(ans);
            Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot Sign Up !'
                    });
        }
         
    }
    
    
</script>



</head>
<body>
<!--header-top start here-->

<!--header-top end here-->
<!--header start here-->
	<!-- NAVBAR
		================================================== -->

<%@include file="Navbar.jsp" %>
<!--header end here-->
<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="contact-top">
                            <h2 style='font-family:Brush Script'><b>User Signup</b></h2>
			</div>
			<div class="contact-bottom">
				<div class="col-md-9 contact-left"> 
                                
                                    <form>
                                        <div style="text-align: center">
                                        <input type="text" id="username" class="form-control" placeholder="Username"><br><br>
                                                <input type="text" id="email" class="form-control" placeholder="Email"><br><br>
                                                <input type="text" id="ps1" class="form-control" placeholder="Enter password"><br><br>
                                                <input type="text" id="ps2" placeholder="Confirm password" class="form-control"><br><br>                                              
                                                <input type="file"id="photo" class="form-control" placeholder="Choose Photo"><br><br>                                            
                                                  <input type="text" id="contact" placeholder="Contact" class="form-control"><br><br>
                                                  <input type="button" onclick="userSignup()" value="Send" class="btn btn-primary form-control"><br><br>
					
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