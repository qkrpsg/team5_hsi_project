<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>PICKPIC | Admin</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
		name="viewport">
	<link href="<c:url value='/Bootstrap/css/bootstrap.css'/>"
		rel="stylesheet">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css'/>">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<c:url value='/css/ionicons.css'/>">
	<!-- Theme style -->
	<link rel="stylesheet" href="<c:url value='/css/AdminLTE.css'/>">
	<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
	        page. However, you can choose any other skin. Make sure you
	        apply the skin class to the body tag so the changes take effect. -->
	<link rel="stylesheet" href="<c:url value='/css/skin-blue.css'/>">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<script src="<c:url value='/js/jquery.js'/>"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="<c:url value='/Bootstrap/js/bootstrap.js'/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/js/adminlte.js'/>"></script>
	<!-- admin_generic -->
	<script src="<c:url value='/js/admin_generic.js'/>"></script>
    
    <!-- DataTable -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/> 
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css"/> 
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.min.css"/> 
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 탑 부분  -->
		<tiles:insertAttribute name="Admin_Top"/>
		<!-- 바디부분 -->
		<tiles:insertAttribute name="Admin_Body"/>
		<!-- 푸터 부분 -->
		<tiles:insertAttribute name="Admin_Footer"/>
	</div>
</body>
</html>