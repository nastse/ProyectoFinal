package com.demo.dao.implementation;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.demo.dao.implementation.HibernateConnection;
import com.demo.pojo.User;

public class UserDAO implements com.demo.dao.layer.UserDAO{
	
	//USANDO HQL
	//DEVUELVO UN INT PARA RECOGER EL ID DEL USUARIO Y HACER LA CONSULTA
		public List<User> doHibernateLogin(String username, String password) {
			
			try {
				
				//Session session = HibernateConnection.doHibernateConnection().openSession();
				Session session = HibernateConnection.getSession();	
				
				session.beginTransaction();
				
				//Consulta HLO
				List<User> user = session.createQuery("From User where email='"+username+"'and password='"+password+"'").list();
				
				//Cerramos la sesion
				session.close();
				

				if(user.size()>=1) return user;
				
				else return null;
				
				
			}catch(Exception e) {
				return null;
			}
			
		}
		
		//ELIMINO UN USUARIO PASANDOLE SU ID Y ASIGNO SUS REVIEWS 
			//PRIMERO HAGO UN UPDATE Y LUEGO UN DELETE
		public int doHibernateDeleteUser(int usuario_id) {
			
			try {
				
				Session session = HibernateConnection.getSession();	
				
				//LE PASO LAS REVIEWS AL USUARIO ADMIN
				session.beginTransaction();
				String hqlUpdate ="update Products p set p.id_user =:newIduser "	
						+ "where p.id_user =:oldIduser";
			
				//ELIMINO EL USUARIO DEFINITIVAMENTE 
				int updatedEntities = session.createQuery(hqlUpdate)
						.setInteger("newIduser", 1)
						.setInteger("oldIduser", usuario_id)
						.executeUpdate();
				session.getTransaction().commit();
				
				
				session.beginTransaction();
				session.createQuery("delete User where id_usuario='"+usuario_id+"'").executeUpdate();
				session.getTransaction().commit();
				
				//Cerramos la sesion
				session.close();
					
				return 1;
				
			}catch(Exception e) {
				return 0;
			}
			
		}
		
		//HAGO UN CAMBIO DE CONTRASEÑA
			//PRIMERO HAGO UN UPDATE Y LUEGO UN DELETE
		public int doHibernateUpdatePassword(int usuario_id, String newpassword) {
			
			try {
				
				Session session = HibernateConnection.getSession();	
				
				//UPDATE DEL CAMPO PASSWORD BUSCADO POR ID_USUARIO
				session.beginTransaction();
				String hqlUpdate ="update User u set u.password =:newPassword "	
						+ "where u.id_usuario =:newIduser";
			
				//HAGO UN CAMBIO DE CONTRASEÑA
				int updatedEntities = session.createQuery(hqlUpdate)
						.setString("newPassword", newpassword)
						.setInteger("newIduser", usuario_id)
						.executeUpdate();
				session.getTransaction().commit();
				
				//Cerramos la sesion
				session.close();
					
				return 1;
				
			}catch(Exception e) {
				return 0;
			}
			
		}
		
		//HAGO UN CAMBIO DE CONTRASEÑA
		//PRIMERO HAGO UN UPDATE Y LUEGO UN DELETE
		public int updateToken(String usuario_id) {
		
		try {
			
			Session session = HibernateConnection.getSession();	
			
			//UPDATE DEL CAMPO PASSWORD BUSCADO POR ID_USUARIO
			session.beginTransaction();
			String hqlUpdate ="update User u set u.tokenID =:newTokenID "	
					+ "where u.id_usuario =:oldTokenID";
		
			String nuevoTokenID= UUID.randomUUID().toString();
			
			//HAGO UN CAMBIO DE CONTRASEÑA
			int updatedEntities = session.createQuery(hqlUpdate)
					.setString("newTokenID", nuevoTokenID)
					.setString("oldTokenID", usuario_id)
					.executeUpdate();
			session.getTransaction().commit();
			
			//Cerramos la sesion
			session.close();
				
			return 1;
			
		}catch(Exception e) {
			return 0;
		}
		
	}
		
		//INSERTAR EN LA BASE DE DATOS CON HIBERNATE
		public String doHibernateSignUp(User user) {
			
			List<String> userComprobar = getUserDatosEmail(user.getEmail());
			
			if(userComprobar.size()>=1) {

				return "El usuario ya existe";
				
			}else {
				
					try {
						
						//Session session = HibernateConnection.doHibernateConnection().openSession();
						Session session = HibernateConnection.getSession();	
						
						session.beginTransaction();
						//LE ASIGNO VALORES POR DEFECTO AL CREAR EL USUARIO
						user.setImagen("imagen.png");
						user.setGenero("Hombre");
						user.setNombre(user.getEmail().toString());
						user.setTipo_usuario(1);
						user.setEstado(1);
						user.setTokenID(UUID.randomUUID().toString());
							
							Date date = new Date();
						user.setCreado(date);	
						

					//SI DA ERROR ES POR QUE EL USUARIO YA EXISTE
						session.save(user);
						
					//PARA HACER UN UPDATE
						//session.update(user);
						
					//PARA UNA LISTA CON VARIAS FILAS A INSERTAR
						//List<User> user1 = null;
						//session.save(user1);
						
					//PARA ACTUALIZAR UNA FILA SI ESTA EXISTE O INSERTARLA SI NO EXISTE
					//COMPRUEBA SOLO LA PRIMARY KEY Y SI EXISTE LA ACTUALIZA EN VEZ DE A�ADIR UNA NUEVA	
						//session.saveOrUpdate(user);
						
					//PARA HACER UN DELETE
						//session.delete(user);
						
					//IMPORTANTE A�ADIR PARA INSERTAR DATOS EN LA BASE DE DATOS
						session.getTransaction().commit();
						
						session.close();
						
						
						return "Alta correcta...";
						
					}catch(Exception e) {
						
						e.printStackTrace();
						return "El usuario ya existe...";
					}
			}
		}
		
		
		//ACTUALIZAR EN LA BASE DE DATOS CON HIBERNATE
				public String doHibernateUpdateUser(String nombre, int peso, int altura, int edad, String genero, String imagen, int id) {
					
							try {
								
								//Session session = HibernateConnection.doHibernateConnection().openSession();
								Session session = HibernateConnection.getSession();	
								
								session.beginTransaction();
								//PARA HACER UN UPDATE DE COLUMNAS EN CONCRETO
								String hqlUpdate ="update User u set u.nombre=:newName, "
										+ "u.peso = :newPeso, "
										+ "u.altura = :newAltura, "
										+ "u.edad = :newEdad, "
										+ "u.genero = :newGenero, "
										+ "u.imagen = :newImagen "
										+ "where u.id_usuario = '"+id+"'";
							
								int updatedEntities = session.createQuery(hqlUpdate)
										.setString("newName", nombre)
										.setInteger("newPeso", peso)
										.setInteger("newAltura", altura)
										.setInteger("newEdad", edad)
										.setString("newGenero", genero)
										.setString("newImagen", imagen)
										.executeUpdate();
							//IMPORTANTE AÑADIR PARA INSERTAR DATOS EN LA BASE DE DATOS
								session.getTransaction().commit();
								session.close();
								//HibernateConnection.closeSession();
								
								return "Actualizacion correcta...";
								
							}catch(Exception e) {
								
								e.printStackTrace();
								return "El usuario ya existe...";
							}
					}
				
		
		public String getUserName(int id_user) {
			
			String usuario = "";
			
			//Session session = HibernateConnection.doHibernateConnection().openSession();
			Session session = HibernateConnection.getSession();	
			
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
		
		public List<String> getUserDatos(String id_usuario) {
			
			//Session session = HibernateConnection.doHibernateConnection().openSession();
			Session session = HibernateConnection.getSession();	
			
			//Session session = sessionFactory.openSession();
			session.beginTransaction();
			System.out.println("ID USUARIO RECIBIDO EN getUserDatos: " +id_usuario);
			List<String> datos = session.createQuery("From User where id_usuario='"+id_usuario+"'").list();
			
			session.close();
			
			return datos;
		}
		
		public List<String> getUserDatosEmail(String email) {
			
			//Session session = HibernateConnection.doHibernateConnection().openSession();
			Session session = HibernateConnection.getSession();	
			
			//Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			List<String> datos = session.createQuery("From User where email='"+email+"'").list();
			
			session.close();
			
			return datos;
		}
		
		//HAGO UNA BUSQUEDA PARA SABER SI EL EMAIL DEL QUE SE QUIERE RECUPERAR LA CONTRASEÑA EXISTE Y DEVUELVO SU TOKENID
		public String comprobarEmail(String email) {
			
			try {
				
				//Session session = HibernateConnection.doHibernateConnection().openSession();
				Session session = HibernateConnection.getSession();	
				
				session.beginTransaction();
				
				//Consulta HLO
				List<User> user = session.createQuery("From User tokenID where email='"+email+"'").list();
				
				//Cerramos la sesion
				session.close();
				
				//SI EXISE EL EMAIL/USUARIO DEVUELVO UN 1
				if(user.size()== 1) return user.get(0).getTokenID();
				
				else return "0";
				
				
			}catch(Exception e) {
				return "0";
			}
			
		}
		
		
		//HAGO UNA BUSQUEDA PARA SABER SI EL TOKEN ES VERDADERO Y DEVUELVO EL USUARIO
		public List<User> comprobarTokenID(String tokenID) {
			
			try {
				
				//Session session = HibernateConnection.doHibernateConnection().openSession();
				Session session = HibernateConnection.getSession();	
				
				session.beginTransaction();
				
				//Consulta HLO
				List<User> user = session.createQuery("From User where tokenID='"+tokenID+"'").list();
				
				//Cerramos la sesion
				session.close();
				
				//SI EXISE EL EMAIL/USUARIO DEVUELVO UN 1
				if(user.size()== 1) return user;
				
				else return null;
				
				
			}catch(Exception e) {
				return null;
			}
			
		}
		
		//CUENTO EL NUMERO DE REVIEWS QUE HA HECHO UN USUARIO
		public List<Object[]> contarReviews(String id_usuario){
			try {
				Session session = HibernateConnection.getSession();
				
				session.beginTransaction();
				
				Query query = session.createQuery("Select SUM(precio), count(precio) from Products where id_user='"+id_usuario+"'");
				List<Object[]> totales =(List<Object[]>)query.list();
				
				session.close();
				
				return totales;
			} catch (Exception e) {
				// TODO: handle exception
			}
				return null;
				
		}
		
		//SACO LA SUMA DE LAS REVIEWS Y TOTAL DE LOS USUARIOS
		public List<Object[]> rankingReviews(){
			try {
				Session session = HibernateConnection.getSession();
				
				session.beginTransaction();
				
				Query query = session.createQuery("Select SUM(p.precio), count(precio), u.nombre, u.id_usuario from Products p, User u where u.id_usuario = p.id_user group by u.id_usuario, u.nombre order by 1");
				List<Object[]> totales =(List<Object[]>)query.list();
				query.setFirstResult(0);
				query.setMaxResults(5);
								
				session.close();
				
				return totales;
				
			} catch (Exception e) {
				// TODO: handle exception
			}
				return null;		
		}
		
		public List<Object[]> rankingGastado(){
			try {
				Session session = HibernateConnection.getSession();
				
				session.beginTransaction();
				
				Query query = session.createQuery("Select SUM(p.precio), count(precio), u.nombre, u.id_usuario from Products p, User u where u.id_usuario = p.id_user group by u.id_usuario, u.nombre order by 2");
				List<Object[]> totales =(List<Object[]>)query.list();
				query.setFirstResult(0);
				query.setMaxResults(5);
								
				session.close();
				
				return totales;
				
			} catch (Exception e) {
				// TODO: handle exception
			}
				return null;		
		}
			



}
