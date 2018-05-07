<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	
	<title>Mi Perfil</title>
</head>

<div class="container-fluid">	
	<c:if test="${empty sessionScope.email}">
		<div id="banner" class="row p-1 d-flex justify-content-end">
		        <div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
					<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGIN</button>
				</div>
				<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
					<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA</button>
				</div>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.email}">
		<div id="banner" class="row p-1 d-flex justify-content-between align-items-center">			
				<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
					<img class="rounded-circle rounded  d-flex justify-content-center shadow d-flex" width="50px" height="50px" src="${pageContext.request.contextPath}/img/${datos[0].imagen}">
					
				</div>
				<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">
					<h5>Bienvenido ${datos[0].nombre}</h5>
				</div>
				<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
					<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/logout';">LOGOUT</button>
				</div>		
		</div>
	</c:if>	
</div>

<body>

	<c:if test="${empty sessionScope.email}">
	        <h1>INICIA SESION</h1>
	</c:if>
	
	<c:if test="${not empty sessionScope.email}">	
		<div class="container">		
			<table border="1" id="productTable">
					<tr>
						<th>Tipo</th>
						<th>Marca</th>
						<th>Talla</th>
						<th>Peso</th>
						<th>Altura</th>
						<th>Imagen</th>
						<th>Eliminar</th>
						<th>Actualizar</th>
					</tr>
					
		
				<%-- LE PASO EL OBJETO QUE ME DEVUELVE EL CONTROLADOR  --%>
				<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
				<c:forEach items="${listaReviews}" var="product">
				<%-- PARA SABER QUE PRODUCTO/FILA ELIMINO  --%>
					<tr  id="tr_${product.id_rev}" align="center">
						<td>${product.categoria}</td>
						<td>${product.marca}</td>
						<td>${product.talla}</td>
						<td>${product.peso}</td>
						<td>${product.altura}</td>
						<td><img width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product.imagen}"></td>	
						<td><input type="button" value="Delete" id="btn_${product.id_rev}"></td>
						<td><a href="<c:url value='/upproducto/${product.id_rev}'/>">Editar</a></td>
		
					</tr>
				</c:forEach>
			</table>
			
			<a href="${pageContext.request.contextPath}/products">Lista productos</a>
		</div>	
	</c:if>	
</body>
</html>