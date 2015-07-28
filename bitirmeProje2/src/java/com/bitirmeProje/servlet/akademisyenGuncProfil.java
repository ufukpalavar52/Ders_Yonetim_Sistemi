

package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.AkademisyenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Toshiba
 */
public class akademisyenGuncProfil extends HttpServlet {

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
        request.setCharacterEncoding("ISO-8859-9");
        response.setCharacterEncoding("ISO-8859-9");
        PrintWriter out = response.getWriter();
        String akademisyenNo = request.getParameter("akademisyenNo");
        String email = request.getParameter("email");
        String cep = request.getParameter("ceptel");
        String istel = request.getParameter("istel");
        String sifre1 = request.getParameter("sifre1");
        String sifre = request.getParameter("sifre");
        
        if(sifre1.equals("")){
            sifre1 = sifre;
        }
        
        AkademisyenDAO gunc = new AkademisyenDAO();
        int d = gunc.AkademisyenProfilGunc(akademisyenNo, email, istel, cep, sifre, sifre1);
        if(d == 1){
            response.sendRedirect("guncellemeBasarili.jsp");
        }
        else{
            HttpSession session = request.getSession();
            session.setAttribute("hata", 1);
            response.sendRedirect("AkademisyenprofilAyar.jsp");
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
