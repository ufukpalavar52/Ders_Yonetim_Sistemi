<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<% 
   
   String yetki = String.valueOf(session.getAttribute("yetki"));
   if(yetki != null)
    if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
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

    <title>Yönetim Paneli || Öğrenci Görüntüle</title>
    
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
                       <h2 style="color: #269abc;"><%=rs.getString("bolumAd")%> Bölümünün Öğrencileri </h2><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  } else {
                 
               %>
               <h2 style="color: #269abc;">Tüm Bölümün Öğrencileri </h2><br>
               <% }%>
               
                
                <table class="footable table table-bordered toggle-circle" id="index">
                <thead>
                    <tr>
                        <th>Fotoğraf</th>
                        <th>Adı</th>
                        <th>Soyadı</th>
                        <th>Email</th>
                        <th>Telefonu</th>
                        <th>Bölümü</th>            
                        <th>İşlemleri</th>
                        
                    </tr>
                </thead>
                    <%
                    
                       
           	        conn = connect.baglanti();
           	        rs = null;
           	        st = null;
                        String sql;
                        if (yetki.equals("1") || yetki.equals("2")) {
                            sql = "Select ogrenciNo,ogrenciAd,ogrenciSoyad,ogrenciSifre,ogrenciEposta,ogrenciCepTel,bolum_bolumId,bolumAd from ogrenci,bolum where bolum_bolumId=bolumId and bolum_bolumId='"+session.getAttribute("oturumBolum")+"'";
                        } else {
                            sql = "Select ogrenciNo,ogrenciAd,ogrenciSoyad,ogrenciSifre,ogrenciEposta,ogrenciCepTel,bolum_bolumId,bolumAd from ogrenci,bolum where bolum_bolumId=bolumId ";
                        }
                        try {
           	        	st = conn.createStatement();
           	                rs = st.executeQuery(sql);

     
           	        
                    %>
                    <tbody>
                    <% while(rs.next()){ %>
                    <tr style="background-color: white ">
                    
                    
                        <th><img src="img/business_man_blue.png" style="width:30px;height:30px;"/></th>
                        <td><%=rs.getString("ogrenciAd")%></td>
                        <td><%=rs.getString("ogrenciSoyad")%></td>
                        <td><%=rs.getString("ogrenciEposta")%></td>
                        <td><%=rs.getString("ogrenciCepTel")%></td>
                        <td><%=rs.getString("bolumAd")%></td>
                        
                        <% /**String id = rs.getString("akademisyenNo"); 
                           String id2 = rs.getString("akademisyenNo");
                           String id3 = rs.getString("akademisyenAd");
                           String id4 = rs.getString("akademisyenSoyad");
                           String id5 = rs.getString("akademisyenEposta");
                           String id6 = rs.getString("ogrenciCepTel");
                           
                           String id8 = rs.getString("bolumAd");
                           String id9 = rs.getString("bolumAd");*/
                           String id = rs.getString("ogrenciNo");
                        %>
                        <th><a href="ogrenciSil.jsp?id=<%=id%>"><button class="btn btn-danger btn bnt- glyphicon glyphicon-trash" type="submit" style="width:50px;height:30px;" onclick="return window.confirm('Öğrenci bilgilerini silmek istiyosun?')"></button></a>
                            <a href="ogrenciGunc.jsp?id=<%=id%>" class="btn btn-warning btn bnt- glyphicon glyphicon-pencil" type="submit" style="width:50px;height:30px;" ></a>
                        </th>
                    </tr>
                    <%}%>
                       </tbody>
                        
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
                    
                    <%
           	        } catch(Exception ex){
           	        	out.println(ex);
           	        }
                    %>
                </table><hr>
                
                <a href="ogrenciEkle.jsp"> <button  class="btn btn-info" type="submit" value="Öğrenci Ekle">Öğrenci Ekle</button> </a>
                
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
<%} else {
       response.sendRedirect("index.jsp");
   } else
       response.sendRedirect("akademisyenGirisi.jsp");
%>