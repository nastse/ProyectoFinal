package com.demo.dao.implementation;

import java.util.Properties;

import org.apache.tomcat.util.digester.SetPropertiesRule;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.demo.pojo.Products;
import com.demo.pojo.User;

public class HibernateConnection {

	public static SessionFactory sessionFactory;
	
	public static SessionFactory doHibernateConnection() {
		
		Properties database = new Properties();
		database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		database.setProperty("hibernate.connection.username", "root");
		database.setProperty("hibernate.connection.password", "");
		database.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/proyecto_sergiu");
		database.setProperty("hibernate.connection.dialect", "org.hibernate.dialect.MySQL5Dialect");
		
		//A�ADO LAS CLASES PARA LA CONEXION CON LA BASE DE DATOS
		Configuration cfg = new Configuration()
							.setProperties(database)
							.addPackage("com.demo.pojo")
							.addAnnotatedClass(User.class)
							.addAnnotatedClass(Products.class);
		
		StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
		
		sessionFactory = cfg.buildSessionFactory(ssrb.build());
		
		return sessionFactory;
	}

}
