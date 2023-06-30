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
        
        <%
            String ue = (String) session.getAttribute("useremail");
        %>


        <script>
            
            var ue = "<%=ue%>";

            function userShowCities() {
            var url = "./userShowCities";
            fetch(url, {method: "POST"})
                    .then(response => response.text())
                    .then(ans => renderAns(ans));
            }
            function renderAns(ans) {

            ans = ans.trim();
            var mainobj = JSON.parse(ans);
            var arr = mainobj.ans;
            var res = "";
            for (var i = 0; i < arr.length; i++){

            var st = arr[i];
             res = res + "<div  class=\"home-bottom  wow bounceInLeft\" data-wow-delay=\"0.3s\">";
            res=res+ "<div class=\"col-md-4 home-grid\">";
                                res=res+"<div class=\"item item-type-move\">";
                                   res=res+"<a class=\"item-hover\" onclick=\"checkLogin("+st.id+")\" >";						
                                       res=res+"<div class=\"item-info\">";
                                          res=res+"<div class=\"headline\">";
//                                                Our Rooms
                                              //  res=res+"<div class=\"line\"> </div>";
                                           res=res+"</div>";
                                            res=res+"<div class=\"date\"><h2 style=\"font-family:Brush Script\">"+st.cityname+"<h2></div>";							
                                        res=res+"</div>";
           
            res=res+"<div class=\"mask\"> </div>";
                                    res=res+"</a>";
                                    res=res+"<div class=\"item-img\">";
                                       res=res+"<img src="+st.photo+" class=\"img-responsive\" class=\"img-fluid\" style=\"height: 210px; width: 350px\" alt=\"\">";
                                    res=res+"</div>";
                                res=res+"</div>";

                           res=res+"</div>";
                        res=res+"</div>";
            }

            document.getElementById("cities").innerHTML = res;
            }
            
            function checkLogin(id){
                
                if(ue != "null"){
                    window.location.href="userShowAllAirbnb.jsp?cityid="+id;
                }else{
                    window.location.href="UserLogin.jsp";
                }
                
            }

        </script>

    </head>
    <body onload="userShowCities()" >
        <!--header-top start here-->
        <!--header-top end here-->
        <!--header start here-->
        <!-- NAVBAR
                ================================================== -->
        <%@include file="Navbar.jsp" %>
        <!--header end here-->
        <!--banner  start hwew-->
        <div class="banner">
            <div class="container">
                <div class="banner-main wow zoomIn" data-wow-delay="0.3s">
                    <h2>THE  RESIDENTIAL</h2>
                    <h6>Welcome To Our Services</h6>
                    <p>The Residentail is rental experience you never gonna forget.We provide resting homes, cabins, boat rooms,apartments etc. for making your travel experience unforgettable and more luxurious.</p>
                </div>
            </div>
        </div>
        <!--BANNER END HERE-->
        <!--information start here-->
        <div class="information">
            <div class="container">
                <div class="information-main">
                    <div class="information-grid five-star wow slideInLeft" data-wow-delay="0.3s">
                        <div class="col-md-4 hotel-info">
                            <div class="info-left">
                                <img src="images/s1.png" alt="">
                            </div>
                            <div class="info-right">
                                <h4>Member Discounts</h4>
                                <p>Become our member and enjoy extra 10% discount. </p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col-md-4 hotel-info">
                            <div class="info-left">
                                <img src="images/s2.png" alt="">
                            </div>
                            <div class="info-right">
                                <h4>Services</h4>
                                <p>Services you got never before. We will provide every essentail service you need to make your experience better with us. </p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col-md-4 hotel-info">
                            <div class="info-left">
                                <img src="images/s4.png" alt="">
                            </div>
                            <div class="info-right">
                                <h4>Secure</h4>
                                <p>Customer security is our topmost priority.You can choose our rental services as we provide the secure and safest environment.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="information-grid wow slideInRight" data-wow-delay="0.3s">
                        <div class="col-md-4 hotel-info">
                            <div class="info-left">
                                <img src="images/s3.png" alt="">
                            </div>
                            <div class="info-right">
                                <h4>Food</h4>
                                <p>Food is all you need to enjoy the most of your vacation.We provide our delicious and healthy breakfasts and dinners with all our hearts.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col-md-4 hotel-info">
                            <div class="info-left">
                                <img src="images/s5.png" alt="">
                            </div>
                            <div class="info-right">
                                <h4>Best Online rate</h4>
                                <p>Did you find a lower rate?We'll match it and give you an additional 25% discount on your stay.Terms and Conditions apply.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col-md-4 hotel-info">
                            <div class="info-left">
                                <img src="images/s6.png" alt="">
                            </div>
                            <div class="info-right">
                                <h4>Bell</h4>
                                <p>Need Help? Just ring the bell and our maintenance staff is always ready to help.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--information end here-->
      
         <div class="home-block">
            <div class="container">
                <div class="home-main">
                    <div class="home-top">
                        <h3 style='font-family:Brush Script'><b><em>Cities</em></b></h3>
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
         <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
     <!--leaves start here-->
        <div class="leaves">
            <div class="container">
                <div class="leaves-main wow zoomIn" data-wow-delay="0.3s">
                    <h1>You Never Leave Us</h1>
                    <h6>100% Friendly services</h6>
                    <p>Come , Stay and Enjoy your day.<br>We will not just provide an ordinary room but you will have extra ordinary experience with us.We share a passion of hospitality and make your travel experience never forgettable. We aim to redefine a new dimension of luxury and relaxation. </p>
<!--                    <a href="single.html" class="hvr-push">Discover More</a>-->
                </div>
            </div>
        </div>
        <!--leaves end here-->
        <!--branches start here-->
<!--        <div class="branches">
            <div class="branches-main wow zoomIn" data-wow-delay="0.3s">
                <div class="branches-top">
                    <h3>Our Branches</h3>
                </div>
                <div  id="effect-5" class="branch-btm">
                    <div  class="col-md-3 branch-gd-main" >					
                        <div class="branch-gd  no-mar"> <a href="room.html">
                                <img src="images/b6.jpg" alt="" class="img-responsive">
                                <div class="overlay">
                                    <span class="expand lardge">+</span>
                                    <span class="close-overlay hidden">x</span>
                                </div></a>
                        </div>                 
                    </div>				
                    <div class="col-md-3 branch-gd-main">
                        <div class="branch-gd went-branc"><a href="room.html">
                                <img src="images/b1.jpg" alt="" class="img-responsive">
                                <div class="overlay">
                                    <span class="expand">+</span>
                                    <span class="close-overlay hidden">x</span>
                                </div></a>
                        </div>
                        <div class="branch-gd went-branc"><a href="room.html">
                                <img src="images/b2.jpg" alt="" class="img-responsive">
                                <div class="overlay">
                                    <span class="expand">+</span>
                                    <span class="close-overlay hidden">x</span>
                                </div></a>
                        </div>
                    </div>
                    <div class="col-md-3 branch-gd-main">
                        <div class="branch-gd"><a href="room.html">
                                <img src="images/b3.jpg" alt="" class="img-responsive">
                                <div class="overlay">
                                    <span class="expand">+</span>
                                    <span class="close-overlay hidden">x</span>
                                </div></a>
                        </div>
                        <div class="branch-gd"><a href="room.html">
                                <img src="images/b4.jpg" alt="" class="img-responsive">
                                <div class="overlay">
                                    <span class="expand">+</span>
                                    <span class="close-overlay hidden">x</span>
                                </div></a>
                        </div>
                    </div>
                    <div class="col-md-3 branch-gd-main">
                        <div class="branch-gd went-branc2"><a href="room.html">
                                <img src="images/b5.jpg" alt="" class="img-responsive">
                                <div class="overlay">
                                    <span class="expand lardge">+</span>
                                    <span class="close-overlay hidden">x</span>
                                </div></a>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>-->
        <!--branches end here-->
        
        <!--swiming-->
<!--        <div class="swimming">
            <div class="container">
                <div class="swimming-main wow zoomIn" data-wow-delay="0.3s">
                    <div class="swimming-top">
                        <h3>Welcome</h3>
                    </div>
                    <div class="swimmimg-bot">
                        <div class="col-md-3 swimming-grid">
                            <h4>758</h4>
                            <span class="swim-icon-1"> </span>
                            <h5>Lorem Ipsum</h5>
                        </div>
                        <div class="col-md-3 swimming-grid">
                            <h4>4,790</h4>
                            <span class="swim-icon-2"> </span>
                            <h5>Lorem Ipsum</h5>
                        </div>
                        <div class="col-md-3 swimming-grid">
                            <h4>7,920</h4>
                            <span class="swim-icon-3"> </span>
                            <h5>Lorem Ipsum</h5>
                        </div>
                        <div class="col-md-3 swimming-grid">
                            <h4>190</h4>
                            <span class="swim-icon-4"> </span>
                            <h5>Lorem Ipsum</h5>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>-->
        <!--swimmg emd here-->
        <div class="branch-text">
            <div class="container">
                <span class="quotations"> </span>
                <p>We give you the legendary welcome, every time you come back.You can choose to stay in whatever your mind says. We are here with Rental rooms, apartments , villas, castles, amazing views, cruise rooms, and what not.Easy and hasttle free online payments are available. You can choose by the city you want to stay in India. Enjoy the extra ordinary retreat with exclusive offers. </p>
            </div>
        </div>
        <!--homegrids start here-->
<!--        <div class="home-block">
            <div class="container">
                <div class="home-main">
                    <div class="home-top">
                        <h3>Cities</h3>
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
                    </div>-->
                    <!--				<div class="col-md-4 home-grid">
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
                                                    </div>-->
<!--                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>-->
    <!--home grid end here-->
    <!--footer start here-->
    <%@include file="footer.jsp" %>
    <!--footer end here-->
    <!--copy rights start here-->
   
</body>
</html>