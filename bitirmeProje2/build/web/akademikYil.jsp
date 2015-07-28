<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("3")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <title>Yönetim Paneli || Öğretim Üyesi Görüntüle</title>
    
<style>
     .largeIcon{
    font-size: 50px;
    padding-left: 35px;
    padding-right: 35px;
}

a:hover{
    text-decoration: none;
}
.gizli {
    display: none;
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
            <div class="col-md-9">
               
               <h2 style="color: #269abc;">Dönem Aktifleştirme </h2><br>
               <table class="table table-hover">
                   <tr>
                        <th>Akademik Yıl</th>
                        <th>Dönem Ad</th>
                        <th>Aktif Mi</th>
                        <th>Güncelleme</th>
                    </tr>
                <% 
                  ConnectionDB connect = new ConnectionDB();
                  Connection conn = connect.baglanti();
                  ResultSet rs = null;
           	  Statement st = null;
                  String bolum_sorgu;
                  String aktif;
                  if (yetki.equals("3") ) {
                      bolum_sorgu ="Select *from donem";
                      try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(bolum_sorgu);
                            while (rs.next()) { %>
                            <tr>
                            <%if (rs.getInt("aktifMi") == 1) {
                                aktif = "Evet";
                            }
                            else
                                aktif = "";
                               %>
                               
                               <td><%=rs.getString("akademikYil")%></td>   
                               <td><%=rs.getString("donemAd")%></td>
                               <td><%=aktif%></td>
                               <td>
                                   <form action="donemGunc.jsp" method="post">
                                       <input name="akademikYil" value="<%=rs.getString("akademikYil")%>" class="gizli"/>
                                       <input name="donemId" value="<%=rs.getString("donemId")%>" class="gizli"/>
                                       <input name="donemAd" value="<%=rs.getString("donemAd")%>" class="gizli"/>
                                       <button class="btn btn-warning btn bnt- glyphicon glyphicon-pencil" type="submit" style="width:50px;height:30px;" onclick="return window.confirm('Dönem üyesinin bilgilerini güncellemekmi istiyosun?')"></button>
                                   </form>
                               </td>
                            </tr>    
                            
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  } else {
                 
               %>
               
               <% }%>
                
               </table>
                
                <a href="donemEkle.jsp"> <button  class="btn btn-info" type="submit" value="">Dönem Ekle</button> </a>
                <a href="donemAktif.jsp"> <button  class="btn btn-info" type="submit" value="">Dönem Aktifleştir</button> </a>
                
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
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery.min.js"></script>
       
</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>