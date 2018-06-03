<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
<style type="text/css">
    		<%@include file="/WEB-INF/css/style.css" %>
    		
    		

</style>
	    
	<div id="footer" class="container-fluid">	
		<div id="" class="row justify-content-start m-2 p-2">
			<div class="col-lg-3 col-sm-3">
				<div id="columna-footer" class="row justify-content-center">
					<div class="col-lg-12">
						<span id="titulo-footer">Ciclismo Review</span><br>
						<span id="copyright">@ 2018 Sergiu Nastase, all right reserved</span>
					</div>
				</div>
			</div>				
			<div class="col-lg-3 col-sm-3">
				<div id="columna-footer" class="row justify-content-center">
					<div class="col-lg-12">
						<span id="titulo-footer-small">Ciclismo Review</span><br>
					</div>
					<div class="col-lg-12">
						<a id="link" href="<c:url value='/contacto'/>"><span id="link-footer">¿Qué es?</span></a><br>
						<a id="link" href="<c:url value='/contacto'/>"><span id="link-footer">¿Quién es?</span></a><br>
						<a id="link" href="<c:url value='/contacto'/>"><span id="link-footer">¿Cómo funciona?</span></a><br>
					</div>		
				</div>		
			</div>
				
			<div class="col-lg-3 col-sm-3">
				<div id="columna-footer" class="row justify-content-center">
					<div class="col-lg-12 ">
						<span id="titulo-footer-small">Legal</span><br>
					</div>
					<div class="col-lg-12">
						<a id="link" href="<c:url value='/terminos'/>"><span id="link-footer">Términos de uso</span></a><br>
						<a id="link" href="<c:url value='/privacidad'/>"><span id="link-footer">Política de privacidad</span></a><br>
					</div>
				</div>		
			</div>
			
			<div class="col-lg-3 col-sm-3">
				<div id="columna-footer" class="row justify-content-center">
					<div class="col-lg-12 ">
						<span id="titulo-footer-small">Contacto</span><br>
					</div>
					<div class="col-lg-12">
						<a id="link" href="<c:url value='/contacto'/>"><span id="link-footer">Formulario de contacto</h5></span></a><br>
					</div>
					
				</div>		
			</div>					
		</div>	
	</div>	
