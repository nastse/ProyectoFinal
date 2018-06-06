package com.demo.dao.layer;

import java.util.List;

import com.demo.pojo.User;

public interface UserDAO {

	public List<User> doHibernateLogin(String username, String password);
	public int updateToken(String tokenID);
	public int doHibernateDeleteUser(int usuario_id);
	public int doHibernateUpdatePassword(int usuario_id, String newpassword);
	public String doHibernateSignUp(User user);
	public String doHibernateUpdateUser(String nombre, int peso, int altura, int edad, String genero, String imagen, int id);
	public String getUserName(int id_user);
	public List<String> getUserDatos(String id_usuario);
	public List<String> getUserDatosEmail(String email);
	public String comprobarEmail(String email);
	public List<User> comprobarTokenID(String tokenID);
	public List<Object[]> contarReviews(String id_usuario);
	public List<Object[]> rankingReviews();
	public List<Object[]> rankingGastado();
}
