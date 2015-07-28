package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import com.bitirmeProje.DAO.ConnectionDB;

public final class duyuru_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\" />\r\n");
      out.write("<title>Duyuru</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link href=\"resources/css/global.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js\"></script>\r\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=IM+Fell+DW+Pica+SC' rel='stylesheet' type='text/css'>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");

        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        try {

        	ConnectionDB connect = new ConnectionDB();
   	        Connection conn = connect.baglanti();

            PreparedStatement st = conn.prepareStatement("SELECT * from duyuru");
            int sayac = 1;

            rs = st.executeQuery();


    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"panel-heading\" style=\"background-color: #333;\"><strong style=\"color:white;font-size: 20px;\">Duyuru</strong> <a href=\"tumDuyuru.jsp\" style=\"float:right;color:white;font-size: 12px;\">Tum duyrulari gor</a></div><br/>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul id=\"ticker_01\" class=\"ticker\" style=\"width:340px;height:318px; list-style-type:none;\">\r\n");
      out.write("    ");
                  while (rs.next() && sayac < 6) {
            String duyuruKonuBaslik = rs.getString("duyuruKonuBaslik");
            String duyuruMesaj = rs.getString("duyuruMesaj");

    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <li style=\"background-color: window\"><hr><strong>Duyuru:&nbsp;&nbsp;</strong><a href=\"#\">");
 out.println(duyuruKonuBaslik); 
      out.write("</a></li>\r\n");
      out.write("            ");

                    sayac = sayac + 1;
                }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</ul>\r\n");
      out.write("\r\n");
      out.write("\r\n");

    } catch (Exception ex) {

        out.println(ex.getMessage());
    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("    function tick() {\r\n");
      out.write("        $('#ticker_01 li:first').slideUp(function() {\r\n");
      out.write("            $(this).appendTo($('#ticker_01')).slideDown();\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    setInterval(function() {\r\n");
      out.write("        tick()\r\n");
      out.write("    }, 5000);\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    function tick2() {\r\n");
      out.write("        $('#ticker_02 li:first').slideUp(function() {\r\n");
      out.write("            $(this).appendTo($('#ticker_02')).slideDown();\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    setInterval(function() {\r\n");
      out.write("        tick2()\r\n");
      out.write("    }, 3000);\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    function tick3() {\r\n");
      out.write("        $('#ticker_03 li:first').animate({'opacity': 0}, 200, function() {\r\n");
      out.write("            $(this).appendTo($('#ticker_03')).css('opacity', 1);\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    setInterval(function() {\r\n");
      out.write("        tick3()\r\n");
      out.write("    }, 4000);\r\n");
      out.write("\r\n");
      out.write("    function tick4() {\r\n");
      out.write("        $('#ticker_04 li:first').slideUp(function() {\r\n");
      out.write("            $(this).appendTo($('#ticker_04')).slideDown();\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    /**\r\n");
      out.write("     * USE TWITTER DATA\r\n");
      out.write("     */\r\n");
      out.write("\r\n");
      out.write("    $.ajax({\r\n");
      out.write("        url: 'http://search.twitter.com/search.json',\r\n");
      out.write("        data: 'q=%23javascript',\r\n");
      out.write("        dataType: 'jsonp',\r\n");
      out.write("        timeout: 10000,\r\n");
      out.write("        success: function(data) {\r\n");
      out.write("            if (!data.results) {\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            for (var i in data.results) {\r\n");
      out.write("                var result = data.results[i];\r\n");
      out.write("                var $res = $(\"<li />\");\r\n");
      out.write("                $res.append('<img src=\"' + result.profile_image_url + '\" />');\r\n");
      out.write("                $res.append(result.text);\r\n");
      out.write("\r\n");
      out.write("                console.log(data.results[i]);\r\n");
      out.write("                $res.appendTo($('#ticker_04'));\r\n");
      out.write("            }\r\n");
      out.write("            setInterval(function() {\r\n");
      out.write("                tick4()\r\n");
      out.write("            }, 4000);\r\n");
      out.write("\r\n");
      out.write("            $('#example_4').show();\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
