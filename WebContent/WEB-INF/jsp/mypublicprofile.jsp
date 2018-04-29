<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ver Perfil </title>
</head>
<body>

	<h1>${datosUsuario}</h1>

	<table border="1" id="productTable">
				<tr>
					<th>Nombre</th>
					<th>Peso</th>
					<th>Altura</th>
					<th>Edad</th>
					<th>Genero</th>
					<th>Imagen</th>
					<th>Actualizar</th>
				</tr>
				
	
			<%-- LE PASO EL OBJETO QUE ME DEVUELVE EL CONTROLADOR  --%>
			<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
			<c:forEach items="${datosUsuario}" var="usuario" varStatus="status">
			<%-- PARA SABER QUE PRODUCTO/FILA ELIMINO  --%>
				<tr  id="tr_${usuario.id_usuario}" align="center">
					<%-- LLAMO AL OBJETO EL VALOR QUE QUIERO MOSTRAR  --%>
					<td>${usuario.nombre}</td>
					<td>${usuario.peso}</td>
					<td>${usuario.altura}</td>
					<td>${usuario.edad}</td>
					<td>${usuario.genero}</td>
					<td><img width="200px" height="200px" src="${pageContext.request.contextPath}/img/${usuario.imagen}"></td>	
	<%-- 				<td><input type="button" value="Delete" id="btn_${product.id_rev}" onclick="deleteProduct(this.id_rev)"></td> --%>
	<%-- 				<td><a href="<c:url value='/verproducto/${product.id_usuario}'/>">Actualizar</a></td>	 --%>
				</tr>
				
	<!-- 			<tr> -->
	<%-- 				<td colspan="7">${allUsers[status.index]}</td> --%>
	<!-- 			</tr> -->
			</c:forEach>
		</table>
	
</body>
</html>