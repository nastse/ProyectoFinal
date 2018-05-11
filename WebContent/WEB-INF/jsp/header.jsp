<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    
    
	<div id="barra-inicio" class="container-fluid">	
		<c:if test="${empty sessionScope.email}">
			<div id="banner" class="row p-1 d-flex justify-content-end align-items-center">
			        <div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1 mr-auto text-center">
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/index';">INICIO</button>
					</div>
			        <div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGUEAR</button>
					</div>
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA</button>
					</div>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.email}">
			<div id="banner" class="row p-1 d-flex justify-content-end align-items-center">			
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1 text-center mr-auto">
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/index';">INICIO</button>
					</div>
					
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1 text-center">
						<a href="<c:url value='/myproducts'/>"><img class="rounded-circle rounded justify-content-center shadow m-1" width="50px" height="50px" src="${pageContext.request.contextPath}/img/${datos[0].imagen}"></a>
					</div>
					
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1 justify-content-center">	
						<button id="boton" type="reset" class="btn btn-success btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/myproducts';">MIS REVIEWS</button>	
					</div>
					
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1 justify-content-center">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/logout';">SALIR</button>
					</div>	
					
					
			</div>		
		</c:if>	
	</div>	
