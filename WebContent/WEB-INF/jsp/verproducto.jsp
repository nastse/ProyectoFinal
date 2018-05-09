<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vista producto</title>
	
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
</head>

<div class="container-fluid">	
	<div id="banner" class="row p-1 d-flex justify-content-end">
				<c:if test="${empty sessionScope.email}">
	        		<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGIN</button>
					</div>
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA</button>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.email}">
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/logout';">LOGOUT</button>
					</div>
				</c:if>
	</div>
</div>


<body>
	<div class="container">	
	
		<div id="" class="row justify-content-md-center justify-content-sm-center">
			
			<h4>Cabecera con info del Usuario que lo ha subido</h4>
		
		</div>
		
		<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
			
					<div id="contenedor-imagen">
						<img class="rounded shadow mb-1"  width="100%" height="100%"src="${pageContext.request.contextPath}/img/${product.imagen}">
					</div>
				
					<div class="col-lg-6">
						<td>${product.categoria}</td>						
					</div>
					<div class="col-lg-6">						
						<td>${product.marca}</td>						
					</div>
					<div class="col-lg-6">						
						<td>${product.talla}</td>						
					</div>
					<div class="col-lg-6">						
						<td>${product.peso}</td>						
					</div>
					<div class="col-lg-6">						
						<td>${product.altura}</td>
					</div>
					<div class="col-lg-6">
						<td>${product.temp_max}</td>	
					</div>
					<div class="col-lg-6">	
						<td>${product.temp_min}</td>
					</div>
				
		</div>
	</div>

</body>
</html>