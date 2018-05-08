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
<!-- 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>  -->
	<script>
	
	
	</script>
	
	<title>Mi perfil</title>
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
	<c:if test="${empty sessionScope.email}">
        <h1>INICIA SESION</h1>
	</c:if>
	
	<c:if test="${not empty sessionScope.email}">
		<div class="container p-5">		
			<c:forEach items="${datosUsuario}" var="usuario" varStatus="status">
				<form action="${pageContext.request.contextPath}/myprofile" method="post" enctype="multipart/form-data">
					<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-4 bg-white rounded">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
							<img class="rounded-circle rounded justify-content-center shadow mb-2" width="200px" height="200px" src="${pageContext.request.contextPath}/img/${usuario.imagen}">
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1 align-self-end">	
  								<input type="file" name="image" class="btn btn-primary">
  								<input type="hidden" name="imagen" value="${usuario.imagen}">
						</div>
					</div>
			
					<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-4 bg-white rounded">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">		
								<label>Nombre de Usuario:</label>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
								<input class="form-control" id="username" type="text" name="username" value="${usuario.nombre}">
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
								<label>Género:</label>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">
							<c:if test="${usuario.genero.equals('Hombre')}">
								<div class="form-check">
								  <input class="form-check-input"  type="radio" name="sexo" value="Hombre" checked>
								  <label class="form-check-label" for="sexo">
								    Hombre
								  </label>
								</div>
								<div class="form-check">
								  <input class="form-check-input"  type="radio" name="sexo" value="Mujer">
								  <label class="form-check-label" for="sexo">
								    Mujer
								  </label>
								</div>
							</c:if>	
							<c:if test="${usuario.genero.equals('Mujer')}">
								<div class="form-check">
								  <input class="form-check-input"  type="radio" name="sexo" value="Hombre">
								  <label class="form-check-label" for="sexo">
								    Hombre
								  </label>
								</div>
								<div class="form-check">
								  <input class="form-check-input"  type="radio" name="sexo" value="Mujer" checked>
								  <label class="form-check-label" for="sexo">
								    Mujer
								  </label>
								</div>
							</c:if>	
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">		
								<label>Peso:</label>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
							<select class="form-control" name="peso">
								<option value = "${usuario.peso}"/>${usuario.peso}kg</option>
									<c:forEach var = "i" begin = "40" end = "200">
				         				<option value = "${i}"/>${i}kg</option>
				     				</c:forEach>			
							</select>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
							<label>Altura:</label>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
							<select class="form-control" name="altura">
									<option value = "${usuario.altura}"/>${usuario.altura}cm</option>
									<c:forEach var = "i" begin = "150" end = "250">
				         				<option value = "${i}"/>${i}cm</option>
				     				</c:forEach>			
							</select>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
							<label>Edad:</label>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1">	
							<select class="form-control" name="edad">
									<option value = "${usuario.edad}"/>${usuario.edad} años</option>
									<c:forEach var = "i" begin = "1" end = "101">
				         				<option value = "${i}"/>${i} años</option>
				     				</c:forEach>			
							</select>
							<input type="hidden" name="usuario" value="${usuario.id_usuario}">
							
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-1 ">
							<input class="btn btn-primary" type="submit" value="Guardar">
						</div>
					</div>	
				</form>
			</c:forEach>
		</div>			
	</c:if>	
</body>
</html>