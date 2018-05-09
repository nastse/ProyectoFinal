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
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 


	<title>Mi Perfil</title>
	
	
</head>
	<script type="text/javascript">
		
		function borrarProducto(id){

			$.ajax({
				
				url: "${pageContext.request.contextPath}/deleteProduct",
				type: "post",
				data: "productId="+id,
				
				success : function(response){
					<%-- COJO ID TABLA E ID TR PARA SABER QUE FILA TENGO QUE BORRAR  --%>
					$("#div_"+id).remove();
					alert(response)
				},
				
				error : function(error){
					alert(error);
					
				}
			})
		}
	
	</script>


<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

<body>

	<c:if test="${empty sessionScope.email}">
	        <h1>INICIA SESION</h1>
	</c:if>
	
	<c:if test="${not empty sessionScope.email}">	
		<div class="container">		
		
			<div id="subir-producto" class="row justify-content-md-center justify-content-sm-center  p-2 rounded text-center">
				<div class="col-lg-12">
				
					<h4>Nueva Review</h4>
				
				</div>
			
			</div>
		
				<%-- LE PASO EL OBJETO QUE ME DEVUELVE EL CONTROLADOR  --%>
				<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
				<c:forEach items="${listaReviews}" var="product">

					<div id="div_${product.id_rev}" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-1">	
								<img class="rounded justify-content-center shadow mb-1" width="100px" height="100px" src="${pageContext.request.contextPath}/img/${product.imagen}">
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 p-1 align-self-center text-center">	
								<spam>${product.categoria}</spam>
								<spam>${product.marca}</spam>
							</div>
							<div class="col-lg-6 col-md-4 col-sm-4 col-xs-4 p-1 align-self-center text-center">	
								<input type="button" value="Eliminar" id="${product.id_rev}" onclick="borrarProducto(this.id)">
								<a href="<c:url value='/upproducto/${product.id_rev}'/>">Editar</a>
							</div>
					</div>

				</c:forEach>
			
			<a href="${pageContext.request.contextPath}/products">Lista productos</a>
		</div>	
	</c:if>	
</body>
</html>