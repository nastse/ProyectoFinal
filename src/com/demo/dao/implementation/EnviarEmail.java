package com.demo.dao.implementation;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EnviarEmail {

	public static void mandarEmail(String destinoEmail, String asunto, String mensaje){
			//PRUEBA PARA ENVIAR EMAIL
			
			final String emailUsername = "sergiu.nastse@gmail.com";//from which you want to send mail
		    final String emailPassword = "Netw0rks";//password off your mail id 
		
		    Properties props = new Properties();
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.host", "smtp.gmail.com");
		    props.put("mail.smtp.port", "587");
		
		    Session session = Session.getInstance(props,
		      new javax.mail.Authenticator() {
		        protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(emailUsername, emailPassword);
		        }
		      });
		
		    try {
		
		        Message message = new MimeMessage(session);
		        message.setFrom(new InternetAddress("Ciclismo Review <sergiu.nastse@gmail.com>"));
		        message.setRecipients(Message.RecipientType.TO,
		            InternetAddress.parse(destinoEmail));//whom you want to send mail
		        message.setSubject(asunto);
		        message.setText(mensaje);
		
		        Transport.send(message);
		
		        System.out.println("Enviado");
		
		    } catch (MessagingException e) {
		        throw new RuntimeException(e);
		    }
		  
	}
}
