package com.demo.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.implementation.EnviarEmail;
import com.demo.dao.registery.RegisteryDAO;

@Controller
public class Contacto_Controller {
	
	@RequestMapping(value="/contacto", method=RequestMethod.GET)
	public ModelAndView formulario_contacto(HttpSession session, ModelMap map) {
	
		ModelAndView mav = new ModelAndView("contacto");
		
		return mav;
	}


	@RequestMapping(value="/contacto", method=RequestMethod.POST)
	public ModelAndView recoger_formulario(HttpServletRequest req, Model md, HttpSession session) {	
	
		ModelAndView mav = new ModelAndView("contacto");
		
		String asunto = req.getParameter("asunto");
		String mensaje = req.getParameter("comentario");
		String remitenteEmail = req.getParameter("email");
		
		String mensajeSistema ="";
		
		try {
		
			if(mensaje.length()>1000) {
			
				mensajeSistema ="ERROR El comentario ha superado el máximo permitido";
				md.addAttribute("error_msg", mensajeSistema);
				
			}else {
				
				//GENERO UNA NOTIFICACION
				String notificacion= RegisteryDAO.getMensajeDAO().crearMensaje(mensaje, remitenteEmail, asunto);
				
				//ME ENVIO UN EMAIL CON EL ASUTO+MENSAJE+EMAIL DE QUIEN LO ENVIA
				EnviarEmail.mandarEmail("sergiu.nastse@gmail.com", asunto, asunto+ "\n \n" +mensaje+"\n \nEnviado por "+remitenteEmail);
				mensajeSistema ="!Comentario enviado correctamente!";
				
				md.addAttribute("error_msg", mensajeSistema);
			}

		} catch (Exception e) {
			
			md.addAttribute("error_msg", "Su comunicación no ha podido ser enviada, puede enviar un email a: ciclismo.review@gmail.com");
			return mav;
		}
	
		return mav;
	}
}
