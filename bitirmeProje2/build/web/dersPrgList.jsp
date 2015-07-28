

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2")) {
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
             <link href="fooTablo/css/bootstrap.min.css" rel="stylesheet">
        <link href="fooTablo/css/footable.core.min.css" rel="stylesheet">
            <link href="fooTablo/css/footable.metro.min.css" rel="stylesheet">
                <link href="fooTablo/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">

                    <script type ="text/javascript" src="fooTablo/js/jquery-2.1.1.min.js"></script>
                    <script type ="text/javascript" src="fooTablo/js/bootstrap.min.js"></script>
                    <script type ="text/javascript" src="fooTablo/js/footable.js"></script>
                    <script type ="text/javascript" src="fooTablo/js/footable.paginate.js"></script>
                    <script type="text/javascript" src="fooTablo/js/footable.sort.js"></script>

    <title>Yönetim Paneli || Ders Programını Listele</title>

    <style>
        .largeIcon{
            font-size: 50px;
            padding-left: 35px;
            padding-right: 35px;
        }

        a:hover{
            text-decoration: none;
        }
    </style>
</head>
<body>
    <br/>
<div class="container panel">
    <div class="row">
        <div class="col-md-12">
            <%@include file="menu.jsp" %>
        </div>
    </div>
</div>


<%@include file="adminIslem.jsp" %>

<br/><br/><br/>




<div class="container">
    <div class="row">
        <div class="col-md-12">

            <% 
                  ConnectionDB connect = new ConnectionDB();
                  Connection conn = connect.baglanti();
                  ResultSet rs = null;
           	  Statement st = null;
                  String bolum_sorgu;
                  if (yetki.equals("1") || yetki.equals("2")) {
                      bolum_sorgu ="Select bolumAd from bolum where bolumId = '"+session.getAttribute("oturumBolum")+"'";
                      try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(bolum_sorgu);
                            if (rs.next()) { %>
                       <h2 style="color: #269abc;"><%=rs.getString("bolumAd")%> Bölümünün Ders Programı Hazırlama Kısmı </h2><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  } else {
                 
               %>
               <h2 style="color: #269abc;">Tüm Bölümünün Ders Programı Hazırlama Kısmı </h2><br>
               <% }%>

            <table class="footable table table-bordered toggle-circle" id="index">
                <thead>
                <tr>
                    <th>Fotoğraf</th>
                    <th>Adi</th>
                    <th>Soyadı</th>
                   


                    <th>İslemler</th>

                </tr>
                </thead>
                <tbody>
                
                <%
                connect = new ConnectionDB();   
                conn = connect.baglanti();
           	        rs = null;
           	        st = null;
                        String sql="";
                        if (yetki.equals("1") || yetki.equals("2")) {
                            sql = "Select DISTINCT akademisyenNo,akademisyenAd,akademisyenSoyad,ders.bolum_bolumId  from ders,akademisyen,ders_has_akademisyan,donem where akademisyenNo = akademisyan_akademisyenNo and ders.bolum_bolumId = '"+session.getAttribute("oturumBolum")+"' and dersId = ders_dersId and ders_has_akademisyan.donem_donemId = donemId and aktifMi = 1 ;";
                        }
                        
           	        try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(sql);
           	          
                           while(rs.next()) {     
                    %>
                   
                <tr style="background-color: white ">
                    <th><img src="img/business_man_blue.png" style="width:30px;height:30px;"/></th>
                <td><%=rs.getString("akademisyenAd")%></td>
                <td><%=rs.getString("akademisyenSoyad")%></td>
                



                
                <th><a href="dersPrgAyar.jsp?id=<%=rs.getString("akademisyenNo")%>"> <button  class="btn btn-warning" type="submit" value="Ogretim Uyesi Ekle">Ders Programı Hazırla </button> </a></th>     


                </tr>

                 
                <%} %>
                <tfoot style="background-color: window">
                                        <center>
                                            <tr >
                                                <td colspan="10">
                                            <div class="pagination pagination-centered hide-if-no-paging"></div>
                                            </td>
                                            </tr>
                                        </center>
                                        </tfoot>
                                        
                                          <script type="text/javascript">
                            $('#index').footable();
                        </script>
            </table><hr>
                </tbody>
                <%} catch(Exception ex) {
                       out.println(ex);
                }%>
            </table>

            <a href="dersProgramiDuzenle.jsp"  class="btn btn-primary">Ders Programı Düzenle</a>
            <a href="LabaratuvarDers.jsp" class="btn btn-info">Labaratuvar Dersi Ayarla</a>
        </div>
    </div>
</div><br/><br/>



<div class="container panel">
    <div class="row">
        <hr>
        <div class="col-md-12">

            <%@include file="asagiMenu.jsp" %>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="dist/js/jquery.min.js"></script>

</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>