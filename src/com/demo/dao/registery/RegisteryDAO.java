package com.demo.dao.registery;

import com.demo.dao.implementation.ProductsDAO;
import com.demo.dao.implementation.UserDAO;
import com.demo.dao.implementation.CategoriaDAO;
import com.demo.dao.implementation.MarcaDAO;
import com.demo.dao.implementation.MensajeDAO;

public class RegisteryDAO {
	
	//DECLARO TODAS LAS INTERFACES
	public static com.demo.dao.layer.ProductsDAO productsDAO;
	public static com.demo.dao.layer.UserDAO userDAO;
	public static com.demo.dao.layer.MensajeDAO mensajeDAO;
	public static com.demo.dao.layer.MarcaDAO marcaDAO;
	public static com.demo.dao.layer.CategoriaDAO categoriaDAO;
	
	
	static {
		//IMPLEMENTACION CLASS
		//CREAMOS UN OBJETO 
		productsDAO = new ProductsDAO();
		userDAO = new UserDAO();
		mensajeDAO = new MensajeDAO();
		marcaDAO = new MarcaDAO();
		categoriaDAO = new CategoriaDAO();
	}

	public static com.demo.dao.layer.ProductsDAO getProductsDAO() {
		return productsDAO;
	}

	public static void setProductsDAO(com.demo.dao.layer.ProductsDAO productsDAO) {
		RegisteryDAO.productsDAO = productsDAO;
	}

	
	
	public static com.demo.dao.layer.UserDAO getUserDAO() {
		return userDAO;
	}
	
	public static void setUserDAO(com.demo.dao.layer.UserDAO userDAO) {
		RegisteryDAO.userDAO = userDAO;
	}
	
	
	public static com.demo.dao.layer.MensajeDAO getMensajeDAO() {
		return mensajeDAO;
	}
	
	public static void setMensajeDAO(com.demo.dao.layer.MensajeDAO mensajeDAO) {
		RegisteryDAO.mensajeDAO = mensajeDAO;
	}
	
	public static com.demo.dao.layer.MarcaDAO getMarcaDAO() {
		return marcaDAO;
	}
	
	public static void setMarcaDAO(com.demo.dao.layer.MarcaDAO marcaDAO) {
		RegisteryDAO.marcaDAO = marcaDAO;
	}
	
	public static com.demo.dao.layer.CategoriaDAO getCategoriaDAO() {
		return categoriaDAO;
	}
	
	public static void setCategoriaDAO(com.demo.dao.layer.CategoriaDAO categoriaDAO) {
		RegisteryDAO.categoriaDAO = categoriaDAO;
	}
}
