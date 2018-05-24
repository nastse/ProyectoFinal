package com.demo.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;


@Controller
@RequestMapping(value= {"/verproducto/{id}"})
public class VistaProducto_Controller {
		
	@RequestMapping(name="/verproducto/{id}", method=RequestMethod.GET)
	public ModelAndView vista_producto(@PathVariable(value="id") String id) {

		ModelAndView mav = new ModelAndView("verproducto");
		System.out.println(id);
		String usuario="";

		Products producto = new Products();
		producto = RegisteryDAO.getProductsDAO().getProductByProductId(id);
		
		
		
		if(producto == null) {
			
			mav = new ModelAndView("error"); 
			return mav;
	
		}else {
			
			//BUSCO EL NOMBRE DEL USUARIO PARA PODER MOSTRARLO EN EL LA PAGINA
			usuario = RegisteryDAO.getUserDAO().getUserName(producto.getId_user());
			
			
			mav.addObject("product", producto);
			mav.addObject("usuario", usuario);
			return mav;
			
		}
		
		
	}
	
}	
	
	
	
	


