package com.demo.dao.implementation;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.demo.pojo.Products;
import com.demo.pojo.User;

public class HibernateConnection {

	public static SessionFactory sessionFactory;
	
	public static SessionFactory doHibernateConnection() {
		
//		String host = System.getenv("RDS_INSTANCE_HOST");
//		String port = System.getenv("RDS_INSTANCE_PORT");
		
		String host = "root.c9p7jdg748qx.us-east-2.rds.amazonaws.com";
		String port = "3306";
		String userName = "useruS5";
		String password= "kQ0cfsXn";
		
		
		Properties database = new Properties();
		database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		//database.setProperty("hibernate.connection.username", "useruS5");
		//database.setProperty("hibernate.connection.password", "kQ0cfsXn");
		database.setProperty("hibernate.connection.url", "jdbc:mysql://"+host+":"+port+"/innodb?user=" + userName + "&password=" + password);
		database.setProperty("hibernate.connection.dialect", "org.hibernate.dialect.MySQL5Dialect");
		
		//AÑADO LAS CLASES PARA LA CONEXION CON LA BASE DE DATOS
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
