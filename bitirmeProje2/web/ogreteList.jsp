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
                       <h2 style="color: #269abc;"><%=rs.getString("bolumAd")%> Bölümünün Öğretim Üyeleri </h2><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  } else {
                 
               %>
               <h2 style="color: #269abc;">Tüm Bölümün Öğretim </h2><br>
               <% }%>
                
                
               <table class="footable table table-bordered toggle-circle" id="index">
                   <thead>
                    <tr>
                        <th>Fotoğraf</th>
                        <th>Adı</th>
                        <th>Soyadı</th>
                        <th>Email</th>
                        <th>İş Telefonu</th>
                        <th>Cep Telefonu</th>
                        <th>Bölüm Baskanı mı</th>
                        <th>İşlemleri</th>
                        
                    </tr>
                   </thead>
                   
                   
                    <%
                    
                        
           	        conn = connect.baglanti();
           	        rs = null;
           	        st = null;
                        String sql="";
                        if (yetki.equals("1") || yetki.equals("2")) {
                            sql = "Select akademisyenNo,akademisyenAd,akademisyenSoyad,akademisyenEposta,akademisyenIsTel,akademisyenCepTel,yetki_yetkiId,bolumAd,bolum_bolumId,pasifMi  from akademisyen,akademisyan_has_yetki,bolum where akademisyenNo = akademisyan_akademisyenNo and bolumId = bolum_bolumId and bolumId='"+session.getAttribute("oturumBolum")+"'";
                        }
                        else {
                           sql = "Select akademisyenNo,akademisyenAd,akademisyenSoyad,akademisyenEposta,akademisyenIsTel,akademisyenCepTel,yetki_yetkiId,bolumAd,bolum_bolumId,pasifMi  from akademisyen,akademisyan_has_yetki,bolum where akademisyenNo = akademisyan_akademisyenNo and bolumId = bolum_bolumId";      
                        }
           	        try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(sql);
           	            
           	        
                    %>
                    <tbody>
                    <% while(rs.next()){ %>
                     <tr style="background-color: white ">
                    <% String s;
                       if(rs.getInt("yetki_yetkiId") == 1 )
                    	   s = "Evet";
                       else
                    	   s ="";
                    %>
                    
                        <th><img src="img/business_man_blue.png" style="width:30px;height:30px;"/></th>
                        <td><%=rs.getString("akademisyenAd")%></td>
                        <td><%=rs.getString("akademisyenSoyad")%></td>
                        <td><%=rs.getString("akademisyenEposta")%></td>
                        <td><%=rs.getString("akademisyenCepTel")%></td>
                        <td><%=rs.getString("akademisyenIsTel")%></td>
                        <td><%=s %></td>
                        <% String id = rs.getString("akademisyenNo"); 
                           String id2 = rs.getString("akademisyenNo");
                           String id3 = rs.getString("bolum_bolumId");
                           int pasif = rs.getInt("pasifMi");
                           /**String id3 = rs.getString("akademisyenAd");
                           String id4 = rs.getString("akademisyenSoyad");
                           String id5 = rs.getString("akademisyenEposta");
                           String id6 = rs.getString("akademisyenCepTel");
                           String id7 = rs.getString("akademisyenIsTel");
                           String id8 = rs.getString("bolum_bolumId");
                           String id9 = rs.getString("bolumAd");**/
                        %>
                        <th><a href="akademisyensil.jsp?id=<%=id%>"><button class="btn btn-danger btn bnt- glyphicon glyphicon-trash" type="submit" style="width:50px;height:30px;"  onclick="return window.confirm('Ögretim üyesini silmek istiyormusun?')"></button></a>
                            <a href="akademisyenGunc.jsp?id=<%=id2%>&id1=<%=id3%>"<button class="btn btn-warning btn bnt- glyphicon glyphicon-pencil" type="submit" style="width:50px;height:30px;" onclick="return window.confirm('Ögretim üyesinin bilgilerini güncellemekmi istiyosun?')"/></a>
                            <%if (pasif == 0) {
                                int p = 1;
                            %>
                              <a href="Pasif?id=<%=p%>&id1=<%=id%>"<button class="btn btn-default" type="submit" style="height:30px;" onclick="return window.confirm('Ögretim üyesinin pasifleştirmek istiyormusunuz?')">Pasif Hale Getir</button></a>
                            <%} else {
                                int p = 0;    
                                    %>
                            <a href="Pasif?id=<%=p%>&id1=<%=id%>"<button class="btn btn-success" type="submit" style="height:30px;" onclick="return window.confirm('Ögretim üyesinin aktifleştirmek istiyormusunuz?')">Aktif Hale Getir</button></a>
                            <%}%>
                        </th>
                       
                        
                        
                    </tr>
                        
                         
                    
                    <%}
                    %>
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
               </table>
                    
                    <%
           	        } catch(Exception ex){
           	        	out.println(ex);
           	        }
                    %>
                
              
                
                <a href="ogrtUyeEkle.jsp"> <button  class="btn btn-info" type="submit" value="Ogretim Uyesi Ekle">Öğretim Üyesi Ekle</button> </a>
                
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