package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminIslem_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"ogreteList.jsp\" class=\"hover\">\r\n");
      out.write("                    <img src=\"img/business_man_blue.png\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong> Öğretim Üyesi</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"dersList.jsp\" class=\"hover\"> <img src=\"img/blackboard.png\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Ders</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"dersAtaList.jsp\" class=\"hover\"> <img src=\"img/pencil.png\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Ders Ata</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"dersPrgList.jsp\"> <img src=\"img/date.png\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong>Ders Programı</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"ogrenciList.jsp\"> <img src=\"img/ogrenci.png\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong>Öğrenci İşlemleri</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"duyuruPaylas.jsp\"> <img src=\"img/duyuru.jpg\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong>Duyuru İşlemleri</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"col-md-2\" style=\"height: 150px; width: 150px;\">\r\n");
      out.write("\r\n");
      out.write("                <a style=\"text-decoration: none;\" href=\"bolumBilgileriGir.jsp\"> <img src=\"img/images.jpg\" style=\"width:60px;height: 60px;\"/><br><br>\r\n");
      out.write("                    <strong>Bölüm İşlemleri</strong></a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
