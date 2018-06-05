<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vista producto</title>
	
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		
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

<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>
	<div class="container shadow p-2 bg-white rounded justify-content-center">	
	
		<div class="row justify-content-md-center justify-content-sm-center text-center">
			<div class="col-12 align-self-center">
				<div class="row">	
					<div id="contenedor-talla-ver" class="col-1">
						<span>${product.talla}</span>
					</div>
					<div class="col-10">
						<span id="marca-ver">${product.marca}</span>&nbsp	
						<span id="modelo-ver">${product.modelo}</span>&nbsp
						<span id="anio-ver">${product.anio}</span>&nbsp
						<span id="modelo-ver">${product.precio}€</span>
					</div>
					
				</div> 	
			</div>
			
			<div class="col-12">
					<img id="contenedor-imagen-ver" class="img-fluid" src="${pageContext.request.contextPath}/img/${product.imagen}">
			</div>
			
			
			
		</div>	
		<div class="row justify-content-center text-center">
			<div class="col-12">
				<hr>
			</div>
			<div class="col-12">
			
			</div>
			
			<div class="col-lg-3 col-sm-5">
				<div id="" class="row justify-content-center text-left">
					<div class="col-12">
						<label id="titulo">REVIEW HECHA POR</label><br>
					</div>
					<div class="col-9">
					<a id="nombre" href="<c:url value='/mypublicprofile/${product.id_user}/'/>">${usuario}</a>
						
					</div>
					<div class="col-12">
						<label id="titulo">MEDIDAS DEL USUARIO</label><br>
					</div>	
					<div class="col-9">
						
					</div>
					<div class="col-9">
						<label >Talla: </label>&nbsp<label>${product.tallauser}</label>
					</div>	
					<div class="col-9">
						<label >Peso: </label>&nbsp<label>${product.peso}kg</label>
					</div>
					<div class="col-9">
						<label>Altura: </label>&nbsp<label>${product.altura}cm</label>
					</div>
					<div class="col-9">
						<label>Pecho: </label>&nbsp<label>${product.pecho}cm</label>
					</div>	
					<div class="col-9">
						<label>Cintura: </label>&nbsp<label>${product.cintura}cm</label>
					</div>
					<div class="col-9">
						<label>Cadera: </label>&nbsp<label>${product.cadera}cm</label>
					</div>
					<div class="col-9">
						<label>Cadera: </label>&nbsp<label>${product.cadera}cm</label>
					</div>
				</div>					
			</div>
			<div class="col-lg-3 col-sm-5">
				<div id="" class="row">
					<div class="col-12">
						<img id="imagen-guia"  src="${pageContext.request.contextPath}/img/guia1.jpg">
					</div>	
				</div>					
			</div>
		</div>
		
		<div id="" class="row justify-content-md-center justify-content-sm-center text-center">		
							
							<div class="col-lg-3">	
									<div id="" class="row">
									<div class="col-12">
										<label id="titulo">Ajuste/Comodidad</label><br>
									</div>
									<div class="col-12">	
						
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
								</div>	
							
							</div>
							<div class="col-lg-3">	
									<div id="" class="row">
									<div class="col-12">
										<label id="titulo">Recomendable</label><br>
									</div>
									<div class="col-12">	
						
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
							<div class="col-lg-3">	
								<div id="" class="row">
									<div class="col-12">
										<label id="titulo">Temperatura máxima</label><br>
									</div>
									<div class="col-12">	
										<span id="modelo">${product.temp_max}º</span>
									</div>
								</div>	
							</div>
							
							<div class="col-lg-3">	
								<div id="" class="row">
									<div class="col-12">
										<label id="titulo">Temperatura mínima</label><br>
									</div>
									<div class="col-12">	
										<span id="modelo">${product.temp_min}º</span>
									</div>
								</div>	
							</div>
							
						
						<div class="col-lg-6">
							<label id="titulo">Leer Comentario</label><br>	
							<textarea style="resize:none" class="form-control" rows="3" name="texto"></textarea>
						</div>
				</div>		
	</div>

</body>

<footer>
	<!-- 	AQUÍ INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>
</html>