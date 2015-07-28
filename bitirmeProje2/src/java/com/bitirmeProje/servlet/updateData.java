
package com.bitirmeProje.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitirmeProje.DAO.ConnectionDB;



public class updateData extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Statement stmt = null;
        ResultSet rs = null;
        
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("ISO-8859-9");
        response.setCharacterEncoding("ISO-8859-9");
        
        String ogrenciNo = request.getParameter("ogrenciNo");
        String pdf  =request.getParameter("pdf");
        String dosyaTipi = request.getParameter("dosyaTipi");
        
        String dosyaAd = request.getParameter("pdfAd");
        String yil = request.getParameter("yil");
        String fakulteAd = request.getParameter("fakulte");
        String bolumAd = request.getParameter("bolum");
        String dersId = request.getParameter("dersId");
        String  dosyaBoyutu = request.getParameter("dosyaBoyutu");
        String dosyaHakkindaAciklama = request.getParameter("notAciklama");
        
    
        
        
        try{
            
            
           ConnectionDB connect = new ConnectionDB();
   	   Connection conn = connect.baglanti();
            
           
          
            PreparedStatement pstatement = conn.prepareStatement("UPDATE dosya SET dosyaAd=?,dosyaYolu=?,dosyaHakkindaAciklama=?,ders_dersId = ?, dosyaTipi=? Where dosyaYolu = '" + pdf + "';");
            
            pstatement.setString(1, dosyaAd);
            pstatement.setString(2,pdf);
            pstatement.setString(3, dosyaHakkindaAciklama);
            pstatement.setString(4, dersId);
            pstatement.setString(5, dosyaTipi);
           
          
           
           
           
           int  updateQuery = pstatement.executeUpdate();
           
           response.sendRedirect("index.jsp");
         // response.sendRedirect("index.jsp");
        
    }   catch (SQLException ex) {
            Logger.getLogger(updateData.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

   

}
