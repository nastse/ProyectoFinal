package com.demo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
public class Myprofile_Controller {
	
	@RequestMapping(value="/myprofile", method=RequestMethod.GET)
	//public ModelAndView load_myprofile(HttpSession session, ModelMap map) {
	
	public String load_myprofile(HttpSession session, ModelMap map) {	
		//ModelAndView mv = new ModelAndView("myprofile");
		
		//COMPRUEBO QUE EL USUARIO ESTA LOGUEADO
		if(session.getAttribute("email") != null) {
			
			
			//PARA RECIBIR EL NOMBRE DE LA SESION LE PASO EL NOMBRE DE LA CLAVE QUE LE ASIGNADO
			String email = session.getAttribute("email").toString();
			
			//HAGO UNA BUSQUEDA DE TODOS LOS PRODUCTOS DE UN USUARIO POR SU ID RECOGIDO ANTES
			List <String> datosUsuario = RegisteryDAO.getUserDAO().getUserDatos(email);
			
			
			if(session.getAttribute("id")  == null) {
				
				System.out.println("VALOR NULL SESION ID");
			}
			
			//mv.addObject("user", username);
			map.addAttribute("email", email);
			map.addAttribute("datosUsuario", datosUsuario);
			
		}
		
		return "myprofile";
	}

}
