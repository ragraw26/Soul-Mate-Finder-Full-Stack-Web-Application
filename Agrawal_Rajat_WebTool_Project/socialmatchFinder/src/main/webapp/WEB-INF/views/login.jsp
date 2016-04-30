<!doctype HTML>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<html>
<head>
<title>My Soulmate Finder</title>
<!-- Custom Theme files -->
<link href="${pageContext.servletContext.contextPath}/resources/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" c ontent="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

<style>
.errorblock {
    color: #060505;
    background-color: #ffEEEE;  
    
}
.successblock {
    color: #060505;
    background-color: #9EF2DF;   
}
</style>

</head>
<body >
<!--login form start here-->
<h1>&nbsp;</h1>
<div class="login">
	<h1>My Soulmate Finder</h1>
	<c:if test="${!empty sessionScope.errorMessage}">
    <div class="errorblock">${errorMessage}</div>
	</c:if>
	<c:if test="${!empty sessionScope.success}">
    <div class="successblock">${success}</div>
	</c:if>
	<c:if test="${!empty sessionScope.error}">
    <div class="errorblock">${error}</div>
	</c:if>
	<form:form action="index.htm" commandName="userAccount" method= "post">
	
	<form:input  path="username" placeholder="User Name" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Name';}" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{3,20}$" required="required"/>
	<form:errors path="username" cssStyle="color:#ff0000" />
	<form:input type="password" required="required" path="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
	<form:errors path="password" cssStyle="color:#ff0000" />
	<div id ="msg" > </div>
	<div class="forgot">
   	  <label class="checkbox"><input type="checkbox" name="checkbox" checked><i> </i> Keep me signed in</label>
   	  <div class="forgot-para">
   	  	<a href="#"> <p>Forgot Your Password?</p></a>
   	  </div>
	   	<div class="clear"> </div>
	</div>
	
	<label  class="hvr-sweep-to-bottom">
	<input type="submit" value="Login"/>
	</label>
	 <h3>Not a member ? <a href="adduser.htm">Sign up now!</a>  </h3>
</form:form>
</div>

<div class="copyright">
	<p>Project for Web Tools - Rajat Agrawal</p>
</div>	

<!--login form end here-->

</body>
</html>