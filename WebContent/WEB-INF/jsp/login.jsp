<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Page</title>
	
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	
	<script>
	 	function closeWindow() {
	        window.close();
	    }
	</script>
	
</head>
<body>
	
	<h1>Ingresar Usuario</h1>
<div class="container">	
	<div class="row justify-content-md-center">
		<div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
		<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
			<label style="color: red;">${error_msg}</label>
			
			<form:form action="${pageContext.request.contextPath}/login" modelAttribute="user" method="post" onsubmit="closeWindow()">
				<form:errors path="*" style="color:red; background-color:#ffb3b3;" element="div"/>
				
					<div class="form-group">
						<label>Enter Username:</label>
							<form:input  class="form-control" type="text" path="email" name="username"></form:input>
		<%-- 					<br><form:errors path="email" style="color:red"></form:errors> --%>
					</div>	
					<div class="form-group">
						<label>Enter Password:</label>
							<form:input  class="form-control" type="password" path="password" name="password"></form:input>
		<%-- 					<br><form:errors path="password" style="color:red"></form:errors> --%>
					</div>	
						<a href="${pageContext.request.contextPath}/signup">Date de alta</a>
						<button type="submit" class="btn btn-default">Login</button>
				
			
			</form:form>
		</div>
	</div>
</div>	
</body>
</html>