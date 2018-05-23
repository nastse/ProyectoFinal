package com.demo.controllers;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
	public ModelAndView update_producto(@PathVariable(value="id") String id, HttpSession session) {

		ModelAndView mav = new ModelAndView("upproducto");
		System.out.println("Id Producto: " +id);

		Products producto = new Products();
		producto = RegisteryDAO.getProductsDAO().getProductByProductId(id);
		
		
		if(session.getAttribute("id_usuario")==null) {
			
			mav = new ModelAndView("error"); 
			return mav;
			
		}else {
			
			int usuario = (int) session.getAttribute("id_usuario");
			System.out.println("Id Usuario que accede: " +usuario);
			
			//SI EL PRODUCTO NO EXISTE REDIRIGO A PAGINA DE ERROR
			//SI EL USUARIO QUE INTENTA ACTUALIZAR LA REVIEW NO ES EL MISMO QUE LA HA CREADO: ERRO
			if(producto == null || producto.getId_user()!=usuario ) {
				
				mav = new ModelAndView("error"); 
				return mav;
			}
			
			//PASO EL PRODUCTO PARA CARGAR VALORES EN JSP
			mav.addObject("product", producto);
			
			//PASO VALORES PARA RECOGERLOS EN EL POST
			session.setAttribute("id_rev", producto.getId_rev());
			session.setAttribute("imagen", producto.getImagen());
			
			return mav;
				
		}	
	}
	

	@RequestMapping(name="/upproducto", method=RequestMethod.POST)
	public String vista_productoUpdate(HttpServletRequest request, Model md, HttpSession session, @Valid Products product, BindingResult br) {
	
//		//TODO RECOJO LOS VALORES Y LOS ACTUALIZO EN LA BDDA REVIEW
//		String id = request.getParameter("id");
//		//String id_user = request.getParameter("id_user");
//		String categoria = request.getParameter("categoria");
//		String marca = request.getParameter("marca");
//		String talla = request.getParameter("talla");
//		String peso = request.getParameter("peso");
//		String altura = request.getParameter("altura");
//		String temp_max = request.getParameter("temp_max");
//		String temp_min = request.getParameter("temp_min");
//		String imagen = request.getParameter("imagen");
//		String ajuste = request.getParameter("ajuste");
//		//String creado = request.getParameter("creado");
//		
//		//PARSEO CREADO A FORMATO FECHA 
//		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
////		Date date = null;
////		try {
////			date = format.parse(creado);
////		} catch (ParseException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
//		
//		
//		String estado = request.getParameter("estado");
//		
//		Products producto = new Products();
//		producto.setId_rev(Integer.parseInt(id));
//		//producto.setId_user(Integer.parseInt(id_user));
//		producto.setCategoria(categoria);
//		producto.setMarca(marca);
//		producto.setTalla(talla);
//		producto.setPeso(Integer.parseInt(peso));
//		producto.setAltura(Integer.parseInt(altura));
//		producto.setTemp_max(Integer.parseInt(temp_max));
//		producto.setTemp_min(Integer.parseInt(temp_min));
//		producto.setImagen(imagen);
//		producto.setAjuste(Integer.parseInt(ajuste));
//		//producto.setCreado(date);
//		producto.setEstado(Integer.parseInt(estado));
//		
//		if(br.getAllErrors().size() > 0) {
//			
//			System.out.println("Se ha validado la actualizacion"+ br.toString());
//			
//			return "redirect:/upproducto/"+Integer.parseInt(id);
//			
//		}else {
//			
//			String mensaje=RegisteryDAO.productsDAO.updateProduct(producto);	
//			System.out.println(mensaje);
//			
//			return "myprofile";
//			
//		}
//		
//		//TODO AQUI REDIRIJO A LA VISTA DEL PRODUCTO?
//		//TODO AQUE REDIRIJO A LA VISTA DEL PERFIL CON TODOS LOS PRODUCTOS?
//		//ModelAndView mav = new ModelAndView("upproducto/"+id);
//		//TODO Usar la ID recibida para hacer busqueda de producto y cargar vista.jsp con el
		
		//NECESITO ID_REV PARA SABER QUE REVIEW TENGO QUE ALCTUALIZAR
		int id_rev=(int) session.getAttribute("id_rev");
		
		Products product1 = new Products();
		boolean error=false;
		
		if(ServletFileUpload.isMultipartContent(request))
		{
			try
			{
				
				//RECOJO TODA LA LISTA DEL FORMULARIO
				List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

				//DATOS USUARIO
				String tallauser = data.get(1).getString();
				String peso = data.get(2).getString();
				String altura = data.get(3).getString();
				String pecho = data.get(4).getString();
				String cintura = data.get(5).getString();
				String cadera = data.get(6).getString();
				
				//DATOS PRENDA
				String categoria = data.get(7).getString();
				String marca = data.get(8).getString();
				String modelo = data.get(9).getString();
				String talla = data.get(10).getString();
				String anio = data.get(11).getString();
				String precio = data.get(12).getString();
				
				//VALORACION PRENDA
				String temp_min = data.get(13).getString();
				String temp_max = data.get(14).getString();
				String ajuste = data.get(15).getString();
				String recomendable = data.get(16).getString();
				String comentario = data.get(17).getString();
				
				
				
				//COMPRUEBO QUE TODOS LOS DATOS VIENEN EN FORMATO INTEGER(NUMERO)
				if((Integer)Integer.parseInt(anio) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(precio) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(peso) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(altura) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(pecho) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(cintura) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(cadera) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(temp_min) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(temp_min) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(ajuste) instanceof Integer == false) {
					error = true;
				}if((Integer)Integer.parseInt(recomendable) instanceof Integer == false) {
					error = true;
				}
				
				
				//RECOJO EL NOMBRE DE LA IMAGEN PARA GUARDARLO EN LA BASE DE DATOS
				//TODO CREAR UN NOMBRE(ID) PARA QUE SEA UNICO Y NO SE SOBREESCRIBAN LAS IMAGENES
				//String imagen = new File(data.get(0).getName()).getName();
				String imagen = "";
			
				//TODO
			//RECOJO TODOS LOS DATOS PARA MANTENERLOS EN EL CASO DE QUE HAYA QUE VALIDAR EL FORMULARIO
				//md.addAttribute("categoria", categoria);

				//SI SE HA SUBIDO UNA IMAGEN NUEVA LA AGREGO A LA BASE DE DATOS Y AL DIRECTORIO
				if(!data.get(0).getName().equals("")) {
					
					String tipoarchivo = data.get(0).getName().toUpperCase();
					boolean extension = tipoarchivo.endsWith(".JPG") || tipoarchivo.endsWith(".JPEG") || tipoarchivo.endsWith(".PNG");
					
					
					if (!extension) {
					      error=true;
					      md.addAttribute("mensaje_alta", "ERROR LA IMAGEN DEBE SER TIPO JPG/JPEG/PNG");
					   }else {
						   
						   imagen = UUID.randomUUID().toString()+".jpg";
						   
						   String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
						   data.get(0).write(new File(path + File.separator + imagen));   
					   }
					
				}else {
					
					//RECOJO Y MANTENGO EL NOMBRE DE LA IMAGEN ORIGINAL YA QUE NO SE HA CARGADO IMAGEN NUEVA
					imagen=((String)session.getAttribute("imagen"));
				}
				
				
				if(!error) {
					
					
					product1.setImagen(imagen);
				
					product1.setCategoria(categoria);
					product1.setMarca(marca);
					product1.setModelo(modelo);
					product1.setTalla(talla);
					product1.setAnio(Integer.parseInt(anio));
					product1.setPrecio(Integer.parseInt(precio));
					product1.setTallauser(tallauser);
					product1.setPeso(Integer.parseInt(peso));
					product1.setAltura(Integer.parseInt(altura));
					product1.setPecho(Integer.parseInt(pecho));
					product1.setCintura(Integer.parseInt(cintura));
					product1.setCadera(Integer.parseInt(cadera));
					product1.setTemp_min(Integer.parseInt(temp_min));
					product1.setTemp_max(Integer.parseInt(temp_max));
					product1.setAjuste(Integer.parseInt(ajuste));
					product1.setRecomendable(Integer.parseInt(recomendable));
					product1.setComentario(comentario);
					
					product1.setId_rev(id_rev);
					
					System.out.println("product dev:" + id_rev + categoria + marca+ modelo);
				
				}	
				
			}catch(Exception e){
				System.out.println(e);
				//message = "Please try again....";
			}
			
		}
		
		if(br.getAllErrors().size() > 0 || error) {
			
			System.out.println("Se ha validado la actualizacion"+ br.toString());
			
			return "redirect:/upproducto/"+id_rev;
			
		}else {
			
			String mensaje=RegisteryDAO.productsDAO.updateProductColumns(product1);	
			System.out.println(mensaje);
			
			return "redirect:/myproducts";
			
		}		
	}
}	
	
	