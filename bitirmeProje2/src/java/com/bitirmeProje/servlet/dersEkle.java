package com.bitirmeProje.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitirmeProje.DAO.DersDAO;
import com.bitirmeProje.model.Akademisyen;
import com.bitirmeProje.model.Ders;


@WebServlet("/dersEkleme")
public class dersEkle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public dersEkle() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = utf-8");
		request.setCharacterEncoding("ISO-8859-9");
		response.setCharacterEncoding("ISO-8859-9");
	    PrintWriter out = response.getWriter();
		
		
		int bolumId = Integer.valueOf(request.getParameter("bolum")); 
		int dersYil = Integer.valueOf(request.getParameter("sinif"));
		String dersId = request.getParameter("kod");
		String dersAd = request.getParameter("dersAd");
		int teorik = Integer.valueOf( request.getParameter("teorikDers"));
		int pratik = Integer.valueOf(request.getParameter("pratikDers"));
		int lab = Integer.valueOf(request.getParameter("labDers"));
		int dersKredi = Integer.valueOf(request.getParameter("dersKredi"));
		int cevap ;
                String checkbox = request.getParameter("cevap1");
                if (checkbox != null) 
                    cevap = 1;
                else 
                    cevap = 0;
                
                
		DersDAO ders = new DersDAO();
		
	    try {
			int d = ders.DersEkle(dersId, dersAd, dersKredi, pratik, teorik, lab, bolumId, dersYil,cevap);
			if(d==1){
				
                Ders dersgnc = new Ders();
				request.setAttribute("ders", dersgnc);
				
				dersgnc.setDersId(dersId);
				dersgnc.setDersAd(dersAd);
				dersgnc.setDersKredi(dersKredi);
				dersgnc.setDersYil(dersYil);
				dersgnc.setTeorikDersSaati(teorik);
				dersgnc.setPratikDersSaati(pratik);
				dersgnc.setLabDersSaati(lab);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("dersBilgi.jsp");
			    dispatcher.forward(request, response);
			    
			}
			else
				response.sendRedirect("hata.jsp");
			    
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

}
