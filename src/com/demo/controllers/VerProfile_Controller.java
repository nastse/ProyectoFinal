package com.demo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.registery.RegisteryDAO;

@Controller
@RequestMapping(value= {"/mypublicprofile/{email}"})
public class VerProfile_Controller {
	
	@RequestMapping(name="/mypublicprofile/{email}", method=RequestMethod.GET)
	public ModelAndView load_profileId(@PathVariable(value="email") String email) {	
		
			ModelAndView map = new ModelAndView("mypublicprofile");
				
			//HAGO UNA BUSQUEDA DEL USUARIO DEL QUE QUIERO VER EL PERFIL
			List <String> datosUsuario = RegisteryDAO.getUserDAO().getUserDatos(email);
			System.out.println(datosUsuario);
			map.addObject("datosUsuario", datosUsuario);
			
			return map;
		}
	
	}

