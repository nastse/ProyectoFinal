<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome to Home</title>
		<link href='<c:url value="/css/style.css"></c:url>' rel="stylesheet">
		<script type="text/javascript" src='<c:url value="/js/demo.js"></c:url>'></script>
		
		<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
		<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
		<style>
			body{
				background-color:#191919;
			}
			#contenedor{
/* 				background-color:#F7F7F7; */
 				background-color:#F5F5F5; 

			}
			#lateral{
				width:120px;
				height: 550px;
				background-color: black;
			}
			#producto{
				max-width: 220px;
/* 				background-color:#1F2833; */
				background-color:white;
				box
			}
			#producto-info{
				width: 200px;
				background-color:white;
				margin-left:5px;
			}
			hr{
				border: 1px solid #F27490;
			}
			#banner{
/* 				background-color:#0B0C10; */
				background-color:#F27490;
			}
			
			#nombre{
				margin-top:30px;
			}
		
		</style>
	
</head>

<div class="container-fluid">	
	<div id="banner" class="row p-1 d-flex justify-content-end">
				<c:if test="${empty sessionScope.email}">
	        		<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGIN</button>
					</div>
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA</button>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.email}">
					<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 p-1">	
						<button id="boton" type="reset" class="btn btn-light btn-sm btn-block" onclick="location.href='${pageContext.request.contextPath}/logout';">LOGOUT</button>
					</div>
				</c:if>
	</div>
</div>

<body>

	
	
<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
	<label style="color: red;">${error_msg}</label>
	
	<script>
	    function popup() {
	        window.open("${pageContext.request.contextPath}/login", 'window', 'width=720,height=720');
	    }
	</script>

	
	<div class="container">	
</div>
	
	<div class="container">	
		<div id="contenedor" class="row m-lg-5 m-md-5  justify-content-center">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 p-1">	
			
			</div>
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
				<div class="row">
					<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
					<c:forEach items="${allProducts}" var="product" varStatus="status">
						<div id="producto" class="col-lg-4 col-md-3 col-sm-3 col-xs-3 p-1 m-2 rounded justify-content-center shadow mb-2 bg-white rounded" id="${product[4]}">
							<div class="producto-img d-flex justify-content-center p-1">
								<a href="<c:url value='/verproducto/${product[4]}'/>"><img class="rounded" width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product[2]}"></a>	
							</div>
							 <hr>
							<div id="producto-info" class="justify-content-center p-1">
								<span>${product[0]}</span>&nbsp<span>${product[1]}</span>&nbsp<span>${product[6]}</span>
								<br>
								<br>
								<div class="d-flex justify-content-between">
									<a id="nombre" href="<c:url value='/mypublicprofile/${product[5]}/'/>">${product[3]}</a>
									<a href="<c:url value='/mypublicprofile/${product[5]}/'/>"><img class="rounded-circle" width="50px" height="50px" src="${pageContext.request.contextPath}/img/${product[7]}"></a>
								</div>
								
							</div>
						</div>	
					</c:forEach>
				</div>	
			</div>			
		</div>	
	</div>	
</body>
</html>