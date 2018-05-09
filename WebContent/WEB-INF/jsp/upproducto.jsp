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
    		span{
				background-color: #F27490;
				display: inline-block;
				height: 5px;
				width: 30px;
    		}
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>

	<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

<body>
	
	<div class="container">	
	
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
				<h1>Cabecera con datos del usuario que lo modifica</h1>
			</div>
		
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
			
						<div class="col-lg-12">
							<form action="${pageContext.request.contextPath}/upproducto"  method="post">	
								<input type="hidden" name="id" value="${product.id_rev}">
								<input type="hidden" name="imagen" value="${product.imagen}">
								<input type="hidden" name="id_user" value="${product.id_user}">
								<input type="hidden" name="ajuste" value="${product.ajuste}">
								<input type="hidden" name="creado" value="${product.creado}">
								<input type="hidden" name="estado" value="${product.estado}">
								<td><img class="img-fluid" src="${pageContext.request.contextPath}/img/${product.imagen}"></td>	
						</div>
			</div>		
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-left">	
						<div class="col-lg-3">
							<label>Categoria</label><br>
						</div>
						<div class="col-lg-3">	
	<%-- 						<input type="text" name="categoria" value="${product.categoria}"> --%>
								<select class="form-control" name="categoria">
									<option value = "${product.categoria}"/>${product.categoria}</option>
									<option value = "Maillot corto"/>Maillot corto</option>
									<option value = "Maillot largo"/>Maillot largo</option>
									<option value = "Cullote corto"/>Cullote corto</option>
									<option value = "Cullote largo"/>Cullote largo</option>
								</select>
						</div>		
						<div class="col-lg-3">	
							<label>Marca</label><br>
						</div>
						<div class="col-lg-3">
	<%-- 						<input type="text" name="marca" value="${product.marca}"> --%>
								<select class="form-control" name="marca">
									<option value = "${product.marca}"/>${product.marca}</option>
									<option value = "Castelli"/>Castelli</option>
									<option value = "Sportful"/>Sportful</option>
									<option value = "Rapha"/>Rapha</option>
									<option value = "Endura"/>Endura</option>
									<option value = "DBH"/>DBH</option>
									<option value = "ALE"/>ALE</option>
									<option value = "Santini"/>Santini</option>
									<option value = "Exteondo"/>Exteondo</option>
								</select>
						</div>
						<div class="col-lg-3">	
							<label>Talla</label><br>
						</div>	
						<div class="col-lg-3">
	<%-- 						<input type="text" name="talla" value="${product.talla}"> --%>
								<select class="form-control" name="talla">
									<option value = "${product.talla}"/>${product.talla}</option>
									<option value = "XXS"/>XXS</option>
									<option value = "XS"/>XS</option>
									<option value = "S"/>S</option>
									<option value = "M"/>M</option>
									<option value = "L"/>L</option>
									<option value = "XL"/>XL</option>
									<option value = "XXL"/>XXL</option>
									<option value = "XXXL"/>XXXL</option>
								</select>
	
						</div>
						<div class="col-lg-3">
							<label>Peso</label><br>
						</div>
						<div class="col-lg-3">	
	<%-- 						<input type="text" name="peso" value="${product.peso}"> --%>
							<select class="form-control" name="peso">
									<option value = "${product.peso}"/>${product.peso}kg</option>
										<c:forEach var = "i" begin = "40" end = "200">
					         				<option value = "${i}"/>${i}kg</option>
					     				</c:forEach>			
							</select>
						</div>
						<div class="col-lg-3">	
							<label>Altura</label><br>
						</div>	
						<div class="col-lg-3">
	<%-- 						<input type="text" name="altura" value="${product.altura}"> --%>
							<select class="form-control" name="altura">
										<option value = "${product.altura}"/>${product.altura}cm</option>
										<c:forEach var = "i" begin = "150" end = "250">
					         				<option value = "${i}"/>${i}cm</option>
					     				</c:forEach>			
							</select>
						</div>	
						<div class="col-lg-3">	
							<label>Temperatura Min</label><br>
						</div>	
						<div class="col-lg-3">
	<%-- 						<input type="text" name="temp_min" value="${product.temp_max}"> --%>
							<select class="form-control" name="temp_min">
								<option value = "${product.temp_min}"/>${product.temp_min}º</option>
										<c:forEach var = "i" begin = "1" end = "10">
					         				<option value = "${i-11}"/>${i-11}º</option>
					     				</c:forEach>
					     				<c:forEach var = "i" begin = "0" end = "50">
					         				<option value = "${i}"/>${i}º</option>
					     				</c:forEach>	
					     	</select>		
						</div>
						<div class="col-lg-3">	
							<label>Temperatura Max</label><br>	
						</div>
						<div class="col-lg-3">
	<%-- 						<input type="text" name="temp_max" value="${product.temp_min}"> --%>
							<select class="form-control" name="temp_max">
								<option value = "${product.temp_max}"/>${product.temp_max}º</option>
										<c:forEach var = "i" begin = "1" end = "10">
					         				<option value = "${i-11}"/>${i-11}º</option>
					     				</c:forEach>
					     				<c:forEach var = "i" begin = "0" end = "50">
					         				<option value = "${i}"/>${i}º</option>
					     				</c:forEach>	
					     	</select>	
						</div>
						<div class="col-lg-3">	
							<label>Temperatura Max</label><br>
						</div>
						<div class="col-lg-3">
	<%-- 						<input type="text" name="temp_max" value="${product.temp_min}"> --%>
							<select class="form-control" name="temp_max">
								<option value = "${product.temp_max}"/>${product.temp_max}º</option>
										<c:forEach var = "i" begin = "1" end = "10">
					         				<option value = "${i-11}"/>${i-11}º</option>
					     				</c:forEach>
					     				<c:forEach var = "i" begin = "0" end = "50">
					         				<option value = "${i}"/>${i}º</option>
					     				</c:forEach>	
					     	</select>	
						</div>
				</div>	
				
				<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">		
							<div class="col-lg-3">	
								<label>Ajuste/Compresion</label><br>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</div>
							<div class="col-lg-3">	
								<label>Comodidad</label><br>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</div>
							<div class="col-lg-3">	
								<label>Temperatura Max</label><br>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</div>
							<div class="col-lg-3">	
								<label>Recomendable</label><br>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</div>
							
						<div class="col-lg-6">
							<label>Comentario (opcional)</label><br>	
							<textarea style="resize:none" class="form-control" rows="3" name="texto"></textarea>
						</div>
				</div>		
				<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">		
						<div class="col-lg-12">	
								<a href="<c:url value='/myproducts'/>">Cancelar</a> 
								<input type="submit" value="Actualizar">
							</form>							
						</div>
				</div>
		
	</div>				
		<a href="${pageContext.request.contextPath}/products">Lista productos</a>


</body>
</html>