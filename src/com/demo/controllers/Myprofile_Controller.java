package com.demo.controllers;


import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.List;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.dao.implementation.S3FileUploader;
import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
public class Myprofile_Controller {
	
	@RequestMapping(value="/myprofile", method=RequestMethod.GET)
	//public ModelAndView load_myprofile(HttpSession session, ModelMap map) {
	
	public String load_myprofile(HttpSession session,RedirectAttributes rm, @ModelAttribute("id_usuario") String iduser, Model md, ModelMap map) {	
		//ModelAndView mv = new ModelAndView("myprofile");
		 
		System.out.println("MUESTRO LO RECOGIDO EN MYPROFILE"+session.getAttribute("id_usuario")+session.getAttribute("email")+session.getAttribute("id")+"iduser: "+iduser);
			
		//COMPRUEBO QUE EL USUARIO ESTA LOGUEADO
//		if(session.getAttribute("email") != null) {
		if(session.getAttribute("email") != null) {	
			
			
				//PARA RECIBIR EL NOMBRE DE LA SESION LE PASO EL NOMBRE DE LA CLAVE QUE LE ASIGNADO
				String id_usuario = session.getAttribute("id_usuario").toString();
				
				//HAGO UNA BUSQUEDA DE TODOS LOS PRODUCTOS DE UN USUARIO POR SU ID RECOGIDO ANTES
				//RECOJO EL VALOR PASADO COMO ADDFLASHATRIBUTE DENTRO DE LOGIN
				List <String> datosUsuario = RegisteryDAO.getUserDAO().getUserDatosEmail(session.getAttribute("email").toString());
				
				map.addAttribute("datosUsuario", datosUsuario);
				session.setAttribute("datos", datosUsuario);
				map.addAttribute("email", session.getAttribute("email"));
				map.addAttribute("tipoUsuario", session.getAttribute("tipoUsuario"));
				System.out.println("DATOS USUARIO: " + datosUsuario);
			
			
			if(session.getAttribute("id_usuario")  == null) {
				
				System.out.println("VALOR NULL SESION ID");
			}	
		}
		
		return "myprofile";
	}
	
	@RequestMapping(value="/myprofile" , method=RequestMethod.POST)
	public String actualizar_myprofile(HttpServletRequest request, HttpSession session, Model md)
	{
		ModelAndView mav = new ModelAndView("myprofile");
		
		boolean error = false;
		String mensaje = "";
		
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
				
					
				if((Integer)Integer.parseInt(peso) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(altura) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(edad) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(id_usuario) instanceof Integer == false) {
					error = true;
				}
				
					//COMPRUEBO SI EL USUARIO HA SELECCIONADO UNA IMAGEN PARA GUARDAR LA NUEVA O MANTENER LA ANTIGUA
					String image="";
					//PARA COMPROBAR SI HAY IMAGEN NUEVA SELECCIONADA
					if(data.get(0).getName().equals("")) {
						
						//SI NO SE SELECCIONA UNA NUEVA MANTENGO LA ANTIGUA
						image = data.get(1).getString();
						
						session.removeAttribute("mensaje_alta");
					
					//SI SE SELECCIONA UNA NUEVA RECOJO SU VALOR PARA GUARDARLO, GENERANDO UN UUID ALEATORIO
					}else {
						
						String tipoarchivo = data.get(0).getName().toUpperCase();
						boolean extension = tipoarchivo.endsWith(".JPG") || tipoarchivo.endsWith(".JPEG") || tipoarchivo.endsWith(".PNG");
						
						//COMPRUEBO LA EXTENSION DEL ARCHIVO
						if (!extension) {
						      error=true;
						      session.setAttribute("mensaje_alta", "ERROR LA IMAGEN DEBE SER TIPO JPG/JPEG/PNG");
						   }else {
							   
							   //COMPRUEBO EL TAMAï¿½AO MAXIMO DEL ARCHIVO 5MB
							   if(data.get(0).getString().length() > 5242880) {
								   
								   error=true;
								   session.setAttribute("mensaje_alta", "ERROR EL TAMAÑO MÁXIMO ES DE 5MB");
							   }else {

								 //image = new File(data.get(0).getName()).getName();
									image = UUID.randomUUID().toString()+".jpg";
									
									//SUBO EL ARCHIVO AL S3 DE AMAZON CONFIGURADO EN LA CLASE S3FILEUPLOADER
									S3FileUploader s3 = new S3FileUploader();
							        String result = s3.fileUploader(data, image);
							        
							        if(!result.equals("Imagen subida correctamente")) {
							        	
							        	error=true;	
							        }
							            
//									String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
//									data.get(0).write(new File(path + File.separator + image));
									System.out.println(result);
									session.removeAttribute("mensaje_alta"); 
							   } 
						   }
					}
					
					
					if(!error) {
						mensaje = RegisteryDAO.userDAO.doHibernateUpdateUser(username, Integer.parseInt(peso), Integer.parseInt(altura), Integer.parseInt(edad), genero, image, Integer.parseInt(id_usuario));
						
						//REFRESCO LOS DATOS TRAS ACTUALIZAR EL USUARIO PARA CARGAR LAS IMAGENES
						List <String> datos = RegisteryDAO.getUserDAO().getUserDatos("id_usuario");
						session.setAttribute("datos", datos);
						
					}
			
			}
			catch(Exception e)
			{
				System.out.println(e);
				String message = "Please try again....";
			}
		}
			
		
		if(mensaje.equals("Actualizacion correcta...")) {
			
			return "redirect:/myprofile";
			
		}
		//SI NO, VUELVO MANTENIENDO LOS CAMPOS CON LA INFORMACION Y DEVOLVIENDO LOS ERRORES
		else {
						
			return "redirect:/myprofile";
			
		}			
	}
}
