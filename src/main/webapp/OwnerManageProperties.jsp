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
-->		<!--
 animated-css 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" 
<script src="js/bootstrap.min.js"></script>-->
<%@include file="Header.jsp" %>


<script>
    
    
    function OwnerManageProperties(){
       
       
          var propertytype = document.getElementById("properttype").value;
           var description = document.getElementById("description").value;
          var address = document.getElementById("address").value;
          var photo = document.getElementById("photo").files[0];
            var price = document.getElementById("price").value;
              var offerprice = document.getElementById("offerprice").value;
            
            
            
        var formdata = new FormData();
          formdata.append("propertytype",propertytype);
            formdata.append("photo",photo);
             formdata.append("price",price);
              formdata.append("description",description);
               formdata.append("offerprice",offerprice);
                formdata.append("address",address);
         
        
        var url="./OwnerManageProperties";
        
        fetch(url,{method: "POST", body: formdata})
                .then(response => response.text())
                .then(ans => renderAns(ans));        
    }
    function renderAns(ans){
        
        if(ans === "success"){
            Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Property Added Successfully!'
                    })
                    
                    
        }
        else{
            Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot Add Property !'
                    });
        }
    }
    
    function showProperties()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        

                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];
                        var ans = "";

                        ans = ans + "<div class=\"dropdown form-group\">";
                        ans = ans + "<label>Choose the type of Property</label><br>";
                        ans = ans + "<select id=\"properttype\" class=\"form-control\" style=\"width: 100%\" >";
                        ans = ans + "<option></option><br>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<option value=\'" + st.property_type_name +"\'  >" + st.property_type_name + "</option><br>";

                        }
                        ans = ans + "</select>";
                        ans = ans + "</div>";

                        document.getElementById("showProperties").innerHTML = ans;

                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./OwnerPropertyTypeServlet", true);

                //3. Send Request
                xhttp.send();
                showAddedProperties();
            }
            function showAddedProperties()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                     

                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];
                        var ans = "";

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"row\" >";

                            ans = ans + "<div class=\"col-sm-3\" >";
                            ans = ans + "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;height: 100px;width: 150px\" src=\'" + st.photo + "\' >";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-2\" style=\"text-align: center\" >";
                            ans = ans + "<div class=\"card-body\">";
                            ans = ans + "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center\" >Property Name : " + st.propertytype + "</label><br><br>";

                            ans = ans + "</div>";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-2\" style=\"text-align: center\" >";
                            ans = ans + "<div class=\"card-body\">";
                            ans = ans + "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center\" >Price : " + st.price + "</label><br><br>";

                            ans = ans + "</div>";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-2\" style=\"text-align: center\" >";
                            ans = ans + "<div class=\"card-body\">";
                            ans = ans + "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center\" >Offer Price : " + st.offerprice + "</label><br><br>";

                            ans = ans + "</div>";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                            ans = ans + "<input type=\"button\" value=\"Remove Property\" class=\"btn btn-dark\" onclick=\"deleteProperty('" + st.detailid + "')\" ><br><br>";
                            ans = ans + "<input type=\"button\" value=\"Add Photos\" class=\"btn btn-success\" onclick=\"addPhotos('" + st.detailid + "')\" ><br><br>";

                            ans = ans + "</div>";

                            ans = ans + "</div>";
                            ans = ans + "<br>";
                            ans = ans + "<hr>";
                        }
                        document.getElementById("showaddedproperties").innerHTML = ans;

                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./OwnerShowPropertiesServlet", true);

                //3. Send Request
                xhttp.send();
            }
            </script>
            <script>
                function deleteProperty(detailid)
            {

                var formdata = new FormData();
                formdata.append("detailid", detailid);


                var url = "./deleteProperty";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderOfDeleteProperty(ans));

            }
            function renderOfDeleteProperty(ans)
            {
                if (ans === "success")
                {
                      if(ans === "success"){
                           Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Property removed successfully!'
                            }).then(function () {
                                window.location = "OwnerManageProperties.jsp";
                            });
                            showProperties();
        }
   

                } else {
                     Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot remove property !'
                    });
                }
            }
            
            
            function addPhotos(detailid){
                window.location.href="OwnerAddPhotos.jsp?detailid="+detailid;
            }
            
    
</script>




</head>
<body onload="showProperties()" >
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
		                <li><a href="about.html" data-hover="User Signup">User Signup</a></li>
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
</div>--><%@include file="OwnerNavbar.jsp" %>
<!--header end here-->
<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="contact-top">
                            <h2 style='font-family:Brush Script; color: black'><b>Add Your New Properties</b></h2>
			</div>
			<div class="contact-bottom">
				<div class="col-md-9 contact-left"> 
                                
                                    <form>
                                        <div>
                                 
                                            <!--<input type="text" id="owneremail" class="form-control" placeholder="Owner Email"><br><br>-->
                                            <div id="showProperties" >

                                            </div>
                                            <input type="file"id="photo" class="form-control" placeholder="choose photo"><br><br>      
                                            <input type="text" id="price" class="form-control" placeholder="Price"><br><br>
                                            <input type="text" id="offerprice" class="form-control" placeholder="Offer Price"><br><br>
                                           Description:<textarea id="description" class="form-control" placeholder="Description" >
                                                
                                           </textarea><br><br>
                                            <input type="text" id="address" placeholder="Address" class="form-control"><br><br>
                                             <input type="button" onclick="OwnerManageProperties()" value="Send" class="btn btn-primary form-control"><br><br>
                                             

                                             </form>
                                    <br><br><h2 style='font-family:Brush Script;' text align='center'><b> Already Existing Properties </b> </h2><br><br>
                                        <div id="showaddedproperties" >
                        
                    </div>
                    
				</div>
				
			  <div class="clearfix"> </div>
			</div>
		</div>
                    
                    
<!--                    <div id="" >
                        
                    </div>
                    -->
	</div>
</div>
</div>
<!--contact end here-->
<!--map start here-->

<!--map end here-->
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
</div>-->
<%@include file="footer.jsp" %>
<!--footer end here-->
<!--copy rights start here-->

</body>
</html>