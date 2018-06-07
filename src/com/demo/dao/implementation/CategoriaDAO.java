package com.demo.dao.implementation;

import java.util.List;
import org.hibernate.Session;
import com.demo.pojo.Categoria;

public class CategoriaDAO implements com.demo.dao.layer.CategoriaDAO{

	
	
public List<Categoria> getAllCategorias(){
		
		Session session = HibernateConnection.getSession();		
		
		List<Categoria> allCategorias = session.createQuery("From Categoria").list();
		session.close();
		
		return allCategorias;
	}
	
}
