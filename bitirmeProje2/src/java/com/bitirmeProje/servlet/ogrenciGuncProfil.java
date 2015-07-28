package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.OgrenciDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ogrenciGuncProfil extends HttpServlet {

    
   
     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("ISO-8859-9");
        response.setCharacterEncoding("ISO-8859-9");
        PrintWriter out = response.getWriter();
        String ogrenciNo = request.getParameter("ogrenciNo");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String sifre = request.getParameter("sifre");
        String sifre1 = request.getParameter("sifre1");
        
        if(sifre1.equals("")){
            sifre1 = sifre;
        }
        OgrenciDAO gunc;
         gunc = new OgrenciDAO();
        int d = gunc.OgrenciProfilGunc(ogrenciNo, email, tel, sifre, sifre1);
        if(d == 1){
           response.sendRedirect("guncellemeBasarili.jsp");
            
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("hata", 1);
            response.sendRedirect("profilAyar.jsp");
        }
    }
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

  
}
