
package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.AkademisyenDAO;
import com.bitirmeProje.DAO.OgrenciDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Toshiba
 */
public class ogrenciGunc extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset = utf-8");
        request.setCharacterEncoding("ISO-8859-9");
        response.setCharacterEncoding("ISO-8859-9");
        PrintWriter out = response.getWriter();

        String ad = request.getParameter("isim");
        String soyad = request.getParameter("soyisim");
        String email = request.getParameter("email");
        String istel = request.getParameter("isTelefon");
        
        String ogrenciNo = request.getParameter("ogrenciNo");
        String eskiNo = request.getParameter("id");

        

        OgrenciDAO gunc = new OgrenciDAO();
       

            int x = gunc.OgrenciGunc(ogrenciNo, ad, soyad, email, eskiNo);
            if (x == 1) {
                response.sendRedirect("ogrenciList.jsp");

            } else {
                response.sendRedirect("hata.jsp");
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
