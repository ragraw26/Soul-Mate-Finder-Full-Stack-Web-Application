<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <!-- Custom Theme files -->
<link
	href="${pageContext.servletContext.contextPath}/resources//css/style.css"
	rel="stylesheet" />	
<script
	src="${pageContext.servletContext.contextPath}/resources//js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources//js/bootstrap.min.js"></script>
 
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
						<li><a href="logout">Logout</a></li>
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
									<li><a href="#"> <i class="glyphicon glyphicon-user"></i>
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
                              <input type="text" style="width:500px;" class="form-control" id="search" placeholder="Search Everyone" />
                          
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
									<section class="wrapper site-min-height">
										<div class="row">
											<div id="searchArea" class="col-lg-12">

												<c:forEach var="user" items="${userList}">
													<div class="col-md-12">
														<div class="form-panel">
															<form:form method="GET" action="profile">
											<h3 class="col-md-12">					<a href="profile?userId=${user.getUserId()}">
																		<i class="fa fa-angle-right"></i> <img
																			onerror="this.src='resources/img/default.jpg';"
																			src="${user.getFileLocation()}" width=150
																			height=150 class="img-circle" />
																		${user.getUserfullName()}</a>
																<button type="submit" disabled
																	class="pull-right btn btn-danger btn-sm">Interest
																	 Sent</button>
																</h3>
																<input type="hidden" name="userId"
																	value="${user.getUserId()}" />
															</form:form>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</section>
								</section>
								</div>
						</div>
						</div>
							</div>
						</div>
						</div>

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
												<form action="" method="POST" enctype="multipart/form-data"
													class="form_avatar">
													<div class="form-group" style="text-align: left;">
														<label class="control-label">Your Message</label>
														<textarea class="form-control form-pm-text"
															id="pm_main_txt" placeholder="Type your message here."></textarea>
													</div>
													<div style="text-align: center">
														<a href="#" class="btn btn-primary btn-submit-send-pm"
															data-user-id="23"><i class="fa fa-envelope"></i> Send
															my PM</a>
													</div>
												</form>
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
												<label for="settings_showonly">Show Only...</label> <select
													id="settings_showonly"
													class="form-control settings_showonly"
													style="text-align: center !important;">
													<option value="0">Men</option>
													<option value="1">Women</option>
													<option value="2">Men & Women</option>
												</select>
											</div>
											<div class="form-group">
												<label for="settings_agerange">Ages</label> <select
													id="settings_agerange"
													class="form-control settings_showonly"
													style="text-align: center !important;">
													<option value="0">18-32</option>
													<option value="1">32-42</option>
													<option value="2">42-52</option>
												</select>
											</div>
											<div class="form-group">
												<label class="control-label">Country</label> <select
													id="country" name="country" class="form-control country"
													style="text-align: center !important;">
													<option value="0" selected="selected">Everywhere</option>
													<option value="AF">Afghanistan</option>
													<option value="AX">Åland Islands</option>
													<option value="AL">Albania</option>
													<option value="DZ">Algeria</option>
													<option value="AS">American Samoa</option>
													<option value="AD">Andorra</option>
													<option value="AO">Angola</option>
													<option value="AI">Anguilla</option>
													<option value="AQ">Antarctica</option>
													<option value="AG">Antigua and Barbuda</option>
													<option value="AR">Argentina</option>
													<option value="AM">Armenia</option>
													<option value="AW">Aruba</option>
													<option value="AU">Australia</option>
													<option value="AT">Austria</option>
													<option value="AZ">Azerbaijan</option>
													<option value="BS">Bahamas</option>
													<option value="BH">Bahrain</option>
													<option value="BD">Bangladesh</option>
													<option value="BB">Barbados</option>
													<option value="BY">Belarus</option>
													<option value="BE">Belgium</option>
													<option value="BZ">Belize</option>
													<option value="BJ">Benin</option>
													<option value="BM">Bermuda</option>
													<option value="BT">Bhutan</option>
													<option value="BO">Bolivia, Plurinational State of</option>
													<option value="BQ">Bonaire, Sint Eustatius and
														Saba</option>
													<option value="BA">Bosnia and Herzegovina</option>
													<option value="BW">Botswana</option>
													<option value="BV">Bouvet Island</option>
													<option value="BR">Brazil</option>
													<option value="IO">British Indian Ocean Territory</option>
													<option value="BN">Brunei Darussalam</option>
													<option value="BG">Bulgaria</option>
													<option value="BF">Burkina Faso</option>
													<option value="BI">Burundi</option>
													<option value="KH">Cambodia</option>
													<option value="CM">Cameroon</option>
													<option value="CA">Canada</option>
													<option value="CV">Cape Verde</option>
													<option value="KY">Cayman Islands</option>
													<option value="CF">Central African Republic</option>
													<option value="TD">Chad</option>
													<option value="CL">Chile</option>
													<option value="CN">China</option>
													<option value="CX">Christmas Island</option>
													<option value="CC">Cocos (Keeling) Islands</option>
													<option value="CO">Colombia</option>
													<option value="KM">Comoros</option>
													<option value="CG">Congo</option>
													<option value="CD">Congo, the Democratic Republic
														of the</option>
													<option value="CK">Cook Islands</option>
													<option value="CR">Costa Rica</option>
													<option value="CI">Côte d'Ivoire</option>
													<option value="HR">Croatia</option>
													<option value="CU">Cuba</option>
													<option value="CW">Curaçao</option>
													<option value="CY">Cyprus</option>
													<option value="CZ">Czech Republic</option>
													<option value="DK">Denmark</option>
													<option value="DJ">Djibouti</option>
													<option value="DM">Dominica</option>
													<option value="DO">Dominican Republic</option>
													<option value="EC">Ecuador</option>
													<option value="EG">Egypt</option>
													<option value="SV">El Salvador</option>
													<option value="GQ">Equatorial Guinea</option>
													<option value="ER">Eritrea</option>
													<option value="EE">Estonia</option>
													<option value="ET">Ethiopia</option>
													<option value="FK">Falkland Islands (Malvinas)</option>
													<option value="FO">Faroe Islands</option>
													<option value="FJ">Fiji</option>
													<option value="FI">Finland</option>
													<option value="FR">France</option>
													<option value="GF">French Guiana</option>
													<option value="PF">French Polynesia</option>
													<option value="TF">French Southern Territories</option>
													<option value="GA">Gabon</option>
													<option value="GM">Gambia</option>
													<option value="GE">Georgia</option>
													<option value="DE">Germany</option>
													<option value="GH">Ghana</option>
													<option value="GI">Gibraltar</option>
													<option value="GR">Greece</option>
													<option value="GL">Greenland</option>
													<option value="GD">Grenada</option>
													<option value="GP">Guadeloupe</option>
													<option value="GU">Guam</option>
													<option value="GT">Guatemala</option>
													<option value="GG">Guernsey</option>
													<option value="GN">Guinea</option>
													<option value="GW">Guinea-Bissau</option>
													<option value="GY">Guyana</option>
													<option value="HT">Haiti</option>
													<option value="HM">Heard Island and McDonald
														Islands</option>
													<option value="VA">Holy See (Vatican City State)</option>
													<option value="HN">Honduras</option>
													<option value="HK">Hong Kong</option>
													<option value="HU">Hungary</option>
													<option value="IS">Iceland</option>
													<option value="IN">India</option>
													<option value="ID">Indonesia</option>
													<option value="IR">Iran, Islamic Republic of</option>
													<option value="IQ">Iraq</option>
													<option value="IE">Ireland</option>
													<option value="IM">Isle of Man</option>
													<option value="IL">Israel</option>
													<option value="IT">Italy</option>
													<option value="JM">Jamaica</option>
													<option value="JP">Japan</option>
													<option value="JE">Jersey</option>
													<option value="JO">Jordan</option>
													<option value="KZ">Kazakhstan</option>
													<option value="KE">Kenya</option>
													<option value="KI">Kiribati</option>
													<option value="KP">Korea, Democratic People's
														Republic of</option>
													<option value="KR">Korea, Republic of</option>
													<option value="KW">Kuwait</option>
													<option value="KG">Kyrgyzstan</option>
													<option value="LA">Lao People's Democratic
														Republic</option>
													<option value="LV">Latvia</option>
													<option value="LB">Lebanon</option>
													<option value="LS">Lesotho</option>
													<option value="LR">Liberia</option>
													<option value="LY">Libya</option>
													<option value="LI">Liechtenstein</option>
													<option value="LT">Lithuania</option>
													<option value="LU">Luxembourg</option>
													<option value="MO">Macao</option>
													<option value="MK">Macedonia</option>
													<option value="MG">Madagascar</option>
													<option value="MW">Malawi</option>
													<option value="MY">Malaysia</option>
													<option value="MV">Maldives</option>
													<option value="ML">Mali</option>
													<option value="MT">Malta</option>
													<option value="MH">Marshall Islands</option>
													<option value="MQ">Martinique</option>
													<option value="MR">Mauritania</option>
													<option value="MU">Mauritius</option>
													<option value="YT">Mayotte</option>
													<option value="MX">Mexico</option>
													<option value="FM">Micronesia</option>
													<option value="MD">Moldova, Republic of</option>
													<option value="MC">Monaco</option>
													<option value="MN">Mongolia</option>
													<option value="ME">Montenegro</option>
													<option value="MS">Montserrat</option>
													<option value="MA">Morocco</option>
													<option value="MZ">Mozambique</option>
													<option value="MM">Myanmar</option>
													<option value="NA">Namibia</option>
													<option value="NR">Nauru</option>
													<option value="NP">Nepal</option>
													<option value="NL">Netherlands</option>
													<option value="NC">New Caledonia</option>
													<option value="NZ">New Zealand</option>
													<option value="NI">Nicaragua</option>
													<option value="NE">Niger</option>
													<option value="NG">Nigeria</option>
													<option value="NU">Niue</option>
													<option value="NF">Norfolk Island</option>
													<option value="MP">Northern Mariana Islands</option>
													<option value="NO">Norway</option>
													<option value="OM">Oman</option>
													<option value="PK">Pakistan</option>
													<option value="PW">Palau</option>
													<option value="PS">Palestinian Territory, Occupied</option>
													<option value="PA">Panama</option>
													<option value="PG">Papua New Guinea</option>
													<option value="PY">Paraguay</option>
													<option value="PE">Peru</option>
													<option value="PH">Philippines</option>
													<option value="PN">Pitcairn</option>
													<option value="PL">Poland</option>
													<option value="PT">Portugal</option>
													<option value="PR">Puerto Rico</option>
													<option value="QA">Qatar</option>
													<option value="RE">Réunion</option>
													<option value="RO">Romania</option>
													<option value="RU">Russian Federation</option>
													<option value="RW">Rwanda</option>
													<option value="BL">Saint Barthélemy</option>
													<option value="SH">Saint Helena</option>
													<option value="KN">Saint Kitts and Nevis</option>
													<option value="LC">Saint Lucia</option>
													<option value="MF">Saint Martin (French part)</option>
													<option value="PM">Saint Pierre and Miquelon</option>
													<option value="VC">Saint Vincent and the
														Grenadines</option>
													<option value="WS">Samoa</option>
													<option value="SM">San Marino</option>
													<option value="ST">Sao Tome and Principe</option>
													<option value="SA">Saudi Arabia</option>
													<option value="SN">Senegal</option>
													<option value="RS">Serbia</option>
													<option value="SC">Seychelles</option>
													<option value="SL">Sierra Leone</option>
													<option value="SG">Singapore</option>
													<option value="SX">Sint Maarten (Dutch part)</option>
													<option value="SK">Slovakia</option>
													<option value="SI">Slovenia</option>
													<option value="SB">Solomon Islands</option>
													<option value="SO">Somalia</option>
													<option value="ZA">South Africa</option>
													<option value="GS">South Georgia</option>
													<option value="SS">South Sudan</option>
													<option value="ES">Spain</option>
													<option value="LK">Sri Lanka</option>
													<option value="SD">Sudan</option>
													<option value="SR">Suriname</option>
													<option value="SJ">Svalbard and Jan Mayen</option>
													<option value="SZ">Swaziland</option>
													<option value="SE">Sweden</option>
													<option value="CH">Switzerland</option>
													<option value="SY">Syrian Arab Republic</option>
													<option value="TW">Taiwan, Province of China</option>
													<option value="TJ">Tajikistan</option>
													<option value="TZ">Tanzaniaf</option>
													<option value="TH">Thailand</option>
													<option value="TL">Timor-Leste</option>
													<option value="TG">Togo</option>
													<option value="TK">Tokelau</option>
													<option value="TO">Tonga</option>
													<option value="TT">Trinidad and Tobago</option>
													<option value="TN">Tunisia</option>
													<option value="TR">Turkey</option>
													<option value="TM">Turkmenistan</option>
													<option value="TC">Turks and Caicos Islands</option>
													<option value="TV">Tuvalu</option>
													<option value="UG">Uganda</option>
													<option value="UA">Ukraine</option>
													<option value="AE">United Arab Emirates</option>
													<option value="GB">United Kingdom</option>
													<option value="US">United States</option>
													<option value="UM">United States Minor Out Isl</option>
													<option value="UY">Uruguay</option>
													<option value="UZ">Uzbekistan</option>
													<option value="VU">Vanuatu</option>
													<option value="VE">Venezuela</option>
													<option value="VN">Viet Nam</option>
													<option value="VG">Virgin Islands, British</option>
													<option value="VI">Virgin Islands, U.S.</option>
													<option value="WF">Wallis and Futuna</option>
													<option value="EH">Western Sahara</option>
													<option value="YE">Yemen</option>
													<option value="ZM">Zambia</option>
													<option value="ZW">Zimbabwe</option>
												</select>
											</div>
											<div class="form-group city_form">
												<label class="control-label">City</label> <input type="text"
													id="cityform" placeholder="Write the city where you live"
													name="city" class="form-control cityform"> <span
													class="help-block m-b-none"><i
													class="fa fa-info-circle"></i> The search will be in all
													the specified country if you don't write a city name.</span>
											</div>
											<div class="form-group">
												<label class="control-label">Sort</label> <select
													name="sort_by" class="form-control sort_by"
													style="text-align: center !important;">
													<option value="0">Newest First</option>
													<option value="1">Last Online</option>
												</select>
											</div>
											<div class="settings_btn_placeholder">
												<div class="btn btn-danger resetfilters btn-sm">Reset
													Filter(s)</div>
											</div>
											<hr />
											<div class="settings_btn_placeholder">
												<div class="btn btn-primary btn-apply-filters">Apply
													Filter(s)</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!----Modal End--->
						<!---Modal for password Reset---->
						<div id="resetpassword" class="modal fade" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h3 class="text-center">Reset your Password?</h3>
									</div>
									<div class="modal-body" style="height: 300px;">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="text-center">
														<fieldset>
															<div class="form-group">
																<input class="form-control input-lg"
																	placeholder="Old Password" name="password"
																	type="password">
															</div>
															<div class="form-group">
																<input class="form-control input-lg"
																	placeholder="New Password" name="password"
																	type="password">
															</div>
															<div class="form-group">
																<input class="form-control input-lg"
																	placeholder="New Password" name="password"
																	type="password">
															</div>
															<input class="btn btn-lg btn-primary btn-block"
																value="Reset Password" type="submit">
														</fieldset>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--Model End--->
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
