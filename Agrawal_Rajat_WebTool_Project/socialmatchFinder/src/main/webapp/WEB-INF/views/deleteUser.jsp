<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>

<html class="gr__bepoke_com"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard</title>
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   
	<link href="${pageContext.servletContext.contextPath}/resources/1/css" rel="stylesheet" type="text/css">
    <link href="${pageContext.servletContext.contextPath}/resources/1/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/animate.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/nailthumb.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/jquery.nouislider.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/bootstrap-select.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/bootstrap.colorpickersliders.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/summernote.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/1/style_admin.css" rel="stylesheet">

<style type="text/css"></style></head>

<body class="fixed-sidebar no-skin-config skinweb" data-gr-c-s-loaded="true">

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> 
	                    <span>
                            <a href=""><img alt="image" class="img-circle avatar_left" src='${pageContext.servletContext.contextPath}/resources/img/default.jpg'></a>
                        </span>
						<a href="">
                        	<span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"></strong></span></span></a><strong class="font-bold"><a href=" user/profile/4">admin</a></strong>
                        
                    </div>
                    <div class="logo-element">MySoulMate Finder </div>
                </li>
                <li>
                    <a href="index"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-users"></i> <span class="nav-label">Manage Users</span></a>
                </li>
                 <li>
                    <a href="#"><i class="fa fa-bullhorn"></i> <span class="nav-label">Reported Users</span></a>
                </li>
                 <li>
                    <a href="#"><i class="fa fa-bullhorn"></i> <span class="nav-label">Reported Photos</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-diamond"></i> <span class="nav-label">Manage Premium</span></a>
                </li>
                 <li>
                    <a href="addcategory"><i class="fa fa-comments"></i> <span class="nav-label">Manage Forum</span></a>
                </li>              
            </ul>
        </div>
    </nav>

	<div id="page-wrapper" class="gray-bg clearfix">
        <div class="row border-bottom">
        	<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
		        <div class="navbar-header">
			        <ul class="nav-toolbar">
		                <li class="dropdown"><a href="#" data-toggle="dropdown"><i class="fa fa-bars" style="color:#77777f !important"></i></a>
		                	<div class="dropdown-menu lg pull-left arrow panel panel-default arrow-top-left">
		                    	<div class="panel-heading">
		                        	Admin Menu
		                        </div>		                        
		                    </div>
		                </li>
		            </ul>
		            <div class="brand-web brand-admin">
		           		<a href="">MySoulMate Finder</a>
		           		
		            </div>
		        </div>
	            <ul class="nav navbar-top-links navbar-right">
	               
	                <li>
	                    <a href="logout">
	                        <i class="fa fa-sign-out"></i> Log out
	                    </a>
	                </li>
	            </ul>
			</nav>
        </div><div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>Admin</h2>
        <ol class="breadcrumb">
            <li>
                <a href="#">Admin</a>
            </li>
            <li class="active">
                <strong>Dashboard</strong>
            </li>
        </ol>
    </div>
</div>

		<div class="col-lg-12 block_form">
				<table class="table table-bordered table-striped table-hover">
					<tbody>
						<tr>
							<th class="forum-title-topic-th">Manage Users</th>
						</tr>
						
						<c:forEach var="u" items="${sessionScope.uList}">
						<form action="deleteUser" commandName="user" method="post">				
							<tr>
                             <td>${u.userId}</td> 
                             <td><input name="" value="${u.userfullName}"/></td>
                             <td><input type="hidden" name="uid" value="${u.userId}"/>
                   			  <td><input type="submit" id="delete" class="btn btn-danger" value="Delete"/></td>
                           </tr>                           
                           </form>
                           </c:forEach>
                      </tbody></table>
                      </div>
                     
	
	    <!-- Mainly scripts -->
	    <script async="" src="./1/analytics.js"></script><script src="./1/jquery.js"></script>
	    <script src="./1/bootstrap.min.js"></script>
		<script src="./1/jquery.nailthumb.min.js"></script>
		<script src="./1/nouislider.min.js"></script>
		<script src="./1/tinycolor.js"></script>
		<script src="./1/bootstrap.colorpickersliders.min.js"></script>

		<script type="text/javascript">
			var base_url = " ";	
		</script>
	    
	    	
	    <!-- Custom and plugin javascript -->
	    <script src="./1/flatui-fileinput.js"></script>
	    <script src="./1/masonry.min.js"></script>
		
		<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-37805539-31', 'auto');
  ga('send', 'pageview');

</script>	

</div></div></body></html>