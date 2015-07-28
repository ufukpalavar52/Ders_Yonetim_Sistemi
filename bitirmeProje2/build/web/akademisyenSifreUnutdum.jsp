<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
<title>Şifre Bilgileri</title>
</head>
<body>
<div class="container">
            <div class="row">
                <div class="col-md-12">
    
    <%@include file="menu.jsp" %>
                </div>
            </div>
    </div>
    <br/><br/><br/>
   
<div class="container">
    <div class="row">   
        <div class="col-md-12">      
 
<%
    String sifre="";
    Statement st = null;
    ResultSet rs = null;
    ConnectionDB conect = new ConnectionDB();
    Connection conn = conect.baglanti();
    String sql = "Select akademisyenSifre from ogrenci where akademisyenEposta='"+request.getParameter("email")+"' and akademisyenNo='"+request.getParameter("akademisyenNo")+"'";
    try {
        st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        
        if(rs.next()) {
            sifre = rs.getString("akademisyenSifre");
             try {
                 String from = "bitirmeprojesi.dys@gmail.com";
                 String sifredys = "ufukfatihilkin";
                 String  []to = { request.getParameter("email")};
                 String host = "smtp.gmail.com";
                 Properties props = System.getProperties();
                 props.put("mail.smtp.starttls.enable", "true");
                 props.put("mail.smtp.host",host);
                 props.put("mail.smtp.user",from);
                 props.put("mail.smtp.password",sifredys);
                 props.put("mail.smtp.port","587");
                 props.put("mail.smtp.auth","true");
    
                 Session mailSession = Session.getInstance(props,null);
                 MimeMessage message = new MimeMessage(mailSession);
                 message.setFrom(new InternetAddress(from));
                 InternetAddress[] toAddress = new InternetAddress[to.length];
    
                 for (int i =0; i< to.length; i++)
                     toAddress[i] = new InternetAddress(to[i]);
    
                 for (int i =0; i< toAddress.length; i++)
                     message.addRecipient(Message.RecipientType.TO, toAddress[i]);
    
                 message.setSubject("Şifre Bilgileriniz");
                 message.setText("Profil Şifreniz: "+sifre);
    
                 Transport transport = mailSession.getTransport("smtp");
                 transport.connect(host,from,sifredys);
                 transport.sendMessage(message, message.getAllRecipients());
                 transport.close();
                 out.println("<p style=\"color:  #000000\">Şifreniz Eposta hesabınıza gönderilmiştir.");
                 } catch(Exception e){
                    out.println("<p style=\"color:red\">Hata oluştu: "+e);
                 }
            }
        else {
            session.setAttribute("MailHata", "1");
            response.sendRedirect("ogrenciSifreUnutuldu.jsp");
        }
        }    
        catch (Exception ex) {
        out.println(ex);
        }
    
    
%>
        </div>
    </div>
        <br/><br/><br/><br/><br/><br/><br/><br/>
    
    <%@include file="asagiMenu.jsp" %>

    
</div> 
</body>
</html>
