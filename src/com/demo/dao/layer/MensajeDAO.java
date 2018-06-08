package com.demo.dao.layer;

import java.util.List;
import java.util.Map;

import com.demo.pojo.Mensaje;
import com.demo.pojo.Products;

public interface MensajeDAO {

	
	public String crearMensaje(String contenido, String origen, String tipo);
	public List<Mensaje> leerMensajes();
	
}
