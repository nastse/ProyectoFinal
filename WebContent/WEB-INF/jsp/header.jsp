<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>

</style>
	    
	<div id="barra-inicio" class="container-fluid">	
		<c:if test="${empty sessionScope.email}">
			<div id="banner" class="row p-1 justify-content-end align-items-center">
				 	<div id="contenedor-icono" class="col-12 justify-content-center">
						<div class="row justify-content-around ">
							<div class="col-2 p-0 text-center">
								<a id="icono" href="<c:url value='/index'/>"><i class="fa fa-home"></i></a>
							</div>
							<div class="col-2 p-0 text-center">	
								<a id="icono" href="<c:url value='/login'/>"><i class="fa fa-user-circle"></i></a>
							</div>
							<div class="col-2 p-0 text-center">		
								<a id="icono" href="<c:url value='/login'/>"><i class="fa fa-plus-circle"></i></a>	
							</div>
						</div>
					</div>
			        <div id="inicio" class="col-lg-4 p-1 mr-auto">						
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/index';">INICIO</button> --%>
							<a href="<c:url value='/index'/>"><i class="fa fa-arrow-circle-up"></i></a>
							<span  id="texto-usuario-login">Inicio</span>
					</div>
			        <div id="usuario-login" class="col-lg-4 p-1">
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGIN</button> --%>
							<a href="<c:url value='/login'/>"><i class="fa fa-user-circle"></i></a>
							<span  id="texto-usuario-login">Login/Alta</span>		
					</div>
					<div id="usuario-subir" class="col-lg-4 p-1 text-right">	
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA NUEVA</button> --%>
							<span id="texto-usuario-subir">Subir review</span>
							<a href="<c:url value='/login'/>"><i class="fa fa-plus-circle"></i></a>	
					</div>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.email}">
			<div id="banner" class="row p-1 d-flex justify-content-end align-items-center">			
					<div id="contenedor-icono" class="col-12 justify-content-center">
						<div class="row justify-content-around ">
							<div class="col-2 p-0 text-center">
								<a id="icono" href="<c:url value='/index'/>"><i class="fa fa-home"></i></a>
							</div>
							<div class="col-2 p-0 text-center">	
								<a href="<c:url value='/myproducts'/>"><i class="fa fa-plus-circle"></i></a>
							</div>
							<div class="col-2 p-0 text-center">		
								<a href="<c:url value='/logout'/>"><i class="fa fa-power-off"></i></a>	
							</div>
							<div class="col-2 p-0 text-center">		
								<c:if test="${not empty sessionScope.datos[0].imagen}">
									<a href="<c:url value='/myprofile'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="35px" height="35px" src="https://s3.us-east-2.amazonaws.com/nastse-s3/imagenes/${datos[0].imagen}"></a>
								</c:if>
								<c:if test="${empty sessionScope.datos[0].imagen}">
									<a href="<c:url value='/myprofile'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="35px" height="35px" src="https://s3.us-east-2.amazonaws.com/nastse-s3/imagenes/imagen.png"></a>
								</c:if>
							</div>
						</div>
					</div>
					
					<div id="inicio" class="col-2 p-1 mr-auto">						
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/index';">INICIO</button> --%>
							<a href="<c:url value='/index'/>"><i class="fa fa-arrow-circle-up"></i></a>
							<span id="texto-usuario-login">Inicio</span>
					</div>
					
					<div id="usuario-subir" class="col-4 p-1">	
<%-- 						<button id="boton" type="reset" class="btn btn-success btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/myproducts';">MIS REVIEWS</button>	 --%>
						<a href="<c:url value='/myproducts'/>"><i class="fa fa-plus-circle"></i></a>	
						<span id="texto-usuario-login">Mis reviews</span>
					</div>
					
					<div id="usuario-subir" class="col-4 p-1 text-right">
						<span id="texto-usuario-subir">Salir</span>
						<a href="<c:url value='/logout'/>"><i class="fa fa-power-off"></i></a>		
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/logout';">SALIR</button> --%>
					</div>	
					
					<div id="imagen-perfil" class="col-1 text-center">
						<c:if test="${not empty sessionScope.datos[0].imagen}">
							<a href="<c:url value='/myprofile'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="35px" height="35px" src="https://s3.us-east-2.amazonaws.com/nastse-s3/imagenes/${datos[0].imagen}"></a>
						</c:if>
						<c:if test="${empty sessionScope.datos[0].imagen}">
							<a href="<c:url value='/myprofile'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="35px" height="35px" src="https://s3.us-east-2.amazonaws.com/nastse-s3/imagenes/imagen.png"></a>
						</c:if>
					</div>	
			</div>		
		</c:if>	
	</div>	
