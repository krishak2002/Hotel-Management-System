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
-->		<script>
		 new WOW().init();
		</script><!--
 animated-css 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" 
<script src="js/bootstrap.min.js"></script>-->
<%@include file="Header.jsp" %>


<script>
            function go()
            {
                var formdata = new FormData();
                var url = "./admin_manageOwner";
                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
            }
            var owneremail;
            function renderAsHtml(ans)
            {
                console.log(ans);
                // extract main object from string
                var mainobj = JSON.parse(ans);
                // now extract JSON ARRAY from main object
                var arr = mainobj.ans;
                console.log(arr);
                var s = "";
                var s2 = "";
                for (var j = 0; j < arr.length; j++)
                {
                    var obj = arr[j];
                    if (obj.status === "Pending")
                    {
                        s = s + '<div class="container">';
                        s = s + '<table class=\"table table-striped\">';
                        s = s + '<div class="col-sm-12">';
                        s = s + '<thead>';
                        s = s + '<tr>';
                        s = s + '<th><h6>Owner name:</h6></th>';
                        s = s + '<th><h6>Owner Email:</h6></th>';
                        s = s + '<th><h6>photo:</h6></th>';
                        s = s + '<th><h6>Airbnb name:</h6></th>';
                        owneremail = obj.owneremail;
                        s = s + "<input type=\"button\" value=\"Approve Owner\" class=\"btn btn-success\" onclick=\"Approve('" + owneremail + "')\" >";
                        s = s + '</tr>';
                        s = s + '</thead>';

                        s = s + '</tbody>';
                        s = s + '<tr>';
                        s = s + '<td>' + obj.ownername + '</td>';
                        s = s + '<td>' + obj.owneremail + '</td>';
                        s = s + "<td><img class=\"img-thumbnail\"  style=\"border: 2px solid black; border-radius: 20px; height: 100px;width: 150px\" src=\'" + obj.photo + "\' width='120px' height='100px' ></td>";
                        s = s + '<td>' + obj.airbnbname + '</td>';
                        s = s + '</tr>';
                        s = s + '</tbody>';
                        s = s + '</div>';
                        s = s + '</table>';
                        s = s + '</div><br>';
                    } else
                    {
                        s2 = s2 + '<div class="container">';
                        s2 = s2 + '<table class=\"table table-striped\">';
                        s2 = s2 + '<div class="col-sm-12">';
                        s2 = s2 + '<thead>';
                        s2 = s2 + '<tr>';
                        s2 = s2 + '<th><h6>Owner name:</h6></th>';
                        s2 = s2 + '<th><h6>Owner Email:</h6></th>';
                        s2 = s2 + '<th><h6>photo:</h6></th>';
                        s2 = s2 + '<th><h6>Airbnb name:</h6></th>';
                        owneremail = obj.owneremail;
                        s2 = s2 + "<input type=\"button\" value=\"Block Owner\" class=\"btn btn-danger\" onclick=\"Block('" + owneremail + "')\" >";
                        s2 = s2 + '</tr>';
                        s2 = s2 + '</thead>';
                        s2 = s2 + '</tbody>';
                        s2 = s2 + '<tr>';
                        s2 = s2 + '<td>' + obj.ownername + '</td>';
                        s2 = s2 + '<td>' + obj.owneremail + '</td>';
                        s2 = s2 + "<td><img class=\"img-thumbnail\"  style=\"border: 2px solid black; border-radius: 10px; height: 100px;width: 150px\" src=\'" + obj.photo + "\' width='120px' height='100px' ></td>";
                        s2 = s2 + '<td>' + obj.airbnbname + '</td>';
                        s2 = s2 + '</tr>';
                        s2 = s2 + '</tbody>';
                        s2 = s2 + '</div>';
                        s2 = s2 + '</table>';
                        s2 = s2 + '</div><br>';
                    }
                }

                document.getElementById("pending").innerHTML = s;
                document.getElementById("approved").innerHTML = s2;
                document.getElementById("pending").style.fontFamily = "Georgia, serif";
                document.getElementById("approved").style.fontFamily = "Georgia, serif";
            }

            function Approve(owneremail)
            {

                var formdata = new FormData();
                formdata.append("owneremail", owneremail);

                var url = "./ApproveOwner";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsApproval(ans));
            }
            function renderAsApproval(ans)
            {
                if (ans === "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Owner Approved!'
                    })
                    go();

                } else {
                   Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot Approve Owner!'
                    });
                }
            }

            function Block(owneremail)
            {

                var formdata = new FormData();
                formdata.append("owneremail", owneremail);

                var url = "./BlockOwner";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsPending(ans));
            }
            function renderAsPending(ans)
            {
                if (ans === "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Owner Blocked!'
                    })
                    go();
                } else {
                   Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot Block Owner!'
                    });
                }
            }

        </script>
<!--        <style>
            .inner-border {
                border: 15px solid #d9dbda;
                box-sizing: border-box;
            }
        </style>
       
          -->




</head>
<body onload="go()" >
<!--header-top start here-->

<!--header-top end here-->
<!--header start here-->
	<!-- NAVBAR
		================================================== -->

<%@include file="AdminNavbar.jsp" %>
<!--header end here-->
<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="contact-top">
<!--                            <h2>Add New Property Type</h2>-->
			</div>
			<div class="contact-bottom">
				<div class="col-md-9 contact-left"> 
                                
                                    <form>
                                        <div>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="classes-title">
                                                            <h2 style='font-family:Brush Script' text align='center'><b>Pending  Owners</b></h2><br><br>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="pending"  >

                                                </div>

                                            </div>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="classes-title">
                                                            <h2 style='font-family:Brush Script' text align='center'><b>Approved  Owners</b></h2><br><br>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="approved"  >

                                                </div>

                                            </div>
<!--                                            <input type="text" id="propertyname" class="form-control" placeholder="Property Name"><br><br>
                                            <input type="text" id="description" class="form-control" placeholder="Description"><br><br>
                                           <input type="file"id="photo" class="form-control" placeholder="Choose Photo"><br><br>  
                                             <input type="button" onclick="manage()" value="Add" class="btn btn-primary form-control"><br><br>
                                             

                                             </form>-->
<!--                                    <br><br><h1 style="color: #003366"> Already added Property Type </h1><br><br>
                                    <div id="showaddedProperties" >

                                    </div>
                       -->
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