<%-- 
    Document   : dersProgramiAl
    Created on : 11.May.2015, 19:38:57
    Author     : Toshiba
--%>

<%@page import="java.util.ArrayList"%>
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
                    int d = 0;
                    String saat[] = {"08:15/09:00","09:15/10:00","10:15/11:00","11:15/12:00","13:00/13:45","14:00/14:45","15:00/15:45","16:00/16:45"};
                    String bilgi[] = request.getParameter("id").split(" ");
                    String donem = bilgi[2];
                    String bolum = String.valueOf(session.getAttribute("oturumBolum"));
                    String dersSinif = bilgi[1];
                    ArrayList <String> dersx = new ArrayList <String>(); 
                    ArrayList <String> sinifx = new ArrayList <String>();
                    %>
                    <%
                    ConnectionDB connect = new ConnectionDB();
                    Connection conn = connect.baglanti();
                                      
                                      try {
                                      ResultSet rs = null;
                                      Statement st = null;
                                      String sorgu = "Select bolumAd,donemAd,akademikYil from bolum, donem where bolumId = '"+bolum+"' "+
                                      "and donemId='"+donem+"'";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(sorgu);
                                      if (rs.next()) {
                                      
                                     
                       
                     %>
                     <center><h3 style="color: #2b669a;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("bolumAd")+"/"+dersSinif%>.Sınıf/Ders Programı </h3></center>
                     <%}%>
                    
                    <%} catch(Exception ex) {
                        out.println(ex);
                    }%>
                    <table class="table table-bordered table-condensed  table-hover">
            
                   
                    
                    
                    
                    <br>

                    <tr class="active">
                    <th rowspan="2"><center>Saat-Gün</center></th>
                    <th colspan="2"><center>Pazartesi</center></th>
                    <th colspan="2"><center>Salı</center></th>
                    <th colspan="2"><center>Çarşamba</center></th>
                    <th colspan="2"><center>Perşembe</center></th>
                    <th colspan="2"><center>Cuma</center></th>

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
                    <td><center>Sınıf</center></td>
                    <td><center>Ders</center></td>
                    <td><center>Sınıf</center></td>
                    <td><center>Ders</center></td>                 
                    <td><center>Sınıf</center></td>
                    <td><center>Ders</center></td>
                    <td><center>Sınıf</center></td>
                   <td><center>Ders</center></td>
                    <td><center>Sınıf</center></td>

                    </tr>
                    <%for (int i = 0; i < 8; i++) {%> 
                    <% if (i == 4) {%>
                    <tr class="active">
                        <td><center>12:00/13:00</center></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
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
                      String bolum_sorgu = "Select akademisyenAd,akademisyenSoyad, dersAd, ders.bolum_bolumId, sinifAd,ders_dersId,sinif_sinifId,saat_saatId, gun_gunId, ders_Yil from akademisyen, ders,sinif, dersprogrami where  dersId = ders_dersId and sinifId = sinif_sinifId and"+ 
                      " saat_saatId ='"+(i+1)+"' and gun_gunId = '"+((j%5)+1)+"' and akademisyen.akademisyenNo = dersprogrami.akademisyenNo "+
                      " and dersprogrami.donem_donemId = '"+donem+"' and ders.bolum_bolumId =' "+bolum+"' and ders_Yil = '"+dersSinif+"'";
                      st = conn.createStatement();
                      rs = st.executeQuery(bolum_sorgu);
                      d = 0;
                      int k = 0;
                      while (rs.next()) {
                      d = 1;
                    %>
                     
                          
                      
                      
                          
                        <%
                          dersx.add(rs.getString("ders_dersId"));
                          dersx.add(rs.getString("dersAd"));
                          sinifx.add(rs.getString("sinifAd"));
                      }
                        %>
                    
                        <td style="height:50px; width: 200px;" >
                          
                            <%for (int x = 0; x < dersx.size(); x++) {
                                out.println(dersx.get(x));
                                if (x % 2 == 1 && x != dersx.size()-1) { 
                                   
                                    %>
                                    /
                                 <%}
                            }
                            
                            %>
                          
                        </td>
                      
                        
                        <td style="height:50px; width: 80px;">
                            <%String s = "";%>
                            <%for (int x = 0; x < sinifx.size(); x++) {
                                out.println(s+sinifx.get(x));
                                if(x != sinifx.size()-1)
                                    out.println("/");
                            }
                            
                            %>
                           
                        </td>
                        
                    
                   
                    <%
                      
                      
                      dersx.clear();
                      sinifx.clear();
                      if (d == 0) {%>
                    
                    
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
