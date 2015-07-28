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
                  String akademisyenNo = request.getParameter("akademisyenNo");
                  ConnectionDB connect = new ConnectionDB();
                  Connection conn = connect.baglanti();
                  ResultSet rs = null;
           	  Statement st = null;
                  String bolum_sorgu;
                  
                      bolum_sorgu ="Select akademisyenAd,akademisyenSoyad,akademisyenNo,akademikYil,donemAd from akademisyen,ders_has_akademisyan,donem where akademisyenNo='"+akademisyenNo+"' and akademisyan_akademisyenNo='"+akademisyenNo+"' and donem_donemId=donemId and aktifMi=1;  ";
                      try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(bolum_sorgu);
                            if (rs.next()) { %>
                       <h2 style="color: #080808"><%=rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")+"  "+rs.getString("akademikYil")+"/"+rs.getString("donemAd")%> Dönemi Verdiği Dersler </h2><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  
                 
               %>
               
                <table class="table table-hover">
                    <tr>
                        
                      
                        <th>Verdiği Dersler</th>
                        <th>Teorik</th>
                        <th>Uygulama</th>
                        <th>Laboratuar</th>
                        <th>Kredi</th>
                        <th>Düzenleme</th>
                        <th>Silme</th>

                    </tr>
                    <%
                    
                        
           	        conn = connect.baglanti();
           	        rs = null;
           	        st = null;
                        String sql;
                        if (yetki.equals("1") || yetki.equals("2"))
                            sql = "Select dersAkId, akademisyenNo, dersAd,dersId,dersKredi,teorikDersSaati,pratikDersSaati,labDersSaati,donemId  from akademisyen, ders, ders_has_akademisyan,donem Where akademisyenNo = akademisyan_akademisyenNo and ders_dersId = dersId and ders.bolum_bolumId = '"+session.getAttribute("oturumBolum")+"' and ders_has_akademisyan.donem_donemId = donemId and aktifMi=1 and akademisyenNo='"+request.getParameter("akademisyenNo")+"';";
           	        else
                            sql = "Select dersAkId, akademisyenNo, dersAd,dersId,dersKredi,teorikDersSaati,pratikDersSaati,labDersSaati,donemId  from donem, akademisyen, ders, ders_has_akademisyan Where akademisyenNo = akademisyan_akademisyenNo and ders_dersId = dersId and ders_has_akademisyan.donem_donemId = donemId and aktifMi=1 and akademisyenNo='"+request.getParameter("akademisyenNo")+"';";
                        try {
           	        	st = conn.createStatement();
                                rs = st.executeQuery(sql);
           	            		
                                while(rs.next()){
           	            	
           	            
           	        
                    %>

                    <tr>
                        
                    
                    <td><%=rs.getString("dersId")+"-"+rs.getString("dersAd")%><br></td>
                    <% String dersSil = "dersAkademisyenSil.jsp?id="+rs.getString("dersAkId")+"&id1="+rs.getString("akademisyenNo")+"&id2="+rs.getString("donemId")+"&id3="+rs.getString("dersId");
                       String dersGunc = rs.getString("akademisyenNo");
                       String id1= rs.getString("dersId");
                       
                      
                    %>
                    <td><%=rs.getString("teorikDersSaati")%></td>
                    <td><%=rs.getString("pratikDersSaati")%></td>
                    <td><%=rs.getString("labDersSaati")%></td>
                    <td><%=rs.getString("dersKredi")%></td>
                    <th><a href="dersAtaGuncelle.jsp?id=<%=dersGunc %>&id1=<%=id1%>"><button class="btn btn-warning btn bnt- glyphicon glyphicon-pencil" type="submit" style="width:50px;height:30px;" onclick="return window.confirm('Ogretim uyesinin bilgilerini guncellemekmi istiyosun?')" ></button></a></th>
                    <th><a href="<%=dersSil %>"> <button class="btn btn-danger btn bnt- glyphicon glyphicon-trash"  style="width:50px;height:30px;" onclick="return window.confirm('Simek için eminmisiniz')"></button></a></th>



                    </tr>
                    <%
           	            }
           	        } catch(Exception ex){
           	        	out.println(ex);
           	        }
                    %>
                </table><hr>


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
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery.min.js"></script>
</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>