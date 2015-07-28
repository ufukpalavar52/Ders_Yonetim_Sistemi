package com.bitirmeProje.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitirmeProje.DAO.DersDAO;


@WebServlet("/dersAta")
public class dersAta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public dersAta() {
        super();
            }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   doPost(request,response);
		
	}

	
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html charset = utf-8");
	    request.setCharacterEncoding("utf-8");
	    PrintWriter out = response.getWriter();
	    
	    String akademisyenNo = request.getParameter("ogretimUyesi");
	    String dersId = request.getParameter("bolumders");
            String donem = request.getParameter("donem");
	    //out.println(akademisyenNo+" "+dersId);
	    DersDAO  ders = new DersDAO();
	    try {
			int d = ders.AkademisyenDers(dersId, akademisyenNo,donem);
			if (d == 1)
				response.sendRedirect("dersAtaList.jsp");
			else
				response.sendRedirect("hata.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}
}
