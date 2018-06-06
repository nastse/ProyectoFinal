package com.demo.controllers;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
//Clase controladora que devuelve un MAV o un String para redirigir a la pagina
public class Login_Controller {
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	//Recojo el valor de la cookie para ir sumandole valor mas adelante
	public ModelAndView loadloginpage(HttpServletResponse response, @CookieValue(value="hits", defaultValue="0") Long hits) {
		
		ModelAndView mav = new ModelAndView("login");
		System.out.println("Se ha llamado al metodo login");
		
		User user = new User();
		mav.addObject("user", user);
		
		//Incremento el valor de la cookie para despues reasignarla de nuevo
		hits++;
		//Creo una cookie para guardarla en el navegador del cliente
		//para contar las veces que se ha conectado
		Cookie cookie = new Cookie("hits", hits.toString());
		//cookie.setMaxAge(90);
		response.addCookie(cookie);
		
		
		return mav;
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loadloaginpage() {
		
		return "login";
	}*/
	

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String do_login(HttpServletRequest req, Model md, HttpSession session, @Valid User user, BindingResult br) {
		
		try {
			
			//System.out.println(br.getAllErrors().size());
			
			//LO RECOJO DEL PATH QUE ASIGNO EN EL JSP
			String username= req.getParameter("email");
			String password= req.getParameter("password");
				
			//Si hay algun error de validacion no hago nada
			if(br.getAllErrors().size() > 0) {
			
				System.out.println("Se ha validado por el lado servidor");
				
			//Si no hay ningun error me compruebo mi User y password para loguearme 	
			}else {
				
				//Login_Model lm = new Login_Model();
				//LOGUE USANDO CONSULTA HQL
				//String message = lm.doHibernateLogin(username, password);
				String passwordSegura = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
				
				
				//MODELO DAO
				List<User> usuario = RegisteryDAO.getUserDAO().doHibernateLogin(username, passwordSegura);
				String mensaje = "";
				
				
				
				//HAGO UNA BUSQUEDA DE TODOS LOS PRODUCTOS DE UN USUARIO POR SU ID RECOGIDO ANTES
				//TODO EN VEZ DE RECOGER AQUI LOS PRODUCTOS Y PASARLOS LOS RECOJO EN EL GET DE MYPRODUCTS
				//List <Products> reviews = RegisteryDAO.getProductsDAO().getProductByUserId(usuario);
				//RECOJO DATOS DEL USUARIO
				
 				//SI ME DEVUELVE ALGUN USUARIO HAGO 
				if(usuario !=null) {
					
					//TODO ESTO SOBRA? LO USO PARA CARGAR LA IMAGEN DEL PERFIL EN EL HEADER. NO FUNCION PASANDOLE USUARIO.GET.IMAGEN//ERROR AL PARSEAR EN JSTL
					List <String> datos = RegisteryDAO.getUserDAO().getUserDatos(String.valueOf(usuario));
					
					//A�ADO A LA SESION EL NOMBRE/EMAIL DEL USUARIO
					System.out.println("ID USUARIO RECOLIGO EN LOGIN_CONTROLLER: "+ usuario);	
					
					//RECOJO LA SESION Y LE ASIGNO UN NOMBRE LO PASO AL JSP PARA MOSTRAR
						session.setAttribute("email", usuario.get(0).getEmail());
						session.setAttribute("datos", datos);
						session.setAttribute("id_usuario", usuario.get(0).getId_usuario());
						session.setAttribute("tipoUsuario", usuario.get(0).getTipo_usuario());
						
						if(usuario.get(0).getTipo_usuario()==3) {
							//TODO USUARIO ES ADMIN IMPLEMENTAR CODIGO BACK OFFICE
							//TODO HAGO UN COUNT DE USUARIOS Y HAGO UN COUNT DE REVIEWS PARA MOSTRAR AL ADMINISTRADOR
							//TODO OPCION DE HABILITAR/DESHABILITAR NOTIFICACIONES INTERNAS
						}
						
					//A�ADO A LA SESION LA LISTA DE LOS PRODUCTOS DE ESTE USUARIO
					//session.setAttribute("id", reviews);
			
					
					return "redirect:/myprofile";
					
				}else {
					
					mensaje = "Login incorrecto!";
					md.addAttribute("error_msg", mensaje);
				}
	
			}

			return "login";
			
		}catch(Exception e){
			
			return "login";
		}
	}
	

}
