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

<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>
	<div class="container shadow p-2 bg-white rounded justify-content-center">	
	
		<div id="" class="row justify-content-md-center justify-content-sm-center text-center">
			<h4>Cabecera con info del Usuario que lo ha subido</h4>
		</div>
		
		<div class="row justify-content-md-center justify-content-sm-center text-center">
			<div class="col-lg-6">
					<img class="img-fluid" src="${pageContext.request.contextPath}/img/${product.imagen}">
			</div>
		</div>	
		<div class="row justify-content-md-center justify-content-sm-center text-center">
			<div class="col-lg-6">
				<label>Categoria</label><br>						
			</div>
			<div class="col-lg-6">
				<td>${product.categoria}</td>						
			</div>
			<div class="col-lg-6">
				<label>Marca</label><br>						
			</div>
			<div class="col-lg-6">						
				<td>${product.marca}</td>						
			</div>
			<div class="col-lg-6">
				<label>Talla</label><br>						
			</div>
			<div class="col-lg-6">						
				<td>${product.talla}</td>						
			</div>
			<div class="col-lg-6">
				<label>Peso</label><br>						
			</div>
			<div class="col-lg-6">						
				<td>${product.peso}</td>						
			</div>
			<div class="col-lg-6">
				<label>Altura</label><br>						
			</div>
			<div class="col-lg-6">						
				<td>${product.altura}</td>
			</div>
			<div class="col-lg-6">
				<label>Temperatura Mínima</label><br>						
			</div>
			<div class="col-lg-6">
				<td>${product.temp_min}</td>	
			</div>
			<div class="col-lg-6">
				<label>Temperatura Máxima</label><br>						
			</div>
			<div class="col-lg-6">	
				<td>${product.temp_max}</td>
			</div>
		</div>
		<hr>
		<div id="" class="row justify-content-md-center justify-content-sm-center text-center">		
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
								<hr>
							</div>
						
						<div class="col-lg-6">
							<label>Leer Comentario</label><br>	
							<textarea style="resize:none" class="form-control" rows="3" name="texto"></textarea>
						</div>
				</div>		
	</div>

</body>

<footer>
	<!-- 	AQUÍ INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>
</html>