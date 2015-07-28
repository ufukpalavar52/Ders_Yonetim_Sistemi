/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.ConnectionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class Akademisyenkontrol extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String akademisyenNo = request.getParameter("uid");
        ResultSet rs = null;
        Statement st = null;
        
        try { 


             ConnectionDB connect = new ConnectionDB();
             Connection conn = connect.baglanti();
             String sql = "Select *from akademisyen where akademisyenNo = '"+akademisyenNo+"';";
             st = conn.createStatement();
             rs = st.executeQuery(sql);


        if(rs.next()){  
            out.print("<p style=\"color: #c12e2a\">Seçtiniz akademisyen numarası kullanılmaktadır.<span class=\"glyphicon glyphicon-warning-sign form-control-feedback\" aria-hidden=\"true\"></span></p>");

        }
        else
            out.println("<p style=\"color: #3e8f3e\">Seçtiniz akademisyen numarası uygundur.<span class=\"glyphicon glyphicon-ok form-control-feedback\" aria-hidden=\"true\"></span></p>");


    }catch(Exception ex){
        out.println(ex);
    }

}

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
