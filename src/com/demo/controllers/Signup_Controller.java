package com.demo.controllers;

import java.io.File;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;



import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.implementation.EnviarEmail;
import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.User;



@Controller
public class Signup_Controller{
	
	@RequestMapping(value="/signup" , method=RequestMethod.GET)
	public ModelAndView load_signup()
	{
		ModelAndView mav = new ModelAndView("signup");
		//Aï¿½ADIDO PRUEBA 2 LINEAS
		User user = new User();
		mav.addObject("user", user);
		return mav;
	}
	
	/*
	//MODELO PARA FORMULARIO CON SUBIDA DE ARCHIVOS
	@RequestMapping(value="/signup" , method=RequestMethod.POST)
	public ModelAndView doSignUpProcess(HttpServletRequest request, @Valid User user, BindingResult br)
	{
		ModelAndView mav = new ModelAndView("signup");
		
		String message = "";
		
		if(ServletFileUpload.isMultipartContent(request))
		{
			try
			{
			List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			String email = data.get(0).getString();
			String password = data.get(1).getString();
			String repassword = data.get(2).getString();
			
			
			//String image = new File(data.get(6).getName()).getName();
			//System.out.println(username + " " +password);
			
			//Creo un objeto de usuerio
			//User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			
			 if(password.equals(repassword))
			{
				//Signup_Model sm = new Signup_Model();
				
				//INSERTAR UN USUARIO EN LA BDDA TIPO SQL
				//message = sm.doSignUp(username, repassword, gender, vehicle, country, image);
				
				//INSERTAR UN USUARIO EN LA BDDA TIPO HQL
				//message=sm.doHibernateSignUp(user);
				//MODELO TIPO DAO
				message = RegisteryDAO.getUserDAO().doHibernateSignUp(user);
				
				//String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
				
				//data.get(6).write(new File(path + File.separator + image));
				
			}
			else
			{
				message = "Password does not match..please try again";
			}
			
			}
			catch(Exception e)
			{
				System.out.println(e);
				message = "Please try again....";
			}
		}
			
		mav.addObject("message", message);
			
		return mav;
	}*/
	
	
	
	@RequestMapping(value="/signup" , method=RequestMethod.POST)
	public String doSignUpProcess(HttpServletRequest request, HttpSession session, Model md, @Valid User user, BindingResult br)
	{
		ModelAndView mav = new ModelAndView("signup");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String message = "";
	
			try{
			//List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			
			String repassword = request.getParameter("repassword");
			
			if(br.getAllErrors().size() > 0) {
				
				System.out.println("Se ha validado");
				
			//Si no hay ningun error me compruebo mi User y password para loguearme 	
				}else {
					
						//Creo un objeto de usuerio
						User user2 = new User();
						user2.setEmail(email);
						
						String passwordSegura = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
						System.out.println(passwordSegura);
						user2.setPassword(passwordSegura);
						
						 if(password.equals(repassword)){
							//Signup_Model sm = new Signup_Model();
							
							//DOY DE ALTA AL USUARIO
							message = RegisteryDAO.getUserDAO().doHibernateSignUp(user2);
							//CREO NOTIFICACION DEL SISTEMA
							String notificacion= RegisteryDAO.getMensajeDAO().crearMensaje("Nuevo usuario: "+email, "Sistema", "Alta Usuario");
							
						//SI LA ALTA ES BUENA VOY A MI PAGINA DE PERFIL Y CARGO MIS DATOS CON EL FORMULARIO PARA COMPLETAR
							/*//RECOJO LA SESION Y LE ASIGNO UN NOMBRE
							session.setAttribute("email", username);
							return "redirect:/myprofile";*/
		
						}
						else{
							message = "Las contraseñas no coinciden";
							md.addAttribute("error_msg", message);
						}
					
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				//return message;
			}
			
		//mav.addObject("message", message);
		md.addAttribute("error_msg", message);
		
		//Si me doy de alta correctamente me redirige a mi PERFIL PARA COMPLETAR MIS DATOS
		if(message.equals("Alta correcta...")) {
			
			//TODO LOGUEAR AL USUARIO DESPUES DE HABER HECHO UNA ALTA CORRECTA PARA PODER REDIRIGIRLO A SU PERFIL
			int usuario = RegisteryDAO.getUserDAO().doHibernateLogin(email, password);
			String mensaje = "";
			
				//HAGO UNA BUSQUEDA DE TODOS LOS PRODUCTOS DE UN USUARIO POR SU ID RECOGIDO ANTES
				List <String> datosUsuario = RegisteryDAO.getUserDAO().getUserDatosEmail(email);
				
				//ASIGNO LA SESION Y TODOS LOS DATOS DEL USUARIO
				session.setAttribute("email", email);
				session.setAttribute("datosUsuario", datosUsuario);
				session.setAttribute("id_usuario", usuario);
			
				//ENVIO EMAIL DE CONFIRMACION DE ALTA
				try {
					EnviarEmail.mandarEmail(email, "Alta nueva", "Se ha dado de alta correctamente en CiclismoReview");
				} catch (Exception e) {
					System.out.println("ERRO AL ENVIAR EMAIL");
				}
					
				
				//return mav = new ModelAndView("myprofile");
				return "redirect:/myprofile";
			
		}else {
			
			return "signup";
		}
		
	}
	

	
	@RequestMapping(value="/dynamic/{message}" , method=RequestMethod.GET)
	public ModelAndView dynamicDemo(@PathVariable("message") String message)
	{
		ModelAndView mav = new ModelAndView("signup");
		System.out.println(message);
		return mav;
	}
}