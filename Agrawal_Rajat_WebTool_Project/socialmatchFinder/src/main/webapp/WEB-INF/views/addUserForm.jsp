<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Create User Profile</title>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/username.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/custom/checkPassword.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/1/css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/css(1)"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/css(2)"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/owl.theme.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/owl.transitions.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/nailthumb.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/blueimp-gallery.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/jquery.sidr.dark.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/jquery.nouislider.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/jquery.cssemoticons.css"
	media="screen" rel="stylesheet" type="text/css">
<link
	href="${pageContext.servletContext.contextPath}/resources/1/style.css"
	rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script
	src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resourcesjs/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/style.css"
	rel="stylesheet" />
<!----font-Awesome----->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/profi/le.css"
	rel="stylesheet" />
<!----font-Awesome----->
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
</head>
<body data-gr-c-s-loaded="true">
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a href="" class="sidr_btn"> <i class="fa fa-bars fa-lg"></i>
			</a> <a class="navbar-brand" href="#">MySoulMate Finder</a>
			<a class="navbar-brand right" style= "margin-left: 800px;" href="login">login</a>
		</div>
		
	</nav>
	<div class="container">
		<form:form action="adduser.htm" commandName= "userAccount" method="post">

			<h3 class="page-header">Create Profile</h3>

			<div class="row">
				<!-- left column -->

				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">HeadLine</h3>
							<a class="btn btn-info btn-clickable pull-right panel-collapsed"
								href="#"> <i class="fa fa-chevron-down"></i>
							</a>
						</div>
						<div class="panel-body" style="display: none;">
						<div class="col-md-4">
								<div class="text-center well" align="center">
									<img src="" class="avatar img-circle img-thumbnail">
									<h6>Upload a different photo...</h6>
									<form:input path="fileLocation"	class="form-control" />
								</div>
							</div> 
							
							<div class="col-md-12">
								<label class="control-label">Full Name: </label>
								<form:input path="userfullName" class="form-control" type="text"
									placeholder="Enter your Full Name" required="required"/>
							</div>

							<div class="col-md-12">
								<label class="control-label">Headline: </label>
								<form:input path="headline" class="form-control" type="text"
									placeholder="Headline" required="required"/>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">Login Details</h3>
							<a class="btn btn-info btn-clickable pull-right" href="#"> <i
								class="fa fa-chevron-up"></i>
							</a>
						</div>
						<div class="panel-body">
							<div class="col-md-12">
								<div class="form-group">

									<div class="col-md-6">
										<label class="control-label">E-Mail ID:</label>
										<form:input path="email" class="form-control" type="email" id="email"
											placeholder="Enter User E-Mail" required="required"/>										
									</div>

									<div class="col-md-6">
										<label class="control-label">User Name:</label>
										<form:input path="userName" class="username form-control placeholder-no-fix"  id= "username" required="required"/>
										<h4><i style="color:green;" class="fa fa-check">User Name Available</i><i style="color:red;" class="fa fa-times">User Name Already Exist</i></h4>
									</div>

									<div class="col-md-6">
										<label class="control-label">Password:</label>
										<form:input path="userPassword" id="pass"  class="form-control"
											type="password" placeholder="Password" required="required" />
									</div>
									<div class="col-md-6">
										<label class="control-label">Confirm Password:</label> <input
											id="repassword" type="password" required name="repassword"
											onkeyup="checkPassword(); return false;"
											placeholder="Confirm Password" autocomplete="off"
											class="form-control placeholder-no-fix" required="required">
											<p><span id="confirmMessage" class="confirmMessage"></span></p>
									</div>
									 
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- edit form column -->
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">Personal Information</h3>
							<a class="btn btn-info btn-clickable pull-right panel-collapsed"
								href="#"> <i class="fa fa-chevron-down"></i>
							</a>
						</div>
						<div class="panel-body" style="display: none;">
							<div class="form-group">
								  <div class="col-md-2">
                                <label class="control-label">DOB Month:</label>
                                <form:input path="dobmonth" class="form-control" type="number" min="1" max="12" size="2"   placeholder="Enter DOB Month" required="required"/>
                            </div>
                            
                             <div class="col-md-2">
                                <label class="control-label">DOB Date:</label>
                                <form:input path="dobday" class="form-control" type="number" min="1" max="31" size="2" placeholder="Enter DOB Date" required="required"/>
                            </div>
                            
                             <div class="col-md-2">
                                <label class="control-label"> DOB Year:</label>
                                <form:input path="dobyear" class="form-control" type="number"  maxlength="4" size="4" placeholder="Enter DOB Year" required="required"/>
                            </div>
                            
                            
                             <div class="col-md-2">
                                <label class="control-label">Age:</label>
                                <form:input path="age" class="form-control" type="number" min="18" max="45" placeholder="Enter Age" required="required"/>
                            </div>
                            
                            
                             <div class="col-md-4">
                                <label class="control-label">Gender:</label>
                                <form:input path="gender" class="form-control" type="text" placeholder="Enter Gender" required="required"/>
                            </div>
                            
                             <div class="col-md-4">
                                <label class="control-label">Seeking Gender:</label>
                                <form:input path="seekingGender" class="form-control" type="text" placeholder="Enter seeking Gender"  required="required"/>
                            </div>                         
                            
                            
                             <div class="col-md-4">
                                <label class="control-label">City:</label>
                                <form:input path="city" class="form-control" type="text" placeholder="Enter City Name"  required="required"/>
                            </div>
                            
                            
                             <div class="col-md-4">
                                <label class="control-label">State:</label>
                                <form:input path="state" class="form-control" type="text" placeholder="Enter State" required="required"/>
                            </div>
                            
                            
                             <div class="col-md-4">
                                <label class="control-label">Country:</label>
                                <form:input path="country" class="form-control" type="text" placeholder="Enter Country" required="required"/>
                            </div>
                            
                             <div class="col-md-4">
                                <label class="control-label">Postal Code:</label>
                                <form:input path="postalCode" class="form-control" type="number" maxlength="5" size="5" placeholder="Enter Postal Code" required="required"/>
                            </div>                    
                        

								<div class="col-md-4">
									<label class="control-label">Height:</label>
									<form:input path="height" class="form-control" type="number"
										placeholder="Enter Height" required="required" max="7"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Weight:</label>
									<form:input path="weight" class="form-control" type="number"
										placeholder="Enter weight" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">GrewUpIn:</label>
									<form:input path="grewUpIn" class="form-control" type="text"
										placeholder="Enter GrewUp Location" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Zodiac Sign:</label>
									<form:input path="zodiacSign" class="form-control" type="text"
										placeholder="Enter zodiac sign" required="required" />
								</div>

								<div class="col-md-4">
									<label class="control-label">Language I Speak: </label>
									<form:input path="languages" class="form-control" type="text"
										placeholder="Languages" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Maritial Status: </label>
									<form:input path="maritalStatus" class="form-control"
										type="text" placeholder="Enter Marital Status" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Relationship seeking: </label>
									<form:input path="relationshipType" class="form-control"
										type="text" placeholder="Enter Relationship Type" required="required" />
								</div>

								<div class="col-md-4">
									<label class="control-label">Custody: </label>
									<form:input path="custody" class="form-control" type="text"
										placeholder="Enter Custody" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Want more children:</label>
									<form:input path="moreChildrenFlag" class="form-control"
										type="text" placeholder="Enter more children" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Religion: </label>
									<form:input path="religion" class="form-control" type="text"
										placeholder="Enter Religion" required="required"/>
								</div>


								<div class="col-md-4">
									<label class="control-label">Ethnicity:</label>
									<form:input path="ethnicity" class="form-control" type="text"
										placeholder="Enter Ethnicity" required="required"/>
								</div>


								<div class="col-md-4">
									<label class="control-label">Smoking Habits: </label>
									<form:input path="smokingHabits" class="form-control"
										type="text" placeholder="Enter Smoking Habits" required="required"/>
								</div>

								<div class="col-md-4">
									<label class="control-label">Drinking Habits:</label>
									<form:input path="drinkingHabits" class="form-control"
										type="text" placeholder="Enter drinking Habits" required="required"/>
								</div>


								<div class="col-md-8">
									<label class=" control-label">ABOUT ME:</label>
									<form:textarea path="aboutMe1" class="form-control" rows="3"
										cols="100" required="required"/>
								</div>

								<div class="col-md-8">
									<label class=" control-label">More Information about me
										:</label>
									<form:textarea path="aboutMe2" class="form-control" rows="3"
										cols="100" required="required"/>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">Education/Profession Information</h3>
							<a class="btn btn-info btn-clickable pull-right panel-collapsed"
								href="#"> <i class="fa fa-chevron-down"></i>
							</a>
						</div>
						<div class="panel-body" style="display: none;">

							<div class="col-md-4">
								<label class="control-label">Education Level:</label>
								<form:input path="educationLevel" class="form-control"
									type="text" placeholder="Enter Education Level" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Studies Emphasis:</label>
								<form:input path="studiesEmphasis" class="form-control"
									type="text" placeholder="Studies Emphasis" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Occupation:</label>
								<form:input path="occupation" class="form-control" type="text"
									placeholder="Occupation" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Occupation Description:</label>
								<form:textarea path="occupationDescription" class="form-control"
									rows="3" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Income Level: </label>
								<form:input path="incomeLevel" class="form-control" type="text"
									placeholder="Enter Income Level" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Willing to Relocate:</label>
								<form:input path="relocateFlag" class="form-control" type="text"
									placeholder="Willing to Relocate" required="required"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">Liking/Disliking Information</h3>
							<a class="btn btn-info btn-clickable pull-right panel-collapsed"
								href="#"> <i class="fa fa-chevron-down"></i>
							</a>
						</div>
						<div class="panel-body" style="display: none;">
							<div class="col-md-4">
								<label class="control-label">Favorite activities: </label>
								<form:input path="leisureActivity" class="form-control"
									type="text" placeholder="leisure Activity" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Favorite music:</label>
								<form:input path="music" class="form-control" type="text"
									placeholder="Enter Music" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Like to read: </label>
								<form:input path="reading" class="form-control" type="text"
									placeholder="Enter Novel" />
							</div>

							<div class="col-md-4">
								<label class="control-label">Favourite Cusine: </label>
								<form:input path="cuisine" class="form-control" type="text"
									placeholder="Favourite Cusine" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Like going out:</label>
								<form:input path="entertainmentLocation" class="form-control"
									type="text" placeholder="Enter entertainment Location" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Favorite physical
									activities: </label>
								<form:input path="physicalActivity" class="form-control"
									type="text" placeholder="Enter physical Activity" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Favorite personality
									traits: </label>
								<form:input path="personalityTrait" class="form-control"
									type="text" placeholder="personality traits" required="required"/>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">Physical Appearance Information</h3>
							<a class="btn btn-info btn-clickable pull-right panel-collapsed"
								href="#"> <i class="fa fa-chevron-down"></i>
							</a>
						</div>
						<div class="panel-body" style="display: none;">
							<div class="col-md-4">
								<label class="control-label">Hair color:</label>
								<form:input path="hairColor" class="form-control" type="text"
									placeholder="Enter Hair color" required="required"/>
							</div>
							<div class="col-md-4">
								<label class="control-label">Rate apperance:</label>
								<form:input path="appearanceImportance" class="form-control"
									type="text" placeholder="Enter Rate apperancee" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Body Type: </label>
								<form:input path="bodyType" class="form-control" type="text"
									placeholder="Enter Body Type" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Eye Color:</label>
								<form:input path="eyeColor" class="form-control" type="text"
									placeholder="Enter Eye Color" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Political Orientation: </label>
								<form:input path="politicalOrientation" class="form-control"
									type="text" placeholder="Enter Political Orientation" required="required"/>
							</div>


							<div class="col-md-4">
								<label class="control-label">Rate Intelligence: </label>
								<form:input path="intelligenceImportance" class="form-control"
									type="text" placeholder="Enter Rate Intelligence" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Activity Level:</label>
								<form:input path="activityLevel" class="form-control"
									type="text" placeholder="Enter Activity Level" required="required"/>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Patner Information</h3>
							<a class="btn btn-info btn-clickable pull-right panel-collapsed"
								href="#"> <i class="fa fa-chevron-down"></i>
							</a>
						</div>
						<div class="panel-body" style="display: none;">
							<div class="col-md-4">
								<label class="control-label">I'am looking for:</label>
								<form:textarea path="perfectMatchEssay" class="form-control"
									rows="2" required="required"/>
							</div>

							<div class="col-md-4">
								<label class="control-label">Ideal Date:</label>
								<form:textarea path="perfectFirstDateEssay" class="form-control"
									rows="3" cols="100" required="required"/>
							</div>

							<div class="col-md-8">
								<label class="control-label">My perception of an ideal
									relationship:</label>
								<form:textarea path="idealRelationshipEssay"
									class="form-control" rows="3" cols="100" required="required"/>
							</div>

							<div class="col-md-8">
								<label class="control-label">What I've learned from my
									past relationships: </label>
								<form:textarea path="learnFromThePastEssay" class="form-control"
									rows="3" cols="100" required="required"/>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-12">
				<label class="control-label"></label> <input class="btn btn-primary"
					value="Register User" type="submit"  id="save"> <input
					class="btn btn-default" value="Reset" type="reset">
			</div>
		</form:form>
	</div>
	<br/>
	<br/>
	<br/>
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
