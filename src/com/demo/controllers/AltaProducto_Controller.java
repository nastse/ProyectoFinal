package com.demo.controllers;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;

@Controller
public class AltaProducto_Controller {
	
	@RequestMapping(value="/altaproducto", method=RequestMethod.GET)
	public String load_altaproducto(HttpSession session, ModelMap map) {
		
		return "altaproducto";
	}
	
	
	@RequestMapping(value="/altaproducto", method=RequestMethod.POST)
	public String insertar_altaproducto(HttpServletRequest request, HttpSession session) {
		
		
		
		if(ServletFileUpload.isMultipartContent(request))
		{
			try
			{
				
				Products product = new Products();
				
				//RECOJO EL ID DE USUARIO PARA SABER A QUIE LE ASINGO LA REVIEW
				String id_usuario = session.getAttribute("id_usuario").toString();
				
				//RECOJO TODA LA LISTA DEL FORMULARIO
				List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				//String imagen = data.get(0).toString();
				String categoria = data.get(1).toString();
				String marca = data.get(2).toString();
				String talla = data.get(3).toString();
				String peso = data.get(4).toString();
				String altura = data.get(5).toString();
				String temp_min = data.get(6).toString();
				String temp_max = data.get(7).toString();
				//TODO AÑADIR COMENTARIO A LA BASE DE DATOS
				//String comentario = data.get(8).toString();
				
				System.out.println(data.get(0).toString()+data.get(1).toString()+data.get(2).toString()+data.get(3).toString()+data.get(4).toString());
				
				java.util.Date dt = new java.util.Date();
				
				product.setCategoria(categoria);
				product.setMarca(marca);
				product.setTalla(talla);
				product.setPeso(Integer.parseInt(peso));
				product.setAltura(Integer.parseInt(altura));
				product.setTemp_min(Integer.parseInt(temp_min));
				product.setTemp_max(Integer.parseInt(temp_max));
				product.setCreado(dt);
				product.setId_user(Integer.parseInt(id_usuario));
				
				
				String imagen = new File(data.get(0).getName()).getName();
				String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
				data.get(0).write(new File(path + File.separator + imagen));
				
				product.setImagen(imagen);
				
				//String mensaje = RegisteryDAO.productsDAO.insertProduct(product);
				
				
			}catch(Exception e){
				System.out.println(e);
				//message = "Please try again....";
			}
		}
		
		return "redirect:/myproducts";
	}
}
