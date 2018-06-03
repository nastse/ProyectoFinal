package com.demo.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name="mensaje")
public class Mensaje {

	@Column(name="id_mensaje")
	@Id
	@GeneratedValue //PARA DECIR QUE ES AUTOINCREMENTADO
	private int id_mensaje;
	
	@Column(name="mensaje")
	private String mensaje;
	
	@Column(name="remitente")
	private String remitente;
	
	@Column(name="tipo")
	private int tipo;
	
	@Column(name="recibido")
	private Date recibido;

	public int getId_mensaje() {
		return id_mensaje;
	}

	public void setId_mensaje(int id_mensaje) {
		this.id_mensaje = id_mensaje;
	}

	public String getRemitente() {
		return remitente;
	}

	public void setRemitente(String remitente) {
		this.remitente = remitente;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public Date getRecibido() {
		return recibido;
	}

	public void setRecibido(Date recibido) {
		this.recibido = recibido;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
	
	
}
