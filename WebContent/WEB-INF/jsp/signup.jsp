<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Alta nueva</title>

	<script type="text/javascript">
		
		function dovalidations(){
			
			var username = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var repassword = document.getElementById("repassword").value;
			
			if(parseInt(email.length) < 4){
				
				alert("El nombre debe tener mas de 3 caracteres");
				return false;
			}
			
			if(parseInt(password.length) < 6){
				
				alert("La contrase�a debe tener mas de 5 caracteres");
				return false;
			}
			
			if(password != repassword){
				
				alert("La contrase�a no coincide");
				return false;
			}

			return true;
		}
	
	</script>
	
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
    		#contenedor-columna{
    		
    			padding-bottom:30px;
    		}
    		
    		#email:focus{
    			border-color: #F27490;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		#password:focus{
    			border-color: #F27490;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		#repassword:focus{
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
    			margin-top:50px;
				background-color:#1F2833;
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
	<div class="container">
		<div class="row justify-content-md-center justify-content-sm-center text-center">	
			<h2>CREAR UNA CUENTA</h2>
		</div>	
			
		<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-left">		
	<!-- 						COLUMNA IZQUIERDA -->
							<div id="column-center" class="col-lg-6">							
								<div id="" class="row justify-content-md-center justify-content-sm-center">	
									<div class="col-lg-10 text-center">
										<h5 id="columna">SOY NUEVO</h5>
										<hr>
									</div>
									<div class="col-lg-10">
										<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
										<label style="color: red;">${error_msg}</label>
										
										<form:form action="${pageContext.request.contextPath}/signup" modelAttribute="user" method="post">
											<form:errors path="*" class="alert alert-danger" element="div"/>
												<div class="form-group">
													<label id="titulo">EMAIL</label></td>
													<form:input id="email" class="form-control" type="text" path="email" name="email"></form:input>
												</div>
												<div class="form-group">
													<label id="titulo">CONTRASEÑA</label>
													<form:input id="password" class="form-control" type="password" path="password" name="password"></form:input>
												</div>
												<div class="form-group">
													<label id="titulo">CONFIRMA CONTRASEÑA</label>
													<input id="repassword" class="form-control" type="password" name="repassword">
												</div>
													<button id="login" type="submit" class="btn btn-lg btn-block mb-1">ALTA NUEVA</button>
											
										
										</form:form>	
									</div>
								</div>	
							</div>		
	<!-- 						COLUMNA DERECHA -->	
							<div id="column-center" class="col-lg-6">							
								<div id="" class="row justify-content-md-center justify-content-sm-center">	
									<div class="col-lg-10 text-center">
										<h5 id="columna">YA ESTOY REGISTRADO</h5>
										<hr>
									</div>
									
									<div class="col-lg-10">
										<div class="form-group">
											<button id="alta" type="reset" class="btn btn-lg btn-block mb-1" onclick="location.href='${pageContext.request.contextPath}/login';">INICIAR SESIÓN</button>
										</div>	
									</div>	
								</div>	
							</div>			
				
		</div>
	</div>		
</body>
</html>