<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Nuevo Producto</title>
	
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		 .invalid-feedback {
    			display: block;
  				}
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
	
	<script>
 		 	var loadFile = function(event) {
    		var output = document.getElementById('imagen');
   		 	output.src = URL.createObjectURL(event.target.files[0]);
  };
</script>
	
</head>

<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

<body>
	<c:if test="${empty sessionScope.email}">
	   <div class="container">	
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
				 <h1>INICIA SESION</h1>
			</div>
	   </div>     
	</c:if>


<c:if test="${not empty sessionScope.email}">	
	<div class="container">	
	
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
				<h1>Cabecera con datos del usuario que lo modifica</h1>
			</div>
			
			<form action="${pageContext.request.contextPath}/altaproducto" method="post" enctype="multipart/form-data">
			
				<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
							
							<div class="col-lg-12">
									<img id="imagen" class="img-fluid" src="${pageContext.request.contextPath}/img/${product.imagen}">	
							</div>
									<input type="file" name="image" accept="image/jpeg" class="btn" onchange="loadFile(event)">
							
				</div>		
				<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-left">	
							<div class="col-lg-3">
								<label>Categoria</label><br>
							</div>
							<div class="col-lg-3">	
	<%-- 							<input type="text" name="categoria" value="${product.categoria}">  --%>
									<select class="form-control" name="categoria" required>
										<option value = ""/></option>
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
									<select class="form-control" name="marca" required>
										<option value = ""/></option>
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
									<select class="form-control" name="talla" required>
										<option value = ""/></option>
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
								<select class="form-control" name="peso" required>
											<option value = ""/></option>
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
								<select class="form-control" name="altura" required>
											<option value = ""/></option>
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
								<select class="form-control" name="temp_min" required>
											<option value = ""/></option>
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
								<select class="form-control custom-select" name="temp_max" required >
											<option value = ""/></option>
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
								<select class="custom-select" required name="temp_max2">
											<option value = ""/></option>
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
	
								
							</div>
							<div class="col-lg-12">	
									<a href="<c:url value='/myproducts'/>">Cancelar</a> 
									<input type="submit" value="Guardar" >													
							</div>
							
					</div>
			</form>	
	</div>				

</c:if>
</body>
</html>