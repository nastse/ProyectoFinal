<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sign Up Here</title>

	<script type="text/javascript">
		
		function dovalidations(){
			
			var username = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var repassword = document.getElementById("repassword").value;
			
			if(parseInt(email.length) < 4){
				
				alert("El nombre debe tener mas de 3 caracteres");
				return false;
			}
			
			if(parseInt(password.length) < 6){
				
				alert("La contraseña debe tener mas de 5 caracteres");
				return false;
			}
			
			if(password != repassword){
				
				alert("La contraseña no coincide");
				return false;
			}

			return true;
		}
	
	</script>
	
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 

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

	<label style="color: red;">${error_msg}</label>

<div class="container">	
	<div class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded">
<!-- 	SERVER SIDE VALIDATION USING SPRING SECCION 7 -->
		<form:form action="${pageContext.request.contextPath}/signup" modelAttribute="user" method="post">
			<form:errors path="*" style="color:red; background-color:#ffb3b3;" element="div"/>
			<table>
				<tr>
					<td><label>Email:</label></td>
					<td><form:input id="email" type="text" path="email" name="email"></form:input></td>
				</tr>
				<tr>
					<td><label>Contraseña:</label></td>
					<td><form:input id="password" type="password" path="password" name="password"></form:input></td>
				</tr>
				<tr>
					<td><label>Confirma Contraseña:</label></td>
					<td><input id="repassword" type="password" name="repassword"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Registrarse"></td>
				</tr>
			</table>
		
		</form:form>
	</div>
</div>		
		
</body>
</html>