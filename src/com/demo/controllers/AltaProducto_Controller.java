package com.demo.controllers;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.dao.implementation.S3FileUploader;
import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Categoria;
import com.demo.pojo.Products;

@Controller
public class AltaProducto_Controller {
	
	@RequestMapping(value="/altaproducto", method=RequestMethod.GET)
	public String load_altaproducto(HttpSession session, ModelMap map) {
		
		
		return "altaproducto";
	}
	
	
	@RequestMapping(value="/altaproducto", method=RequestMethod.POST)
	public String insertar_altaproducto(HttpServletRequest request, HttpSession session, Model md) {
		
		String mensaje="";
		boolean error = false;
		
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
				//String imagen = new File(data.get(0).getName()).getName();
				
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
				}if((Integer)Integer.parseInt(id_usuario) instanceof Integer == false) {
					error = true;
				}
				
				
				//System.out.println("imagen:"+imagen+"categoria:"+categoria+ "marca:"+marca+"talla:"+talla+"peso:"+peso+"altura:"+altura);
				
				//RECOJO TODOS LOS DATOS PARA MANTENERLOS EN EL CASO DE QUE HAYA QUE VALIDAR EL FORMULARIO
					//md.addAttribute("categoria", categoria);

					//RECOJO EL NOMBRE DE LA IMAGEN PARA GUARDARLO EN LA BASE DE DATOS
					//TODO CREAR UN NOMBRE(ID) PARA QUE SEA UNICO Y NO SE SOBREESCRIBAN LAS IMAGENES
					//String imagen = new File(data.get(0).getName()).getName();
					String imagen = "subir.png";
				
					//SI EL USUARIO NO SUBE NINGUNA IMAGEN LE DEJO EL NOMBRE POR DEFECTO
					if(!data.get(0).getName().equals("")) {
						
						String tipoarchivo = data.get(0).getName().toUpperCase();
						
						boolean extension = tipoarchivo.endsWith(".JPG") || tipoarchivo.endsWith(".JPEG") || tipoarchivo.endsWith(".PNG");
						
						//COMPRUEBO LA EXTENSION DEL ARCHIVO 
						   if (!extension) {
						      error=true;
						      md.addAttribute("mensaje_alta", "ERROR LA IMAGEN DEBE SER TIPO JPG/JPEG/PNG");
						   }else {
							   
							   //COMPRUEBO EL TAMAÑAO MAXIMO DEL ARCHIVO 5MB
							   if(data.get(0).getString().length() > 5242880) {
								   
								   error=true;
								   session.setAttribute("mensaje_alta", "ERROR EL TAMAÑO MÁXIMO ES DE 5MB");
								   
							   }else {
								   
								   imagen = UUID.randomUUID().toString()+".jpg";
								   session.removeAttribute("mensaje_alta");
								   
							   } 
						   }
					}
				
				
				if(!error) {

//					String path = request.getSession().getServletContext().getRealPath("/") + "//WEB-INF//images//";
//					data.get(0).write(new File(path + File.separator + imagen));
					
					//SUBO EL ARCHIVO AL S3 DE AMAZON CONFIGURADO EN LA CLASE S3FILEUPLOADER
					S3FileUploader s3 = new S3FileUploader();
			        String result = s3.fileUploader(data, imagen);
					
//						java.util.Date dt = new java.util.Date();
					
					DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					Date date = new Date();
					
					
					product.setImagen(imagen);
					product.setCategoria(categoria);
					product.setMarca(marca);
					product.setModelo(modelo);
					product.setTalla(talla);
					product.setAnio(Integer.parseInt(anio));
					product.setPrecio(Integer.parseInt(precio));
					product.setTallauser(tallauser);
					product.setPeso(Integer.parseInt(peso));
					product.setAltura(Integer.parseInt(altura));
					product.setPecho(Integer.parseInt(pecho));
					product.setCintura(Integer.parseInt(cintura));
					product.setCadera(Integer.parseInt(cadera));
					product.setTemp_min(Integer.parseInt(temp_min));
					product.setTemp_max(Integer.parseInt(temp_max));
					product.setAjuste(Integer.parseInt(ajuste));
					product.setRecomendable(Integer.parseInt(recomendable));
					product.setComentario(comentario);
					product.setCreado(date);
					product.setId_user(Integer.parseInt(id_usuario));
					product.setEstado(1);
					
					
					
					//INSERTO EL PRODUCTO EN LA BASE DE DATOS
					mensaje = RegisteryDAO.productsDAO.insertProduct(product);
					
					//CREO UNA NOTIFICACION EN EL SISTEMA
					String notificacion= RegisteryDAO.getMensajeDAO().crearMensaje("Nueva review creada", "Sistema", "Nueva Review");
					
					
				}else {
					
					System.out.println("HA HABIDO UN ERROR DE DATOS");
				}
					
			}catch(Exception e){
				System.out.println(e);
				//message = "Please try again....";
			}
			
		}
		

		//SI SE HA INSERTADO CORRECTAMENTE VOY A LA PAGINA DE TODOS LOS PRODUCTOS CARGANDOLA DE NUEVO
		if(mensaje.equals("Producto insertado")) {
			
			return "redirect:/myproducts";
			
		}
		//SI NO, VUELVO MANTENIENDO LOS CAMPOS CON LA INFORMACION Y DEVOLVIENDO LOS ERRORES
		else {
						
			return "altaproducto";
			
		}	
	}
}
