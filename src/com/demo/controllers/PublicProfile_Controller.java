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
import com.demo.pojo.Products;

@Controller
@RequestMapping(value= {"/mypublicprofile/{id_usuario}"})
public class PublicProfile_Controller {
	
	@RequestMapping(name="/mypublicprofile/{id_usuario}", method=RequestMethod.GET)
	public ModelAndView load_profileId(@PathVariable(value="id_usuario") String id_usuario) {	
		
			ModelAndView map = new ModelAndView("mypublicprofile");
				
			//HAGO UNA BUSQUEDA DEL USUARIO DEL QUE QUIERO VER EL PERFIL
			List <String> datosUsuario = RegisteryDAO.getUserDAO().getUserDatos(id_usuario);
			List <Products> reviews = RegisteryDAO.getProductsDAO().getProductByUserId(Integer.parseInt(id_usuario));
			
			
			map.addObject("datosUsuario", datosUsuario);
			map.addObject("listaReviews", reviews);
			
			
			return map;
		}
	
	}

