package com.demo.dao.implementation;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

//CAMBIO
//import com.demo.models.HibernateConnection;
import com.demo.dao.implementation.HibernateConnection;

import com.demo.pojo.Products;


public class ProductsDAO implements com.demo.dao.layer.ProductsDAO {

//DEVUELVO LA LISTA DE PRODUCTOS	
	//SUSTITUYO LOS MODELS POR DAO
	public List<Products> getAllProducts(){
		
		//CREO LA SESION DE HIBERNATE - NECESITO CREAR UN CONTROLADOR
		Session session = HibernateConnection.doHibernateConnection().openSession();
		
		List<Products> allProducts = session.createQuery("From Products").list();
		session.close();
		
		//DEVUELVE UN POJO
		return allProducts;
	}
	
	//DEVUELVO UN MAP CON LOS PRODUCTOS Y EL NOMBRE DE USUARIO DE CADA UNO
	//TODO SUSTITUIR POR ARRAYLIST?�
	public List<String> getAllProductsNames(String marca, String modelo, String talla, String anio, String tallauser, String peso, String altura, String cintura, String pecho, String cadera, String genero ){
		
		//CREO LA SESION DE HIBERNATE - NECESITO CREAR UN CONTROLADOR
		Session session = HibernateConnection.doHibernateConnection().openSession();
		
		//CREO VARIABLES PARA RECOGER LOS VALORES Y COMPARAR EL VALOR QUE TRAEN PARA HACER LA BUSQUEDA
		String marca2=marca;
		String modelo2=modelo;
		String talla2=talla;
		String anio2=anio;
		String tallauser2=tallauser;
		String peso2=peso;
		String altura2=altura;
		String cintura2=cintura;
		String pecho2=pecho;
		String cadera2=cadera;
		String genero2=genero;
		
		if(marca.equals("Todos")) {
			marca2="%";
		}
		if(modelo.equals("Todos")) {
			modelo2="%";
		}
		if(talla.equals("Todos")) {
			talla2="%";
		}
		if(anio.equals("Todos")) {
			anio2="%";
		}
		if(tallauser.equals("Todos")) {
			tallauser2="%";
		}
		if(peso.equals("Todos")) {
			peso2="%";
		}
		if(altura.equals("Todos")) {
			altura2="%";
		}
		if(pecho.equals("Todos")) {
			pecho2="%";
		}
		if(cadera.equals("Todos")) {
			cadera2="%";
		}
		if(cintura.equals("Todos")) {
			cintura2="%";
		}
		if(genero.equals("Todos")) {
			genero2="%";
		}
		
		
		//List<String> allProductsNames = session.createQuery("Select p.categoria, p.marca, p.imagen, u.nombre, p.id_rev, u.email, p.modelo, u.imagen from User u, Products p where u.id_usuario=p.id_user" ).list();
		List<String> allProductsNames = session.createQuery("Select p.categoria, p.marca, p.imagen, u.nombre, p.id_rev, u.id_usuario, p.modelo, u.imagen, p.recomendable, p.tallauser, p.talla, p.peso, p.altura, u.genero from User u, Products p where " 
		+ "u.id_usuario=p.id_user and p.marca like '"+marca2+"' and p.categoria like '"+modelo2+"' and p.talla like '"+talla2+"' and p.anio like '"+anio2+"' "
		+ " and p.tallauser like '"+tallauser2+"' and p.peso like '"+peso2+"' and p.altura like '"+altura2+"' and p.pecho like '"+pecho2+"' "
		+ " and p.cadera like '"+cadera2+"' and p.cintura like '"+cintura2+"' and u.genero like '"+genero2+"'").list();
		
		session.close();
		
		//DEVUELVE UN POJO
	
		return allProductsNames;
	}
	
	
	//DEVUELVO UN MAP CON LOS PRODUCTOS Y EL NOMBRE DE USUARIO DE CADA UNO PARA PAGINAR
	public List<String> getAllProductsNamesPage(int pagina, String marca, String modelo, String talla, String anio, String tallauser, String peso, String altura, String cintura, String pecho, String cadera, String genero){
		
			int limiteporpagina = 4;
			
			//CREO VARIABLES PARA RECOGER LOS VALORES Y COMPARAR EL VALOR QUE TRAEN PARA HACER LA BUSQUEDA			
			String marca2=marca;
			String modelo2=modelo;
			String talla2=talla;
			String anio2=anio;
			String tallauser2=tallauser;
			String peso2=peso;
			String altura2=altura;
			String cintura2=cintura;
			String pecho2=pecho;
			String cadera2=cadera;
			String genero2=genero;
			
			if(marca.equals("Todos")) {
				marca2="%";
			}
			if(modelo.equals("Todos")) {
				modelo2="%";
			}
			if(talla.equals("Todos")) {
				talla2="%";
			}
			if(anio.equals("Todos")) {
				anio2="%";
			}
			if(tallauser.equals("Todos")) {
				tallauser2="%";
			}
			if(peso.equals("Todos")) {
				peso2="%";
			}
			if(altura.equals("Todos")) {
				altura2="%";
			}
			if(pecho.equals("Todos")) {
				pecho2="%";
			}
			if(cadera.equals("Todos")) {
				cadera2="%";
			}
			if(cintura.equals("Todos")) {
				cintura2="%";
			}
			if(genero.equals("Todos")) {
				genero2="%";
			}
		
			//CREO LA SESION DE HIBERNATE - NECESITO CREAR UN CONTROLADOR
			Session session = HibernateConnection.doHibernateConnection().openSession();
			
			
			Query q  = session.createQuery("Select p.categoria, p.marca, p.imagen, u.nombre, p.id_rev, u.id_usuario, p.modelo, u.imagen, p.recomendable, p.tallauser, p.talla, p.peso, p.altura, u.genero from User u, Products p where " 
					+ "u.id_usuario=p.id_user and p.marca like '"+marca2+"' and p.categoria like '"+modelo2+"' and p.talla like '"+talla2+"' and p.anio like '"+anio2+"' " 
					+ " and p.tallauser like '"+tallauser2+"' and p.peso like '"+peso2+"' and p.altura like '"+altura2+"' and p.pecho like '"+pecho2+"' " 
					+ " and p.cadera like '"+cadera2+"' and p.cintura like '"+cintura2+"' and u.genero like '"+genero2+"'");
		
				q.setFirstResult(pagina*limiteporpagina);
				q.setMaxResults(limiteporpagina);
			
				List <String> resultado = q.list();
				
			session.close();
			
			//DEVUELVE UN POJO
			return resultado;
		}

//BORRAR UN PRODUCTO
	public boolean deleteProductById(String id){
		try{
			Session session = HibernateConnection.doHibernateConnection().openSession();
			
			List<Products> product = session.createQuery("From Products where id_rev='"+id+"'").list();
			
			
			
			if(product != null && product.get(0) != null){
				session.beginTransaction();
				session.delete(product.get(0));
				session.getTransaction().commit();
				session.close();
			}
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

//DEVUELVO UN PRODUCTO POR SU ID
	public Products getProductByProductId(String id) {
		try {
			
			Session session = HibernateConnection.doHibernateConnection().openSession();
			
			List <Products> product = session.createQuery("From Products where id_rev='"+id+"'").list();
			session.close();
			
			//SOLO DEVUELVE UNO PORQUE ID ES PK
			return product.get(0);
			
		}catch(Exception e) {
			
			return null;
		}
	}
	
	
	//DEVUELVO LISTA DE PRODUCTOS POR SU ID DE USUARIO
		public List<Products> getProductByUserId(int id) {
			try {
				
				Session session = HibernateConnection.doHibernateConnection().openSession();
				
				List <Products> productosId = session.createQuery("From Products where id_user='"+id+"')").list();
				session.close();
				
				return productosId;
				
			}catch(Exception e) {
				
				return null;
			}
		}
		
		
		
	//ACTUALIZAR UN PRODUCTO
		public String updateProduct(Products product) {
			
			Session session = HibernateConnection.doHibernateConnection().openSession();
			session.beginTransaction();
			session.update(product);
			session.getTransaction().commit();
			session.close();
			
			return "Producto actualizado correctamente";
			
		}
		
	//ACTUALIZAR CAMPOS DE UN PRODUCTO
			public String updateProductColumns(Products product) {
				
				Session session = HibernateConnection.doHibernateConnection().openSession();
				session.beginTransaction();
				
				
				//PARA HACER UN UPDATE DE COLUMNAS EN CONCRETO
				String hqlUpdate ="update Products p set  "
						+ "p.imagen=:newImagen, "
						+ "p.categoria =:newCategoria, "
						+ "p.marca = :newMarca, "
						+ "p.modelo = :newModelo, "
						+ "p.talla = :newTalla, "
						+ "p.anio = :newAnio, "
						+ "p.precio = :newPrecio, "
						+ "p.tallauser = :newTallauser, "
						+ "p.peso = :newPeso, "
						+ "p.altura = :newAltura, "
						+ "p.pecho = :newPecho, "
						+ "p.cintura = :newCintura, "
						+ "p.cadera = :newCadera, "
						+ "p.temp_max = :newTemp_max, "
						+ "p.temp_min = :newTemp_min, "
						+ "p.ajuste = :newAjuste, "
						+ "p.recomendable = :newRecomendable, "
						+ "p.comentario = :newComentario "
						+ "where p.id_rev = '"+product.getId_rev()+"'";
			
				int updatedEntities = session.createQuery(hqlUpdate)
						.setString("newImagen", product.getImagen())
						.setString("newCategoria", product.getCategoria())
						.setString("newMarca", product.getMarca())
						.setString("newModelo", product.getModelo())
						.setString("newTalla", product.getTalla())
						.setInteger("newAnio", product.getAnio())
						.setInteger("newPrecio", product.getPrecio())
						.setString("newTallauser", product.getTallauser())
						.setInteger("newPeso", product.getPeso())
						.setInteger("newAltura", product.getAltura())
						.setInteger("newPecho", product.getPecho())
						.setInteger("newCintura", product.getCintura())
						.setInteger("newCadera", product.getCadera())
						.setInteger("newTemp_max", product.getTemp_max())
						.setInteger("newTemp_min", product.getTemp_min())
						.setInteger("newAjuste", product.getAjuste())
						.setInteger("newRecomendable", product.getRecomendable())
						.setString("newComentario", product.getComentario())
						.executeUpdate();

				session.getTransaction().commit();
				session.close();
				
				return "Producto actualizado correctamente";
				
			}	
		
		
		//INSERTAR UN PRODUCTO
		public String insertProduct(Products product) {
			
			Session session = HibernateConnection.doHibernateConnection().openSession();
			session.beginTransaction();
			session.save(product);
			session.getTransaction().commit();
			session.close();
			
			return "Producto insertado";
			
		}
		
		/*//DEVUELVO LISTA DE PRODUCTOS POR SU NOMBRE DE USUARIO
	//NO FUNCIONA	
				public List<Products> getProductByUserName(String user) {
					try {
						
						Session session = HibernateConnection.doHibernateConnection().openSession();
						
						List <Products> productosId = session.createQuery("Select * from Products p, User u, where p.id_user=u.id_usuario and u.email='"+user+"')").list();
						session.close();
						
						return productosId;
						
					}catch(Exception e) {
						
						return null;
					}
				}*/
	
}
