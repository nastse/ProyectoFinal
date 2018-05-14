package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



	@Controller
	public class Prueba_Controller {
		
		@RequestMapping(value= { "/prueba"}, method=RequestMethod.GET)
		public ModelAndView paginaPrueba() {
			
			ModelAndView mav = new ModelAndView("prueba");
			mav.addObject("prueba", "Se Ha llamado a prueba");
			
			
			return mav;
		
		}

	}

	

