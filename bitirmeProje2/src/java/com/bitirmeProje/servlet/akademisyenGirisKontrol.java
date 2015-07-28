
package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.AkademisyenDAO;
import com.bitirmeProje.DAO.OgrenciDAO;
import com.bitirmeProje.model.Akademisyen;
import com.bitirmeProje.model.Ogrenci;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/akademisyenGirisKontrol")
public class akademisyenGirisKontrol extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            //HttpSession session = request.getSession();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            ArrayList<Akademisyen> akademik = new ArrayList();

            String akademisyenNo = request.getParameter("akademisyenNo");
            String akademisyenSifre = request.getParameter("akademisyenSifre");
            
            AkademisyenDAO akademisyen = new AkademisyenDAO();
            akademik = akademisyen.AkademisyenLogin(akademisyenNo, akademisyenSifre);
            
            
            if (akademik != null) {
                for (Akademisyen item : akademik) {
                    String oturumAd = item.getAkademisyenAd(); // returns String
                    String oturumSifre = item.getAkademisyenSifre();
                    String bolumId = item.getAkademisyenBolumId();
                    String akdemisyenNo = item.getAkademisyenNo();
                    int yetki = item.getAkademisyenYetki();
                    
                    HttpSession session = request.getSession(true);
                    session.setAttribute("oturum", oturumAd);
                    session.setAttribute("oturumBolum",bolumId);
                    session.setAttribute("oturumNo",akdemisyenNo);
                    session.setAttribute("yetki",yetki);
                    
                    
                    session.setMaxInactiveInterval(60 * 60);

                    response.sendRedirect("index.jsp");

                }
            } else {
                response.sendRedirect("akademisyenGirisi.jsp");
            }
           //String oturum = (String) session.getAttribute("ogrenciAd");

        } catch (Exception ex) {
            Logger.getLogger(ogrenciGirisKontrol.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    
    }

    

    
}
