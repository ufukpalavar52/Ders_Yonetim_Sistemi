<%-- 
    Document   : sinifGoster
    Created on : 11.May.2015, 21:04:17
    Author     : Toshiba
--%>

<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
                    String saat[] = {"08:15/09:00","09:15/10:00","10:15/11:00","11:15/12:00","13:00/13:45","14:00/14:45","15:00/15:45","16:00/16:45"};
                    String str[] = request.getParameter("id").split(" ");
                    String donem = str[1];
                    String sinif = str[0];
                    
                    ConnectionDB connect = new ConnectionDB();
                    Connection conn = connect.baglanti();
                                      
                    try {
                         ResultSet rs = null;
                         Statement st = null;
                         String sinif_sorgu = "Select sinifAd,donemAd,akademikYil from donem, sinif where sinifId = '"+sinif+"' and donemId='"+donem+"'";
                         st = conn.createStatement();
                         rs = st.executeQuery(sinif_sorgu);
                         
                         if (rs.next()) {
                    
                    
                    %>
                    <center>
                    <h3 style="color: #2b669a;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+" Dönemi "+rs.getString("sinifAd")%> Dersliğini Planı </h3><br>
                    </center>
                    <% } %>
                    <% 
                            
                    }catch(Exception ex) {
                           out.println(ex);
                       }
                    
                    %>
                    <table class="table table-bordered table-condensed  table-hover ">
            
                   
                    
                    
                    
                    <br>

                    <tr class="active">
                    <th rowspan="2" ><center>Saat-Gün</center></th>
                    <th ><center>Pazartesi</center></th>
                    <th ><center>Salı</center></th>
                    <th ><center>Çarşamba</center></th>
                    <th ><center>Perşembe</center></th>
                    <th ><center>Cuma</center></th>

                    </tr>
                    <%
                                      connect = new ConnectionDB();
                                      conn = connect.baglanti();
                                      
                                      try {
                                      ResultSet rs = null;
                                      Statement st = null;
                                      
                                      
                                     
                       
                     %>
                    <tr>

                    <td><center>Ders</center></td>
                  
                    <td><center>Ders</center></td>
                    
                    <td><center>Ders</center></td>                 
                    
                    <td><center>Ders</center></td>
                    
                   <td><center>Ders</center></td>
                    

                    </tr>
                    <%for (int i = 0; i < 8; i++) { %> 
                    <% if (i == 4) {%>
                    <tr class="active">
                        <td><center>12:00/13:00</center></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%}%>
                    <tr>
                        <td><center><%=saat[i]%></center></td>
                  
                    <%for (int j = 0; j < 5; j++) {
                      String bolum_sorgu = "Select akademisyenAd,akademisyenSoyad, dersAd, sinif_sinifId,saat_saatId, gun_gunId,ders_dersId from akademisyen, ders,sinif, dersprogrami where  dersId = ders_dersId and sinif_sinifId = '"+sinif+"' and"+ 
                      " saat_saatId ='"+(i+1)+"' and gun_gunId = '"+((j%5)+1)+"' and akademisyen.akademisyenNo = dersprogrami.akademisyenNo "+
                      " and dersprogrami.donem_donemId = '"+donem+"' ";
                      st = conn.createStatement();
                      rs = st.executeQuery(bolum_sorgu);
                      if (rs.next()) {
                    
                    %>
                     
                          
                      
                      
                          
                     
                        <td style="width: 400px; height:50px"><%=rs.getString("ders_dersId")+"-"+rs.getString("dersAd")+"<br/>"%></td>
                       
                 
                    
                   
                    <%} else {%>
                    
                    <td style="width: 400px; height:50px"></td>
                    
                    <%}
                    
                    st = null;
                    rs = null;
                    
                    }%>
                   
                    </tr>
                    <%}%>
                    
                <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%>   
               
            </table>
</body>
</html>
