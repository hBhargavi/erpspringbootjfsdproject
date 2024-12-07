package com.klef.jfsd.springboot.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService 
{
	 @Autowired
	    private JavaMailSender mailSender;

	    public void sendEmail(String to, String subject, String text) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(to);
	        message.setSubject(subject);
	        message.setText(text);
	        mailSender.send(message);
	    }

	    public void sendRegistrationEmail(String toEmail, Long studentId, String password)
	    {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(toEmail);
	        message.setSubject("Student Registration Details");
	        message.setText("Dear Student,\n\nYour registration is successful.\n\nYour ID: " + studentId + 
	                        "\nYour Password: " + password + 
	                        "\n\nPlease keep this information secure.\n\nRegards,\nAdministration Team");
	        mailSender.send(message);
	    }
	    public void sendfacultyregistrationEmail(String toemail, Long id, String password)
	    {
	        try 
	        {
	            SimpleMailMessage message = new SimpleMailMessage();
	            message.setTo(toemail);
	            message.setSubject("Faculty Registration Details");
	            message.setText("Dear Faculty,\n\nYour registration is successful.\n\nYour ID: " + id + 
	                            "\nYour Password: " + password + "\nYour Email: " + toemail + 
	                            "\n\n Please keep this information secure.\n\nRegards,\nAdministration Team");
	            mailSender.send(message);
	        } 
	        catch (Exception e) 
	        {
	            System.err.println("Failed to send email: " + e.getMessage());
	        }
	    }

}
