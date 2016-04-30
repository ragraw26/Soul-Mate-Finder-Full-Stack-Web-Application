<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>

<html class="gr__bepoke_com"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard</title>
   
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
                    <a href="deleteUser"><i class="fa fa-users"></i> <span class="nav-label">Manage Users</span></a>
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
	<div class="row">
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<i class="fa fa-area-chart"></i>
				<div class="desc_admin_block">
					<b><c:out value="${sessionScope.userListCount}"/></b>
					<br>
					Total Users
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<i class="fa fa-user-plus"></i>
				<div class="desc_admin_block">
					<b><c:out value="${sessionScope.usertodayListCount}"/></b>
					<br>
					New Users Today
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<i class="fa fa-dollar"></i>
				<div class="desc_admin_block">
					<b>3</b>
					<br>
					Total Purchases
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<a href="deleteUser"><i class="fa fa-users"></i></a>
				<div class="desc_admin_block">
					<a href="deleteUser">Manage Users</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<a href="#"><i class="fa fa-users"></i></a>
				<div class="desc_admin_block">
					<a href="#">Reported Users</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<a href="#"><i class="fa fa-picture-o"></i></a>
				<div class="desc_admin_block">
					<a href="#">Reported Photos</a>
				</div>
			</div>
		</div>	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<a href="#"><i class="fa fa-diamond"></i></a>
				<div class="desc_admin_block">
					<a href="#">Manage Premium</a>
				</div>
			</div>
		</div>
				
		<div class="col-md-4">
			<div class="well block_admin_dash">
				<a href="addcategory"><i class="fa fa-comments"></i></a>
				<div class="desc_admin_block">
					<a href="addcategory">Manage Forum</a>
				</div>
			</div>
		</div>	
	</div>
</div>	
	  
</div></div></body></html>