/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.MailSender.ejb;

import java.util.Properties;
import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.io.*;
import java.net.*;



@Stateless
public class MailSenderBean {
    
    public void sendEmail1(String fromEmail, String userName, String pass, String toEmail,  String msg) throws MessagingException{
    
        String subject="Feed Back From Rent-A-Car";
        Properties pro = System.getProperties();
        pro.put("mail.smtp.host", "smtp.gmail.com");
        pro.put("mail.smtp.auth", "true");
        pro.put("mail.smtp.port", "465");
        pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        pro.put("mail.smtp.socketFactory.port", "465");
        pro.put("mail.smtp.socketFactory.fallback", "false");
        
        Session mailSession = Session.getDefaultInstance(pro, null);
        mailSession.setDebug(true);
        Message mailMessage = new MimeMessage(mailSession);
        mailMessage.setFrom(new InternetAddress(fromEmail));
        mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        mailMessage.setContent(msg,"text/html");
        mailMessage.setSubject(subject);
        //Transport transport = session.getTransport("smtp");
        Transport trans = mailSession.getTransport("smtp");
        trans.connect("smtp.gmail.com",fromEmail, pass);
        trans.sendMessage(mailMessage, mailMessage.getAllRecipients());
        
        
        
        
        
        
        
        
        
    
    }

    public void sendEmail(String fromEmail, String userName, String pass, String toEmail, String subject, String msg) throws MessagingException{
        
        Properties pro = System.getProperties();
        
        pro.put("mail.smtp.host", "smtp.gmail.com");
        pro.put("mail.smtp.auth", "true");
        
        pro.put("mail.smtp.port", "465");
        
        pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        pro.put("mail.smtp.socketFactory.port", "465");
        pro.put("mail.smtp.socketFactory.fallback", "false");
        
        Session mailSession = Session.getDefaultInstance(pro, null);
        mailSession.setDebug(true);
        Message mailMessage = new MimeMessage(mailSession);
        mailMessage.setFrom(new InternetAddress(fromEmail));
        mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        mailMessage.setContent(msg,"text/html");
        mailMessage.setSubject(subject);
        
        Transport tra= mailSession.getTransport("smtp");
        tra.connect("smtp.gmail.com",fromEmail, pass);
        tra.sendMessage(mailMessage, mailMessage.getAllRecipients());
        
        
        
        
        
        
        
        
        
    
    }
}
