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
import com.demo.pojo.Categoria;
import com.demo.pojo.Marca;
import com.demo.pojo.Products;
import com.demo.pojo.User;

@Controller
@RequestMapping(value= { "/", "/index"})
public class Index_Controller {
	

	@RequestMapping(value= { "/", "/index"}, method=RequestMethod.GET)
	public ModelAndView loadProducts(HttpSession session) {
		
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
        List<String> allproducts = RegisteryDAO.productsDAO.getAllProductsNames("Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos");
        
        //HAGO OTRA BUSQUEDA CON LA PRIMERA TANDA POR PAGINA (4 POR PAGINA)
        List<String> products = RegisteryDAO.productsDAO.getAllProductsNamesPage(0, "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos", "Todos");
        //ENVIO LA TANDA A MOSTRAR
        modelAndView.addObject("allProducts", products);
        
        //LISTA CON TODOS LAS REVIEWS
        List<User> listaUsuario = RegisteryDAO.getUserDAO().totalUsuario();
        session.setAttribute("listaUsuario", listaUsuario);
        
        try {
        	//HAGO BUSQUEDA PARA RECOGER LAS MARCAS DISPONIBLES EN LA BDDA
            List<Marca> allMarcas = RegisteryDAO.marcaDAO.getAllMarcas();
            //modelAndView.addObject("allMarcas", allMarcas);
            session.setAttribute("allMarcas", allMarcas);
            
          //HAGO BUSQUEDA PARA RECOGER LAS CATEGORIAS DISPONIBLES EN LA BDDA
            List<Categoria> allCategorias = RegisteryDAO.categoriaDAO.getAllCategorias();
            //modelAndView.addObject("allMarcas", allMarcas);
            session.setAttribute("allCategorias", allCategorias);
        	
	        //HAGO BUSQUEDA PARA RELLENAR EL RANKING
	       List<Object[]> reviews = RegisteryDAO.getUserDAO().rankingReviews();
	       //modelAndView.addObject("reviews", reviews);
	       session.setAttribute("reviews", reviews);
	       
	     //HAGO BUSQUEDA PARA RELLENAR EL RANKING
	       List<Object[]> gastado = RegisteryDAO.getUserDAO().rankingGastado();
	       //modelAndView.addObject("gastado", gastado);
	       session.setAttribute("gastado", gastado);
	       
		} catch (Exception e) {
			System.out.println("Error al cargar ranking");
		}
       
//       for(Object[] total : ranking) {
//			System.out.println((long)total[0]);
//			System.out.println((long)total[1]);	
//			System.out.println(total[2]);	
//		}
//        
       
        
        PagedListHolder<String> pagedListHolder = new PagedListHolder<String>(allproducts);
        
        //ENVIO LA PAGINA ACTUAL QUE ES 1 PARA QUE EN EL MENU NO ME SALGA SELECCIONABLE
        String page = "1";
        modelAndView.addObject("page", Integer.parseInt(page));
        
        
        pagedListHolder.setPageSize(6);
        //ENVIO EL NUMERO TOTAL DE PAGINAS QUE VA A TENER MI MENU DE PAGINACION
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        return modelAndView;
		
	}
	
	//ESTA EL PAGINA QUE DEVUELVO TRAS CONSULTAR EL NUMERO DE PAGINA QUE QUIERO VER
	@RequestMapping(value="/pagina")
    public ModelAndView paginaProducts(HttpServletRequest request) {
        
		ModelAndView modelAndView = new ModelAndView("index");
        
        String page = request.getParameter("page");
        //RECOJO TODOS LOS VALORES DEL MENU DE BUSQUEDA PARA HACER LA QUERY Y PARA REENVIARLOS A LA PAGINA
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String talla = request.getParameter("talla");
        String anio = request.getParameter("anio");
        String tallauser = request.getParameter("tallauser");
        String peso = request.getParameter("peso");
        String altura = request.getParameter("altura");
        String cintura = request.getParameter("cintura");
        String pecho = request.getParameter("pecho");
        String cadera = request.getParameter("cadera");
        String genero = request.getParameter("genero");
        
        
        System.out.println(page+marca+modelo+talla+anio+tallauser+peso+altura+cintura+pecho+cadera+genero);
        
        //LA PRIMERA VEZ EN CARGAR PAGE ESTA A NULL POR ESO LE ASIGNO UN VALOR PARA QUE NO DE ERROR
        if(page == null) {
        	page = "1";
        }
        
        
        //HAGO UNA CONSULTA PARA SABER EL NUMERO DE PAGINA QUE VA A TENER MI MENU DE PAGINAS
        List<String> totalproducts = RegisteryDAO.productsDAO.getAllProductsNames(marca, modelo, talla, anio, tallauser, peso, altura, cintura, pecho, cadera, genero);
        
        //VOY HACIENDO CONSULTAS DEPENDIENDO DEL NUMERO DE PAGINA QUE HAYA SELECCIONADO
        //LE RESTO 1 A PAGE PARA QUE AL SELECCIONAR LA PAGINA 1 EL RESULTADO NO SE SALTE LOS 4 PRIMEROS RESULTADOS 
        //4*1=4 E IRIA A LA SGUIENTE PAGINA SALTANDOSE LOS PRIMEROS RESULTADOS
        List<String> products = RegisteryDAO.productsDAO.getAllProductsNamesPage(Integer.parseInt(page)-1, marca, modelo, talla, anio, tallauser, peso, altura, cintura, pecho, cadera, genero);
        
        //ENVIO EL PRODUCTO RESULTADO DE LA BUSQUEDA Y MANTENGO LOS CAMPOS SELECCIONADOS
        modelAndView.addObject("allProducts", products);
        modelAndView.addObject("marca", marca);
        modelAndView.addObject("modelo", modelo);
        modelAndView.addObject("talla", talla);
        modelAndView.addObject("anio", anio);
        modelAndView.addObject("tallauser", tallauser);
        modelAndView.addObject("peso", peso);
        modelAndView.addObject("altura", altura);
        modelAndView.addObject("cintura", cintura);
        modelAndView.addObject("pecho", pecho);
        modelAndView.addObject("cadera", cadera);
        modelAndView.addObject("genero", genero);
        
        PagedListHolder<String> pagedListHolder = new PagedListHolder<String>(totalproducts);
       
        pagedListHolder.setPageSize(6);
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