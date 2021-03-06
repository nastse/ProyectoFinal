<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;  UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Inicia Sesión</title>
	

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
    			margin-top:50px;
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
		
		<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120234980-1"></script>
	<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-120234980-1');
	</script>
</head>

<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>

<c:if test="${empty sessionScope.email}">	
	<div class="container">
		<div class="row justify-content-md-center justify-content-sm-center text-center">	
			<h2>INICIAR SESIÓN CON UNA CUENTA</h2>
		</div>	
			
		<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center bg-white rounded text-left">		
	<!-- 						COLUMNA IZQUIERDA -->
							<div id="column-center" class="col-lg-6">							
								<div id="" class="row justify-content-md-center justify-content-sm-center">	
									<div class="col-lg-10 text-center">
										<h5 id="columna">YA ESTOY REGISTRADO</h5>
										<hr>
									</div>
									<div class="col-lg-10">
										<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
										<label style="color: red;">${error_msg}</label>
										
										<form:form action="${pageContext.request.contextPath}/login" modelAttribute="user" method="post" onsubmit="closeWindow()">
											<form:errors class="alert alert-danger" path="*"  element="div"/>
											
												<div class="form-group">
													<label id="titulo">EMAIL</label>
														<form:input  id="form" class="form-control" type="text" path="email" name="username"></form:input>
									<%-- 					<br><form:errors path="email" style="color:red"></form:errors> --%>
												</div>	
												<div class="form-group">
													<label id="titulo">CONTRASEÑA</label><span>(Entre 5 y 10 caracteres)</span>
														<form:input id="form" class="form-control" type="password" path="password" name="password" maxlength="10" ></form:input>
									<%-- 					<br><form:errors path="password" style="color:red"></form:errors> --%>
												</div>	
												<button id="login" type="submit" class="btn btn-lg btn-block mb-1">INICIAR SESIÓN</button>
												
						
										</form:form>	
									</div>
									<div class="col-10">
									<div class="row justify-content-center">
										<div class="col-12 text-center">
										<label  class="form-check-label" for="terminos"><a id="link-negro" href="<c:url value='/recuperar-password'/>">¿Has olvidado tu contraseña?</a></label>
									</div>
							</div>	
						</div>
								</div>	
							</div>		
	<!-- 						COLUMNA DERECHA -->	
							<div id="column-center" class="col-lg-6">							
								<div id="" class="row justify-content-md-center justify-content-sm-center">	
									<div class="col-lg-10 text-center">
										<h5 id="columna">SOY NUEVO</h5>
										<hr>
									</div>
									
									<div class="col-lg-10">
										<div class="form-group">
											<button id="alta" type="reset" class="btn btn-lg btn-block mb-1" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA NUEVA</button>
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