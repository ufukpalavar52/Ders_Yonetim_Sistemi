package com.bitirmeProje.servlet;

import com.bitirmeProje.DAO.DersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/dersAtaGunc")
public class dersAtaGunc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dersAtaGunc() {
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
		response.setContentType("text/html; charset=utf-8");
	
	    PrintWriter out = response.getWriter();
		String akademisyenNo = request.getParameter("ogretimUyesi");
	    String dersId = request.getParameter("bolumders");
	    String dersId2 = request.getParameter("id");
            int donem = Integer.valueOf(request.getParameter("donemId"));
	    
	    DersDAO  ders = new DersDAO();
	    try {
                        int d1 = ders.DersProgramiKontrol(akademisyenNo, dersId2, donem);
                    if (d1 == 0) {    
			int d = ders.AkademisyenDersGnc(dersId, akademisyenNo,dersId2,donem);
			if (d == 1)
				response.sendRedirect("dersAtaList.jsp");
			else
				response.sendRedirect("hata.jsp");
                    }
                    else {
                        HttpSession session = request.getSession();
                        session.setAttribute("dersProgramiKontrol","1");
                        response.sendRedirect("dersAtaGuncelle.jsp?id="+akademisyenNo+"&id1="+dersId2);
                    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    
	    
	}

}
