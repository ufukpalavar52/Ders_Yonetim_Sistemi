package com.bitirmeProje.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitirmeProje.DAO.AkademisyenDAO;
import com.bitirmeProje.model.Akademisyen;
import java.util.Locale;

/**
 * Servlet implementation class ogretimUyeEkle
 */
@WebServlet("/ogretimUyeEkle")
public class ogretimUyeEkle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ogretimUyeEkle() {
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
		String bolumId = request.getParameter("bolum");
		String akademisyenNo = request.getParameter("akademisyenNo");
		String ad = request.getParameter("isim");
	
		String soyad = request.getParameter("soyisim");
		
		String eposta = request.getParameter("email");
		String istel = request.getParameter("isTelefon");
		String ceptel = request.getParameter("cepTelefon");
		int d;
                String s1 = ad.substring(0,2).toLowerCase();
                String s2 = soyad.substring(0, 2).toLowerCase();
                String s3 = akademisyenNo.substring(1, 9);
                
		String sifre = s1+s3+s2;
                
		String cevap = request.getParameter("cevap1");
		String cevap1 = request.getParameter("cevap2");
		if (cevap != null)
                    d = 1;
                else if (cevap1 != null && cevap == null)
                    d = 2;
		else
                    d = 0;
                
		AkademisyenDAO ekle = new AkademisyenDAO();
		
		try {
			
			int x = ekle.AkademisyenEkle(bolumId, akademisyenNo, ad, soyad, sifre, eposta, istel, ceptel,d);
		    if (x==1){
		    	response.sendRedirect("ogreteList.jsp");
		    	/** Akademisyen akademik = new Akademisyen();
		    	request.setAttribute("akademik", akademik);
		    	
		    	akademik.setAkademisyenNo(akademisyenNo);
		    	akademik.setAkademisyenBolumAd(Integer.valueOf(bolumId));
		    	akademik.setAkademisyenAd(ad);
		    	akademik.setAkademisyenSoyad(soyad);
		    	akademik.setAkademisyenSifre(sifre);
		    	akademik.setAkademisyenEposta(eposta);
		    	akademik.setAkademisyenIsTel(istel);
		    	akademik.setAkademisyenCepTel(ceptel);
		    	akademik.setBolumBaskani(d);
		    	
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("akademisyenEklemeBilgi.jsp");
			    dispatcher.forward(request, response);*/
		    }
		    else
		    	response.sendRedirect("hata.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	
	
	
	
	

}
