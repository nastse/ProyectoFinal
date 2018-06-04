<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;  UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>¿Quién es?</title>
	

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
						<h5 id="columna">¿QUIÉN HA CREADO CICLISMO REVIEW?</h5>
						<hr>
					</div>
					<div class="col-lg-10">
						<p><strong>Programador Java</strong></p>
						<p>Sergiu Nastase Stancila</p>
						<p>Técnico Superior en Desarrollo de Aplicaciones Multiplataforma y Ciclista</p>
						<p>Ciclismo Review es una aplicación WEB desarrollada como proyecto final para la titulación del CFGS en la que se han utilizado los siguientes lenguajes de programación:</p>
						<ul>
							<li>Java (Eclipse)</li>
							<li>Spring Framework</li>
							<li>Maven Framework</li>
							<li>Hibernate Framework</li>
							<li>MySQL, Ajax, HTML, CSS, Bootstrap, JSP, JSTL, JavaScript, JQuery</li>
							<li>Alojado en AWS</li>
						</ul>
						<p>Anteriormente en 2013 creé la tienda online <a href=http://paracordworld.es/>Paracord World</a> que actualmente solo funciona como muestra pero sin la funcionalidad de tienda.</p><br><br>
					</div>	
					<div class="col-lg-5">	
						<p><strong>Ciclista</strong></p>
						<p>Empezando en 2015 de manera regular, practico el ciclismo en todas sus modalidades:</p>
						<ul>
							<li>Carretera</li>
							<li>Montaña</li>
							<li>Urbano</li>
						</ul>
						<ul>
							<li>2015 - 3.900km</li>
							<li>2016 - 7.700km</li>
							<li>2017 - 14.125km</li>
							<li>2018 - 	5.000km</li>
						</ul>
					</div>	
					<div class="col-lg-5">		
						<iframe height='454' width='300' frameborder='0' allowtransparency='true' scrolling='yes' src='https://www.strava.com/athletes/10212281/latest-rides/a821b4cf24212dfdd1249eee0361a3a2691cd4e6'></iframe>
					</div>	
						
						
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