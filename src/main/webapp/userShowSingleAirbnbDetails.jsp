<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Mr Hotel a Hotel Category Flat Bootstrap Responsive  Website Template | About :: w3layouts</title>
<!--        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.chocolat.js" type="text/javascript"></script>
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
-->        <link href="css/animate.css" rel="stylesheet" type="text/css" media="all"><!--
        <script src="js/wow.min.js"></script>-->
        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">

        
<!--        <script>
            new WOW().init();
        </script>
       <script src="js/bootstrap.min.js"></script>-->
       <%@include file="Header.jsp"%>

       <%
        String detailid = (String) request.getParameter("detailid");

       %>
        
        <script>

            var detailid = "<%=detailid%>";
            var offerprice;

            function userShowSingleAirbnbDetails() {
                
                var url = "./userShowSingleAirbnbDetails";

                var formdata = new FormData();
                formdata.append("detailid", detailid);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAns(ans));
                showPhotos();
            }

            function renderAns(ans) {

                ans = ans.trim();
  
                var mainobj = JSON.parse(ans);
                //    var arr= mainobj.ans;
                var arr = mainobj["ans"];
                console.log(arr);
                for (var i = 0; i < arr.length; i++) {

                    var st = arr[i];

                    document.getElementById("airbnbname").innerHTML = st.airbnbname;
                    document.getElementById("description").innerHTML = st.description;
                         document.getElementById("price").innerHTML = st.price;
                       document.getElementById("offerprice").innerHTML = st.offerprice;
                       offerprice = st.offerprice;

                }
            }
        </script>
        <script>
    var detailid = "<%=detailid%>";
    
    function showPhotos()
    {
       
       
        var url="./showPhotos";
        
        var formdata = new FormData();
        formdata.append("detailid",detailid);
        
        fetch (url,{method: "POST", body: formdata})
                .then(response=>response.text())
                .then(ans=>renderphoto(ans));
    }
        
         function renderphoto(ans)
    {
     
       ans=ans.trim();
       
       var mainobj= JSON.parse(ans);
       var arr=mainobj ["ans"];
       console.log(arr);
       var ans="";
       ans=ans+"<div class=\"gallery\" id=\"gallery\">";
	ans=ans+"<div class=\"container\">";
	  ans=ans+"<div class=\"gallery-main wow zoomIn\" data-wow-delay=\"0.3s\">";
	  	ans=ans+"<div class=\"gallery-top\">";
	  		
	  	ans=ans+"</div>";
		ans=ans+"<div class=\"gallery-bott\">";
                for(var i=0;i<arr.length;i++){
                var st=arr[i];
			ans=ans+"<div class=\"col-md-6 col1 gallery-grid\">";
			ans=ans+"<a href=" +st.photo+ " rel=\"title\" class=\"b-link-stripe b-animate-go  thickbox\">";
                	ans=ans+"<figure class=\"effect-bubba\">";
			ans=ans+"<img class=\"img-responsive\" class=\"img-fluid\" style=\"height: 340px; width: 580px\" src=" +st.photo+ " alt=\"\">";
			ans=ans+"<figcaption>";
								ans=ans+"<h4 class=\"gal\"> </h4>";
							ans=ans+"<p class=\"gal1\"></p>";
							ans=ans+"</figcaption>";			
						ans=ans+"</figure>";
					ans=ans+"</a>";
					ans=ans+"</div>";
                                        }
                ans=ans+"</div>";
             ans=ans+"</div>";
          ans=ans+"</div>";
           ans=ans+"</div>";
//        ans = ans + "<div class=\"row\">";
//       
//       for(var i=0;i<arr.length;i++)
//       {
//           var st=arr[i];
//            ans = ans + "<div class=\"col-sm-3\">";
//           ans = ans + "<img src=" + st.photo + " class=\"img-fluid\" width=\"300\" height=\"350\"><div class=\"read_more\"><span></span></div></a>";
//        
//          ans=ans+"</div>";
//       }
//       
//       ans=ans+"</div>";

       document.getElementById("d1").innerHTML=ans;
    
    }
    
</script>


    <script>
        var stdate="";
        var enddate="";
       function go()
         {
             stdate=document.getElementById("fromdatepicker").value;
              enddate=document.getElementById("todatepicker").value;
             window.location.href="SelectModeOfPayment.jsp?detailid="+detailid+"&from="+stdate+"&to="+enddate+"&grandtotal="+grandtotal;

             }
        </script>
  
       
    </head>
    <body  onload="userShowSingleAirbnbDetails()">
        <!--header-top start here-->


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
        <!--header-top end here-->
        <!--header start here-->
        <%@include file="Navbar.jsp" %>
        <!--	 NAVBAR
                        ================================================== 
        <div class="header">
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
                                        <li><a class="active" href="about.html" data-hover="About">About</a></li>
                                                        <li><a href="services.html" data-hover="Services">Services</a></li>
                                                        <li><a href="room.html" data-hover="Rooms">Rooms</a></li>
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
        <!--about start here-->
        <div class="about">
            <div class="container">
                <div class="about-main">
                    <div class="about-top">
                        <h1 id="airbnbname"></h1>
                    </div>
                   
                    <div class="about-bottom">
                        <div class="col-md-5 about-left wow bounceInLeft" data-wow-delay="0.3s">
                            <!--					<img src="images/a1.jpg" alt="" class="img-responsive">-->
                        </div>
                        <div class="col-md-7 about-right wow bounceInRight" data-wow-delay="0.3s">
                        </div>
                            
                        <div class="row" >
                        <div class="col-md-7 about-right wow bounceInRight" data-wow-delay="0.3s">
                            <br><br><h2 style='font-family:Brush Script'> About the Property </h2><br>
                        
                          <p id="description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p><br><br>
                        </div>
                            <div class="col-md-1 about-right wow bounceInRight" data-wow-delay="0.3s">
                            
                        </div>
                            
                            <div class="col-md-3 about-right wow bounceInRight" data-wow-delay="0.3s" style="border: 3px solid #cccccc; border-radius:10px; text-align: center">
                            <div class="about-list "  >
                                <div class="about-img" >
                                    <!--<span class="abou-icon1"> </span>-->
                              <h3 style='font-family:Brush Script'> PRICE </h3>
                             
                             <br>
                             <label id="price">Labore et dolore magnam</label>
                                </div>
                                <div class="about-text">
<!--                                    <br><br><br><label id="price">Labore et dolore magnam</label><br><br>-->
                                   <!-- <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam</p>-->
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <hr style="border: 1px solid #cccccc " >
                            <div class="about-list">
                                <div class="about-img">
                       
                           <h3 style='font-family:Brush Script'> OFFER PRICE </h3>
                           <br>
                           <label id="offerprice">Labore et dolore magnam</label>
                                </div>
                                <div class="about-text">
<!--                                    <br><br><br><br> <label id="offerprice">Labore et dolore magnam</label> <br><br>-->
                                <!--    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam</p>-->
                                </div>
                               </div>
                            </div>
                            </div>
                                <h3 style="color: white" >Choose your dates :</h3><br>
                               
                                    <p>from : <input type="text" id="fromdatepicker" class="form-control"></p>
                                    <p>to : <input type="text" id="todatepicker" class="form-control" onchange="func()"></p>
                                    <h3 style="color: white" >Grand Total is Rs.</h3>
                                
                                    <h3 style='font-family:Brush Script'> Grand Total is : </h3><br><br>
                                    <h3> <div  id="grandtotal" >
                                        
                                        </div></h3>
                                    
                                            <br><input type="button" value="select mode of payment" class="btn btn-primary"  onclick="go()">
                                <div class="clearfix"> </div>
                                <div id="d1">
                                
                            
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
       
        <!--about end here-->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


        <script>

                                    var from = "";
                                    var to = "";

                                    $(function () {
                                        $("#fromdatepicker").datepicker({
                                            minDate: 0,
                                            
                                        });
                                        from = $("#fromdatepicker")
                                    });


                                    $(function () {
                                        $("#todatepicker").datepicker({
                                            minDate: 0
                                        });
                                        to = $("#todatepicker")
                                    });

                                    function func() {

                                        from = new Date(fromdatepicker.value);
                                        
                                        to = new Date(todatepicker.value);

                                        var milli_secs = from.getTime() - to.getTime();
                                        
                                        // Convert the milli seconds to Days 
                                        var days = milli_secs / (1000 * 3600 * 24);
                                        
                                        days = Math.round(Math.abs(days));
                                        
                                        grandtotal = days * offerprice;

                                        document.getElementById("grandtotal").innerHTML =
                                                grandtotal;
                                    }

        </script>
        <%@include file="footer.jsp" %>
        <!--copy rights start here-->
       
    </body>
</html>