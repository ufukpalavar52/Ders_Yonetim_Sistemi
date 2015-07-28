
package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.ConnectionDB;
import com.bitirmeProje.DAO.OgrenciDAO;
import com.bitirmeProje.model.Ogrenci;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class duyuruKaydet extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       try {

            //HttpSession session = request.getSession();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("ISO-8859-9");
            response.setCharacterEncoding("ISO-8859-9");
            
            String duyuruKonuBaslik = request.getParameter("duyuruKonuBaslik");
            String duyuruMesaj = request.getParameter("duyuruMesaj");
            

            
           ConnectionDB connect = new ConnectionDB();
   	   Connection conn = connect.baglanti();
            
           
          
            PreparedStatement pstatement = conn.prepareStatement("insert into duyuru(duyuruKonuBaslik,duyuruMesaj) values(?,?);");
            
            pstatement.setString(1, duyuruKonuBaslik);
            pstatement.setString(2,duyuruMesaj);
           
          
           
           int  updateQuery = pstatement.executeUpdate();
           
           response.sendRedirect("index.jsp");
         // response.sendRedirect("index.jsp");
        
    }   catch (SQLException ex) {
            Logger.getLogger(updateData.class.getName()).log(Level.SEVERE, null, ex);
        }
            

            
           //String oturum = (String) session.getAttribute("ogrenciAd");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

 

}
