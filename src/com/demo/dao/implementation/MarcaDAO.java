package com.demo.dao.implementation;

import java.util.List;

import org.hibernate.Session;

import com.demo.pojo.Marca;


public class MarcaDAO implements com.demo.dao.layer.MarcaDAO{

	
	public List<Marca> getAllMarcas(){
		
		Session session = HibernateConnection.getSession();		
		
		List<Marca> allMarcas = session.createQuery("From Marca").list();
		session.close();
		
		return allMarcas;
	}
}
