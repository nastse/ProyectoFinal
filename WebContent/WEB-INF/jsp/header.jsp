<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>

</style>
	    
	<div id="barra-inicio" class="container-fluid">	
		<c:if test="${empty sessionScope.email}">
			<div id="banner" class="row p-1 d-flex justify-content-end align-items-center">
			        <div id="inicio" class="col-2 mr-auto">						
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/index';">INICIO</button> --%>
						<a href="<c:url value='/index'/>"><span id="texto-inicio">INICIO</span></a>
					</div>
			        <div id="usuario-login" class="col-4 p-1">	
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGIN</button> --%>
							<a href="<c:url value='/login'/>"><i class="fa fa-user-circle"></i></a>
							<span id="texto-usuario-login">Login/Alta</span>
					</div>
					
					<div id="usuario-subir" class="col-4 p-1 text-right">	
<%-- 						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA NUEVA</button> --%>
							<span id="texto-usuario-subir">Subir review</span>
							<a href="<c:url value='/login'/>"><i class="fa fa-plus-circle"></i></a>	
					</div>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.email}">
			<div id="banner" class="row p-1 d-flex justify-content-end align-items-center">			
					<div class="col-lg-2 col-md-3 col-sm-3 col-xs-2 p-1 text-center mr-auto">
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/index';">INICIO</button>
					</div>
					
					<div class="col-lg-2 col-md-3 col-sm-3 col-xs-2 p-1 text-center">
						<c:if test="${not empty sessionScope.datos[0].imagen}">
							<a href="<c:url value='/myprofile'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="50px" height="50px" src="${pageContext.request.contextPath}/img/${datos[0].imagen}"></a>
						</c:if>
						<c:if test="${empty sessionScope.datos[0].imagen}">
							<a href="<c:url value='/myprofile'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="50px" height="50px" src="${pageContext.request.contextPath}/img/imagen.png"></a>
						</c:if>
					</div>
					
					<div class="col-lg-2 col-md-3 col-sm-3 col-xs-2 p-1 justify-content-center">	
						<button id="boton" type="reset" class="btn btn-success btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/myproducts';">MIS REVIEWS</button>	
					</div>
					
					<div class="col-lg-2 col-md-3 col-sm-3 col-xs-2 p-1 justify-content-center">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/logout';">SALIR</button>
					</div>	
					
					
			</div>		
		</c:if>	
	</div>	
