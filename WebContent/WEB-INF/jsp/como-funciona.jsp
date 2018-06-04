<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;  UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>¿Cómo funciona?</title>
	

	<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		#titulo{
    			margin-top:20px;
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			font-weight: bold;
    			font-size:14px;
    			text-transform: uppercase;
    		}
    		#columna{
    			font-family: Trade Gothic, Charcoal, sans-serif;
    			font-weight: bold;
    			font-size:16px;
    			margin-top:30px;
    		}
    		#contenedor-columna{
    		
    			padding-bottom:30px;
    		}
    		
    		#form:focus{
    			border-color: #F27490;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);
    		}
    		.form-control{border-width: 2px; border-color: #0B0C10;}  
  				
  			.form-control:focus {

        		border-color: #0B0C10;
        		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 255, 255, 0.5);

    		}
    		#alta{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			
    			color:white;
    			font-size:18px;
    			margin-top:50px;
 				background-color:#1F2833; 
/* 				background: linear-gradient(to bottom, #45484d 0%,#000000 100%); */
    		}
    		#alta:hover{
    			background-color:#F27490;
    		}
    		
    		#login{
    			font-family: Trade Gothic, Charcoal, sans-serif; 
    			color:white;
    			font-size:18px;
    			margin-top:50px;
 				background-color:#1F2833; 
/* 				background: linear-gradient(to bottom, #45484d 0%,#000000 100%); */
    		}
    		#login:hover{
    			background-color:#F27490;
    		}
    		
    		hr{
    			
    			background-color: #F27490; 
    			height: 1px; 
    			border: 0; 
    		}
	</style>
		
	<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
	<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
	
	
	<script>
		$(document).ready(function() {
			    var text_max = 999;
			    $('#textarea_feedback').html('te quedan '+text_max + ' caracteres');
	
			    $('#textarea').keyup(function() {
			        var text_length = $('#textarea').val().length;
			        var text_remaining = text_max - text_length;
	
			        $('#textarea_feedback').html('te quedan '+ text_remaining + ' caracteres');
			    });
		});
	</script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120234980-1"></script>
	<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-120234980-1');
	</script>
</head>

<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>	
	<div class="container">
		
			
		<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center  bg-white rounded text-left">		
	<!-- 						COLUMNA CENTRAL -->
			<div id="column-center" class="col-lg-12">							
				<div id="" class="row justify-content-md-center justify-content-sm-center">	
					<div class="col-lg-10 text-center">
						<h5 id="columna">CÓMO SUBIR UNA REVIEW</h5>
						<hr>
					</div>
					<div class="col-lg-10">
						
						<p><strong>Dar de alta una nueva Review</strong></p>
						<p>Para dar de alta una Review lo primero que deberemos hacer es registrarnos en la página, dándonos de alta en la sección login y configurando nuestro perfil.</p>
						<p>Una vez realizado este paso pinchamos en el apartado Mis Reviews para añadir una nueva. </p>
						<p>Dentro de la página que nos permite crear una nueva Review tenemos varias partes diferenciadas: </p>
						<ul>
							<li>Subir una imagen:</li>
								<ul>
									<li>Aquí seleccionamos una imagen para nuestra Review. La imagen deberá estar en los siguiente formatos: jpg/jpeg/png y con un tamaño máximo de 5MB. Más abajo podrás ver que tipo de imágenes no está permitidas.</li>
									<li><a href=https://www.reducirfotos.com/ target="_blank">Aquí</a> puedes utilizar una herramienta online para reducir tu imagen.</li>
								</ul>
							<li>Datos Usuario:</li>
								<ul>
									<li>Aquí configuramos nuestras medidas anatómicas. Es importante que sean los más precisas posibles. Las medidas opcionales en caso de duda es preferible dejarlas en blanco aunque son medidas que ayudan mucho si están bien tomadas.</li>
								</ul>
							<li>Datos Prenda:</li>
								<ul>
									<li>Aquí configuramos los datos de la prenda.</li>
								</ul>
							<li>Valoración:</li>
								<ul>
									<li>Aquí seleccionamos el rango de temperatura con el que nos sentimos cómodos utilizando la prenda. También podemos valorar de 1 a 5 el ajuste de la prenda y si la recomendamos como buena compra.</li>
									<li>También tenemos un espacio para comentar libremente algún punto que queramos destacar especialmente.</li>
								</ul>
						</ul>
						
						<p><strong>Actualizar/Borrar Review</strong></p>
						<p>Detro de Mis Reviews podemos ver todas nuestras Reviews y actualizarlas o borrarlas definitivamente.</p>
						
						<p><strong>¿Qué imágenes subir?</strong></p>
						<p>A la hora de subir una imagen para mostrar la prenda recomendamos no incluir rostros de personas o taparlos para que no pueda ser reconocido.</p>
						
						<p><strong>¿Qué imágenes no subir?</strong></p>
						<p>El contenido (incluyendo fotos, títulos, textos) que vaya contra disposiciones legales, buenas costumbres, y/o nuestros términos de uso o que ofenda otros usuarios está sujeto a la eliminación por parte de Ciclismo Review sin aviso previo.</p>
					
						
					</div>
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