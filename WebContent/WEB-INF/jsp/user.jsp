<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>

	</style>
	
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 

	
	<title>Mi perfil</title>
	
</head>

<script type="text/javascript">
		
	function paginar(id){

			$.ajax({
				async: false,
				url: "${pageContext.request.contextPath}/user/pagina",
				data: "page="+id,
				
				
				success : function(response){
					$("#subViewDiv").html(response);
					
				},
				
				error : function(error){
					alert(error);	
				}
			})
		}
	
	</script>

<body>




<div id="subViewDiv" class="container">	
		<div id="contenedor-inicio" class="row m-lg-5 m-md-5 justify-content-center">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 p-1">	
			
			</div>
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
				<div id="" class="row">
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
		<div id="mostrar" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
			<div class="col-lg-12">
					
					<h1 id="texto">Prueba</h1>
					
					<div id="pagination">
					   
					     
					   
					    <c:if test="${page > 1}">
					    	 <input type="button" id="${page - 1}" value="Prev"  onclick="paginar(this.id)">
					        
					    </c:if>
					
					    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
					        <c:choose>
					            <c:when test="${page == i.index}">
					                <span id="${i.index}">${i.index}</span>
					            </c:when>
					            <c:otherwise>
					               <input type="button" id="${i.index}" value="${i.index}"  onclick="paginar(this.id)">
					                
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					    	

					    <c:if test="${page + 1 <= maxPages}">
					   		<input type="button" id="${page + 1}" value="Next"  onclick="paginar(this.id)">
					        
					    </c:if>
					</div>
			</div> 
		</div>
	
	</div>	

</body>
