<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "com.bitirmeProje.model.Ders" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Yönetim Paneli || Ders Atamaları</title>
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

       
        <style>
            .largeIcon{
                font-size: 50px;
                padding-left: 35px;
                padding-right: 35px;
            }

            a:hover{
                text-decoration: none;
            }
            .gizli{
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
                       <h2 style="color: #269abc;"><%=rs.getString("bolumAd")%> Bölümünün Ders Atamaları </h2><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  } else {
                 
               %>
               <h2 style="color: #269abc;">Tüm Bölümün Ders Atamaları </h2><br>
               <% }%>
                <table class="footable table table-bordered toggle-circle" id="index">
                    <thead>
                    <tr>
                        <th>Fotoğraf</th>
                        <th>Adı</th>
                        <th>Soyadı</th>
                        
                        <th>Verdiği Desler</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                    
                        
           	        conn = connect.baglanti();
           	        rs = null;
           	        st = null;
                        String sql;
                        if (yetki.equals("1") || yetki.equals("2"))
                            sql = "Select DISTINCT akademisyenNo, akademisyenAd, akademisyenSoyad  from akademisyen, ders, ders_has_akademisyan,donem Where akademisyenNo = akademisyan_akademisyenNo and ders_dersId = dersId and ders.bolum_bolumId = '"+session.getAttribute("oturumBolum")+"' and ders_has_akademisyan.donem_donemId = donemId and aktifMi=1";
           	        else
                            sql = "Select DISTINCT akademisyenNo, akademisyenAd,akademisyenSoyad   from akademisyen,donem, ders, ders_has_akademisyan Where akademisyenNo = akademisyan_akademisyenNo and ders_dersId = dersId and ders_has_akademisyan.donem_donemId = donemId and aktifMi=1";
                        try {
           	        	st = conn.createStatement();
                                rs = st.executeQuery(sql);
           	            		
                                while(rs.next()){
           	            	
           	            
           	        
                    %>
                    
                    <tr style="background-color: white ">
                        <td><img src="img/business_man_blue.png" style="width:30px;height:30px;"/></td>
                    <td><%=rs.getString("akademisyenAd")%></td>
                    <td><%=rs.getString("akademisyenSoyad")%></td>
                    

                    
                    <th>
                    <form action="akademisyenDersGoster.jsp" method="post">
                        <input type="text" name="akademisyenNo" value="<%=rs.getString("akademisyenNo")%>" class="gizli"/>
                        <button class="btn btn-success btn bnt- glyphicon glyphicon-list" type="submit" style="width:50px;height:30px;" ></button>
                        
                    </form>
                    </th>



                    </tr>
                    
                    <%
           	            }
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
                                        </table><hr>
                                
                                <%
           	        } catch(Exception ex){
           	        	out.println(ex);
           	        }
                    %>
                

                <a href="dersAtaYap.jsp"> <button  class="btn btn-info" type="submit" value="Ders Atamasi Yap">Ders Ataması Yap</button> </a>

            </div>
        </div>
    </div><br/><br/>



    <div class="container panel">
        <div class="row">
            <hr>
            <div class="col-md-12">

                <%@include file="asagiMenu.jsp"%> 
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