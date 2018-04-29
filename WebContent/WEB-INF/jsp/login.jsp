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
	
	
<div class="container">	
	<div class="row justify-content-md-center justify-content-sm-center">
		<div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 p-3">
		<h2>Ingresar Usuario</h2>
		<!-- 	AUTHENTICATION PROCES FOR LOGIN SECCION 6 -->
			<label style="color: red;">${error_msg}</label>
			
			<form:form action="${pageContext.request.contextPath}/login" modelAttribute="user" method="post" onsubmit="closeWindow()">
				<form:errors class="alert alert-danger" path="*"  element="div"/>
				
					<div class="form-group">
						<label class="sr-only">Enter Username:</label>
							<form:input  class="form-control" type="text" path="email" name="username"></form:input>
		<%-- 					<br><form:errors path="email" style="color:red"></form:errors> --%>
					</div>	
					<div class="form-group">
						<label class="sr-only">Enter Password:</label>
							<form:input  class="form-control" type="password" path="password" name="password"></form:input>
		<%-- 					<br><form:errors path="password" style="color:red"></form:errors> --%>
					</div>	
						<button type="submit" class="btn btn-lg btn-primary btn-block mb-1">LOGIN</button>
						<button type="reset" class="btn btn-sm btn-success btn-block" onclick="location.href='${pageContext.request.contextPath}/signup';">ALTA NUEVA</button>
			
			</form:form>
		</div>
	</div>
</div>	
</body>
</html>