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

            function manage() {
               
                var description = document.getElementById("description").value;
                var cityname = document.getElementById("cityname").value;
                var photo = document.getElementById("photo").files[0];
                

                var formdata = new FormData();
                
                formdata.append("description", description);

                formdata.append("cityname", cityname);
                
                 
                formdata.append("photo", photo);

                var url = "./citiesdetail";
                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));

            }
            function renderAsHtml(ans)
            {
               
                if (ans === "success")
                {
                   Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'City Added Successfully!'
                    })
                    showAddedcities();
                } else 
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Cannot Add City !'
                    });

                }
                showAddedcities();
            }
           
                         var id;
            function showAddedcities()
            {
              
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var res = this.responseText;
                        res = res.trim();
                        
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];
                        var ans = "";
                          ans = ans + "<div class=\"row\" >";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"col-sm-3\" >";
                            ans = ans + "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px; height: 175px;width: 250px\" src=\'" + st.photo + "\' ><br><br>";                      
                            ans = ans + "<span><b>"+st.cityname+"</b></span><br>";
                            id=st.id;
                            ans = ans + "<input type=\"button\" value=\"Remove City\" class=\"btn btn-dark\" onclick=\"RemoveProperty('" + id + "')\" ><br><br>";
                            ans = ans + "</div>";
                            }
                            ans = ans + "</div>";
                        document.getElementById("showaddedcities").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./AdminPropertyTypeServlet", true);

                //3. Send Request
                xhttp.send();
            }
        function RemoveProperty(id)
        {
            
            var formdata = new FormData();
            
            formdata.append("id",id);
            
            var url = "./deletecity";
             fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderofdeleteproperty(ans));
         }
         function renderofdeleteproperty(ans)
         {
                if (ans ==="success")
                {
                   Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'City Removed Successfully!'
                    })
//                    window.location.href = "newmanage.jsp";
              
                } else 
                {
                   Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'City Not Removed !'
                    });
                }
                showAddedcities();
         }
         
        </script>
          




</head>
<body onload="showAddedcities()" >
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
                            <h2 style='font-family:Brush Script'><b>Add New Cities</b></h2>
			</div>
			<div class="contact-bottom">
				<div class="col-md-9 contact-left"> 
                                
                                    <form>
                                        <div>
                                 
                                            <input type="text" id="cityname" class="form-control" placeholder="Cityname"><br><br>
                                         Description: <textarea id="description" class="form-control" placeholder="Description">
                                                
                                           </textarea><br><br>
                                           <input type="file"id="photo" class="form-control" placeholder="Choose Photo"><br><br>  
                                             <input type="button" onclick="manage()" value="Add" class="btn btn-primary form-control"><br><br>
                                             

                                             </form>
                                    <br><br><h1 style='font-family:Brush Script' text align='center'><b> Already added cities </b></h1><br><br>
                                    <div id="showaddedcities" >

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

<%@include file="footer.jsp" %>
<!--footer end here-->
<!--copy rights start here-->

</body>
</html>