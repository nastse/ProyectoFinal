package com.demo.dao.layer;

import java.util.List;
import java.util.Map;

import com.demo.pojo.Products;

public interface ProductsDAO {

	
	public List<Products> getAllProducts();
	public List<String> getAllProductsNames();
	public boolean deleteProductById(String id);
	public Products getProductByProductId(String id);
	public List<Products> getProductByUserId(int id);
	public String updateProduct(Products product);
	
	//public List<Products> getProductByUserName(String user);
	
}
