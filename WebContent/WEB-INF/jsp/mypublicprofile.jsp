<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ver Perfil</title>
	
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 

</head>


<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>

	<div class="container">	
		<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded">
			<c:forEach items="${datosUsuario}" var="usuario" varStatus="status">
				<div class="col-lg-12 text-center">	
					<div id="" class="row justify-content-center">
						<div class="col-2">
							<img id="imagen" class="rounded-circle rounded justify-content-center shadow mb-2" width="100px" height="100px" src="${pageContext.request.contextPath}/img/${usuario.imagen}">
  						</div>
  						<div class="col-2">
							
						</div>
  						<div class="col-2">
							<label>Altura:</label><br>
							<label>${usuario.altura}cm</label>
						</div>
						<div class="col-2">
							<label >Peso: </label><br>
							<label>${usuario.peso}kg</label>
						</div>
  					</div>
  				</div>
			</c:forEach>
	
		<div id="contenedor-inicio" class="row m-lg-5 m-md-2 p-1 m-1 justify-content-center">
		
			<c:forEach items="${listaReviews}" var="product" varStatus="status">
							<div class="" id="${product.id_rev}">
								<div id="producto" class="row justify-content-center text-center bg-white rounded p-1 m-1">
									<div class="col-12">
										<div class="row justify-content-center">
											<div id="contenedor-talla" class="col-2 text-center">
												<span>${product.tallauser}</span>
											</div>
											<div class="col-6 mr-auto text-center p-0 align-self-center">
												<span id="marca-producto">${product.marca}</span>
											</div>
										</div>
										
									</div>
										
									<div class="col-12">
										<div class="producto-img d-flex justify-content-center p-1">
											<a href="<c:url value='/verproducto/${product.id_rev}'/>"><img class="rounded" width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product.imagen}"></a>	
										</div>
									</div>	
									<div class="col-12">	
											<fmt:parseNumber var = "i" type = "number" value= "${product.recomendable}" />
											
											<i class="fa fa-star" style="color:#F27490;"></i>	
											<c:if test="${i > 1}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${i > 2}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${i > 3}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${i > 4}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											
											<c:if test="${i < 2}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${i < 3}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${i < 4}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${i < 5}">
												<i class="fa fa-star"></i>
											</c:if>
									</div>
									<div class="col-12">	
											<span id="modelo-producto">${product.modelo}</span>
									</div>
<!-- 									<div class="col-12">	 -->
<%-- 											<span id="categoria">${product[0]}</span> --%>
<!-- 									</div> -->
									<div class="col-12">
										<div class="row">	
											<div class="col-8 text-center p-0 align-self-end">
												<span id="datos"><span id="datos">Talla: ${product.tallauser}</span>&nbsp<span id="datos">${product.altura}cm</span>&nbsp<span id="datos">${product.peso}kg</span>&nbsp
	<%-- 												<a id="nombre" href="<c:url value='/mypublicprofile/${product[5]}/'/>">${product[3]}</a> --%>					
											</div>
											<div class="col-2 text-center">
												<a href="<c:url value='/mypublicprofile/${product.id_user}/'/>"><img id="imagen-inicio" class="rounded-circle shadow-sm  rounded" width="45px" height="45px" src="${pageContext.request.contextPath}/img/${product.imagen}"></a>
											</div>
											
										</div>
									</div>
								</div>
							</div>	
						</c:forEach>
		
		</div>
	</div>
</div>	
		
		
</body>

<footer>
	<!-- 	AQU� INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>
</html>