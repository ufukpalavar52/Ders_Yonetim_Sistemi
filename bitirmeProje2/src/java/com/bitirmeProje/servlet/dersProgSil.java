/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

/**
 *
 * @author Toshiba
 */
public class dersProgSil extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int donemId = Integer.valueOf(request.getParameter("donem"));
        String str[] = request.getParameter("bolumdersSil").split(" ");
        String dersId = str[0];
        int saatId = Integer.valueOf(str[1]);
        int gunId = Integer.valueOf(str[2]);
        int sinifId = Integer.valueOf(str[3]);
        
        DersDAO  dersProgSil = new DersDAO();
        try {
            int d = dersProgSil.DersProgSil(donemId, dersId, saatId, gunId,sinifId);
            if (d == 1) {
                response.sendRedirect("dersProgramiDuzenle.jsp");
            }
            else
                response.sendRedirect("hata.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(dersProgSil.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
