/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.AkademisyenDAO;
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
public class Pasif extends HttpServlet {

    
  
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        doPost(request,response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int pasif = Integer.valueOf(request.getParameter("id"));
        String akademisyenNo = request.getParameter("id1");
        DersDAO dk = new DersDAO();
        int donem = 0;
        int dersAtaKontrol = 0;
        if (pasif == 1) {
            try {
                donem = dk.AktifDonemKontrol();
            } catch (SQLException ex) {
                Logger.getLogger(Pasif.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
            try {
                dersAtaKontrol = dk.DersAtaKontrol(akademisyenNo, donem);
            } catch (SQLException ex) {
                Logger.getLogger(Pasif.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if (dersAtaKontrol == 0) {
            AkademisyenDAO p = new AkademisyenDAO();
            try {
                int d = p.AkademisyenPasif(pasif, akademisyenNo);
                if (d == 1) {
                    response.sendRedirect("ogreteList.jsp");
                }
                else
                    response.sendRedirect("hata.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(Pasif.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
            response.sendRedirect("dersAtaHata.jsp");
     
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
