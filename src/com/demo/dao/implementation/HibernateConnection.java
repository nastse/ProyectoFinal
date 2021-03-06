package com.demo.dao.implementation;

import java.util.Properties;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.demo.pojo.Categoria;
import com.demo.pojo.Marca;
import com.demo.pojo.Mensaje;
import com.demo.pojo.Products;
import com.demo.pojo.User;

public class HibernateConnection {

	public static SessionFactory sessionFactory;
	
	static {
		
//		String host = System.getenv("RDS_INSTANCE_HOST");
//		String port = System.getenv("RDS_INSTANCE_PORT");
		
		String host = "nastse-db.c9p7jdg748qx.us-east-2.rds.amazonaws.com";
		String port = "3306";
		String userName = "useruS5";
		String password= "kQ0cfsXn";
		
		
		Properties database = new Properties();
		database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		database.setProperty("hibernate.connection.url", "jdbc:mysql://"+host+":"+port+"/innodb?user=" + userName + "&password=" + password);
		database.setProperty("hibernate.connection.dialect", "org.hibernate.dialect.MySQL5Dialect");
		database.setProperty("org.hibernate.context.spi.CurrentSessionContext", "WebSessionContext");
		
		
		//database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		//database.setProperty("hibernate.connection.username", "root");
		//database.setProperty("hibernate.connection.password", "");
		//database.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/proyecto_sergiu");
		//database.setProperty("hibernate.connection.dialect", "org.hibernate.dialect.MySQL5Dialect");
		
		//A�ADO LAS CLASES PARA LA CONEXION CON LA BASE DE DATOS
		Configuration cfg = new Configuration()
							.setProperties(database)
							.addPackage("com.demo.pojo")
							.addAnnotatedClass(User.class)
							.addAnnotatedClass(Products.class)
							.addAnnotatedClass(Marca.class)
							.addAnnotatedClass(Categoria.class)
							.addAnnotatedClass(Mensaje.class);
		
		StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
		
		sessionFactory = cfg.buildSessionFactory(ssrb.build());
		
		
	}
		public static Session getSession() {
		
			
				
				return sessionFactory.openSession();	
			
			
		}
		
	
	
		private static void addAnnotatedClass(Class<Mensaje> class1) {
			// TODO Auto-generated method stub
			
		}



		public static void closeSession() {
	       sessionFactory.close();
		}

}
