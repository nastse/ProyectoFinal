package com.demo.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.registery.RegisteryDAO;
import com.demo.pojo.Products;
import com.demo.pojo.User;


//@Controller
//@RequestMapping("/user")
//public class Prueba_Controller {
	
//	@RequestMapping(value="/list")
//    public ModelAndView inicioProducts(@RequestParam(required = false) Integer page) {
//        ModelAndView modelAndView = new ModelAndView("user");
//
//        //List<String> products = RegisteryDAO.productsDAO.getAllProductsNames();
//        
//        //LA PRIMERA VEZ EN CARGAR PAGE ESTA A NULL POR ESO LE ASIGNO UN VALOR PARA QUE NO DE ERROR
//        if(page == null) {
//        	page = 1;
//        }
//        
//       
//        //TODO EN VEZ DE CARGAR TODO Y SABER CUANTAS PAGINAS VOY A TENER, IR CARGANDO PAGINAS MIENTRAS VOY BAJANDO
//        //ASI EVITO HACER 2 CONSULTAS
//       
//        //HAGO UNA CONSULTA PARA SABER EL NUMERO DE PAGINA QUE VA A TENER MI MENU DE PAGINAS
//        List<String> totalproducts = RegisteryDAO.productsDAO.getAllProductsNames();
//        
//        //VOY HACIENDO CONSULTAS DEPENDIENDO DEL NUMERO DE PAGINA QUE HAYA SELECCIONADO
//        //LE RESTO 1 A PAGE PARA QUE AL SELECCIONAR LA PAGINA 1 EL RESULTADO NO SE SALTE LOS 4 PRIMEROS RESULTADOS 
//        //4*1=4 E IRIA A LA SGUIENTE PAGINA SALTANDOSE LOS PRIMEROS RESULTADOS
//        List<String> products = RegisteryDAO.productsDAO.getAllProductsNamesPage(page-1);
//        
//        modelAndView.addObject("allProducts", products);
//        
//        PagedListHolder<String> pagedListHolder = new PagedListHolder<>(totalproducts);
//        pagedListHolder.setPageSize(5);
//        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
//
//        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;
//
//        modelAndView.addObject("page", page);
//        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
//            pagedListHolder.setPage(0);
//            modelAndView.addObject("users", pagedListHolder.getPageList());
//        }
//        else if(page <= pagedListHolder.getPageCount()) {
//            pagedListHolder.setPage(page-1);
//            modelAndView.addObject("users", pagedListHolder.getPageList());
//        }
//
//        return modelAndView;
//    }	


	//ESTA PARTE SE CARGA LA PRIMERA VEZ AL ENTRAR EN LA PAGINA
	@Controller
	@RequestMapping("/user")
	public class Prueba_Controller {
		
		@RequestMapping(value="/list")
	    public ModelAndView inicioProducts() {
	        ModelAndView modelAndView = new ModelAndView("user");

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
	        
	        
	        pagedListHolder.setPageSize(5);
	        //ENVIO EL NUMERO TOTAL DE PAGINAS QUE VA A TENER MI MENU DE PAGINACION
	        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

	        return modelAndView;
	    }
		
		
		//ESTA EL PAGINA QUE DEVUELVO TRAS CONSULTAR EL NUMERO DE PAGINA QUE QUIERO VER
		@RequestMapping(value="/pagina")
	    public ModelAndView paginaProducts(HttpServletRequest request) {
	        ModelAndView modelAndView = new ModelAndView("user");

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
	       
	        pagedListHolder.setPageSize(5);
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

	}

	

