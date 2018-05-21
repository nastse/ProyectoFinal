<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Inicio</title>
	
		<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
			#contenedor-menu{
				
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
				background-color:#F5F5F5;
    		
			}
			#menu{
				margin-top:10px;
				margin-bottom:50px;
				padding:20px 10px 50px 10px;
				
				background-color:#1F2833;
				border-radius:5%;
			}
			
			
			
			
			.dropdown-dark:before {
			  border-bottom-color: #aaa;
			}
			
			.dropdown-dark:after {
			  border-top-color: #aaa;
			}
			
			.dropdown-dark .dropdown-select {
			  color: white;
			  background: #F27490; 
			  font-size:14px;
			   /* Fallback for IE 8 */
			}
			
			.dropdown-dark .dropdown-select:focus {
			  color: white;
			  background: #F27490;
			}
			
			.dropdown-dark .dropdown-select > option {
			  background: white;
			   color: #1F2833;
			}
			
			#titulo{
    			font-family: Trade Gothic, Charcoal, sans-serif;
    			font-weight: bold;
    			font-size:30px;
    		}
				
			#titulo-menu{

				margin-top:20px;
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			font-weight: bold;
    			font-size:14px;
    		}
    		#subtitulo{
    			
    			font-size:12px;
    			font-style: oblique;
    		}
    		
    		.boton{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:#1F2833;
    			font-weight:bold;
    			font-size:18px;
    			margin-top:30px;
				background-color:white;
				width:90px;
    		}
    		.boton:hover{
    			background-color:#F27490;
    			color:white;
    		} 		
    		
		</style>
		
		<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
		<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
		
	
</head>



<script type="text/javascript">
		
	function paginar(id){
		
		var marca= $('#marca option:selected').attr('value');
		var modelo= $('#modelo option:selected').attr('value');
		var talla= $('#talla option:selected').attr('value');
		var anio= $('#anio option:selected').attr('value');
		
		
			$.ajax({
				async: false,
				url: "${pageContext.request.contextPath}/index/pagina",
				data: "page="+id+"&marca="+marca+"&modelo="+modelo+"&talla="+talla+"&anio="+anio,
				
				
				success : function(response){
					$("#vista").html(response);
					
				},
				
				error : function(error){
					alert(error);	
				}
			})
		}
	
</script>

<body id="vista">

<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

	<div class="container">	
		<div id="contenedor-inicio" class="row m-lg-5 m-md-2 justify-content-center">
			<div id="contenedor-menu" class="col-lg-3 col-md-3 col-sm-6">	
				<div id="" class="row">
					<div class="col-lg-12 text-center">
					 	<div id="menu">
					 		<h2 id="titulo">Buscar:</h2>
				 			<div id="titulo-menu" class="col col-12 text-left">
				 				<spam>MARCA</spam> <spam id="subtitulo">prenda</spam>
				 			</div>
						     	<div class="dropdown dropdown-dark">
							     	<select id="marca" class="form-control dropdown-select" name="marca">
										<c:if test="${empty marca}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty marca}">
											<option value = "${marca}">${marca}</option>
										</c:if>	
										<option value = "Todos">Todos</option>
										<option value = "Castelli">Castelli</option>
										<option value = "Sportful">Sportful</option>
										<option value = "Rapha">Rapha</option>
										<option value = "Endura">Endura</option>
										<option value = "DBH">DBH</option>
										<option value = "ALE">ALE</option>
										<option value = "Santini">Santini</option>
										<option value = "Exteondo">Etxeondo</option>
									</select>
								</div>	
						     <div id="titulo-menu" class="col col-12 text-left">
						     	<spam>TIPO</spam> <spam id="subtitulo">prenda</spam>
						     </div>	
						     	<div class="dropdown dropdown-dark">
							     	<select id="modelo" class="form-control dropdown-select" name="categoria">
							     		<c:if test="${empty modelo}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty modelo}">
											<option value = "${modelo}">${modelo}</option>
										</c:if>	
										<option value = "Todos">Todos</option>
										<option value = "Maillot corto">Maillot corto</option>
										<option value = "Maillot largo">Maillot largo</option>
										<option value = "Cullote corto">Cullote corto</option>
										<option value = "Cullote largo">Cullote largo</option>
									</select>	
								</div>								  							  
						     <div id="titulo-menu" class="col col-12 text-left">
						     	<spam>TALLA</spam> <spam id="subtitulo">prenda</spam>
						     </div>	
							     <div class="dropdown dropdown-dark">
							     	<select id="talla" class="form-control dropdown-select" name="talla">
										<c:if test="${empty talla}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty talla}">
											<option value = "${talla}">${talla}</option>
										</c:if>	
										<option value = "Todos">Todos</option>
										<option value = "XXS">XXS</option>
										<option value = "XS">XS</option>
										<option value = "S">S</option>
										<option value = "M">M</option>
										<option value = "L">L</option>
										<option value = "XL">XL</option>
										<option value = "XXL">XXL</option>
										<option value = "XXXL">XXXL</option>
									</select>	
								</div>							  
						     <div id="titulo-menu" class="col col-12 text-left">
						     	<spam>AÑO</spam> <spam id="subtitulo">prenda</spam>
						     </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="anio" class="form-control dropdown-select" name="anio">
										<c:if test="${empty anio}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty anio}">
											<option value = "${anio}">${anio}</option>
										</c:if>	
											<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "2015" end = "2018">
						         			<option value = "${i}">${i}</option>
						     			</c:forEach>
									</select>	
								</div>	
								
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>TALLA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="tallauser" class="form-control dropdown-select" name="tallauser">
										<c:if test="${empty tallauser}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty tallauser}">
											<option value = "${tallauser}">${tallauser}</option>
										</c:if>	
										<option value = "Todos">Todos</option>
										<option value = "XXS">XXS</option>
										<option value = "XS">XS</option>
										<option value = "S">S</option>
										<option value = "M">M</option>
										<option value = "L">L</option>
										<option value = "XL">XL</option>
										<option value = "XXL">XXL</option>
										<option value = "XXXL">XXXL</option>
									</select>	
								</div>
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>PESO</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="peso" class="form-control dropdown-select" name="peso">
										<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "40" end = "200">
					         				<option value = "${i}"/>${i}kg</option>
					     				</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>ALTURA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="altura" class="form-control dropdown-select" name="altura">
										<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "150" end = "250">
					         				<option value = "${i}"/>${i}cm</option>
					     				</c:forEach>			
									</select>
								</div>	
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>PECHO</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="pecho" class="form-control dropdown-select" name="pecho">
										<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "60" end = "120">
					         				<option value = "${i}"/>${i}cm</option>
					     				</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>CINTURA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="cintura" class="form-control dropdown-select" name="cintura">
										<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "40" end = "100">
					         				<option value = "${i}"/>${i}cm</option>
					     				</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>CADERA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="cadera" class="form-control dropdown-select" name="cadera">
										<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "50" end = "100">
								         		<option value = "${i}"/>${i}cm</option>
								     	</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left">
						     	<spam>GENERO</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     
							     	
									<div class="form-check text-left col-9 offset-3">
								  		<input class="form-check-input"  type="radio" name="sexo" value="Hombre" checked>
										<label class="form-check-label" for="sexo">
								  		  Hombre
								  		</label><br>	
								  		<input class="form-check-input"  type="radio" name="sexo" value="Mujer" >
								 	 	<label class="form-check-label" for="sexo">
								   		 Mujer
								  		</label>		
									
								</div>	
											
											
							
								<button id="boton" type="reset" class="boton btn btn-sm" onclick="paginar('1')">ACEPTAR</button>							  						  								  
					 		
					 	</div>
					</div>	
				</div>	
			</div>
			<div class="col-lg-9 col-md-9 col-sm-6">
				<div id="" class="row justify-content-center">
					<c:if test="${empty allProducts}">
						<h2>NO HAY NINGÚN RESULTADO</h2>
					</c:if>
					<c:if test="${not empty allProducts}">
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
					</c:if>	
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
</html>