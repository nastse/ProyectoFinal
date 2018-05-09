package com.demo.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
@RequestMapping(value= {"/upproducto/{id}", "/upproducto"})
public class UpdateProducto_Controller {
		
	@RequestMapping(name="/upproducto/{id}", method=RequestMethod.GET)
	public ModelAndView update_producto(@PathVariable(value="id") String id) {

		ModelAndView mav = new ModelAndView("upproducto");
		System.out.println(id);

		Products producto = new Products();
		producto = RegisteryDAO.getProductsDAO().getProductByProductId(id);
		
		
		if(producto == null) {
			
			mav = new ModelAndView("error"); 
			return mav;
	
		}
		
		mav.addObject("product", producto);
		
		return mav;
	}
	

	@RequestMapping(name="/upproducto", method=RequestMethod.POST)
	public String vista_productoUpdate(HttpServletRequest request, Model md,  @Valid User user, BindingResult br) {
	
		//TODO RECOJO LOS VALORES Y LOS ACTUALIZO EN LA BDDA REVIEW
		
		String id = request.getParameter("id");
		String id_user = request.getParameter("id_user");
		String categoria = request.getParameter("categoria");
		String marca = request.getParameter("marca");
		String talla = request.getParameter("talla");
		String peso = request.getParameter("peso");
		String altura = request.getParameter("altura");
		String temp_max = request.getParameter("temp_max");
		String temp_min = request.getParameter("temp_min");
		String imagen = request.getParameter("imagen");
		String ajuste = request.getParameter("ajuste");
		String creado = request.getParameter("creado");
		//PARSEO CREADO A FORMATO FECHA 
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(creado);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String estado = request.getParameter("estado");
		
		Products producto = new Products();
		producto.setId_rev(Integer.parseInt(id));
		producto.setId_user(Integer.parseInt(id_user));
		producto.setCategoria(categoria);
		producto.setMarca(marca);
		producto.setTalla(talla);
		producto.setPeso(Integer.parseInt(peso));
		producto.setAltura(Integer.parseInt(altura));
		producto.setTemp_max(Integer.parseInt(temp_max));
		producto.setTemp_min(Integer.parseInt(temp_min));
		producto.setImagen(imagen);
		producto.setAjuste(Integer.parseInt(ajuste));
		producto.setCreado(date);
		producto.setEstado(Integer.parseInt(estado));
		
		String mensaje=RegisteryDAO.productsDAO.updateProduct(producto);	
		System.out.println(mensaje);

		
		//TODO AQUI REDIRIJO A LA VISTA DEL PRODUCTO?
		//TODO AQUE REDIRIJO A LA VISTA DEL PERFIL CON TODOS LOS PRODUCTOS?
		//ModelAndView mav = new ModelAndView("upproducto/"+id);
		ModelAndView mav = new ModelAndView("myprofile");
		
		return "redirect:/myproducts";

		//TODO Usar la ID recibida para hacer busqueda de producto y cargar vista.jsp con el
		
	}
}	
	/*
	@RequestMapping(name= "/vista", method=RequestMethod.GET)
	public ModelAndView vista_normal() {
	
		ModelAndView mav = new ModelAndView("vista");
		
		
		return mav;
	}*/
	