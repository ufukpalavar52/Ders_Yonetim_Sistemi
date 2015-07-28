
package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.DersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class donemGunc extends HttpServlet {

  
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int donemId = Integer.valueOf(request.getParameter("donemId"));
        String donemAd = request.getParameter("donemAd");
        String yil = request.getParameter("yil");
        
        DersDAO donem = new DersDAO();
        try {
            int durum = donem.DonemGunc(donemId, yil, donemAd);
            if (durum == 1) {
                response.sendRedirect("akademikYil.jsp");
            }
            else {
                response.sendRedirect("hata.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(donemGunc.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
