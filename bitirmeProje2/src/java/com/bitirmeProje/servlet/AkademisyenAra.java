package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.ConnectionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Toshiba
 */
public class AkademisyenAra extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String ad = request.getParameter("kelime");
        ResultSet rs = null;
        Statement st = null;
        if (ad == "") {
            out.println("Lütfen harf giriniz.");
        } else {
            try {

                ConnectionDB connect = new ConnectionDB();
                Connection conn = connect.baglanti();
                String sql = "Select akademisyenAd, akademisyenSoyad from akademisyen where akademisyenAd like  '" + ad + "%'  ";
                //String sql ="select akademisyenAd, akademisyenSoyad from akademisyen";
                st = conn.createStatement();
                rs = st.executeQuery(sql);

                while (rs.next()) {
                    out.println("<div class ='list-group-item' onClick=\"tamamla('" + rs.getString("akademisyenAd") + " " + rs.getString("akademisyenSoyad") + "')\" >" + rs.getString("akademisyenAd") + " " + rs.getString("akademisyenSoyad") + "</div>");

                }

            } catch (Exception ex) {
                out.println(ex);
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
