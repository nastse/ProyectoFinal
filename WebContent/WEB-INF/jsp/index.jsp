<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

/* 				margin-top:20px; */
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

<!-- 	AQUÍ INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

	<div class="container">	
		<div id="contenedor-inicio" class="row m-lg-5 m-md-2 p-1 m-1 justify-content-center">
			<div id="contenedor-menu" class="lg-col-3 text-center">	
					 	<div id="menu" class="m-1">
					 		<h2 id="titulo">Buscar:</h2>
				 			<div id="titulo-menu" class="col col-12 text-left">
				 				<i onclick="colapsarMenu('marca')" class="fa fa-chevron-down"></i>&nbsp<spam>MARCA</spam> <spam id="subtitulo">prenda</spam> 
				 			</div>
						     	<div class="dropdown dropdown-dark">
							     	<select id="marca" class="form-control dropdown-select" name="marca">
<!-- 										SI EL ATRIBUTO MARCA ESTA VACIO DENTRO DEL SELECT PONGO PRIMERO TODOS -->
<!-- 										SI EL ATRIBUTO MARCA TIENE ALGUN VALOR -->
										<c:if test="${not empty marca}">
											<option value = "${marca}">${marca}</option>
<!-- 										SI NO ES TODOS LO DESPLIEGO PARA QUE SE VEA LA SELECCION HECHA ANTES DE HACER EL SUBMIT -->
											<c:if test="${marca != 'TODOS'}">
													<script type="text/javascript">
														colapsarMenu('marca');
 													</script>
 													<option value = "Todos">TODOS</option>
											</c:if>
											
										</c:if>
										<c:if test="${empty marca}">
											<option value = "Todos">TODOS</option>
										</c:if>	
											
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
						     	<i onclick="colapsarMenu('modelo')" class="fa fa-chevron-down"></i>&nbsp<spam>TIPO</spam> <spam id="subtitulo">prenda</spam>
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
										<option value = "Maillot corto">Maillot corto</option>
										<option value = "Maillot largo">Maillot largo</option>
										<option value = "Cullote corto">Cullote corto</option>
										<option value = "Cullote largo">Cullote largo</option>
									</select>	
								</div>								  							  
						     <div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('talla')" class="fa fa-chevron-down"></i>&nbsp<spam>TALLA</spam> <spam id="subtitulo">prenda</spam>
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
						     <div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('anio')" class="fa fa-chevron-down"></i>&nbsp<spam>AÑO</spam> <spam id="subtitulo">prenda</spam>
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
								
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('tallauser')" class="fa fa-chevron-down"></i>&nbsp<spam>TALLA</spam> <spam id="subtitulo">usuario</spam>
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
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('peso')" class="fa fa-chevron-down"></i>&nbsp<spam>PESO</spam> <spam id="subtitulo">usuario</spam>
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
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('altura')" class="fa fa-chevron-down"></i>&nbsp<spam>ALTURA</spam> <spam id="subtitulo">usuario</spam>
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
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('pecho')" class="fa fa-chevron-down"></i>&nbsp<spam>PECHO</spam> <spam id="subtitulo">usuario</spam>
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
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('cintura')" class="fa fa-chevron-down"></i>&nbsp<spam>CINTURA</spam> <spam id="subtitulo">usuario</spam>
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
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('cadera')" class="fa fa-chevron-down"></i>&nbsp<spam>CADERA</spam> <spam id="subtitulo">usuario</spam>
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
							<div id="titulo-menu" class="col col-12 text-left">
						     	<i onclick="colapsarMenu('genero')" class="fa fa-chevron-down"></i>&nbsp<spam>GENERO</spam> <spam id="subtitulo"></spam>
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
				</div>			

					<c:if test="${empty allProducts}">
						<h2>NO HAY NINGÚN RESULTADO</h2>
					</c:if>
					<c:if test="${not empty allProducts}">
						<%-- HAGO UN FOREACH PARA MOSTRAR TODAS LAS FILAS QUE ME DEVUELVE LA CONSULTA  --%>
						<c:forEach items="${allProducts}" var="product" varStatus="status">
							<div class="" id="${product[4]}">
								<div id="producto" class="row justify-content-center text-center bg-white rounded p-1 m-1">
									<div class="col-12">
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
											<a href="<c:url value='/verproducto/${product[4]}'/>"><img class="rounded" width="200px" height="200px" src="${pageContext.request.contextPath}/img/${product[2]}"></a>	
										</div>
									</div>	
									<div class="col-12">	
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
										<div class="row">	
											<div class="col-8 text-center p-0 align-self-end">
												<span id="datos"><span id="datos">Talla: ${product[9]}</span>&nbsp<span id="datos">${product[12]}cm</span>&nbsp<span id="datos">${product[11]}kg</span>&nbsp
	<%-- 												<a id="nombre" href="<c:url value='/mypublicprofile/${product[5]}/'/>">${product[3]}</a> --%>					
											</div>
											<div class="col-2 text-center">
												<a href="<c:url value='/mypublicprofile/${product[5]}/'/>"><img id="imagen-inicio" class="rounded-circle shadow-sm  rounded" width="45px" height="45px" src="${pageContext.request.contextPath}/img/${product[7]}"></a>
											</div>
											
										</div>
									</div>
								</div>
							</div>	
						</c:forEach>
					</c:if>	
				
					
		</div>
		
<!-- 		PAGINACION	 -->
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

<footer>
	<!-- 	AQUÍ INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>

</html>