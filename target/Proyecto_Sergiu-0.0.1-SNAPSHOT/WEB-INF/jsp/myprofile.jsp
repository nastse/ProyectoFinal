<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		
    		#encabezado{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			font-weight: bold;
    			font-size:24px;
    			text-transform: uppercase;
    		}
    		#carga{
    			margin-top:20px;
    			max-width:200px;
    		}
    		
    		.form-control{
    			border-width: 2px; 
    			border-color: #0B0C10;
    			
    		}  	
  			.form-control:focus {
        		border-color: #0B0C10;
        		
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		#form:focus{
    			border-color: #F27490;
    			
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		#login{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
    			margin-top:50px;
    			width:133px;
 				background-color:#1F2833; 
/* 				background: linear-gradient(to bottom, #45484d 0%,#000000 100%); */
    		}
    		#login:hover{
    			background-color:#F27490;
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
	
	<title>Mi perfil</title>
</head>


<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

<body>
	<c:if test="${empty sessionScope.email}">
	   <div class="container">	
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
				<h1>DEBES INICIAR SESIÓN</h1>
				<meta http-equiv="Refresh" content="2;url=login">
			</div>  
	   </div>     
	</c:if>
	
	<c:if test="${not empty sessionScope.email}">
		<div class="container p-5">				
		
			<c:forEach items="${datosUsuario}" var="usuario" varStatus="status">
				<form action="${pageContext.request.contextPath}/myprofile" method="post" enctype="multipart/form-data">
					<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-4 bg-white rounded">
						<div class="col-12 text-center">
							<span id="encabezado">Actualiza tus datos</span>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-1 text-center">	
  								<img id="imagen" class="img-fluid rounded-circle rounded justify-content-center shadow mb-2" width="200px" height="200px" src="${pageContext.request.contextPath}/img/${usuario.imagen}"><br>
  								<span id="texto">Sube una imagen de perfil tipo jpg/jpeg/png de tamaño máximo 5MB</span>
  							
  							<div class="col-lg-12 ">	
  								<input id="carga" type="file" accept="image/*" name="image" class="btn " onchange="loadFile(event)">
  								<input id="form" type="hidden" name="imagen" value="${usuario.imagen}">
  							</div>
  							
  							<c:if test="${not empty mensaje_alta}">	
  								<div id="error-alta" class="col-lg-12 ">
									<span id="error-alta-texto" class="alert alert-danger" >${mensaje_alta}</span>
								</div>
							</c:if>	
						</div>
					</div>
			
					
					
					<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-4 bg-white rounded">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="row justify-content-center">
									<div class="col-12 p-1">		
											<label id="titulo">Nombre de Usuario:</label>
											<input id="form" class="form-control" id="username" type="text" name="username" value="${usuario.nombre}" required>
									</div>
									<div class="col-12 p-1">	
											<label id="titulo">Género:</label>	
											<c:if test="${usuario.genero.equals('Hombre')}">
											<div class="form-check">
											  <input id="form" class="form-check-input"  type="radio" name="sexo" value="Hombre" checked>
											  <label class="form-check-label" for="sexo">
											    Hombre
											  </label>
											</div>
											<div class="form-check">
											  <input id="form" class="form-check-input"  type="radio" name="sexo" value="Mujer" >
											  <label  class="form-check-label" for="sexo">
											    Mujer
											  </label>
											</div>
										</c:if>	
										<c:if test="${usuario.genero.equals('Mujer')}">
											<div class="form-check">
											  <input id="form" class="form-check-input"  type="radio" name="sexo" value="Hombre" >
											  <label  class="form-check-label" for="sexo">
											    Hombre
											  </label>
											</div>
											<div class="form-check">
											  <input id="form" class="form-check-input"  type="radio" name="sexo" value="Mujer" checked>
											  <label  class="form-check-label" for="sexo">
											    Mujer
											  </label>
											</div>
										</c:if>	
									</div>
									
									<div class="col-12 p-1">		
											<label id="titulo">Peso:</label>
											<select id="form" class="form-control" name="peso">
											<option value = "${usuario.peso}"/>${usuario.peso}kg</option>
												<c:forEach var = "i" begin = "40" end = "200">
							         				<option value = "${i}"/>${i}kg</option>
							     				</c:forEach>			
											</select>
									</div>
									
									<div class="col-12 p-1">	
										<label id="titulo">Altura:</label>
										<select id="form" class="form-control" name="altura">
												<option value = "${usuario.altura}"/>${usuario.altura}cm</option>
												<c:forEach var = "i" begin = "150" end = "250">
							         				<option value = "${i}"/>${i}cm</option>
							     				</c:forEach>			
										</select>	
									</div>
									
									<div class="col-12 p-1">	
										<label id="titulo">Edad:</label>
										<select id="form" class="form-control" name="edad">
												<option value = "${usuario.edad}"/>${usuario.edad} años</option>
												<c:forEach var = "i" begin = "18" end = "101">
							         				<option value = "${i}"/>${i} años</option>
							     				</c:forEach>			
										</select>
										<input type="hidden" name="usuario" value="${usuario.id_usuario}">
									</div>
									
					
							</div>
						</div>
						<div class="col-12">
							<div class="row justify-content-center">
								<div class="col-12 text-center">
									<button id="login" type="submit" class="btn btn-lg  mb-1">GUARDAR</button>
								</div>
							</div>	
						</div>	
					
					</div>
				</form>
			</c:forEach>
		</div>			
	</c:if>	
</body>

<footer>
	<!-- 	AQUÍ INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>
</html>