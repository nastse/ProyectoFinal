<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;  UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Política de privacidad</title>
	

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
	
</head>

<!-- 	AQU� INSERTO EL HEADER -->
	<jsp:include page="header.jsp" />


<body>	
	<div class="container">
		
			
		<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center bg-white rounded text-left">		
	<!-- 						COLUMNA CENTRAL -->
			<div id="column-center" class="col-lg-12">							
				<div id="" class="row justify-content-md-center justify-content-sm-center">	
					<div class="col-lg-10 text-center">
						<h5 id="columna">POLÍTICA DE PRIVACIDAD</h5>
						<hr>
					</div>
					<div class="col-lg-10">
						<p><strong>¿Quién es el responsable del tratamiento de sus datos personales?</strong>
						</p><p>Sergiu Nastase Stancila (en adelante, "Ciclismo Review"), NIF nº 50599214L, ubicado en la Calle Avenida del Manzanares Planta 7ºD, 28019, Madrid (España) y correo electrónico: sergiu.nastse@gmail.com, será responsable de sus datos personales (en adelante, los "Datos").</p>
						<p>Le informamos que cuando a través de nuestra Página Web o de nuestra Aplicación realice algún comentario en redes sociales, el responsable de los Datos que facilite a través de las mismas será la red social correspondiente y no Ciclismo Review, debiendo dirigirse a dicha red social para ejercer, en su caso, sus derechos de protección de datos que puede consultar en el apartado ¿Cuáles son los derechos de protección de sus datos personales? de la presente Política de Privacidad.</p>
						<p>&nbsp;</p>
						<p><strong>¿A quién es aplicable esta Política?</strong></p>
						<p>La utilización de la&nbsp; Página Web de Ciclismo Review así como de su Aplicación no está dirigida a menores de 18 años y, por consiguiente, éstos deberán abstenerse de facilitar cualquier información de carácter personal. Para ello, Ciclismo Review se reserva el derecho a comprobar en cualquier momento la edad de los usuarios de su Página Web y de su Aplicación</p>
						<p>&nbsp;</p>
						<p><strong>¿Cuándo recabamos sus datos personales?</strong>&nbsp;</p>
						<p>Ciclismo Review recaba y trata datos de carácter personal tanto de usuarios que se hayan registrado en nuestra Página Web o en nuestra Aplicación, como de usuarios que, no habiéndose registrado, naveguen o las consulten.</p>
						<p>De esta manera, Ciclismo Review obtiene y utiliza los datos de la IP y demás identificadores proporcionados por el dispositivo desde el que navegue por nuestra Página Web o por nuestra Aplicación, a la vez que recaba los Datos que usted proporcione en el momento de registrarse como "Usuario" de Ciclismo Review así como aquellos Datos obtenidos como consecuencia de su navegación, solicitudes, publicaciones, conversaciones, búsquedas, compras, valoraciones de otros usuarios, participación en concursos y los Datos derivados, en su caso, de la vinculación de su registro en nuestra Página Web o en nuestra Aplicación con su cuenta en Facebook o Google.</p>
						<p>Adicionalmente, si nos da su consentimiento Ciclismo Review también tratará la ubicación de su dispositivo para informarle de los productos que tiene más cerca, permitiéndole así disfrutar de nuestros servicios de manera completa.&nbsp;</p>
						<p>&nbsp;</p>
						<p><strong>¿Qué datos recabamos?</strong></p>
						<p>Ciclismo Review solamente recaba los Datos que resultan estrictamente necesarios para la consecución de las finalidades de obtención de los mismos, las cuales detallamos en el apartado ¿Con qué finalidades tratamos sus datos personales? de la presente Política de Privacidad. Es por ello que, en caso de no facilitarnos dichos Datos no podremos, gestionar el registro solicitado, prestarle el servicio solicitado, llevar a cabo la venta solicitada, facilitarle la información requerida, etc., que en cada caso corresponda.</p>
						<p>&nbsp;</p>
						<p><strong>¿Con qué finalidades y con qué base legitimadora tratamos sus datos personales?</strong></p>
						<p>En el caso de que usted no se haya registrado en nuestra página Web y/o de nuestra Aplicación, Ciclismo Review tratará la Ip de su dispositivo para las siguientes finalidades:</p>
						<p>- Conocer el origen de la descarga de nuestra Aplicación, llevando a cabo dicho tratamiento en atención a nuestro interés legítimo para la mejora de la oferta comercial.</p>
						<p>En el caso que usted se haya registrado en nuestra página Web y/o de nuestra Aplicación, las finalidades para las cuales trataremos sus Datos de carácter personal son:&nbsp;</p>
						<p>- Gestionar su alta y sus preferencias de usuario dentro del área de usuario registrado, así como para prestarle los servicios de nuestra página Web y/o de nuestra Aplicación que Usted haya solicitado. La base de legitimación que habilita a Ciclismo Review a tratar sus datos para la presente finalidad es su solicitud de registro.</p>
						<p>- Para velar por el buen uso de nuestros servicios y productos, impidiendo que se lleven a cabo usos ilícitos o contrarios a nuestra política y valores, pudiendo incluso darle de baja como usuario registrado. La base legitimadora de dicho tratamiento es el cumplimiento por parte de Ciclismo Review de determinadas obligaciones legales, así como el interés legítimo de proteger nuestros servicios y productos.</p>
						<p>- Mostrarle publicidad ajustada a sus hábitos de consumo y navegación obtenidos del uso de nuestra aplicación o página web, en atención a nuestro interés legítimo para la mejora de la oferta comercial.</p>
						<p>- Remitirle, por cualquier medio, incluidos por medios electrónicos, comunicaciones comerciales en relación a los productos y servicios ofrecidos por Ciclismo Review, comunicaciones que podrán dirigirse en atención a sus hábitos de consumo, navegación o utilización de nuestra Página Web y/o nuestra Aplicación. Ciclismo Review realizará dicho tratamiento en atención a la relación mantenida con usted, teniendo en cuenta que las citadas comunicaciones siempre versarán sobre nuestros productos y servicios.&nbsp;</p>
						<p>- Gestionar las quejas y consultas sobre los productos y/o servicios adquiridos a través de nuestra Página Web y/o de nuestra Aplicación, siendo la base legitimadora de este tratamiento la obligación legal de Ciclismo Review de acuerdo con la normativa de defensa de los consumidores y usuarios.&nbsp;</p>
						<p>- Envío de comunicaciones relacionadas con Ciclismo Review.</p>
						<p>- Si usted nos ha proporcionado su consentimiento expreso a tal efecto, comunicaremos sus datos a terceras empresas ajenas a Ciclismo Review, con la finalidad mostrarle publicidad adaptada a sus preferencias de consumo y navegación tanto de productos y servicios propios, como de terceros. Dicho tratamiento únicamente se llevará a cabo si nos da su consentimiento para ello.</p>
						<p>&nbsp;</p><p><strong>¿Durante cuánto tiempo conservamos sus datos personales?</strong></p>
						<p>En el caso de que usted no se haya registrado en nuestra página Web y/o de nuestra Aplicación, el tiempo de conservación de sus datos de carácter personal por parte de Ciclismo Review será el siguiente:</p>
						<p>- El tratamiento realizado de la IP o de cualquier otro identificador de su dispositivo para conocer el origen de la descarga de nuestra web y/o Aplicación se llevará a cabo únicamente en el momento en que tenga lugar dicha descarga.</p>
						<p>En el caso que usted se haya registrado en nuestra página Web y/o de nuestra Aplicación, los Datos que tratamos se conservarán durante los siguientes plazos:</p>
						<p>- Los datos recabados para permitirle el registro en nuestra página web o aplicación ser conservarán mientras Usted no cancele su cuenta.&nbsp;</p>
						<p>- Los datos recabados para gestionar sus preferencias como usuario se conservarán mientras usted no se oponga a dicho tratamiento.&nbsp;</p>
						<p>- Aquellos datos recabados y tratados para velar por el bueno uso de nuestros servicios y productos se conservarán hasta que se haya llevado a cabo la acción de verificación correspondiente.</p>
						<p>- Los datos recabados para mostrarle publicidad segmentada serán utilizados mientras no se oponga a dicho tratamiento.</p>
						<p>- Aquellos datos recabados para remitirle comunicaciones comerciales sobre nuestros propios servicios se conservarán mientas no se dé de baja como usuario registrado y no se oponga a dicho tratamiento.&nbsp;</p>
						<p>- Aquellos datos obtenidos como consecuencia de las quejas o consultas que nos pueda dirigir se conservarán hasta que se haya resuelto la queja o consulta correspondiente.</p>
						<p>- Los datos relativos a sus hábitos de navegación o de consumo que podamos haber obtenido de terceros serán mantenidos mientras usted no revoque el consentimiento otorgado.</p>
						<p>De manera general, cuando Usted se dé de baja como usuario registrado de Ciclismo Review, ésta eliminará toda la información de que dispusiera de aquél. Sin embargo, Ciclismo Review conservará datos meramente estadísticos de utilización por parte de los usuarios de sus recursos y herramientas.</p>
						<p>&nbsp;</p><p><strong>¿Con quién compartimos sus datos personales?</strong></p>
						<p>Como le hemos informado, únicamente, en caso de que nos dé su consentimiento para ello, Ciclismo Review comunica sus datos a terceras empresas ajenas a nuestra compañía.</p>
						<p>&nbsp;</p><p><strong>¿Cuáles son sus derechos en materia de protección datos de carácter personal?</strong></p>
						<p>Usted podrá ejercer sus derechos de acceso, rectificación, supresión, oposición, limitación al tratamiento y portabilidad de sus Datos, así como la revocación, en cualquier momento, de los consentimientos, en su caso, prestados ante Sergiu Nastase Stancila, NIF nº 50599214L, ubicado en la Calle Avenida del Manzanares Planta 7ºD, 28019, Madrid (España), adjuntando fotocopia de su DNI o documento identificativo válido equivalente. Para su mayor comodidad, y sin perjuicio de que se deban cumplir con determinados requisitos formales establecidos por la LOPD y la RGPD, Ciclismo Review le ofrece la posibilidad de ejercer los derechos antes referidos a través de nuestro <a href="http://localhost:8081/Spring_Web_App/contacto">Formulario de contacto</a>.&nbsp;</p>
						<p>Igualmente, le recordamos la posibilidad de dirigir una reclamación ante la Agencia Española de Protección de Datos, especialmente cuando considere que Ciclismo Review no ha satisfecho debidamente el ejercicio de sus derechos. Dicha reclamación podrá presentarla ante la citada autoridad mediante las diferentes opciones que la sede electrónica de la Agencia Española de Protección de datos ofrece (<a href="http://www.agpd.es/portalwebAGPD/CanalDelCiudadano/derechos/principales_derchos">http://www.agpd.es/portalwebAGPD/CanalDelCiudadano/derechos/principales_derchos</a>).</p>
						<p>Usted podrá ejercer sus derechos de acceso, rectificación, supresión, oposición, limitación al tratamiento y portabilidad de sus Datos, así como la revocación, en cualquier momento, de los consentimientos, en su caso, prestados ante Sergiu Nastase Stancila, NIF nº 50599214L, ubicado en la Calle Avenida del Manzanares Planta 7ºD, 28019, Madrid (España), adjuntando fotocopia de su DNI o documento identificativo válido equivalente. Para su mayor comodidad, y sin perjuicio de que se deban cumplir con determinados requisitos formales establecidos por la  LOPD y la RGPD, Ciclismo Review le ofrece la posibilidad de ejercer los derechos antes referidos a través de nuestro <a href="http://localhost:8081/Spring_Web_App/contacto">Formulario de contacto</a></p>
						
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