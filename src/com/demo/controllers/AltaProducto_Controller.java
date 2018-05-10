package com.demo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AltaProducto_Controller {
	
	@RequestMapping(value="/altaproducto", method=RequestMethod.GET)
	public String load_altaproducto(HttpSession session, ModelMap map) {
		
		
		return "altaproducto";
	}
}
