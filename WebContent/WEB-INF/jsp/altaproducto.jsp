<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Nueva review</title>
	
	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		*{margin:0;padding:0;box-sizing:border-box;}
			body{background:teal;color:#0B0C10;}
    		
    		 .invalid-feedback {
    			display: block;
  				}
  			
  			.form-control{border-width: 2px; border-color: #0B0C10;}  
  				
  			.form-control:focus {

        		border-color: #0B0C10;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		
    		.boton{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
				background-color:#1F2833;
				width:90px;
    		}
    		.boton:hover{
    			background-color:#F27490;
    		} 
    		
    		#form:focus{
    			border-color: #F27490;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		
    		#titulo{
    			margin-top:20px;
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			font-weight: bold;
    			font-size:14px;
    			text-transform: uppercase;
    		}

    		#columna{
    		
    			margin-top:30px;
    		}
    		#contenedor-columna{
    		
    			padding-bottom:30px;
    		}
    		
    		hr{
    			
    			background-color: #F27490; 
    			height: 1px; 
    			border: 0; 
    		}
    		
    		#radios{
				  position:relative;
				  width:80%;
				  margin:0 auto;
				}
				input[type="radio"]{
				  position:absolute;
				  right:1000%;
				}
				#r{
				  float:left;
				  width:15%; padding-bottom:15%;
				  margin:0 2.5%;
				  background:#F27490;
				  border-radius:50%;
				  cursor:pointer;
				}

				
				#slider{
				  position:absolute;
				  left:0%; top:0;
				  width:10%; padding-bottom:10%;
				  margin:2.5% 0 0 5%;
				  background:#fff;
				  transition:transform 1s;
				  border-radius:50%;
				  animation-timing-function: ease-in-out;
				  animation-duration:.3s;
				  animation-fill-mode: forwards;
				  transition: 0.2s left .05s ease-in-out;
				}
				
				#input1:checked  ~ #slider{ animation-name: input1; left:0; }
				#input2:checked  ~ #slider{ animation-name: input2; left:20%; }
				#input3:checked  ~ #slider{ animation-name: input3; left:40%; }
				#input4:checked  ~ #slider{ animation-name: input4; left:60%; }
				#input5:checked  ~ #slider{ animation-name: input5; left:80%; }
				
				@keyframes input1{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input2{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input3{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input4{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input5{ 30%, 70% { transform:scale(0.5); } }
				
				#input10:checked  ~ #slider{ animation-name: input10; left:0; }
				#input20:checked  ~ #slider{ animation-name: input20; left:20%; }
				#input30:checked  ~ #slider{ animation-name: input30; left:40%; }
				#input40:checked  ~ #slider{ animation-name: input40; left:60%; }
				#input50:checked  ~ #slider{ animation-name: input50; left:80%; }
				
				@keyframes input10{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input20{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input30{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input40{ 30%, 70% { transform:scale(0.5); } }
				@keyframes input50{ 30%, 70% { transform:scale(0.5); } }
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
	
	<script>
 		 	var loadFile = function(event) {
 		 		
    			var output = document.getElementById('imagen');
   		 		output.src = URL.createObjectURL(event.target.files[0]);
  			};
  			
  			
  			$(document).ready(function() {
  			    var text_max = 399;
  			    $('#textarea_feedback').html('te quedan '+text_max + ' caracteres');

  			    $('#textarea').keyup(function() {
  			        var text_length = $('#textarea').val().length;
  			        var text_remaining = text_max - text_length;

  			        $('#textarea_feedback').html('te quedan '+ text_remaining + ' caracteres');
  			    });
  			});
  			
	</script>
	
</head>

<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />

<body>
	<c:if test="${empty sessionScope.email}">
	   <div class="container">	
			<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
				 <h1>INICIA SESION</h1>
			</div>
	   </div>     
	</c:if>


<c:if test="${not empty sessionScope.email}">	
	<div class="container">	
	
			<div id="" class="row justify-content-md-center justify-content-sm-center bg-white rounded text-center">
				<div class="col-lg-10 text-center">
					<h5 id="columna">CREAR UNA NUEVA REVIEW</h5>
					<hr>
				</div>
			</div>
			
			<form action="${pageContext.request.contextPath}/altaproducto" method="post" enctype="multipart/form-data">
			
				<div id="" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-center">
							
							<div class="col-lg-12">
								<img  id="imagen" class="img-fluid" src="${pageContext.request.contextPath}/img/subir.png">	
							</div> 
							<div class="col-lg-6">
								<input id="subir-imagen" class="form-control" type="file" name="image" required="required" accept="image/*" class="btn" onchange="loadFile(event)">
								<span id="texto">Sube una imagen tipo jpg/jpeg/png de tamaño máximo 5MB</span>
							</div> 
							
						<c:if test="${not empty mensaje_alta}">	
 							<div id="error-alta" class="col-lg-12 ">
								<span id="error-alta-texto" class="alert alert-danger" >${mensaje_alta}</span>
							</div>
						</c:if>		
								
							
				</div>		
				<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center shadow m-2 p-2 bg-white rounded text-left">		
					<div class="col-lg-12">
							
					</div>
<!-- 						COLUMNA CENTRAL -->
						<div id="column-center" class="col-lg-4">							
							<div id="" class="row justify-content-md-center justify-content-sm-center">	
								<div class="col-lg-10 text-center">
									<h5 id="columna">DATOS USUARIO</h5>
									<hr>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Talla</label><br>
			<%-- 						<input type="text" name="talla" value="${product.talla}"> --%>
										<select id="form" class="form-control" name="tallauser" required>
											<option value = ""></option>
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
								<div class="col-lg-10">	
									<label id="titulo">Peso</label><br>
			<%-- 						<input type="text" name="peso" value="${product.peso}"> --%>
									<select id="form" class="form-control" name="peso" required>
												<option value = ""></option>
												<c:forEach var = "i" begin = "40" end = "200">
							         				<option value = "${i}"/>${i}kg</option>
							     				</c:forEach>			
									</select>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Altura</label><br>
			<%-- 						<input type="text" name="altura" value="${product.altura}"> --%>
									<select id="form" class="form-control" name="altura" required>
												<option value = ""></option>
												<c:forEach var = "i" begin = "150" end = "250">
							         				<option value = "${i}"/>${i}cm</option>
							     				</c:forEach>			
									</select>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Medida Pecho</label><span>(opcional)</span><br>
									<select id="form" class="form-control" name="pecho">
												<option value = "0"></option>
												<c:forEach var = "i" begin = "60" end = "120">
							         				<option value = "${i}"/>${i}cm</option>
							     				</c:forEach>			
									</select>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Medida Cintura</label><span>(opcional)</span><br>
									<select id="form" class="form-control" name="cintura">
												<option value = "0"></option>
												<c:forEach var = "i" begin = "40" end = "100">
							         				<option value = "${i}"/>${i}cm</option>
							     				</c:forEach>			
									</select>
								</div>	
								<div class="col-lg-10">
									<label id="titulo">Medida Cadera</label><span>(opcional)</span><br>
									<select id="form" class="form-control" name="cadera">
												<option value = "0"></option>
												<c:forEach var = "i" begin = "50" end = "100">
							         				<option value = "${i}"/>${i}cm</option>
							     				</c:forEach>			
									</select>
								</div>			

							
							</div>		
						</div>

<!-- 						COLUMNA IZQUIERDA -->
						<div id="column-left" class="col-lg-4">
							<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center">
								<div class="col-lg-10 text-center">
									<h5 id="columna">DATOS PRENDA</h5>
									<hr>
								</div>
								<div class="col-lg-10">	
									<label id="titulo">Categoría</label><br>
		<%-- 							<input type="text" name="categoria" value="${product.categoria}">  --%>
										<select id="form" class="form-control" name="categoria" required>
											<option value = ""/></option>
											<c:forEach items="${allCategorias}"  var="categoria">
         										<option value="${categoria.nombre}">${categoria.nombre}</option>
    										</c:forEach>
										</select>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Marca</label><br>
			<%-- 						<input type="text" name="marca" value="${product.marca}"> --%>
										<select id="form" class="form-control" name="marca" required>
											<option value = ""/></option>
											<c:forEach items="${allMarcas}"  var="marca">
         										<option value="${marca.nombre}">${marca.nombre}</option>
    										</c:forEach>
										</select>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Modelo</label><span>(max. 20 caracteres)</span><br>
									<input id="form" class="form-control" type="text" name="modelo" value="" maxlength="20" required>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Talla</label><br>
			<%-- 						<input type="text" name="talla" value="${product.talla}"> --%>
										<select id="form" class="form-control" name="talla" required>
											<option value = ""/></option>
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
								<div class="col-lg-10">
									<label id="titulo">Año</label><br>
			<%-- 						<input type="text" name="talla" value="${product.talla}"> --%>
										<select id="form" class="form-control" name="anio" required>
											<option value = ""/></option>
											<c:forEach var = "i" begin = "2015" end = "2018">
							         			<option value = "${i}">${i}</option>
							     			</c:forEach>
										</select>
								</div>
								<div class="col-lg-10">
									<label id="titulo">Precio</label><br>
										<select id="form" class="form-control" name="precio" required>
											<option value = ""/></option>
											<c:forEach var = "i" begin = "1" end = "500">
							         			<option value = "${i}">${i}€</option>
							     			</c:forEach>
										</select>
								</div>
								
								
							</div>
						</div>

<!-- 						COLUMNA DERECHA -->
						<div id="column-right" class="col-lg-4">
							<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center">
									<div class="col-lg-10 text-center">
										<h5 id="columna">VALORACIÓN</h5>
										<hr>
									</div>
									<div class="col-lg-10">
									<label id="titulo">Temperatura Min</label><br>
			<%-- 						<input type="text" name="temp_min" value="${product.temp_max}"> --%>
									<select id="form" class="form-control" name="temp_min" required>
												<option value = ""/></option>
												<c:forEach var = "i" begin = "1" end = "10">
							         				<option value = "${i-11}">${i-11}º</option>
							     				</c:forEach>
							     				<c:forEach var = "i" begin = "0" end = "50">
							         				<option value = "${i}">${i}º</option>
							     				</c:forEach>	
							     	</select>		
								</div>

								<div class="col-lg-10">
									<label id="titulo">Temperatura Max</label><br>
			<%-- 						<input type="text" name="temp_max" value="${product.temp_min}"> --%>
									<select id="form" class="form-control custom-select" name="temp_max" required >
												<option value = ""></option>
												<c:forEach var = "i" begin = "1" end = "10">
							         				<option value = "${i-11}">${i-11}º</option>
							     				</c:forEach>
							     				<c:forEach var = "i" begin = "0" end = "50">
							         				<option value = "${i}">${i}º</option>
							     				</c:forEach>	
							     	</select>
								</div>
								<div class="col-lg-10">
									<div class="col-12">
										<label id="titulo">Ajuste/Comodidad</label><br>
									</div>	
									<div id="puntos">
										<i class="fa fa-minus"></i>
										<i class="fa fa-plus ml-auto"></i>	
									</div>
									<div id="radios">
									  <label id="ra" for="input1"></label>
									  <input  id="input1" name="ajuste" type="radio" value="1"/>
									  <label id="ra" for="input2"></label>
									  <input  id="input2" name="ajuste" type="radio" value="2"/>
									  <label id="ra" for="input3"></label>
									  <input  id="input3" name="ajuste" type="radio" value="3" checked/>
									  <label id="ra" for="input4"></label>
									  <input  id="input4" name="ajuste" type="radio" value="4" />
									  <label id="ra" for="input5"></label>
									  <input  id="input5" name="ajuste" type="radio" value="5"/>
									  <span id="slider"></span>
									</div>
								</div>
								<div class="col-lg-10">				
										<div class="col-12">
											<label id="titulo">Valoración/Recomendable</label><br>
										</div>
										<div id="puntos">
											<i class="fa fa-minus"></i>
											<i class="fa fa-plus ml-auto"></i>	
										</div>
										<div id="radios">										  
											  <label id="r" for="input10"></label>
											  <input  id="input10" name="comodidad" type="radio" value="1"/>
											  <label id="r" for="input20"></label>
											  <input  id="input20" name="comodidad" type="radio" value="2"/>
											  <label id="r" for="input30"></label>
											  <input  id="input30" name="comodidad" type="radio" value="3" checked/>
											  <label id="r" for="input40"></label>
											  <input  id="input40" name="comodidad" type="radio" value="4"/>
											  <label id="r" for="input50"></label>
											  <input  id="input50" name="comodidad" type="radio" value="5"/>
											  <span id="slider"></span>	  
										</div>
										
								</div>
								<div class="col-lg-10">
									<label id="titulo">Comentario (opcional)</label><br>	
									<textarea id="textarea" style="resize:none" class="form-control" rows="5" name="comentario" maxlength="399"></textarea>
									<div id="textarea_feedback"></div>	
								</div>
							</div>
						</div>	
						<div class="col-lg-12 text-center">
							<button id="boton" type="reset" class="boton btn btn-sm" onclick="location.href='${pageContext.request.contextPath}/myproducts'">CANCELAR</button>
							<button id="boton" class="boton btn btn-sm" type="submit" value="Guardar" >GUARDAR</button>
						</div>
				</div>			
			</form>	
	</div>				

</c:if>
</body>

<footer>
	<!-- 	AQUÍ INSERTO EL FOOTER -->
	<jsp:include page="footer.jsp" />	
</footer>

</html>