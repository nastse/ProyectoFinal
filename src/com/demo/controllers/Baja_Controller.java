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
public class Baja_Controller {
	
	@RequestMapping(value="/baja", method=RequestMethod.GET)
	//Recojo el valor de la cookie para ir sumandole valor mas adelante
	public ModelAndView loadloginpage(HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("baja");
		
		User user = new User();
		mav.addObject("user", user);
		
		return mav;
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loadloaginpage() {
		
		return "login";
	}*/
	

	@RequestMapping(value="/baja", method=RequestMethod.POST)
	public String do_login(HttpServletRequest req, Model md, HttpSession session) {
		
		try {
			
			//LO RECOJO DEL PATH QUE ASIGNO EN EL JSP
			String username= req.getParameter("email");
			String password= req.getParameter("password");
					
				//COMPRUEBO QUE EL USUARIO Y LA CONTRASEÑA COINCIDEN Y SIGO CON EL PROCESO DE BAJA DE USUARIO
				int usuario = RegisteryDAO.getUserDAO().doHibernateLogin(username, password);
				String mensaje = "";
				
				if(usuario != 0) {
		
					System.out.println("USUARIO DADO DE BAJA");
					
					//CAMBIO TODOS LOS REVIEWS DEL USUARIO A ELIMINAR Y SE LOS ASIGNO AL USUARIO ADMIN
					//ELIMINO DEFINITIVAMENTE EL USUARIO DE LA BASE DE DATOS
					int baja = RegisteryDAO.userDAO.doHibernateDeleteUser(usuario);
					
					//CIERRO SESION Y REDIRIJO AL INICIO
					HttpSession httpSession = req.getSession();
				    httpSession.invalidate(); 
					return "redirect:/index";
					
				}else {
					
					mensaje = "Introduce usuario y contraseña válidos";
					md.addAttribute("error_msg", mensaje);
					return "baja";
				}
	
			
			
		}catch(Exception e){
			
			return "baja";
		}
	}
	

}
