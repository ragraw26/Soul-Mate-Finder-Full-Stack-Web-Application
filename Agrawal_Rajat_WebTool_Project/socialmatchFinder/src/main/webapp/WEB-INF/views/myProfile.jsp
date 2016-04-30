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
<script type="text/javascript">
	$(document).on(
			'click',
			'.panel-heading .btn-clickable',
			function(e) {
				var $this = $(this);
				debugger
				if (!$this.hasClass('panel-collapsed')) {
					
					
				$this.parents('.panel').find('.panel-body').slideUp();
				$this.addClass('panel-collapsed');
				$this.find('i').removeClass('fa-chevron-up').addClass(
						'fa-chevron-down');
					
					$this.focus();
				} else {
					var div=$this.parent().parent().parent().parent();
					$(div).find('.panel-body').slideUp();
					$(div).find("a").addClass('panel-collapsed');
				$(div).find().find('i').removeClass('fa-chevron-up').addClass(
							'fa-chevron-down');
					$this.parents('.panel').find('.panel-body').slideDown();
					$this.removeClass('panel-collapsed');
					$this.find('i').removeClass('fa-chevron-down').addClass(
							'fa-chevron-up');
					$this.focus();
				}
			})
</script>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</SCRIPT>
<style>
.panel-heading .btn-clickable {
	display: inline-block;
	margin-top: -5px;
	font-size: 15px;
	margin-right: -10px;
	padding: 4px 10px;
	border-radius: 4px;
}

.panel-heading span {
	margin-top: -23px;
	font-size: 15px;
	margin-right: -9px;
}

.form-group {
	width: 100% !important;
}
</style>
<script
	src="${pageContext.servletContext.contextPath}/resources/custom/filterProfile.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/search.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/infiniteScrolling.js"></script>
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
<!----font-Awesome----->

</head>

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
									<li class="#"><a href="#"> <i
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
										
				<div class="row">
					<div id="searchArea" class="col-md-12">				 			
			   
              <!-- edit form column -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-info">

                    <div class="panel-heading">
                        <h3 class="panel-title">Personal Information</h3>
                        <a class="btn btn-info btn-clickable pull-right panel-collapsed" href="#">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
                    <div class="panel-body" style="display: none;">
                        <div class="form-group">
                                       <div class="col-md-4">
											<label class="control-label">Full name:</label>
											${user.userfullName}
										</div>

										<div class="col-md-4">
											<label class="control-label">Height:</label> ${user.height}
										</div>

										<div class="col-md-4">
											<label class="control-label">Weight:</label> ${user.weight}
										</div>

										<div class="col-md-4">
											<label class="control-label">GrewUpIn:</label>
											${user.grewUpIn}
										</div>

										<div class="col-md-4">
											<label class="control-label">Zodiac Sign:</label>
											${user.zodiacSign}
										</div>

										<div class="col-md-4">
											<label class="control-label">Language I Speak: </label>
											${user.languages}
										</div>

										<div class="col-md-4">
											<label class="control-label">Maritial Status: </label>
											${user.maritalStatus}
										</div>

										<div class="col-md-4">
											<label class="control-label">Relationship seeking: </label>
											${user.relationshipType}
										</div>

										<div class="col-md-4">
											<label class="control-label">Custody: </label>
											${user.custody}
										</div>

										<div class="col-md-4">
											<label class="control-label">Want more children:</label>
											${user.moreChildrenFlag}
										</div>

										<div class="col-md-4">
											<label class="control-label">Religion: </label>
											${user.religion}
										</div>


										<div class="col-md-4">
											<label class="control-label">Ethnicity:</label>
											${user.ethnicity}
										</div>


										<div class="col-md-4">
											<label class="control-label">Smoking Habits: </label>
											${user.smokingHabits}
										</div>

										<div class="col-md-4">
											<label class="control-label">Drinking Habits:</label>
											${user.drinkingHabits}
										</div>


										<div class="col-md-8">
											<label class=" control-label">ABOUT ME:</label>
											${user.aboutMe1}
										</div>

										<div class="col-md-8">
											<label class=" control-label">More Information about
												me :</label> ${user.aboutMe2}
										</div>
                    </div>
                </div>
              </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-info">

                    <div class="panel-heading">
                        <h3 class="panel-title">Education/Profession Information</h3>
                        <a class="btn btn-info btn-clickable pull-right panel-collapsed" href="#">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
                    <div class="panel-body" style="display: none;">
                    
                       <div class="col-md-4">
										<label class="control-label">Education Level:</label>
										${user.educationLevel}
									</div>

									<div class="col-md-4">
										<label class="control-label">Studies Emphasis:</label>
										${user.studiesEmphasis}
									</div>

									<div class="col-md-4">
										<label class="control-label">Occupation:</label>
										${user.occupation}
									</div>

									<div class="col-md-4">
										<label class="control-label">Occupation Description:</label>
										${user.occupationDescription}
									</div>

									<div class="col-md-4">
										<label class="control-label">Income Level: </label>
										${user.incomeLevel}
									</div>

									<div class="col-md-4">
										<label class="control-label">Willing to Relocate:</label>
										${user.relocateFlag}
									</div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-info">

                    <div class="panel-heading">
                        <h3 class="panel-title">Liking/Disliking Information</h3>
                        <a class="btn btn-info btn-clickable pull-right panel-collapsed" href="#">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
                    <div class="panel-body" style="display: none;">
                    <div class="col-md-4">
										<label class="control-label">Favorite activities: </label>
										${user.leisureActivity}
									</div>


									<div class="col-md-4">
										<label class="control-label">Favorite music:</label>
										${user.music}
									</div>


									<div class="col-md-4">
										<label class="control-label">Like to read: </label>
										${user.reading}
									</div>
									

									<div class="col-md-4">
										<label class="control-label">Like going out:</label>
										${user.leisureActivity}
									</div>
									
									<div class="col-md-4">
										<label class="control-label">Favorite physical
											activities: </label> ${user.physicalActivity}
									</div>


									<div class="col-md-4">
										<label class="control-label">Favorite personality
											traits: </label> ${user.personalityTrait}
									</div>
									
                     

                    </div>
                </div>
            </div>       
          
           <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-info">

                    <div class="panel-heading">
                        <h3 class="panel-title">Physical Appearance Information</h3>
                        <a class="btn btn-info btn-clickable pull-right panel-collapsed" href="#">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
                    <div class="panel-body" style="display: none;">
                     <div class="col-md-4">
										<label class="control-label">Hair color:</label>
										${user.hairColor}
									</div>
									<div class="col-md-4">
										<label class="control-label">Rate apperance:</label>
										${user.appearanceImportance}
									</div>

									<div class="col-md-4">
										<label class="control-label">Body Type: </label>
										${user.bodyType}
									</div>


									<div class="col-md-4">
										<label class="control-label">Eye Color:</label>
										${user.eyeColor}
									</div>


									<div class="col-md-4">
										<label class="control-label">Political Orientation: </label>
										${user.politicalOrientation}
									</div>


									<div class="col-md-4">
										<label class="control-label">Rate Intelligence: </label>
										${user.intelligenceImportance}
									</div>

									<div class="col-md-4">
										<label class="control-label">Activity Level:</label>
										${user.activityLevel}
									</div>     
                    </div>
                </div>
            </div>
            
             <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Patner Information</h3>
                        <a class="btn btn-info btn-clickable pull-right panel-collapsed" href="#">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
                    <div class="panel-body" style="display: none;">
                   	<div class="col-md-6">
										<label class="control-label">I'am looking for:</label>
										${user.seekingGender}
									</div>

									<div class="col-md-6">
										<label class="control-label">Ideal Date:</label>
										${user.perfectFirstDateEssay}
									</div>

									<div class="col-md-8">
										<label class="control-label">My perception of an ideal
											relationship:</label> ${user.idealRelationshipEssay}
									</div>

									<div class="col-md-8">
										<label class="control-label">What I've learned from my
											past relationships: </label> ${user.learnFromThePastEssay}
									</div>
                                                               		
                            </div>
                    </div>
                </div>
            </div> 
          	
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
					<form role="form">						
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
						
					</form>
				</div>
			</div>
		</div>
	</div>
	<!----Modal End--->
	
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


</body>
</html>

