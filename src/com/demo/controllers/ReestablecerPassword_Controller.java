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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
@RequestMapping(value= {"/reestablecer-password/{id}", "/reestablecer-password"})
public class ReestablecerPassword_Controller {
	
	@RequestMapping(name="/reestablecer-password/{id}", method=RequestMethod.GET)
	public ModelAndView loadloginpage(@PathVariable(value="id") String tokenID, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("reestablecer-password");
		User user = new User();
		mav.addObject("user", user);
		
		
		int usuario = RegisteryDAO.getUserDAO().comprobarTokenID(tokenID);
		
		//SI EL TOKEN ES VALIDO MUESTRO EL FORMULARIO PARA CAMBIAR LA PASSWORD
		if(usuario != 0) {
			//ES EL ID DEL USUARIO AL QUE SE LE VA A CAMBIAR LA CONTRASEÑA
			session.setAttribute("id_usuario", usuario);
			return mav;
			
		//SI EL TOKEN NO EXISTE REDIRIJO A ERROR
		}else {
			
			mav = new ModelAndView("error"); 
			return mav;
		}
		
	}
	
	

	@RequestMapping(name="/reestablecer-password", method=RequestMethod.POST)
	public String do_login(HttpServletRequest req, Model md, HttpSession session, @Valid User user, BindingResult br) {
		
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
					
					//HAGO UN UPDATE DE TOKENID CON OTRO TOKENID NUEVO
					//TODO GENERAR UN NUEVO TOKENID Y ACTUALIZARLO
					message = "Contraseña actualizada correctamente";
					md.addAttribute("error_msg", message);
					
					return "redirect:/login";
				 }
				 else{
					 
					message = "Las contraseñas no coinciden";
					md.addAttribute("error_msg", message);

				 }		 
			}
			
			return "reestablecer-password";
			
		}catch(Exception e){
			
			return "reestablecer-password";
		}
	}
	

}
