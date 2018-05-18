package com.demo.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
@RequestMapping(value= { "/", "/index"})
public class Index_Controller {
	

	@RequestMapping(value= { "/", "/index"}, method=RequestMethod.GET)
	public ModelAndView loadProducts() {
		
//	//PARA CONSULTA HQL
//		ModelAndView mav = new ModelAndView("index");
//	
//		List<String> datos = RegisteryDAO.productsDAO.getAllProductsNames();
//
//		mav.addObject("allProducts", datos);
//
//		return mav;
		
		
		ModelAndView modelAndView = new ModelAndView("index");

        //HAGO UNA BUSQUEDA PARA SABER EL NUMERO TOTAL DE PRODUCTOS
        List<String> allproducts = RegisteryDAO.productsDAO.getAllProductsNames();
        
        //HAGO OTRA BUSQUEDA CON LA PRIMERA TANDA POR PAGINA (4 POR PAGINA)
        List<String> products = RegisteryDAO.productsDAO.getAllProductsNamesPage(0);
        
        //ENVIO LA TANDA A MOSTRAR
        modelAndView.addObject("allProducts", products);
        
        PagedListHolder<String> pagedListHolder = new PagedListHolder<>(allproducts);
        
        //ENVIO LA PAGINA ACTUAL QUE ES 1 PARA QUE EN EL MENU NO ME SALGA SELECCIONABLE
        String page = "1";
        modelAndView.addObject("page", Integer.parseInt(page));
        
        
        pagedListHolder.setPageSize(4);
        //ENVIO EL NUMERO TOTAL DE PAGINAS QUE VA A TENER MI MENU DE PAGINACION
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        return modelAndView;
		
	}
	
	//ESTA EL PAGINA QUE DEVUELVO TRAS CONSULTAR EL NUMERO DE PAGINA QUE QUIERO VER
	@RequestMapping(value="/pagina")
    public ModelAndView paginaProducts(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("index");

        //List<String> products = RegisteryDAO.productsDAO.getAllProductsNames();
        
        String page = request.getParameter("page");
        
        //LA PRIMERA VEZ EN CARGAR PAGE ESTA A NULL POR ESO LE ASIGNO UN VALOR PARA QUE NO DE ERROR
        if(page == null) {
        	page = "1";
        }
        

        //HAGO UNA CONSULTA PARA SABER EL NUMERO DE PAGINA QUE VA A TENER MI MENU DE PAGINAS
        List<String> totalproducts = RegisteryDAO.productsDAO.getAllProductsNames();
        
        //VOY HACIENDO CONSULTAS DEPENDIENDO DEL NUMERO DE PAGINA QUE HAYA SELECCIONADO
        //LE RESTO 1 A PAGE PARA QUE AL SELECCIONAR LA PAGINA 1 EL RESULTADO NO SE SALTE LOS 4 PRIMEROS RESULTADOS 
        //4*1=4 E IRIA A LA SGUIENTE PAGINA SALTANDOSE LOS PRIMEROS RESULTADOS
        List<String> products = RegisteryDAO.productsDAO.getAllProductsNamesPage(Integer.parseInt(page)-1);
        
        modelAndView.addObject("allProducts", products);
        
        PagedListHolder<String> pagedListHolder = new PagedListHolder<>(totalproducts);
       
        pagedListHolder.setPageSize(4);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || Integer.parseInt(page) < 1 || Integer.parseInt(page) > pagedListHolder.getPageCount())page="1";
        	modelAndView.addObject("page", Integer.parseInt(page));
        
        
        if(page == null || Integer.parseInt(page) < 1 || Integer.parseInt(page) > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
        else if(Integer.parseInt(page) <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(Integer.parseInt(page)-1);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

	
//	@RequestMapping(value= { "/", "/index"}, method=RequestMethod.POST)
//	public String do_login(HttpServletRequest req, Model md, HttpSession session, @Valid User user, BindingResult br) {
//		
//		try {
//			
//			//System.out.println(br.getAllErrors().size());
//			
//			String username= req.getParameter("email");
//			String password= req.getParameter("password");
//			
//			System.out.println("Usuario: " +username + " Pass: " +password);
//			
//			//Si hay algun error de validacion no hago nada
//			if(br.getAllErrors().size() > 0) {
//			
//				System.out.println("Se ha validad por el lado servidor");
//				
//			//Si no hay ningun error me compruebo mi User y password para loguearme 	
//			}else{
//				
//				//MODELO DAO
//				int message = RegisteryDAO.getUserDAO().doHibernateLogin(username, password);
//				
//				if(message != 0) {
//					
//					//RECOJO LA SESION Y LE ASIGNO UN NOMBRE
//					session.setAttribute("email", username);
//					return "redirect:/myprofile";
//					
//				}else {
//					
//					md.addAttribute("error_msg", message);
//					
//				}
//			}
//			
//			return "index";
//			
//		}catch(Exception e){
//			
//			return "index";
//		}
//	}
			
}