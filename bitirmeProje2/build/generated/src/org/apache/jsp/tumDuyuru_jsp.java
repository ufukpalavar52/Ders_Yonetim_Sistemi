package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.*;
import com.bitirmeProje.DAO.ConnectionDB;

public final class tumDuyuru_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/menu.jsp");
    _jspx_dependants.add("/akademisyenLogin.jsp");
    _jspx_dependants.add("/ogrenciGirisi.jsp");
    _jspx_dependants.add("/asagiMenu.jsp");
  }

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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/style.css\" />\r\n");
      out.write("\r\n");
      out.write("        <title>Duyrular</title>\r\n");
      out.write("        \r\n");
      out.write("        <style>\r\n");
      out.write("a:link {text-decoration: none;}\r\n");
      out.write("a:visited {text-decoration: none;}\r\n");
      out.write("a:hover {text-decoration: none;}\r\n");
      out.write("a:active {text-decoration: none;}\r\n");
      out.write("            \r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <br/>\r\n");
      out.write("    <div class=\"container panel\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-md-12\">\r\n");
      out.write("                ");
      out.write('\r');
      out.write('\n');

request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("    <title>Omü Mühendislik</title>\r\n");
      out.write("    \r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/css/bootstrap.min.css\"/>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\"/>\r\n");
      out.write("    <link href=\"http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <script src=\"dist/js/bootsrap.js\" ></script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"span12\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <a href=\"http://mf.omu.edu.tr\" title=\"Omu Muhendislik Sayfasi\"><img src=\"img/omu_muhendislik.jpg\" style=\"width: 100px;height:100px;\"> </a>\r\n");
      out.write("\r\n");
      out.write("            &nbsp;&nbsp;&nbsp;<a href=\"index.jsp\" style=\"text-decoration: none;\"><strong style=\"font-size: 20px;color: #2aabd2;\">Omü Mühendislik Ders Yönetim Sistemi</strong>          \r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<br/>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"navbar navbar-default \"  style=\"background-color: #444444;\">\r\n");
      out.write("    \r\n");
      out.write("    ");
String oturum = (String)session.getAttribute("oturum"); 
      out.write("\r\n");
      out.write("    <div class=\"navbar-header\">\r\n");
      out.write("        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("            <span class=\"icon-bar\"></span>\r\n");
      out.write("            <span class=\"icon-bar\"></span>\r\n");
      out.write("            <span class=\"icon-bar\"></span>\r\n");
      out.write("\r\n");
      out.write("        </button>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("        ");

        
        if(session.getAttribute("oturum") != null){
           
            if (session.getAttribute("yetki") == null){
               
             
       
      out.write("\r\n");
      out.write("    \r\n");
      out.write("     <ul class=\"nav navbar-nav navbar-right\" style=\"position: relative;left: 0px;\">\r\n");
      out.write("            <li class=\"dropdown \" style=\"float:right;\">\r\n");
      out.write("                <a href=\"\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" style=\"color: white; background-color: #444444;\">");
      out.print(session.getAttribute("oturum"));
      out.write("<span class=\"caret\"></span></a>\r\n");
      out.write("                <ul class=\"dropdown-menu\" role=\"menu\">\r\n");
      out.write("                    <li><a href=\"profilAyar.jsp\">Profil Ayarları</a></li>\r\n");
      out.write("                    <li><a href=\"oturumKapat.jsp\">Çıkış</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </ul>\r\n");
      out.write("\r\n");
      out.write("            </li>\r\n");
      out.write("                \r\n");
      out.write("     </ul>\r\n");
      out.write("         ");
} else {
      out.write("\r\n");
      out.write("         <ul class=\"nav navbar-nav navbar-right\" style=\"position: relative;left: 0px;\">\r\n");
      out.write("             \r\n");
      out.write("            <li class=\"dropdown \" style=\"float:right;\">\r\n");
      out.write("                <a href=\"\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" style=\"color: white; background-color: #444444;\">");
      out.print(session.getAttribute("oturum"));
      out.write("<span class=\"caret\"></span></a>\r\n");
      out.write("                <ul class=\"dropdown-menu\" role=\"menu\">\r\n");
      out.write("                    <li><a href=\"AkademisyenprofilAyar.jsp\">Profil Ayarları</a></li>\r\n");
      out.write("                    <li><a href=\"oturumKapat.jsp\">Çıkış</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </ul>\r\n");
      out.write("\r\n");
      out.write("            </li>\r\n");
      out.write("                ");
 String yetki1 = String.valueOf(session.getAttribute("yetki"));
               
               if (yetki1.equals("1") || yetki1.equals("2") || yetki1.equals("3")) {
      out.write("\r\n");
      out.write("                   \r\n");
      out.write("                   <li><a href=\"adminPaneli.jsp\" style=\"color: white;\">Admin</a></li>\r\n");
      out.write("              ");
  } 
      out.write("\r\n");
      out.write("                \r\n");
      out.write("          </ul>\r\n");
      out.write("                \r\n");
      out.write("         \r\n");
      out.write("        ");
}}
      out.write("\r\n");
      out.write("                \r\n");
      out.write("    <div class=\"navbar-collapse collapse\" style=\"float:left;\">\r\n");
      out.write("        <ul class=\"nav navbar-nav\" >\r\n");
      out.write("\r\n");
      out.write("            <li><a href=\"index.jsp\" style=\"color: white;\"><strong style=\"color: white;\">AnaSayfa</strong></a></li>\r\n");
      out.write("            <li><a href=\"hakkinda.jsp\" style=\"color: white;\"><strong style=\"color: white;\">Hakkımızda</strong></a></li>\r\n");
      out.write("            <li><a href=\"contact.jsp\" style=\"color: white;\"><strong style=\"color: white;\">İletişim</strong></a></li>\r\n");
      out.write("            <li class=\"dropdown\" >\r\n");
      out.write("                <a href=\"\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" style=\"background-color:#444444; \" ><strong style=\"color: white;\">Sisteme Giriş</strong> <b class=\"caret\"></b></a>\r\n");
      out.write("                <ul class=\"dropdown-menu\">\r\n");
      out.write("                    <li><a href=\"#myAkademisyan\" data-toggle=\"modal\">Akademisyen Girişi</a></li>\r\n");
      out.write("                    <li><a href=\"#myOgrenci\" data-toggle=\"modal\">Öğrenci Girişi</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"dropdown\" >\r\n");
      out.write("                <a href=\"\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" style=\"background-color:#444444; \" ><strong style=\"color: white;\">Planlar</strong> <b class=\"caret\"></b></a>\r\n");
      out.write("                <ul class=\"dropdown-menu\">\r\n");
      out.write("                    <li><a href=\"bolumPlani.jsp\">Bölüm Planı</a></li>\r\n");
      out.write("                    <li><a href=\"sinifPlani.jsp\" >Sınıf Planı</a></li>\r\n");
      out.write("                    <li><a href=\"ogretimPlani.jsp\" >Öğretim Üyesi Planı</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("\r\n");
      out.write("           \r\n");
if (session.getAttribute("oturum")!=null) {
      out.write("\r\n");
      out.write("            <li><a href=\"yakinIndex.jsp\" style=\"color: white;\"><strong style=\"color: white;float: left;\">OMÜ Dosya Paylaşım Sistesi</strong></a></li>\r\n");
      out.write(" ");
}
      out.write("\r\n");
      out.write("            \r\n");
      out.write("\r\n");
      out.write("        </ul>\r\n");
      out.write("             \r\n");
      out.write("          \r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"modal fade\" id=\"myAkademisyan\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\r\n");
      out.write("        <div class=\"modal-dialog\">\r\n");
      out.write("            <div class=\"modal-content\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>Akademisyen Login</title>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/bootstrap.min.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-md-6\">\r\n");
      out.write("\r\n");
      out.write("                <h2>Akademisyen Girişi </h2> <hr/>\r\n");
      out.write("                <form class=\"form-horizontal\" action=\"./akademisyenGirisKontrol\" method=\"post\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"akademisyenNo\" class=\"col-sm-2 control-label\">Akademisyen No</label>\r\n");
      out.write("                        <div class=\"col-sm-6\">\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"akademisyenNo\" placeholder=\"Akademisyen Numaranızı Giriniz\" required autofocus/>\r\n");
      out.write("                        </div>   \r\n");
      out.write("                    </div> \r\n");
      out.write("\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"password\" class=\"col-sm-2 control-label\" >Şifre</label>\r\n");
      out.write("                        <div class=\"col-sm-6\">\r\n");
      out.write("                            <input type=\"password\" class=\"form-control\" name=\"akademisyenSifre\" placeholder=\"Şifrenizi Giriniz\" required autofocus/>\r\n");
      out.write("                        </div>   \r\n");
      out.write("                    </div> \r\n");
      out.write("\r\n");
      out.write("                    <div class=\"form-group\" style=\"float:center;\">\r\n");
      out.write("                        <div class=\"col-sm-offset-2 col-sm-6\">\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Giriş</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"sifreUnutuldu.jsp\">Şifremi Unuttum</a>\r\n");
      out.write("                        </div>   \r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                    <button class=\"btn btn-danger\" data-dismiss=\"modal\" aria-hidden=\"true\">Kapat</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"modal fade\" id=\"myOgrenci\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\r\n");
      out.write("        <div class=\"modal-dialog\">\r\n");
      out.write("            <div class=\"modal-content\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    \r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/css/bootstrap.min.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("   \r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-md-6\">\r\n");
      out.write("                \r\n");
      out.write("                <h2>Öğrenci Girişi </h2> <hr/>\r\n");
      out.write("                <form class=\"form-horizontal\" action=\"./ogrenciGirisKontrol\" method=\"POST\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"ogrenciNo\" class=\"col-sm-2 control-label\">Öğrenci No</label>\r\n");
      out.write("                        <div class=\"col-sm-6\">\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"ogrenciNo\" placeholder=\"Öğrenci Numaranızı Giriniz\" required autofocus/>\r\n");
      out.write("                        </div>   \r\n");
      out.write("                    </div> \r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"password\" class=\"col-sm-2 control-label\" >Şifre</label>\r\n");
      out.write("                        <div class=\"col-sm-6\">\r\n");
      out.write("                            <input type=\"password\" class=\"form-control\" name=\"ogrenciSifre\" placeholder=\"Şifrenizi Giriniz\" required autofocus/>\r\n");
      out.write("                        </div>   \r\n");
      out.write("                    </div> \r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"form-group\" style=\"float:center;\">\r\n");
      out.write("                        <div class=\"col-sm-offset-2 col-sm-6\">\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Giriş</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"sifreUnutuldu.jsp\">Şifremi Unuttum</a>\r\n");
      out.write("                        </div>   \r\n");
      out.write("                    </div>\r\n");
      out.write("                  \r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                    <button class=\"btn btn-danger\" data-dismiss=\"modal\" aria-hidden=\"true\">Kapat</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!--Slider-->\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"col-md-10\">\r\n");
      out.write("        \r\n");
      out.write("            <h2>Tum Duyurular</h2><br>\r\n");
      out.write("            ");

               
                Statement stm = null;
                ResultSet rs = null;

                try {
                	ConnectionDB connect = new ConnectionDB();
           	        Connection conn = connect.baglanti();
                    PreparedStatement st = conn.prepareStatement("SELECT * from duyuru order by duyuruId desc");
                    int saygac = 1;

                    rs = st.executeQuery();
                    int sayac=0;
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            \r\n");
      out.write(" ");
 while (rs.next() && sayac < 11) {
      out.write("\r\n");
      out.write(" <br>\r\n");
      out.write(" <div class=\"panel-group\" id=\"accordion\">\r\n");
      out.write(" <div style=\";\" class=\"col-md-12\">\r\n");
      out.write("     ");
if(sayac%2==0){
      out.write("\r\n");
      out.write("             <div class=\"panel panel-primary\"> \r\n");
      out.write("     ");
}
     else{
         
      out.write("\r\n");
      out.write("     <div class=\"panel panel-info\"> \r\n");
      out.write("         ");
}
     
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" style=\"text-decoration: none;\" href=\"#");
      out.print(sayac );
      out.write('"');
      out.write('>');
 out.println(rs.getString("duyuruId") + ". " + rs.getString("duyuruKonuBaslik")); 
      out.write("</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("           \r\n");
      out.write("            \r\n");
      out.write("          </div>\r\n");
      out.write("            \r\n");
      out.write("          <div id=\"");
      out.print(sayac );
      out.write("\" class=\"panel-collapse collapse\">\r\n");
      out.write("            <div class=\"panel-body\">");
 out.println(rs.getString("duyuruMesaj")); 
      out.write("</div>\r\n");
      out.write("          </div>\r\n");
      out.write("             </div>\r\n");
      out.write("      \r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" </div>\r\n");
      out.write(" </div>");

 sayac = sayac + 1;
      }
      out.write(" \r\n");
      out.write("               \r\n");
      out.write("              \r\n");
      out.write("                ");


                    } catch (Exception ex) {

                        out.println(ex.getMessage());
                    }
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("            \r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container panel\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <hr>\r\n");
      out.write("            <div class=\"col-md-12\">\r\n");
      out.write("\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("    <div id=\"footer\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <p class=\"text-muted credit\" ><strong>İlkin,Ufuk,Fatih Tasarımıdır &copy; 2015 Company,Tüm Hakları Saklıdır.</strong></p> \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>   \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"dist/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"dist/js/jquery.min.js\"></script>\r\n");
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