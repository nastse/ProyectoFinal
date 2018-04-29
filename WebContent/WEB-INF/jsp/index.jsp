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

</head>
<body>

	<h1>Ingresar Usuario</h1>
	
<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
	<label style="color: red;">${error_msg}</label>
	
	<script>
	    function popup() {
	        window.open("${pageContext.request.contextPath}/login", 'window', 'width=720,height=720');
	    }
	</script>

	<a onclick="popup()">LOGUEARSE</a>
	<a class="demo" href="${pageContext.request.contextPath}/login">Login</a>	
	<a class="demo" href="${pageContext.request.contextPath}/signup">Sign Up</a>
	<a onclick="hello()">Sign Up</a>
	
	<h1>${allProducts}</h1>	
	
	<table border="1" id="productTable">
			<tr>
				<th>Tipo</th>
				<th>Marca</th>
				<th>Imagen</th>
			</tr>
			

		<%-- LE PASO EL OBJETO QUE ME DEVUELVE EL CONTROLADOR  --%>
		<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
		<c:forEach items="${allProducts}" var="product" varStatus="status">
		<%-- PARA SABER QUE PRODUCTO/FILA ELIMINO  --%>
			<tr  id="tr_" align="center">
				<td>${product[0]}</td>
				<td>${product[1]}</td>
				<td><a href="<c:url value='/verproducto/${product[4]}'/>"><img width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product[2]}"></a></td>	
<%-- 				<td><input type="button" value="Delete" id="btn_${product.id_rev}" onclick="deleteProduct(this.id_rev)"></td> --%>
			</tr>
			
			<tr>
				<td colspan="7"><a href="<c:url value='/mypublicprofile/${product[5]}/'/>">${product[3]}</a></td>
			</tr>
		</c:forEach>
	</table>
		
	
</body>
</html>