package com.demo.dao.layer;

import java.util.List;

import com.demo.pojo.User;

public interface UserDAO {

	public int doHibernateLogin(String username, String password);
	public String doHibernateSignUp(User user);
	public String getUserName(int id_user);
	public List<String> getUserDatos(String email);
}
