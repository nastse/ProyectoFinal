<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		.boton{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
    			margin-top:10px;
				background-color:#1F2833;
				width:90px;
    		}
    		.boton:hover{
    			background-color:#F27490;
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

	<title>Mis Reviews</title>
	
	
</head>
	<script type="text/javascript">
		
		function borrarProducto(id){
			if (confirm("Está seguro?")) {
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
		}
	
	</script>


<!-- 	AQU� INSERTO EL HEADER -->
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
			<div id="contenedor-inicio" class="row justify-content-around">
			<div class="col-lg-12 text-center">
					<h5 id="columna">AÑADE O MODIFICA TUS REVIEWS</h5>
					<hr>
				</div>
			<div class="col-12">	
				
				<div id="subir-producto" class="row justify-content-md-center justify-content-sm-center  p-2 rounded text-center">
					
					<div class="col-lg-12">
					
						<a href="<c:url value='/altaproducto'/>"><h4>Añadir nueva Review</h4></a>
					
					</div>
				
				</div>
			
					<%-- LE PASO EL OBJETO QUE ME DEVUELVE EL CONTROLADOR  --%>
					<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
					<c:forEach items="${listaReviews}" var="product">
		
						<div id="div_${product.id_rev}" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded">
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-1 text-center">	
									<img class="rounded justify-content-center shadow mb-1" width="100px" height="100px" src="https://s3.us-east-2.amazonaws.com/nastse-s3/imagenes/${product.imagen}">
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 p-1 align-self-center text-center">	
									<div id="" class="row justify-content-start">
										<div class="col-12">
											<span id="titulo-negrita" style="color:#F27490">${product.talla}</span>
											<span id="titulo-negrita">${product.marca}</span>
											<span id="titulo-negrita">${product.modelo}</span><br>	
										</div>
										<div class="col-12">
											<span>${product.categoria}</span><br>	
										</div>
										<div class="col-12">
											<span>Ajuste</span>
												<i class="fa fa-star" style="color:#1F2833;"></i>	
											<c:if test="${product.ajuste > 1}">
												<i class="fa fa-star" style="color:#1F2833;"></i>
											</c:if>
											<c:if test="${product.ajuste > 2}">
												<i class="fa fa-star" style="color:#1F2833;"></i>
											</c:if>
										<c:if test="${product.ajuste > 3}">
												<i class="fa fa-star" style="color:#1F2833;"></i>
											</c:if>
											<c:if test="${product.ajuste > 4}">
												<i class="fa fa-star" style="color:#1F2833;"></i>
											</c:if>
											
											<c:if test="${product.ajuste < 2}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${product.ajuste < 3}">
											<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${product.ajuste < 4}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${product.ajuste < 5}">
												<i class="fa fa-star"></i>
											</c:if>
										</div>
										<div class="col-12">
										<span>Valoración</span>
												<i class="fa fa-star" style="color:#F27490;"></i>	
											<c:if test="${product.recomendable > 1}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${product.recomendable > 2}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${product.recomendable > 3}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${product.recomendable > 4}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											
											<c:if test="${product.recomendable < 2}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${product.recomendable < 3}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${product.recomendable < 4}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${product.recomendable < 5}">
												<i class="fa fa-star"></i>
											</c:if>
										</div>
									</div>	
								</div>
								<div class="col-lg-6 col-md-4 col-sm-4 col-xs-4 p-1 align-self-center text-center">	
									<div id="" class="row justify-content-md-center justify-content-sm-center">		
										<div class="col-lg-12 text-center">	
											<button  id="${product.id_rev}" type="button" class="boton btn btn-sm" value="Eliminar" onclick="borrarProducto(this.id)">ELIMINAR</button>
											<button id="boton" type="reset" class="boton btn btn-sm" onclick="location.href='${pageContext.request.contextPath}/upproducto/${product.id_rev}'">EDITAR</button>
										</div>
										<div class="col-lg-12 text-center">
		<%-- 										<span>${product.creado}</span> --%>
										</div>
									</div>
								</div>
						</div>
		
					</c:forEach>
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