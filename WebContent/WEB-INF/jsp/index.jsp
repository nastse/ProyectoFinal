	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
    <%@ page language="java" contentType="text/html; ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html;ISO-8859-1">
		<title>Inicio � Ciclismo Review</title>
	
		<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
			#contenedor-menu{
				
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
			}
			#menu{
				margin-top:10px;
				margin-bottom:50px;
				padding:20px 10px 50px 10px;
/* 				background-color:#1F2833; */
				background: linear-gradient(to bottom, #45484d 0%,#000000 100%);
				border-radius:25px;
				max-width:220px;
				min-width:220px;
			}
			
			#ranking{
				margin-top:10px;
				margin-bottom:50px;
				padding:20px 10px 50px 10px;
				border:solid 1px #F27490; 
				border-radius:25px;
				max-width:220px;
				min-width:220px;
				min-height:394px; 
				background-color: white;
				user-select: none; 
				z-index:10;
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
			
			#titulo-index{
    			font-family: Trade Gothic, Charcoal, sans-serif;
    			font-weight: bold;
    			font-size:30px;
    		}
				
			#titulo-menu{

/* 				margin-top:20px; */
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			font-weight: bold;
    			font-size:14px;
    		}
    		#titulo-menu:hover{

    			transition: 0.25s;
				transition-timing-function: ease-in;
				transform : translate(0, -2px);	
				cursor:pointer;
     		}
    		#subtitulo{
    			
    			font-size:12px;
    			font-style: oblique;
    		}
    		
    		#boton{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:#1F2833;
    			font-weight:bold;
    			font-size:18px;
    			margin-top:30px;
				background-color:white;
				width:100px;
    		}
    		#boton:hover{
    			background-color:#F27490;
    			color:white;
    		} 
    		.form-control{
    			visibility: hidden;
    			position:absolute;
    		}
    		.fa-chevron-down{
    			cursor: pointer;
    			color: #F27490;
    		}		
    		
    		
		</style>
		
		<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
		<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120234980-1"></script>
		<script>
			  window.dataLayer = window.dataLayer || [];
			  function gtag(){dataLayer.push(arguments);}
			  gtag('js', new Date());
			
			  gtag('config', 'UA-120234980-1');
		</script>
		
	
</head>



<script type="text/javascript">
		
	function paginar(id){
		
		var marca= $('#marca option:selected').attr('value');
		var modelo= $('#modelo option:selected').attr('value');
		var talla= $('#talla option:selected').attr('value');
		var anio= $('#anio option:selected').attr('value');
		var tallauser= $('#tallauser option:selected').attr('value');
		var peso= $('#peso option:selected').attr('value');
		var altura= $('#altura option:selected').attr('value');
		var cintura= $('#cintura option:selected').attr('value');
		var pecho= $('#pecho option:selected').attr('value');
		var cadera= $('#cadera option:selected').attr('value');
		var genero= $('#genero option:selected').attr('value');
		
		
			$.ajax({
				async: false,
				url: "${pageContext.request.contextPath}/index/pagina",
				data: "page="+id+"&marca="+marca+"&modelo="+modelo+"&talla="+talla+"&anio="+anio+
				"&tallauser="+tallauser+"&peso="+peso+"&altura="+altura+"&cintura="+cintura+"&pecho="+pecho+
				"&cadera="+cadera+"&genero="+genero,
				
				
				success : function(response){
					$("#vista").html(response);
					
				},
				
				error : function(error){
					alert(error);	
				}
			})
		}
	
// 		FUNCION PARA PLEGAR Y DESPLEGAR DENTRO DEL MENU DE BUSQUEDA SEGUN EL CAMPO QUE SE SELECCIONE
		function colapsarMenu(id){
			
			var visibilidad = $("#"+id).css('visibility');
			var parametrosON = {'visibility':'visible','position':'relative','margin-bottom':'10px'}
			var parametrosOFF = {'visibility':'hidden','position':'absolute','margin-bottom':'0px'}
			
			if(visibilidad == 'visible'){
				
				$("#"+id).css(parametrosOFF);
			}else{
				
				$("#"+id).css(parametrosON);
			}

		}
	
</script>

<body id="vista">

<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

	<div class="container">
		<div id="contenedor-inicio" class="row justify-content-around">
			<div id="contenedor-menu" class="col-lg-3 col-md-3 col-sm-5 col-xs-4 justify-content-end text-center">	
					<div class="row justify-content-center"> 
					 	<div id="menu" class="col-lg-12 m-1">
					 		<h2 id="titulo-index">Buscar:</h2>
				 			<div id="titulo-menu" class="col-12 text-left" onclick="colapsarMenu('marca')">
				 				<i  class="fa fa-chevron-down"></i>&nbsp<spam>MARCA</spam> <spam id="subtitulo">prenda</spam> 
				 			</div>
						     	<div class="dropdown dropdown-dark">
							     	<select id="marca" class="form-control dropdown-select" name="marca">
<!-- 										SI EL ATRIBUTO MARCA ESTA VACIO DENTRO DEL SELECT PONGO PRIMERO TODOS -->
<!-- 										SI EL ATRIBUTO MARCA TIENE ALGUN VALOR -->
										<c:if test="${not empty marca}">
											<option value = "${marca}">${marca}</option>
<!-- 										SI NO ES TODOS LO DESPLIEGO PARA QUE SE VEA LA SELECCION HECHA ANTES DE HACER EL SUBMIT -->
											<c:if test="${marca != 'Todos'}">
													<script type="text/javascript">
														colapsarMenu('marca');
 													</script>
 													<option value = "Todos">TODOS</option>
 													<c:forEach items="${allMarcas}"  var="marca">
         												<option value="${marca.nombre}">${marca.nombre}</option>
    												</c:forEach>
											</c:if>
											
										</c:if>
										<c:if test="${empty marca}">
											<option value = "Todos">TODOS</option>
										</c:if>	
											
											<c:forEach items="${allMarcas}"  var="marca">
         										<option value="${marca.nombre}">${marca.nombre}</option>
    										</c:forEach>
											
									</select>
								</div>	
						     <div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('modelo')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>TIPO</spam> <spam id="subtitulo">prenda</spam>
						     </div>	
						     	<div class="dropdown dropdown-dark">
							     	<select id="modelo" class="form-control dropdown-select" name="categoria">
							     		<c:if test="${empty modelo}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty modelo}">
											<option value = "${modelo}">${modelo}</option>
												<c:if test="${modelo != 'Todos'}">
													<script type="text/javascript">
														colapsarMenu('modelo');
 													</script>
												</c:if>
										</c:if>	
										<option value = "Todos">Todos</option>
										<c:forEach items="${allCategorias}"  var="categoria">
         									<option value="${categoria.nombre}">${categoria.nombre}</option>
    									</c:forEach>
									</select>	
								</div>								  							  
						     <div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('talla')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>TALLA</spam> <spam id="subtitulo">prenda</spam>
						     </div>	
							     <div class="dropdown dropdown-dark">
							     	<select id="talla" class="form-control dropdown-select" name="talla">
										<c:if test="${empty talla}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty talla}">
											<option value = "${talla}">${talla}</option>
											<c:if test="${talla != 'Todos'}">
													<script type="text/javascript">
														colapsarMenu('talla');
 													</script>
											</c:if>
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
						     <div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('anio')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>A�O</spam> <spam id="subtitulo">prenda</spam>
						     </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="anio" class="form-control dropdown-select" name="anio">
										<c:if test="${empty anio}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty anio}">
											<option value = "${anio}">${anio}</option>
											<c:if test="${anio != 'Todos'}">
													<script type="text/javascript">
														colapsarMenu('anio');
 													</script>
											</c:if>
										</c:if>	
											<option value = "Todos">Todos</option>
										<c:forEach var = "i" begin = "2015" end = "2018">
						         			<option value = "${i}">${i}</option>
						     			</c:forEach>
									</select>	
								</div>	
								
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('tallauser')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>TALLA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="tallauser" class="form-control dropdown-select" name="tallauser">
										<c:if test="${empty tallauser}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty tallauser}">
											<option value = "${tallauser}">${tallauser}</option>
											<c:if test="${tallauser != 'Todos'}">
													<script type="text/javascript">
														colapsarMenu('tallauser');
 													</script>
											</c:if>
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
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('peso')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>PESO</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="peso" class="form-control dropdown-select" name="peso">
							     		<c:if test="${empty peso}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty peso}">
												<c:if test="${peso != 'Todos'}">
													<option value = "${peso}">${peso}kg</option>
													<script type="text/javascript">
														colapsarMenu('peso');
 													</script>
												</c:if>
												<c:if test="${peso == 'Todos'}">
													<option value = "${peso}">${peso}</option>
												</c:if>
										</c:if>	
										<option value = "Todos">Todos</option>
										<c:forEach var = "j" begin = "40" end = "200">
					         				<option value = "${j}">${j}kg</option>
					     				</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('altura')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>ALTURA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="altura" class="form-control dropdown-select" name="altura">
							     		<c:if test="${empty altura}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty altura}">
												<c:if test="${altura != 'Todos'}">
													<option value = "${altura}">${altura}cm</option>
													<script type="text/javascript">
														colapsarMenu('altura');
 													</script>
												</c:if>
												<c:if test="${altura == 'Todos'}">
													<option value = "${altura}">${altura}</option>
												</c:if>
										</c:if>	
										<option value = "Todos">Todos</option>
										<c:forEach var = "k" begin = "150" end = "250">
					         				<option value = "${k}">${k}cm</option>
					     				</c:forEach>			
									</select>
								</div>	
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('pecho')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>PECHO</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     	<select id="pecho" class="form-control dropdown-select" name="pecho">
								     	<c:if test="${empty pecho}">
												<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty pecho}">
												<c:if test="${pecho != 'Todos'}">
													<option value = "${pecho}">${pecho}cm</option>
													<script type="text/javascript">
														colapsarMenu('pecho');
 													</script>
												</c:if>
												<c:if test="${pecho == 'Todos'}">
													<option value = "${pecho}">${pecho}</option>
												</c:if>
										</c:if>	
										<option value = "Todos">Todos</option>
										<c:forEach var = "l" begin = "60" end = "120">
					         				<option value = "${l}">${l}cm</option>
					     				</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('cintura')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>CINTURA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
								    <select id="cintura" class="form-control dropdown-select" name="cintura">
									     <c:if test="${empty cintura}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty cintura}">
												<c:if test="${cintura != 'Todos'}">
													<option value = "${cintura}">${cintura}cm</option>
													<script type="text/javascript">
														colapsarMenu('cintura');
 													</script>
												</c:if>
												<c:if test="${cintura == 'Todos'}">
													<option value = "${cintura}">${cintura}</option>
												</c:if>
										</c:if>	
										<option value = "Todos">Todos</option>
										<c:forEach var = "m" begin = "40" end = "100">
					         				<option value = "${m}">${m}cm</option>
					     				</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('cadera')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>CADERA</spam> <spam id="subtitulo">usuario</spam>
						    </div>
							     <div class="dropdown dropdown-dark">
							     <select id="cadera" class="form-control dropdown-select" name="cadera">
							     		<c:if test="${empty cadera}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty cadera}">
												<c:if test="${cadera != 'Todos'}">
													<option value = "${cadera}">${cadera}cm</option>
													<script type="text/javascript">
														colapsarMenu('cadera');
 													</script>
												</c:if>
												<c:if test="${cadera == 'Todos'}">
													<option value = "${cadera}">${cadera}</option>
												</c:if>
										</c:if>	
										<option value = "Todos">Todos</option>
										<c:forEach var = "n" begin = "50" end = "100">
								         		<option value = "${n}">${n}cm</option>
								     	</c:forEach>			
									</select>
								</div>
							<div id="titulo-menu" class="col col-12 text-left" onclick="colapsarMenu('genero')">
						     	<i  class="fa fa-chevron-down"></i>&nbsp<spam>GENERO</spam> <spam id="subtitulo"></spam>
						    </div>
						    	<div class="dropdown dropdown-dark">	
									<select id="genero" class="form-control dropdown-select" name="genero">
										<c:if test="${empty genero}">
											<option value = "Todos">Todos</option>
										</c:if>
										<c:if test="${not empty genero}">
											<c:if test="${genero != 'Todos'}">
												<option value = "${genero}">${genero}</option>
												<script type="text/javascript">
													colapsarMenu('genero');
												</script>
											</c:if>
										</c:if>	
								  		<option value = "Todos">Todos</option>
										<option value = "Hombre">Hombre</option>
								  		<option value = "Mujer">Mujer</option>		
									</select>
								</div>
								
								<button id="boton" type="reset" class="boton btn btn-sm" onclick="paginar('1')">ACEPTAR</button>							  						  								  
							</div>
							<div id="ranking" class="col-lg-12 m-1">
								<div class="row justify-content-center text-center">
									<div class="col-10">
										<i class="fa fa-star" style="color:#f6ff00;"></i>
										<i class="fa fa-star" style="color:#f6ff00;"></i>
										<i class="fa fa-star" style="color:#f6ff00;"></i>
										<i class="fa fa-star" style="color:#f6ff00;"></i>
										<i class="fa fa-star" style="color:#f6ff00;"></i><br>
									</div>
								</div>	
								<div id="fila-reviews" class="row justify-content-center text-center">	
									<div class="col-10">
										<span id="titulo-negrita">Ranking reviews</span>
										<c:forEach var="i" items="${reviews}">
									        <div class="row justify-content-center text-center">
									         	<div class="col-9 ">
											         <a href="${pageContext.request.contextPath}/mypublicprofile/${i[3]}"><span id="datos-ranking">${i[2]}</span></a>
											  	</div>   
											  	<div class="col-3 ">
											         <span id="datos-ranking">${i[1]}</span> 
											  	</div>    
									        </div>
									    </c:forEach>
									</div>
								</div>
								<div class="row justify-content-center text-center">
									<div class="col-10">
										<i class="fa fa-star" style="color:#02fc02;"></i>
										<i class="fa fa-star" style="color:#02fc02;"></i>
										<i class="fa fa-star" style="color:#02fc02;"></i>
										<i class="fa fa-star" style="color:#02fc02;"></i>
										<i class="fa fa-star" style="color:#02fc02;"></i><br>
									</div>
								</div>
								<div id="fila-gastado" class="row justify-content-center text-center">
									<div class="col-10">
										<span id="titulo-negrita">Ranking gastado</span>
										<c:forEach var="i" items="${gastado}">
									        <div class="row justify-content-center text-center">
									         	<div class="col-9 ">
											         <a href="${pageContext.request.contextPath}/mypublicprofile/${i[3]}"><span id="datos-ranking">${i[2]}</span></a>
											  	</div>    
											  	<div class="col-3 ">
											         <span id="datos-ranking">${i[0]}&euro;</span>
											  	</div>     
									        </div>
									    </c:forEach>
									</div>
								</div>
							</div>
					 	</div>
				</div>			
				<div  class="col-lg-9 col-md-9 col-sm-7 col-xs-8 justify-content-start">
					<c:if test="${empty allProducts}">
						<div class="row justify-content-center text-center bg-white rounded p-1 m-1" id="${product[4]}">
							<h2 id="mensaje-index">NO SE HAN ENCONTRADO RESULTADOS PARA TU B�SQUEDA</h2>
						</div>	
					</c:if>
					<c:if test="${not empty allProducts}">
						<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
						<div class="row justify-content-center text-center bg-white rounded p-1 m-1" id="${product[4]}">
						<c:forEach items="${allProducts}" var="product" varStatus="status">
							
								<div id="producto" class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
								<div class="row justify-content-center m-1 text-center">
									<div class="col-12 ">
										<div class="row justify-content-center">
											<div id="contenedor-talla" class="col-2 text-center">
												<span>${product[10]}</span>
											</div>
											<div class="col-6 mr-auto text-center p-0 align-self-center">
												<span id="marca-producto">${product[1]}</span>
											</div>
										</div>
										
									</div>
										
									<div class="col-12">
										<div class="producto-img d-flex justify-content-center p-1">
											<a href="${pageContext.request.contextPath}/verproducto/${product[4]}"><img class="rounded" width="200px" height="200px" src="https://s3.us-east-2.amazonaws.com/nastse-s3/imagenes/${product[2]}"></a>	
										</div>
									</div>	
									<div id="valoracion-index" class="col-12">	
											<fmt:parseNumber var = "i" type = "number" value= "${product[8]}" />
											
											<i class="fa fa-star" style="color:#F27490;"></i>	
											<c:if test="${i > 1}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${i > 2}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${i > 3}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											<c:if test="${i > 4}">
												<i class="fa fa-star" style="color:#F27490;"></i>
											</c:if>
											
											<c:if test="${i < 2}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${i < 3}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${i < 4}">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${i < 5}">
												<i class="fa fa-star"></i>
											</c:if>
									</div>
									
									<div class="col-12">	
											<span id="modelo-producto">${product[6]}</span>
									</div>
<!-- 									<div class="col-12">	 -->
<%-- 											<span id="categoria">${product[0]}</span> --%>
<!-- 									</div> -->
									<div class="col-12">
										<div  class="row">	
											<div id="producto-datos-usuario" class="col-12 text-center p-0 align-self-end">
												<span id="datos">Talla: ${product[9]}</span>&nbsp<span id="datos">${product[12]}cm</span>&nbsp<span id="datos">${product[11]}kg</span>&nbsp<span id="datos">${product[12]}&euro;</span>		
											</div>
											<div class="col-12 text-center">
												<a href="${pageContext.request.contextPath}/mypublicprofile/${product[5]}">${product[3]}</a>
											</div>
											
										</div>
									</div>
									</div>
									
								</div>
								</c:forEach>
							</div>	
						
					</c:if>	
				</div>
	</div>	
<!-- 		PAGINACION	 -->
		<div id="mostrar" class="row justify-content-md-center justify-content-sm-center bg-white rounded text-center">
			<div class="col-lg-12">
				<hr>
			</div>
			<div class="col-lg-12">
					<div id="pagination">
					    <c:if test="${page > 1}">
					    	 <input type="button" id="${page - 1}" class="boton-pagina" value="Ant"  onclick="paginar(this.id)">
					        
					    </c:if>
					    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
					        <c:choose>
					            <c:when test="${page == i.index}">
					                <span id="${i.index}">${i.index}</span>
					            </c:when>
					            <c:otherwise>
					               <input type="button" id="${i.index}" class="boton-pagina" value="${i.index}"  onclick="paginar(this.id)">
					                
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					    <c:if test="${page + 1 <= maxPages}">
					   		<input type="button" id="${page + 1}" class="boton-pagina" value="Sig"  onclick="paginar(this.id)">				        
					    </c:if>
					</div>
			</div> 
		</div>
</div>		
</body>

<footer>
	<!-- 	AQU� INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>

</html>