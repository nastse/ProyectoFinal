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

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
//Clase controladora que devuelve un MAV o un String para redirigir a la pagina
public class Password_Controller {
	
	@RequestMapping(value="/password", method=RequestMethod.GET)
	//Recojo el valor de la cookie para ir sumandole valor mas adelante
	public ModelAndView loadloginpage(HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("password");
		
		User user = new User();
		mav.addObject("user", user);
		
		return mav;
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loadloaginpage() {
		
		return "login";
	}*/
	

	@RequestMapping(value="/password", method=RequestMethod.POST)
	public String do_password(HttpServletRequest req, Model md, HttpSession session, @Valid User user, BindingResult br) {
		
		//LO RECOJO DEL PATH QUE ASIGNO EN EL JSP
		String password= req.getParameter("password");
		String repassword= req.getParameter("repassword");
		String usuario = session.getAttribute("id_usuario").toString();
		String message = "";
		
		try {
				
			//SI HA HABIDO MAS DE 1 ERROR YA QUE EMAIL SIEMPRE DA ERROR PORQUE EN ESTE CASO NO LO ESTOY EVALUANDO
			if(br.getAllErrors().size() > 1) {
				
				System.out.println("Se ha validado");
				
			//SI NO HAY ERROR VALIDANDO EL PASSWORD COMPRUEBO QUE COINCIDEN LOS DOS 	
			}
			else {
				
				//SI LAS CONTRASEÑAS COINCIDEN HAGO UN UPDATE DE PASSWORD
				 if(password.equals(repassword)){
					
					//HAGO UN UPDATE DE PASSWORD 
					int cambio = RegisteryDAO.userDAO.doHibernateUpdatePassword(Integer.parseInt(usuario), password);
					 
					return "redirect:/myprofile";
				 }
				 else{
					 
					message = "Las contraseñas no coinciden";
					md.addAttribute("error_msg", message);

				 }		 
			}
			
			return "password";
	
		}catch(Exception e){
			
			return "password";
		}
	}

}
