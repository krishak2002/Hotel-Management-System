<%-- 
    Document   : index
    Created on : Apr 17, 2023, 10:50:13 AM
    Author     : Asus
--%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Mr Hotel a Hotel Category Flat Bootstrap Responsive  Website Template | Home :: w3layouts</title>
        <!--<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
         jQuery (necessary for Bootstrap's JavaScript plugins) 
        <script src="js/jquery-1.11.0.min.js"></script>
         Custom Theme files 
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />	
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
        <script src="js/modernizr.js"></script>
        <script>
            $(document).ready(function(){
                if (Modernizr.touch) {
                    // show the close overlay button
                    $(".close-overlay").removeClass("hidden");
                    // handle the adding of hover class when clicked
                    $(".branch-gd").click(function(e){
                        if (!$(this).hasClass("hover")) {
                            $(this).addClass("hover");
                        }
                    });
                    // handle the closing of the overlay
                    $(".close-overlay").click(function(e){
                        e.preventDefault();
                        e.stopPropagation();
                        if ($(this).closest(".branch-gd").hasClass("hover")) {
                            $(this).closest(".branch-gd").removeClass("hover");
                        }
                    });
                } else {
                    // handle the mouseenter functionality
                    $(".branch-gd").mouseenter(function(){
                        $(this).addClass("hover");
                    })
                    // handle the mouseleave functionality
                    .mouseleave(function(){
                        $(this).removeClass("hover");
                    });
                }
            });
        </script>
        <script src="js/bootstrap.min.js"></script>-->

        <%@include file="Header.jsp" %>


      

    </head>
    <body >
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
        <!-- NAVBAR
                ================================================== -->
        <%@include file="AdminNavbar.jsp" %>
        <!--header end here-->
              <div class="home-block">
            <div class="container">
                <div class="home-main">
                    <div class="home-top">
                        <h3 style='font-family:Brush Script'><b>Welcome to Admin Home</b></h3>
                    </div>
                    <div id="cities" >
                        <div class="home-bottom  wow bounceInLeft" data-wow-delay="0.3s">
                            <div class="col-md-4 home-grid">
                                <div class="item item-type-move">
                                    <a class="item-hover" href="AdminManageCities.jsp">						
                                        <div class="item-info">
                                            <div class="headline">
                                               <!--Our Rooms-->
                                                <!--<div class="line"> </div>-->
                                            </div>
                                            <div class="date"><h2 style='font-family:Brush Script'>Manage Cities</h2></div>							
                                        </div>
                                        <div class="mask"> </div>
                                    </a>
                                    <div class="item-img">
                                        <img src="MyUploads/city.jpg" style="height: 210px; width: 350px" class="img-responsive" alt="">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    				<div class="col-md-4 home-grid">
                                                            <div class="item item-type-move">
                                                                    <a class="item-hover" href="AdminManageProperties.jsp">						
                                                                            <div class="item-info">
                                                                                    <div class="headline">
                                                                                            <!--Our Rooms-->
                                                                                            <!--<div class="line"> </div>-->
                                                                                    </div>
                                                                                <div class="date"><h2 style='font-family:Brush Script'>Manage Property Type</h2></div>							
                                                                            </div>
                                                                            <div class="mask"> </div>
                                                                </a>
                                                                    <div class="item-img">
                                                                                    <img src="MyUploads/dome.jpg" style="height: 210px; width: 350px" class="img-responsive" alt="">
                                                                    </div>
                                                            </div>
                                                    </div>
                                                    <div class="col-md-4 home-grid">
                                                            <div class="item item-type-move">
                                                                    <a class="item-hover" href="AdminManagePropertyOwner.jsp">						
                                                                            <div class="item-info">
                                                                                    <div class="headline">
                                                                                            <!--Our Rooms-->
                                                                                            <!--<div class="line"> </div>-->
                                                                                    </div>
                                                                                <div class="date"><h2 style='font-family:Brush Script'>Manage Property Owners</h2></div>							
                                                                            </div>
                                                                            <div class="mask"> </div>
                                                                </a>
                                                                    <div class="item-img">
                                                                                    <img src="MyUploads/owner.jpg" style="height: 210px; width: 350px" class="img-responsive" alt="">
                                                                    </div>
                                                            </div>
                                                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
   
        <!--banner  start hwew-->
        
        <!--BANNER END HERE-->
        <!--information start here-->
        
        <!--information end here-->
        <!--leaves start here-->
        
        <!--leaves end here-->
        <!--branches start here-->
        
        <!--branches end here-->
        
        <!--swiming-->
        
        <!--swimmg emd here-->
        <!--homegrids start here-->
<!--        <div class="home-block">
            <div class="container">
                <div class="home-main">
                    <div class="home-top">
                        <h3>Welcome to Owner Home</h3>
                    </div>
                    <div id="cities" >
                        <div class="home-bottom  wow bounceInLeft" data-wow-delay="0.3s">
                            <div class="col-md-4 home-grid">
                                <div class="item item-type-move">
                                    <a class="item-hover" href="single.html">						
                                        <div class="item-info">
                                            <div class="headline">
                                                Our Rooms
                                                <div class="line"> </div>
                                            </div>
                                            <div class="date">February 29, 2016</div>							
                                        </div>
                                        <div class="mask"> </div>
                                    </a>
                                    <div class="item-img">
                                        <img src="images/b7.jpg" class="img-responsive" alt="">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    				<div class="col-md-4 home-grid">
                                                            <div class="item item-type-move">
                                                                    <a class="item-hover" href="single.html">						
                                                                            <div class="item-info">
                                                                                    <div class="headline">
                                                                                            Our Rooms
                                                                                            <div class="line"> </div>
                                                                                    </div>
                                                                                    <div class="date">February 29, 2016</div>							
                                                                            </div>
                                                                            <div class="mask"> </div>
                                                                </a>
                                                                    <div class="item-img">
                                                                                    <img src="images/b8.jpg" class="img-responsive" alt="">
                                                                    </div>
                                                            </div>
                                                    </div>
                                                    <div class="col-md-4 home-grid">
                                                            <div class="item item-type-move">
                                                                    <a class="item-hover" href="single.html">						
                                                                            <div class="item-info">
                                                                                    <div class="headline">
                                                                                            Our Rooms
                                                                                            <div class="line"> </div>
                                                                                    </div>
                                                                                    <div class="date">February 29, 2016</div>							
                                                                            </div>
                                                                            <div class="mask"> </div>
                                                                </a>
                                                                    <div class="item-img">
                                                                                    <img src="images/b9.jpg" class="img-responsive" alt="">
                                                                    </div>
                                                            </div>
                                                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>-->
    
    <!--home grid end here-->
    <!--footer start here-->
    <%@include file="footer.jsp" %>
    <!--footer end here-->
    <!--copy rights start here-->
   
</body>
</html>