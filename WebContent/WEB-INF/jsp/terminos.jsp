<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;  UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Términos y condiciones</title>
	

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
		
			
		<div id="contenedor-columna" class="row justify-content-md-center justify-content-sm-center  bg-white rounded text-left">		
	<!-- 						COLUMNA CENTRAL -->
			<div id="column-center" class="col-lg-12">							
				<div id="" class="row justify-content-md-center justify-content-sm-center">	
					<div class="col-lg-10 text-center">
						<h5 id="columna">TÉRMINOS DE USO</h5>
						<hr>
					</div>
					<div class="col-lg-10">
						
						<p>Los presentes Términos de uso (en adelante, “los Términos de Uso”) establecen las condiciones bajo las cuales se ofrece a los usuarios el acceso a los sitios web, servicios y aplicaciones Ciclismo Review (en adelante, “el Servicio”) , que es una plataforma que permite a los usuarios publicar ofertas para la compra–venta de una amplia variedad de artículos de su propiedad, así como la comunicación entre los usuarios ofertantes y los usuarios interesados en adquirir los artículos ofrecidos y la localización geográfica de los mismos, para completar la transacción.</p>
						<p>El uso del Servicio atribuye a quien lo realiza la condición de usuario del mismo (en adelante, “el Usuario”) e implica la aceptación íntegra de estos Términos de Uso. En caso de no estar de acuerdo con todo o parte de estos Términos de Uso, el Usuario debe abstenerse de instalar y utilizar el Servicio.</p>
						<p>Por medio de la aceptación de los presentes Términos de Uso, el Usuario manifiesta:</p>
						<ul>
							<li>Que ha leído, entiende y comprende lo aquí expuesto.</li>
							<li>Que asume todas las obligaciones aquí dispuestas.</li>
							<li>Que es mayor de edad y tiene la capacidad legal suficiente para utilizar el Servicio.</li>
						</ul>
						<p>Estos Términos de Uso serán aplicables a los Usuarios a partir de 01&nbsp;de Junio&nbsp;de 2018. Su aceptación por parte de los Usuarios será un paso previo e indispensable a la utilización del Servicio. El titular del Servicio se reserva la facultad de realizar en cualquier momento cualquier modificación o actualización de los Términos de Uso que, una vez entren en vigor, deberá ser aceptada por el Usuario para continuar utilizando el Servicio.</p>
						
						<p><strong>1. Necesidad de registro</strong></p>
							<p>Para poder utilizar el Servicio es necesario el previo registro del Usuario, la aceptación de los presentes Términos de uso y la Política de privacidad y de cookies.</p>
							<p>Los datos introducidos por el Usuario deberán ser exactos, actuales y veraces. El Usuario registrado será responsable en todo momento de la custodia de su contraseña, asumiendo en consecuencia cualesquiera daños y perjuicios que pudieran derivarse de su uso indebido, así como de la cesión, revelación o extravío de la misma, debiendo informar inmediatamente a Ciclismo Review en caso de que tenga motivos para creer que su contraseña ha sido utilizada de manera no autorizada o es susceptible de serlo. En cualquier caso, el acceso a áreas restringidas y/o el uso del Servicio realizado bajo la contraseña de un Usuario registrado se reputarán realizados por dicho Usuario, quien responderá en todo caso de dicho acceso y uso.</p>
							<p>Mediante la aceptación de los Términos de Uso, el Usuario consiente que sus datos pasen a formar parte del fichero de Ciclismo Review y el tratamiento de esos datos será conforme a lo previsto en la Política de Privacidad.</p>
						
						<p><strong>2. Normas de utilización del servicio</strong></p>
							<p>El Usuario se obliga a utilizar el Servicio conforme a lo establecido en la ley, la moral, el orden público y los presentes Términos de Uso. Asimismo, se obliga hacer un uso adecuado del Servicio y a no emplearlo para realizar actividades ilícitas o constitutivas de delito, que atenten contra los derechos de terceros o que infrinjan cualquier norma del ordenamiento jurídico.</p>
							<p>El Usuario se obliga a no transmitir, introducir, difundir y poner a disposición de terceros, cualquier tipo de material e información (productos, objetos, datos, contenidos, mensajes, dibujos, archivos de sonido e imagen, fotografías, software, etc.) que sean contrarios a la ley, la moral, el orden público y los presentes Términos de Uso. A título enunciativo y en ningún caso limitativo o excluyente, el Usuario se compromete a:</p>
							<ul id="anchor3">
								<li>I. No introducir o difundir contenidos o propaganda de carácter racista, xenófobo, pornográfico, de apología del terrorismo o que atenten contra los derechos humanos.</li>
								<li>II. No difundir, transmitir o poner a disposición de terceros cualquier tipo de información, elemento o contenido que atente contra los derechos fundamentales y las libertades públicas reconocidos constitucionalmente y en los tratados internacionales.</li>
								<li>III. No difundir, transmitir o poner a disposición de terceros cualquier tipo de información, elemento o contenido que constituya publicidad ilícita o desleal.</li>
								<li>IV. No transmitir publicidad no solicitada o autorizada, material publicitario, “correo basura”, “cartas en cadena”, “estructuras piramidales”, o cualquier otra forma de solicitación, excepto en aquellas áreas (tales como espacios comerciales) que hayan sido exclusivamente concebidas para ello.</li>
								<li>V. No introducir o difundir cualquier información y contenidos falsos, engañosos, ambiguos o inexactos de forma que induzca o pueda inducir a error a los receptores de la información.</li>
								<li>VI. No suplantar a otros Usuarios del Servicio ni transmitir los datos de acceso a la cuenta ni la contraseña a un tercero sin el consentimiento de Ciclismo Review.</li>
								<li>VII. No difundir, transmitir o poner a disposición de terceros cualquier tipo de información, elemento o contenido sin autorización de los titulares de los derechos de propiedad intelectual e industrial que puedan recaer sobre tal información, elemento o contenido.</li>
								<li>VIII. No difundir, transmitir o poner a disposición de terceros cualquier tipo de información, elemento o contenido que suponga una violación del secreto de las comunicaciones y la legislación de datos de carácter personal.</li>
								<li>IX. No difundir, transmitir o poner a disposición de terceros fotografías ni cualquier representación o imagen de personas menores de edad.</li>
								<li>X. Cualquier sustancia que requiera una receta médica o que deba dispensarse bajo la supervisión de un médico (doctor, dentista, optometrista, óptico, farmacéutico o veterinario) no está permitida en Ciclismo Review. Así como los productos que puedas influir en la salud del individuo (que presenten contraindicaciones, interacciones, etc) y perecederos de cualquier tipo.</li>
							</ul>
							<p>El Usuario se obliga a mantener indemne a Ciclismo Review ante cualquier posible reclamación, multa, pena o sanción que pueda venir obligada a soportar como consecuencia del incumplimiento por parte del Usuario de cualquiera de las normas de utilización antes indicadas, reservándose, además Ciclismo Review el derecho a solicitar la indemnización por daños y perjuicios que corresponda.</p>
							
						<p><strong>3. Exclusión de Usuarios</strong></p>
							<p>Ciclismo Review se reserva el derecho a impedir el uso del Servicio, ya sea de forma temporal o definitiva, a cualquier Usuario que infrinja cualquiera de las normas establecidas en estos Términos de Uso, la ley o la moral. Discrecionalmente, Ciclismo Review también podrá excluir Usuarios e incluso dejar de prestar total o parcialmente el Servicio cuando así lo considere oportuno para mejorar la operativa del Servicio y/o del resto de los usuarios del mismo.</p>
						
						<p><strong>4. Exclusión de responsabilidad</strong></p>
							<p>Con carácter enunciativo, y en ningún caso limitativo, Ciclismo Review no será responsable por los daños y perjuicios de cualquier naturaleza derivados de:</p>
							<p>a) La utilización que los Usuarios hagan del Servicio ni por el estado, origen, posible inexactitud, o posible falsedad de los datos proporcionados por los Usuarios ni de las opiniones ofrecidos a través del Servicio.</p>
							<p>b) Los contenidos, informaciones, opiniones y manifestaciones de cualquier Usuario o de terceras personas o entidades que se comuniquen o exhiban a través del Servicio.</p>
							<p>c) La utilización que los Usuarios puedan hacer de los materiales del Servicio, ya sean prohibidos o permitidos, en infracción de los derechos de propiedad intelectual y/o industrial, información confidencial, de contenidos del Servicio o de terceros.</p>
							<p>d) La realización de actos de competencia desleal y publicidad ilícita.</p>
							<p>e) La eventual pérdida de datos de los Usuarios por causa no atribuible al Servicio,</p>
							<p>f) El acceso de menores de edad a los contenidos incluidos en el Servicio.</p>
							<p>g) La indisponibilidad, errores, fallos de acceso y falta de continuidad del Servicio.</p>
							<p>h) Los fallos o incidencias que pudieran producirse en las comunicaciones, borrado o transmisiones incompletas.</p>
							<p>i) La no operatividad o problemas en la dirección de email facilitada por el Usuario.</p>
							<p>Cualquier reclamación o controversia que pueda surgir entre los Usuarios del Servicio deberá ser solventada entre éstos, obligándose a mantener a Ciclismo Review totalmente indemne, sin perjuicio de lo cual Ciclismo Review realizará sus mejores esfuerzos para facilitar a los Usuarios una pronta y satisfactoria solución a través de su Servicio de Atención al Usuario</p>
							
						<p><strong>5. Contenidos y servicios enlazados a través del Servicio</strong></p>
							<p>El Servicio puede incluir dispositivos técnicos de enlace, directorios e incluso instrumentos de búsqueda que permitan al Usuario acceder a otras páginas y portales de internet (en adelante, “Sitios Enlazados”).</p>
							<p>El Usuario reconoce y acepta que el acceso a los Sitios Enlazados será bajo su exclusivo riesgo y responsabilidad y exonera a Ciclismo Review de cualquier responsabilidad sobre eventuales vulneraciones de derechos de propiedad intelectual o industrial de los titulares de los Sitios Enlazados. Así mismo el Usuario exonera a Ciclismo Review de cualquier responsabilidad sobre la disponibilidad técnica de las páginas web enlazadas, la calidad, fiabilidad, exactitud y/o veracidad de los servicios, informaciones, elementos y/o contenidos a los que el Usuario pueda acceder.</p>
							<p>En estos casos, Ciclismo Review sólo será responsable de los contenidos y servicios suministrados en los Sitios Enlazados en la medida en que tenga conocimiento efectivo de la ilicitud y no haya desactivado el enlace con la diligencia debida. En el supuesto de que el Usuario considere que existe un Sitio Enlazado con contenidos ilícitos o inadecuados podrá comunicárselo a Ciclismo Review, sin que en ningún caso esta comunicación conlleve la obligación de retirar el correspondiente enlace.</p>
							<p>En ningún caso, la existencia de Sitios Enlazados debe presuponer la formalización de acuerdos con los responsables o titulares de los mismos, ni la recomendación, promoción o identificación de Ciclismo Review con las manifestaciones, contenidos o servicios proveídos. Ciclismo Review no conoce los contenidos y servicios de los Sitios Enlazados y, por tanto, no se hace responsable de forma directa o indirecta por los daños producidos por la ilicitud, calidad, desactualización, indisponibilidad, error e inutilidad de los contenidos y/o servicios de los Sitios Enlazados ni por cualquier otro daño que no sea directamente imputable a Ciclismo Review.</p>
							
						<p><strong>6. Propiedad intelectual e industrial</strong>
							</p><p>Los derechos de propiedad industrial e intelectual sobre las obras, prestaciones protegidas y cualesquiera contenidos o elementos sobre los que recaigan derechos de propiedad intelectual e industrial que se usen en el Servicio (los “Contenidos del Servicio”) pertenecen a sus legítimos titulares. El Usuario no adquirirá por el uso del Servicio ningún derecho de propiedad intelectual o industrial, ni licencia de uso alguna sobre tales elementos.</p>
							<p>Son Contenidos del Servicio, los textos, fotografías, gráficos, imágenes, iconos, tecnología, software, bases de datos, y demás contenidos audiovisuales o sonoros, así como su diseño gráfico y códigos fuente utilizados en el Servicio. Esta enumeración se realiza a título enunciativo y ejemplificativo, no limitativo.</p>
							<p>El texto, las imágenes, los gráficos, los ficheros de sonido, los ficheros de animación, los ficheros de vídeo, el software y la apariencia del sitio web de Ciclismo Review son objeto de protección por derechos de propiedad intelectual e industrial. Esos elementos no podrán ser válida y legítimamente copiados o distribuidos para uso comercial, ni podrán ser modificados o insertados en otros sitios web sin previa autorización expresa de sus titulares.</p>
							<p>El Usuario manifiesta ser titular en exclusiva de todos los derechos que recaen sobre las obras, prestaciones protegidas y cualesquiera otros elementos protegidos por propiedad intelectual o industrial que incorpore en el Servicio (en adelante, los “Contenidos”).</p>
							<p>El Usuario cede gratuitamente y en exclusiva a Ciclismo Review los derechos de comunicación pública, reproducción, distribución y transformación que tiene sobre los Contenidos, en todas las modalidades de explotación existentes en la fecha aceptación de estos Términos de Uso, por todo el tiempo de vigencia de los derechos objeto de cesión, para el ámbito territorial universal.</p>
							<p>Cualesquiera consultas relacionadas con lo anterior pueden plantearse a través del Servicio de Atención al Usuario a través de <a href="http://localhost:8081/Spring_Web_App/contacto">Formulario de Contacto</a></p>
						<p><strong>7. Publicación de reviews</strong></p>
							
							<p>A la hora de publicar una review el Usuario deberá tomar en consideración lo siguiente:</p>
							<p>- No está permitido publicar reviews con imágenes de contenido sexual.</p>
							<p>- No está permitido publicar reviews relacionados con el sexo, el erotismo o el fetichismo, así como tampoco relacionados con masajes, servicios de compañía o amistad.</p>
							<p>- No está permitido publicar esquemas piramidales o similares.</p>						
							<p>- No está permitido publicar imágenes o descripciones que no se correspondan con la review.</p>
							<p>- No está permitido publicar imágenes de menores de edad.</p>
							<p>- No está permitido publicar reviews que no correspondan con las categorias disponibles.</p>							
							<p>En cualquier caso, a la hora de publicar sus reviews el Usuario deberá tomar en consideración las <a href="http://localhost:8081/Spring_Web_App/reglas">reglas de publicacion</a>.</p>	
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