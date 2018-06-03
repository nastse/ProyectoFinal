package com.demo.controllers;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.dao.implementation.EnviarEmail;
import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
//Clase controladora que devuelve un MAV o un String para redirigir a la pagina
public class RecuperarPassword_Controller {
	
	@RequestMapping(value="/recuperar-password", method=RequestMethod.GET)
	
	public ModelAndView loadloginpage(HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("recuperar-password");
		
		return mav;
	}
	
	

	@RequestMapping(value="/recuperar-password", method=RequestMethod.POST)
	public String do_login(HttpServletRequest req, Model md, HttpSession session) {
		
		try {
			
			//LO RECOJO DEL PATH QUE ASIGNO EN EL JSP
			String email= req.getParameter("email");
				
				//COMPRUEBO QUE EXISTE EL EMAIL Y RECIBO EL TOKENID
				String usuario = RegisteryDAO.getUserDAO().comprobarEmail(email);
				String mensaje = "";
				
				if(usuario.equals("0")) {
					
					mensaje = "El email introducido no figura en el sistema";
					md.addAttribute("error_msg", mensaje);
					
					return "recuperar-password";
					
					
				}else {
					
					//MENSAJE DE EMAIL ENCONTRADO
					mensaje = "¡En breve recibirá un correo para reestablecer su contraseña!";
					
					//ENVIO EL EMAIL CON EL LINK PARA REESTABLECER LA CONTRASEÑA
					EnviarEmail.mandarEmail(email, "Cambio de contraseña", "Haga click en este enlace para reestablecer su contraseña: " +"http://localhost:8081/Spring_Web_App/reestablecer-password/"+usuario);
					
					md.addAttribute("error_msg", mensaje);
					
					System.out.println(usuario);
					 
					
					return "recuperar-password";
				}
	
			
			
		}catch(Exception e){
			
			return "recuperar-password";
		}
	}
	

}
