<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mi perfil</title>
</head>
<body>

	<c:if test="${empty sessionScope.email}">
        <h1>INICIA SESION</h1>
	</c:if>
	
	<c:forEach items="${datosUsuario}" var="usuario" varStatus="status">
		<form action="${pageContext.request.contextPath}/myprofile" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td><label>Nombre de Usuario:</label></td>
					<td><input id="username" type="text" name="username" value="${usuario.nombre}"></td>
				</tr>
				<tr>
					<td><label>Género:</label></td>
					<td>
						Hombre<input type="radio" name="sexo" value="Hombre">
						Mujer<input type="radio" name="sexo" value="Mujer">
					</td>
				</tr>
				<tr>
					<td><label>Peso:</label></td>
					<td>
						<select name="peso">
							<option value = "${usuario.peso}"/>${usuario.peso}kg</option>
							<c:forEach var = "i" begin = "40" end = "200">
		         				<option value = "${i}"/>${i}kg</option>
		     				</c:forEach>			
						</select>
					</td>
				</tr>
				<tr>
					<td><label>Altura:</label></td>
					<td>
						<select name="altura">
							<option value = "${usuario.altura}"/>${usuario.altura}cm</option>
							<c:forEach var = "i" begin = "150" end = "250">
		         				<option value = "${i}"/>${i}cm</option>
		     				</c:forEach>			
						</select>
					</td>
				</tr>
				<tr>
					<td><label>Edad:</label></td>
					<td>
						<select name="edad">
							<option value = "${usuario.edad}"/>${usuario.edad} años</option>
							<c:forEach var = "i" begin = "1" end = "101">
		         				<option value = "${i}"/>${i} años</option>
		     				</c:forEach>			
						</select>
					</td>
				</tr>
				<tr>
					<td><label>Selecciona una imagen:</label></td>
					<td><input type="file" name="image"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Guardar"></td>
				</tr>
			</table>
		
		</form>
	</c:forEach>	
	
	<c:if test="${not empty sessionScope.email}">
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
	</c:if>
</body>
</html>