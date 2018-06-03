<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;  UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Recuperar contraseña</title>
	

	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		#titulo{
    			margin-top:20px;
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			font-weight: bold;
    			font-size:14px;
    			text-transform: uppercase;
    		}
    		#columna{
    			font-family: Trade Gothic, Charcoal, sans-serif;
    			font-weight: bold;
    			font-size:16px;
    			margin-top:30px;
    		}
    		
    		
    		#form:focus{
    			border-color: #F27490;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		.form-control{border-width: 2px; border-color: #0B0C10;}  
  				
  			.form-control:focus {

        		border-color: #0B0C10;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);

    		}
    		#alta{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
    			margin-top:10px;
 				background-color:#1F2833; 
/* 				background: linear-gradient(to bottom, #45484d 0%,#000000 100%); */
    		}
    		#alta:hover{
    			background-color:#F27490;
    		}
    		
    		#login{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
    			margin-top:50px;
 				background-color:#1F2833; 
/* 				background: linear-gradient(to bottom, #45484d 0%,#000000 100%); */
    		}
    		#login:hover{
    			background-color:#F27490;
    		}
    		
    		hr{
    			
    			background-color: #F27490; 
    			height: 1px; 
    			border: 0; 
    		}
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
	
</head>

<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>

<c:if test="${not empty sessionScope.email}">
	<jsp:include page="error.jsp" />
</c:if>

<c:if test="${empty sessionScope.email}">		
	<div class="container">			
		<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-left">		
	<!-- 						COLUMNA IZQUIERDA -->
							<div id="column-center" class="col-lg-6">							
								<div id="" class="row justify-content-md-center justify-content-sm-center">	
									<div class="col-lg-10 text-center">
										<h5 id="columna">RECUPERAR CONTRASEÑA</h5>
										<hr>
									</div>
									<div class="col-lg-10 text-center">
										<span id="texto">Introduce el email con el que te diste de alta para recibir un correo con los pasos para recuperar tu contraseña</span>
									</div>	
									<div id="mensaje-baja" class="col-lg-10 text-center">
										<c:if test="${not empty error_msg}">	
  											<label class="alert alert-danger">${error_msg}</label>
										</c:if>
									</div>	
									<div class="col-lg-10">
										<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->

										<form action="${pageContext.request.contextPath}/recuperar-password" method="post">
												<div class="form-group">
													<label id="titulo">EMAIL</label>
														<input  id="form" class="form-control" type="text" name="email" required></input>
												</div>	
												<button id="login" type="submit" class="btn btn-lg btn-block mb-1">ACEPTAR</button>
										</form>	
									</div>
									<div class="col-lg-10">
										<div class="form-group">
											<button id="alta" type="reset" class="btn btn-lg btn-block mb-1" onclick="location.href='${pageContext.request.contextPath}/login';">ATRÁS</button>
										</div>	
									</div>
								</div>	
							</div>		
				
		</div>
	</div>
</c:if>	
</body>

<footer>
	<!-- 	AQUÍ INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>
</html>