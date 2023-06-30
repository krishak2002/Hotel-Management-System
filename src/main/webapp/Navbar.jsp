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
<!--			                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" /></a>-->
                                       <h2 style='font-family:Brush Script'> <b><em>The Residential</em></b> </h2>
			              </div>
			          </div>
		            <div id="navbar" class="navbar-collapse collapse">
		            <nav class="cl-effect-16" id="cl-effect-16">
		              <ul class="nav navbar-nav">
                                  
                                  <%
                                      String useremail4 = (String) session.getAttribute("useremail");
                                      
if(useremail4 != null){
                                  %>
                                  
		               <li><a class="active" href="" data-hover="Welcome: <%=useremail4%>">Welcome: <%=useremail4%></a></li>

                               <li><a class="active" href="userLogout.jsp" data-hover="Logout">Logout</a></li>
                               <li><a class="active" href="UserManageBookings.jsp" data-hover="View Bookings">View Bookings</a></li>
                                <%
                                    }
else{
                                
                                %>
                                
                                
<!--                                <li><a class="active" href="index.html" data-hover="Home">Home</a></li>-->
		                <li><a href="UserSignup.jsp" data-hover="User Signup">User Signup</a></li>
                                <li><a href="UserLogin.jsp" data-hover="User Login">User Login</a></li>
                                 <li><a href="OwnerSignup.jsp" data-hover="Owner Signup">Owner Signup</a></li>
                                 <li><a href="OwnerLogin.jsp" data-hover="Owner Login">Owner Login</a></li>
                                      <li><a href="AdminLogin.jsp" data-hover="Admin Login">Admin Login</a></li>
<!--                                <li><a href="room.html" data-hover="Rooms">Rooms</a></li>
                                <li><a href="shortcodes.html" data-hover="Shortcodes">Shortcodes</a></li>-->
                                
                                <%
                                    }
                                %>
                                
                                <!--<li><a href="LogOut.jsp" data-hover="Log Out">Log Out</a></li>-->						
                              </ul>
		            </nav>

		            </div>
		            <div class="clearfix"> </div>
		             </nav>
		          </div>
		           <div class="clearfix"> </div>
		    </div>
	 </div>
</div>
