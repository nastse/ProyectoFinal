package com.demo.dao.layer;

import java.util.List;
import java.util.Map;

import com.demo.pojo.Products;

public interface ProductsDAO {

	
	public List<Products> getAllProducts();
	public List<String> getAllProductsNames(String marca, String modelo, String talla, String anio);
	public List<String> getAllProductsNamesPage(int pagina, String marca, String modelo, String talla, String anio);
	public boolean deleteProductById(String id);
	public Products getProductByProductId(String id);
	public List<Products> getProductByUserId(int id);
	public String updateProduct(Products product);
	public String updateProductColumns(Products product);
	public String insertProduct(Products product);
	
	//public List<Products> getProductByUserName(String user);
	
}
