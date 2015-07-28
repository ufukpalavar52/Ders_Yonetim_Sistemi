package com.bitirmeProje.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class mailAtServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String result;
        String kullanici = request.getParameter("isimSoyisim");

// Alici email adresi
        String to = "bitirmeprojesi.dys@gmail.com";

// Gonderen email adresi
        String from = request.getParameter("email");

// Uygulama localhost uzerinde calisacagi icin localhost yazilir.
        String host = "localhost";

// Sistem Properties sinifindan ozellikler nesnesi tanimlanir.
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

// Authentication yapisi olusturulur sifre ve kullanici girilir/
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("dersyonetimsistemiprojesi", "ufukfatihilkin");
            }
        };

// Session nesnesi olusturulur.
        Session mailSession = Session.getDefaultInstance(properties, auth);
        mailSession.setDebug(false);
        try {

// MimeMessage nesnesi olusturulur.
            MimeMessage message = new MimeMessage(mailSession);

// Gonderen email adresi setlenir.
            message.setFrom(new InternetAddress(from));

// Alici mail adresleri setlenir.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

// Mail basligi setlenir.
            message.setSubject(request.getParameter("konu"));

// Mail metni setlenir.
        

            message.setText("Mail " + kullanici + " adli kullanicidan gonderildi\n\n\nPosta adresi " + from + "\n\n\nMesaj:" + request.getParameter("mesaj"));
            
            
// Mesaj gonderilir.
            Transport.send(message);
            result = "Email basari ile gonderildi!";
        } catch (MessagingException mex) {
            mex.printStackTrace();
            result = "Email gonderilemedi!";
        }

        out.println(result);

        response.sendRedirect("contact.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

}
