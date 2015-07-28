package com.bitirmeProje.servlet;


import com.bitirmeProje.DAO.AkademisyenDAO;
import com.bitirmeProje.DAO.OgrenciDAO;
import com.bitirmeProje.model.Akademisyen;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ogretimUyeEkle
 */

public class ogrenciEkle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ogrenciEkle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("ISO-8859-9");
		response.setCharacterEncoding("ISO-8859-9");
		int bolumId =Integer.valueOf(request.getParameter("bolum"));
		String ogrenciNo = request.getParameter("ogrenciNo");
		String ad = request.getParameter("isim");
	        
		String soyad = request.getParameter("soyisim");
		
		String eposta = request.getParameter("email");
		String s1 = ad.substring(0,2).toLowerCase();
                String s2 = soyad.substring(0, 2).toLowerCase();
                String s3 = ogrenciNo.substring(1, 9);
                
		String sifre = s1+s3+s2;
		
		
		
		
		
		OgrenciDAO ekle = new OgrenciDAO();
		
		try {
			
			int x = ekle.OgrenciEkle(ogrenciNo, ad, soyad, eposta, sifre, bolumId);
		    if (x==1){
		    	response.sendRedirect("ogrenciList.jsp");
		    	
		    }
		    else
		    	response.sendRedirect("hata.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	
	
	
	
	

}
