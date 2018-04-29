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
				background-color:#ededed;
			}
		
		</style>
	
</head>


<body>

	
	
<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
	<label style="color: red;">${error_msg}</label>
	
	<script>
	    function popup() {
	        window.open("${pageContext.request.contextPath}/login", 'window', 'width=720,height=720');
	    }
	</script>

	<div class="container-fluid">
		<div class="row p-3 bg-white d-flex justify-content-end">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 p-1">	
				<button type="reset" class="btn btn-sm btn-success btn-block" onclick="location.href='${pageContext.request.contextPath}/login';">LOGIN</button>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 p-1">	
				<button type="reset" class="btn btn-sm btn-success btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA</button>
			</div>
		</div>
	</div>
	
	<div class="container">	
		<div class="row justify-content-md-center justify-content-sm-center justify-content-xs-center">
			<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
				<c:forEach items="${allProducts}" var="product" varStatus="status">
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 p-3" id="${product[4]}">
						<div class="producto-img d-flex justify-content-center p-2">
							<a href="<c:url value='/verproducto/${product[4]}'/>"><img class="rounded" width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product[2]}"></a>	
						</div>
						<div class="producto-info p-2">
							<span>${product[0]}</span></br>
							<span>${product[1]}</span></br>
							<a href="<c:url value='/mypublicprofile/${product[5]}/'/>">${product[3]}</a>
						</div>
					</div>	
				</c:forEach>	
		</div>	
	</div>	
</body>
</html>