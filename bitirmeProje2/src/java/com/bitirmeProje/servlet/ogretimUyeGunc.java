package com.bitirmeProje.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitirmeProje.DAO.AkademisyenDAO;
import com.bitirmeProje.model.Akademisyen;
import com.bitirmeProje.model.Ders;

@WebServlet("/ogretimUyeGunc")
public class ogretimUyeGunc extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ogretimUyeGunc() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset = utf-8");
        request.setCharacterEncoding("ISO-8859-9");
        response.setCharacterEncoding("ISO-8859-9");
        PrintWriter out = response.getWriter();

        int bolum = Integer.valueOf(request.getParameter("bolum"));
        String ad = request.getParameter("isim");
        String soyad = request.getParameter("soyisim");
        String email = request.getParameter("email");
        String istel = request.getParameter("isTelefon");
        String ceptel = request.getParameter("cepTelefon");
        String cevap = request.getParameter("cevap1");
        String akademisyenNo = request.getParameter("akademisyenNo");
        String eskiNo = request.getParameter("id");

        int d;
        if (cevap != null) {
            d = 1;
        } else {
            d = 0;
        }

        AkademisyenDAO gunc = new AkademisyenDAO();
        try {

            int x = gunc.AkademisyenGunc(bolum, akademisyenNo, ad, soyad, email, istel, ceptel, d, eskiNo);
            if (x == 1) {
                response.sendRedirect("ogreteList.jsp");

            } else {
                response.sendRedirect("hata.jsp");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
