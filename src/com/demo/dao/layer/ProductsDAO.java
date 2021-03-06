package com.demo.dao.layer;

import java.util.List;
import java.util.Map;

import com.demo.pojo.Products;

public interface ProductsDAO {

	
	public List<Products> getAllProducts();
	public List<String> getAllProductsNames(String marca, String modelo, String talla, String anio, String tallauser, String peso, String altura, String cintura, String pecho, String cadera, String genero);
	public List<String> getAllProductsNamesPage(int pagina, String marca, String modelo, String talla, String anio, String tallauser, String peso, String altura, String cintura, String pecho, String cadera, String genero);
	public boolean deleteProductById(String id, String usuario_id);
	public Products getProductByProductId(String id);
	public List<Products> getProductByUserId(int id);
	public String updateProduct(Products product);
	public String updateProductColumns(Products product);
	public String insertProduct(Products product);
	
	//public List<Products> getProductByUserName(String user);
	
}
