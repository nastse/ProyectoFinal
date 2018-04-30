package com.demo.dao.implementation;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.demo.dao.implementation.HibernateConnection;
import com.demo.pojo.User;

public class UserDAO implements com.demo.dao.layer.UserDAO{
	
	//USANDO HQL
	//DEVUELVO UN INT PARA RECOGER EL ID DEL USUARIO Y HACER LA CONSULTA
		public int doHibernateLogin(String username, String password) {
			
			try {
				
				SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				Session session = sessionFactory.openSession();
				
				session.beginTransaction();
				
				//Consulta HLO
				List<User> user = session.createQuery("From User where email='"+username+"'and password='"+password+"'").list();
				
				//Cerramos la sesion
				session.close();
				
				if(user.size()==1) return user.get(0).getId_usuario();
				
				else return 0;
				
				
			}catch(Exception e) {
				return 0;
			}
			
		}
		
		//INSERTAR EN LA BASE DE DATOS CON HIBERNATE
		public String doHibernateSignUp(User user) {
			
			List<String> userComprobar = getUserDatos(user.getEmail());
			
			if(userComprobar.size()==1) {

				return "El usuario ya existe";
				
			}else {
				
					try {
						
						Session session = HibernateConnection.doHibernateConnection().openSession();
						session.beginTransaction();
						//LE ASIGNO VALORES POR DEFECTO AL CREAR EL USUARIO
						user.setImagen("imagen.png");
						user.setTipo_usuario(1);
						user.setEstado(1);
						java.util.Date dt = new java.util.Date();
						user.setCreado(dt);	
						

					//SI DA ERROR ES POR QUE EL USUARIO YA EXISTE
						session.save(user);
						
					//PARA HACER UN UPDATE
						//session.update(user);
						
					//PARA UNA LISTA CON VARIAS FILAS A INSERTAR
						//List<User> user1 = null;
						//session.save(user1);
						
					//PARA ACTUALIZAR UNA FILA SI ESTA EXISTE O INSERTARLA SI NO EXISTE
					//COMPRUEBA SOLO LA PRIMARY KEY Y SI EXISTE LA ACTUALIZA EN VEZ DE AÑADIR UNA NUEVA	
						//session.saveOrUpdate(user);
						
					//PARA HACER UN DELETE
						//session.delete(user);
						
					//IMPORTANTE AÑADIR PARA INSERTAR DATOS EN LA BASE DE DATOS
						session.getTransaction().commit();
						session.close();
						
						return "Alta correcta...";
						
					}catch(Exception e) {
						
						e.printStackTrace();
						return "El usuario ya existe...";
					}
			}
		}
		
		public String getUserName(int id_user) {
			
			String usuario = "";
			
			SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			//Consulta HLO
			List<User> user = session.createQuery("From User where id_usuario='"+id_user+"'").list();
			
			if(user.size()==1) {			
				usuario = user.get(0).getNombre();	
			}
			
			//Cerramos la sesion
			session.close();

			return usuario;
		}
		
		public List<String> getUserDatos(String email) {
			
			SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			List<String> datos = session.createQuery("From User where email='"+email+"'").list();
			
			session.close();
			
			return datos;
		}
		

}
