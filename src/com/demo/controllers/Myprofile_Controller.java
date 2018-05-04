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
	public ModelAndView actualizar_myprofile(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("myprofile");
		
		String message = "";
		
		if(ServletFileUpload.isMultipartContent(request))
		{
			try
			{
				
				//RECOJO TODA LA LISTA DEL FORMULARIO
				List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				//TODO EL NOMBRE DE USUARIO ES LA PRIMERA PARTE DEL EMAIL
				String username = data.get(0).getString();
				String peso = data.get(1).getString();
				String altura = data.get(2).getString();;
				String edad = data.get(3).getString();
				String image = new File(data.get(4).getName()).getName();
				
				System.out.println(username + peso + altura + edad + image);
				
				//Creo un objeto de usuerio
				User user = new User();
				user.setNombre(username);

				//TODO LOS DEMAS CAMPOS DE USUARIO
				
				user.setImagen(image);
				
				//TODO ACTUALIZAR EL USUARIO 
				String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
				data.get(4).write(new File(path + File.separator + image));

			}
			catch(Exception e)
			{
				System.out.println(e);
				message = "Please try again....";
			}
		}
			
		mav.addObject("message", message);
			
		return mav;
	}

}
