<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script src="js/jquery-1.11.0.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />	
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
<script src="js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div class="top-header">
            <div class="container">
                <div class="top-header-main">
                    <div class="col-md-4 top-social wow bounceInLeft" data-wow-delay="0.3s">
<!--                        <ul>
                            <li><h5>Experience the Luxury like never before.</h5></li>
                            <li><a href="#"><span class="fb"> </span></a></li>
                            <li><a href="#"><span class="tw"> </span></a></li>
                            <li><a href="#"><span class="in"> </span></a></li>
                            <li><a href="#"><span class="gmail"> </span></a></li>
                        </ul>-->
                    </div>
                    <div class="col-md-8 header-address wow bounceInRight text-center" data-wow-delay="0.3s">
                        <ul><!--
-->                            <li><span class="highlight"> </span> <h6>We share a passion for hospitality</h6></li><!--
-->                                                        <li><h3><a Experience the Luxury like never before.></a></h3></li><!--
-->                        </ul>
                        <!--<h3> Experience  the Luxury like never before</h3>-->
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
 