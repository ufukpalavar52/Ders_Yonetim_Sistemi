package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.OgrenciDAO;
import com.bitirmeProje.model.Ogrenci;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ogrenciGirisKontrol")
public class ogrenciGirisKontrol extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            //HttpSession session = request.getSession();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            ArrayList<Ogrenci> talebe = new ArrayList();

            String ogrenciNo = request.getParameter("ogrenciNo");
            String ogrenciSifre = request.getParameter("ogrenciSifre");

            OgrenciDAO ogrenci = new OgrenciDAO();
            talebe = ogrenci.OgrenciLogin(ogrenciNo, ogrenciSifre);

            if (talebe != null) {
                for (Ogrenci item : talebe) {
                    String oturumAd = item.getOgrenciAd(); // returns String
                    String oturumSifre = item.getOgrenciSifre();
                    String ogrenciOturumNo = item.getOgrenciNo();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("oturum", oturumAd);
                    session.setAttribute("oturumNo",ogrenciOturumNo);
                    session.setAttribute("oturumBolum", item.getBolum_BolumId());
                    session.setAttribute("yetki",null);
                    session.setMaxInactiveInterval(60 * 60);
                    response.sendRedirect("index.jsp");

                }
            } else {
                response.sendRedirect("ogrenciGirisi.jsp");
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
