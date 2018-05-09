<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Producto seleccionado</title>
	
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
	
	<h1>Aqui cargo el producto entero</h1>

	<h2>Producto,${producto}</h2>


<div class="container">	
	
		<div id="" class="row justify-content-md-center justify-content-sm-center">
	
			<form action="${pageContext.request.contextPath}/upproducto"  method="post">	
				<table border="1" id="productTable">
						<tr>
							<th>Tipo</th>
							<th>Marca</th>
							<th>Talla</th>
							<th>Peso</th>
							<th>Temperatura Máxima</th>
							<th>Temperatura Mínima</th>
							<th>Imagen</th>
							<th>Cancelar</th>
							<th>Actualizar</th>
						</tr>
						
					<%-- PARA SABER QUE PRODUCTO/FILA ELIMINO  --%>
						<tr  id="tr_${product.id_rev}" align="center">
						
							<input type="hidden" name="id" value="${product.id_rev}">
							<input type="hidden" name="imagen" value="${product.imagen}">
							<input type="hidden" name="id_user" value="${product.id_user}">
							<input type="hidden" name="ajuste" value="${product.ajuste}">
							<input type="hidden" name="creado" value="${product.creado}">
							<input type="hidden" name="estado" value="${product.estado}">
							<td><input type="text" name="categoria" value="${product.categoria}"></td>
							<td><input type="text" name="marca" value="${product.marca}"></td>
							<td><input type="text" name="talla" value="${product.talla}"></td>
							<td><input type="text" name="peso" value="${product.peso}"></td>
							<td><input type="text" name="altura" value="${product.altura}"></td>
							<td><input type="text" name="temp_max" value="${product.temp_max}"></td>
							<td><input type="text" name="temp_min" value="${product.temp_min}"></td>
							<td><img width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product.imagen}"></td>	
							<td><a href="<c:url value='/myproducts'/>">Cancelar</a></td> 
							<td><input type="submit" value="Actualizar"></td>
						</tr>
				</table>
			</form>
	</div>
</div>				
	<a href="${pageContext.request.contextPath}/products">Lista productos</a>


</body>
</html>