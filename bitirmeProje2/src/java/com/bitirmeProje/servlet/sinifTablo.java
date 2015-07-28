/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bitirmeProje.servlet;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.lowagie.text.Rectangle;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Toshiba
 */
public class sinifTablo extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
           
            HttpSession session = request.getSession();
            
            
            
            String donem = request.getParameter("donem");
            
            String sinif = request.getParameter("sinif");
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment;filename="+donem+"_"+sinif+"_plani.pdf");
            //String k = "<html>\n<body>\n<table border='1'>\n<tr>\n <td>This is my Project</td> \n</tr>\n</table>\n</body>\n</html>";
            
            String k = String.valueOf(session.getAttribute("tablo"));
            
            
            //out.println(k);
            
            Document document = new Document();
            
            
            document.setPageSize(PageSize.LEGAL.rotate());
            
            
            StringReader reader = new StringReader(k);
            PdfWriter writer ;
            
            writer = PdfWriter.getInstance(document, response.getOutputStream());
            
            
            
            document.open();
            
            
            
            InputStream is = new ByteArrayInputStream(k.getBytes());
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, reader);
            
            document.close();
            response.reset();
            session.removeAttribute("tablo");
        } catch (DocumentException ex) {
            Logger.getLogger(sinifTablo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
