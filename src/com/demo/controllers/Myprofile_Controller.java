package com.demo.controllers;


import java.io.File;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/myprofile" , method=RequestMethod.POST)
	public String actualizar_myprofile(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("myprofile");
		
		String message = "";
		
		if(ServletFileUpload.isMultipartContent(request))
		{
			try
			{
				
				//RECOJO TODA LA LISTA DEL FORMULARIO
				List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				//TODO Seccion 6 - 25.
				//TODO ACTUALIZAR EL USUARIO 
				//TODO VALIDAR CAMPOS
				//TODO EL NOMBRE DE USUARIO ES LA PRIMERA PARTE DEL EMAIL
				
				String username = data.get(2).getString();
				String genero = data.get(3).getString();
				String peso = data.get(4).getString();
				String altura = data.get(5).getString();
				String edad = data.get(6).getString();
				String id_usuario = data.get(7).getString();
				
				//COMPRUEBO SI EL USUARIO HA SELECCIONADO UNA IMAGEN PARA GUARDAR LA NUEVA O MANTENER LA ANTIGUA
				String image="";
				if(data.get(0).getName().equals("")) {
					
					image = data.get(1).getString();
					
				}else {

					image = new File(data.get(0).getName()).getName();
					String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
					data.get(0).write(new File(path + File.separator + image));
				}
				
				String mesagge = RegisteryDAO.userDAO.doHibernateUpdateUser(username, Integer.parseInt(peso), Integer.parseInt(altura), Integer.parseInt(edad), genero, image, Integer.parseInt(id_usuario));

			}
			catch(Exception e)
			{
				System.out.println(e);
				message = "Please try again....";
			}
		}
			
		mav.addObject("message", message);
			
		//return mav;
		
		return "redirect:/myprofile";
	}

}
