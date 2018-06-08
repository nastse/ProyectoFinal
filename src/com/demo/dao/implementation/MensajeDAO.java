package com.demo.dao.implementation;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.demo.pojo.Mensaje;
import com.demo.pojo.User;

public class MensajeDAO implements com.demo.dao.layer.MensajeDAO{

	public String crearMensaje(String contenido, String origen, String tipo) {
		
		Session session = HibernateConnection.getSession();	
		Mensaje mensaje = new Mensaje();
		
		mensaje.setMensaje(contenido);
		mensaje.setRemitente(origen);
		mensaje.setTipo(tipo);
		
		Date date = new Date();
		mensaje.setRecibido(date);
		
		session.beginTransaction();
		session.save(mensaje);
		session.getTransaction().commit();
		
		session.close();
		
		return "Mensaje creado";
		
	}
	
	
	public List<Mensaje> leerMensajes() {
		
		try {
			
			Session session = HibernateConnection.getSession();	
			session.beginTransaction();
			
			List<Mensaje> mensaje = session.createQuery("From Mensaje order by recibido DESC").list();
			
			session.close();
			
			return mensaje;
			
			
		}catch(Exception e) {
			return null;
		}
		
	}
}
