<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="application/x-javascript">	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script>
	$(document).ready(function() {
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop(true, true).slideDown("fast");
			$(this).toggleClass('open');
		}, function() {
			$('.dropdown-menu', this).stop(true, true).slideUp("fast");
			$(this).toggleClass('open');
		});
	});
</script>
<script
	src="${pageContext.servletContext.contextPath}/resources/custom/filterProfile.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/search.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/likes.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/comments.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/readNotification.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/readMessages.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources//1/css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/css(1)"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/css(2)"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/owl.theme.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/owl.transitions.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/nailthumb.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/blueimp-gallery.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/jquery.sidr.dark.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/jquery.nouislider.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/jquery.cssemoticons.css"
	media="screen" rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources//1/style.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources//css/profile.css"
	rel="stylesheet" />
	
<!-- Custom Theme files -->
<link
	href="${pageContext.servletContext.contextPath}/resources//css/style.css"
	rel="stylesheet" />	
<script
	src="${pageContext.servletContext.contextPath}/resources//js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources//js/bootstrap.min.js"></script>

<style>
.form-control {
	height: 33px;
}
</style>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</SCRIPT>
</head>
				
	
<!-- ============================  Navigation Start =========================== -->
<body data-gr-c-s-loaded="true">
<%
  response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %> 
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">		
			<a class="navbar-brand" href="#">MySoulMate Finder</a>
		</div>
		<div id="sidr" class="sidr left">
			<ul>
				<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-search"></i>Browse Profiles</a></li>
				<li><a href="friends"><i class="fa fa-users"></i>Friends</a></li>
				<li><a href="inbox"><i class="fa fa-envelope"></i>Messages</a></li>
			</ul>
		</div>
		<div id="bs-collapse-1">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="#" data-toggle="modal" data-target="#myModal"><span class="nav-label">Browse
							Profiles </span></a></li>
				<li><a href="friends"><span class="nav-label">Friends</span></a>
				</li>
				<li><a href="#"><span class="nav-label">Premium</span></a>
				</li>
				<li><a href="#"><span class="nav-label">Forum</span></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a class="lovesli" href="pendingRequests"><i
						class="fa fa-heart"></i></a></li>
				<li><a href="friendRequests"><i class="fa fa-eye"></i></a></li>
				<li><a href="inbox"><i class="fa fa-comments"></i></a></li>
				<li class="dropdown"><a href=""
					class="dropdown-toggle dropdown-avatar" data-toggle="dropdown"
					data-html="true" data-placement="bottom">
						<img alt="image" class="avatar_right"
						src='${pageContext.servletContext.contextPath}/resources/img/default.jpg'>
				</a>
					<ul class="dropdown-menu">
						<li><a href="logout" onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="" >Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="main_container">
				<div class="row">
					<div class="col-md-3">
						<div class="profile-sidebar">
							<!-- SIDEBAR USERPIC -->
							<div class="profile-userpic">
								<img src='${pageContext.servletContext.contextPath}/resources/img/default.jpg' class="img-responsive" alt="">
							</div>
							<!-- END SIDEBAR USERPIC -->
							<!-- SIDEBAR USER TITLE -->
							<div class="profile-usertitle">
								<div class="profile-usertitle-name">${sessionScope.user.userfullName}</div>
								<div class="profile-usertitle-name">${sessionScope.user.headline}</div>
								<div class="profile-usertitle-job">${sessionScope.user.occupation}</div>
							</div>
							<!-- END SIDEBAR USER TITLE -->
							<!-- SIDEBAR BUTTONS -->
							<div class="profile-userbuttons">
								<button type="button" class="btn btn-success btn-sm">Follow</button>
								<button type="button" class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#msg_modal">Message</button>

							</div>
							<!-- END SIDEBAR BUTTONS -->
							<!-- SIDEBAR MENU -->
							<div class="profile-usermenu">
							<ul class="nav">
									<li class="index"><a href="index"> <i
											class="glyphicon glyphicon-home"></i> Home									</a></li>
									<li class="myProfile"><a href="myProfile"> <i
											class="glyphicon glyphicon-home"></i> My Profile
									</a></li>
									<li><a href="editProfile"> <i class="glyphicon glyphicon-user"></i>
											Manage My Profile
									</a></li>
									<li class="sub-menu dropdown"><a href="javascript:;"> <i
											class="fa fa-child"></i> <span>Friends</span>
									</a>
										<ul class="sub dropdown-menu">
											<li><a href="friends">Your Friends</a></li>
											<li><a href="friendRequests">Friend Requests</a></li>
											<li><a href="pendingRequests">Pending Requests</a></li>
										</ul></li>									
									<li><a href="inbox" ><i class="glyphicon glyphicon-ok"></i>
											Messages
									</a></li>
									<li><a href="#" data-toggle="modal" data-target="#myModal">
											<i class="glyphicon glyphicon-flag"></i> Filter Profile
									</a></li>
								</ul>
							</div>
							<!-- END MENU -->
					
						</div>
					</div>
				
				
			<div class="col-md-9 profile_right">
						<div class="row">
						<!-- Search Controller -->
						
						<div class="col-md-12">					
						<form class="form-inline"  role="form">
                          <div class="form-group">
                              <input type="text" style="width:500px;" class="form-control" id="search" placeholder="Search Everyone"  required="required"/>
                          
                          <button type="submit" class="btn btn-theme">Search</button>
                          </div>
                      </form>
                     </div>
                   </div>
                   <br />
					<div class="row">
						<div class="col-md-12">
								<ul class="list-group">
									<li class="list-group-item"><span
										class="label label-default label-pill pull-xs-right">
										<c:out value="${sessionScope.messageCount}"></c:out>
										</span>
										 &nbsp;&nbsp;&nbsp;New Messages Received</li>
									<li class="list-group-item"><span
										class="label label-default label-pill pull-xs-right">
										<c:out value="${sessionScope.notificationCount}"></c:out>
										</span>
										 &nbsp;&nbsp;&nbsp;Profile View</li>
									<li class="list-group-item"><span
										class="label label-default label-pill pull-xs-right">1</span>
										 &nbsp;&nbsp;&nbsp;Interest Shown</li>
								</ul>
							</div>
						</div>	
	
	
	 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">		
              <div class="row">
                <div id="searchArea" class="col-md-10 main-chart">
	            <div class="row mtpost well">
	            	<c:forEach var="user" items="${userList}">
	                    <a href="getMessage?userId=${user.getUserId()}">
	                    <div class="form-panel">
	                      <img onerror="this.src='resources/img/default.jpg';" src="${user.getFileLocation()}" width=30px class="img-circle pull-left" />
	                      <h4>&nbsp; ${user.getUserfullName()}</a></h4>
	                   </div></a>
	                </c:forEach>
	                   <!-- form-panel -->
	                
	             </div><!-- /row -->                    
              
              </div><!-- /col-md-9 END SECTION MIDDLE -->
             </section>
          </section>


											<div class="modal inmodal" id="msg_modal" tabindex="-1"
												role="dialog" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content animated fadeIn">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span><span
																	class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">Send a Private Message</h4>
														</div>
														<div class="modal-body">
															<p>
															<form action="" method="POST"
																enctype="multipart/form-data" class="form_avatar">
																<div class="form-group" style="text-align: left;">
																	<label class="control-label">Your Message</label>
																	<textarea class="form-control form-pm-text"
																		id="pm_main_txt" placeholder="Type your message here."></textarea>
																</div>
																<div style="text-align: center">
																	<a href="#" class="btn btn-primary btn-submit-send-pm"
																		data-user-id="23"><i class="fa fa-envelope"></i>
																		Send my PM</a>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
								</div>
							</div>
	</div>
							<!----Modal--->
							<!-- Modal -->
							<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title">Filter Users Results</h4>
				</div>
				<div class="modal-body">											
							<div class="form-group">
								<label for="settings_showonly">Show Only...</label>
								<select id="gender"
									class="form-control settings_showonly"
									style="text-align: center !important;" >
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>
							<div class="form-group">
								<label for="settings_agerange">Ages</label>
								<select  id="age"
									class="form-control settings_showonly"
									style="text-align: center !important;" >
									<option value="18-32">18-32</option>
									<option value="32-42">32-42</option>
									<option value="42-52">42-52</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">Country</label>
								<select id="country" 
									class="form-control country"
									style="text-align: center !important;">
									<option value="0" selected="selected">Everywhere</option>
									<option value="US">United States</option>
									<option value="IN">INDIA</option>
								</select>
							</div>
							<div class="form-group city_form">
								<label class="control-label">City</label>
								<input type="text" id="city"
									placeholder="Write the city where you live" 
									class="form-control cityform" />
								<span class="help-block m-b-none"><i
									class="fa fa-info-circle"></i> The search will be in all the
									specified country if you don't write a city name.</span>
							</div>

							<div class="col-md-12">
								<label class="control-label"></label> 
								<button class="btn btn-primary" id="submit">
								Apply Filters
								</button>
							</div>				
				</div>
			</div>
		</div>
				</div>
			</div>
			<div class="container footer_container">
									<footer>
										<ul class="bottom_menu">
											<li><a href="#"><i class="fa fa-info-circle"></i>About</a>
											</li>
											<li><a href="#"><i
													class="fa fa-question-circle"></i>Help</a></li>
										</ul>
										<div class="copyright">© Copyright 2016 MySoulFinder</div>
									</footer>
								</div>
						

							<!-- ============================  Navigation End ============================ -->
</body>
</html>
