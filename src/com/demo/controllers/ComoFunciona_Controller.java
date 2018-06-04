package com.demo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ComoFunciona_Controller {
	
	@RequestMapping(value="/como-funciona", method=RequestMethod.GET)
	public ModelAndView formulario_contacto(HttpSession session, ModelMap map) {
	
		ModelAndView mav = new ModelAndView("como-funciona");
		
		return mav;
	}
}
