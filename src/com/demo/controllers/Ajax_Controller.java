package com.demo.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.dao.registery.RegisteryDAO;

@Controller
public class Ajax_Controller {

	@ResponseBody
	@RequestMapping(value="/deleteProduct",method=RequestMethod.POST)
	public String deleteProduct(HttpServletRequest request, HttpSession session){
		
		String productId = request.getParameter("productId");
		
		System.out.println(productId);
		String usuario_id = session.getAttribute("id_usuario").toString();
		
		
		boolean flag = RegisteryDAO.getProductsDAO().deleteProductById(productId, usuario_id);
		
		if(flag){
			return "Producto eliminado correctamente ! ! !";
		}
		else{
			return "Vuelve a intentarlo ! ! !";
		}
		
	}
	
}

