<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/verproducto"  method="post">	
	<table border="1" id="productTable">
			<tr>
				<th>Tipo</th>
				<th>Marca</th>
				<th>Talla</th>
				<th>Peso</th>
				<th>Altura</th>
				<th>Temperatura Máxima</th>
				<th>Temperatura Mínima</th>
				<th>Imagen</th>
		
			</tr>
			
		<%-- PARA SABER QUE PRODUCTO/FILA ELIMINO  --%>
			<tr  id="tr_${product.id_rev}" align="center">
				<td>${product.categoria}</td>
				<td>${product.marca}</td>
				<td>${product.talla}</td>
				<td>${product.peso}</td>
				<td>${product.altura}</td>
				<td>${product.temp_max}</td>
				<td>${product.temp_min}</td>
				<td><img width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product.imagen}"></td>	
			</tr>
	</table>
</form>

</body>
</html>