



<%@page import="com.lowagie.text.Rectangle"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="java.util.List"%>
<%@page import="java.io.StringReader"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.lowagie.text.html.simpleparser.StyleSheet"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.bitirmeProje.model.Ders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>

<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.tool.xml.XMLWorkerHelper"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Program</title>
</head>
<body>
<%
   
    String donem = request.getParameter("donem");
    String bolum = request.getParameter("bolum");
    String sinif = request.getParameter("sinif");
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment;filename="+donem+"_"+bolum+"_"+sinif+".pdf");
    //String k = "<html>\n<body>\n<table border='1'>\n<tr>\n <td>This is my Project</td> \n</tr>\n</table>\n</body>\n</html>";
    
    String k = String.valueOf(session.getAttribute("tablo"));
    
    
    //out.println(k);
    
    Document document = new Document();
    
    
    document.setPageSize(PageSize.LEGAL.rotate());
   
    
    StringReader reader = new StringReader(k);
    PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
    document.open();
    
    
    
    InputStream is = new ByteArrayInputStream(k.getBytes());
    XMLWorkerHelper.getInstance().parseXHtml(writer, document, reader);
    
    document.close();
    response.reset();
    session.removeAttribute("tablo");
%>    
    

</body>
</html>
