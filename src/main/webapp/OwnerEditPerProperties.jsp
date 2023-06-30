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
    <% 
        String detailid = (String) request.getParameter("detailid"); 
    %>
    
        var detailid = "<%=detailid%>";
        function PrefilledData()
        {
            var formdata = new FormData();
            formdata.append("detailid", detailid);

            var url = "./prefilledData";

            fetch(url, {method: "POST", body: formdata})
                    .then(response => response.text())
                    .then(ans => renderAsHtml(ans));
        }

        function renderAsHtml(ans)
        {
           
            console.log(ans);
            // extract main object from string
            var mainobj = JSON.parse(ans);
            // now extract JSON ARRAY from main object
            var arr = mainobj.ans;
            console.log(arr);

            var obj = arr[0];

            document.getElementById("description").value = obj.description;
            document.getElementById("price").value = obj.price;
            document.getElementById("offerprice").value = obj.offerprice;
        }
    </script>

    <script>
        function updateProfile()
        {
            var desc = document.getElementById("description").value;
            var price = document.getElementById("price").value;
            var offerprice = document.getElementById("offerprice").value;

            var formdata = new FormData();
            formdata.append("detailid", detailid);
            formdata.append("description", desc);
            formdata.append("price", price);
            formdata.append("offerprice", offerprice);

            var url = "./UpdateProfile";

            fetch(url, {method: "POST", body: formdata})
                    .then(response => response.text())
                    .then(ans => renderUpdateProfile(ans));
        }
        function renderUpdateProfile(ans)
        {
            if (ans === "success")
            {
                Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Editing Successful!'
                    })
                PrefilledData();
            } else {
               Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot Edit !'
                    });
            }
        }
    </script>
    




</head>
<body onload="PrefilledData()">
<!--header-top start here-->

<!--header-top end here-->
<!--header start here-->
	<!-- NAVBAR
		================================================== -->

<%@include file="OwnerNavbar.jsp" %>
<!--header end here-->
<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="contact-top">
                            <h2 style='font-family:Brush Script'><b>Edit Your details</b></h2>
			</div>
			<div class="contact-bottom">
				<div class="col-md-9 contact-left"> 
                                
                                    <form>
                                        <div>
                                           Description:<textarea id="description" class="form-control" placeholder="Description" >
                                                
                                           </textarea><br><br>
                                                 Price:<input type="text" id="price" class="form-control" placeholder="Price"><br><br>
                                              Offer Price:<input type="text" id="offerprice" class="form-control" placeholder="Offer Price"><br><br>
                                                <input type="button" value="Edit profile" onclick="updateProfile()" class="btn btn-primary form-control"><br><br>
                                          
					
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