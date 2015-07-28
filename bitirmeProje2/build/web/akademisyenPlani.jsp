<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <title>Yönetim Paneli || Akademisyen Planı</title>

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




<br/>




<div class="container">
    <div class="row">
        <div class="col-md-12">
            <%String tablo = "<!doctype html>\n<html><head>\n<meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n"
                            +"</head>\n<body>\n"; 
             %>
             
                    <%
                    String akademikYil = "";
                    String donemAd = "";
                    String akademisyenAd = "";
                    String saat[] = {"08:15/09:00","09:15/10:00","10:15/11:00","11:15/12:00","13:00/13:45","14:00/14:45","15:00/15:45","16:00/16:45"};
                    String donem = request.getParameter("donem");
                    String akademisyenNo = request.getParameter("akademisyenNo");
                    %>
                    
                     <%
                                      ConnectionDB connect = new ConnectionDB();
                                      Connection conn = connect.baglanti();
                                      ResultSet rs = null;
                                      Statement st = null;
                                      try {
                                      String sorgu = "Select akademisyenAd,akademisyenSoyad,donemAd,akademikYil from "+
                                      "akademisyen,donem,ders_has_akademisyan where akademisyenNo = '"+akademisyenNo+"' " +
                                       "and akademisyan_akademisyenNo = akademisyenNo and donem_donemId = '"+donem+"' "+
                                       "and donemId = donem_donemId";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(sorgu);
                                      if (rs.next()) {
                                      %>
                                      <center>
                                       <%tablo += "<div style='font-family:calibri;font-size:15px;'>\n<center><h3 style=\"color: black;\">"+rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")+" "+"Planı </h3></center><br/>\n"; %>        
                                      <h3 style="color: #2b669a;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")%> Ders Planı </h3><br>
                                      <%
                                        akademikYil = rs.getString("akademikYil");
                                        donemAd = rs.getString("donemAd");
                                        akademisyenAd = rs.getString("akademisyenAd")+"_"+rs.getString("akademisyenSoyad");
                                      %>
                                      </center>
                    
                    <%
                                      }
                                      else { %>
                                      <center>
                                         <h3 style="color: #ac2925"> Ders Planı Hazır Değil </h3><br>
                                         <%tablo += "<div style='font-family:calibri;font-size:15px;'>\n<center><h3 style=\"color: black;\">Ders Planı Hazır Değil </h3></center><br/>\n"; %> 
                                      </center>
                                         <%}
                                      } catch(Exception ex) {
                                          out.println(ex);
                                      }
                     %>
                    <table class="table table-bordered table-condensed  table-hover ">
                    <%tablo += "<center><table border=\"1\" >\n";%>
                    
                    
                    
                    
                    <br>
                    <%
                    tablo += "<tr style=\"background-color: gray\">\n"
                            + "<th rowspan=\"2\">Saat-Gün</th>\n"
                            + "<th colspan=\"2\">Pazartesi</th>\n"
                            + "<th colspan=\"2\">Salı</th>\n"
                            + "<th colspan=\"2\">Çarşamba</th>\n"
                            + "<th colspan=\"2\">Perşembe</th>\n"
                            + "<th colspan=\"2\">Cuma</th>\n</tr>\n";
                    %>
                   
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
                                      rs = null;
                                      st = null;
                                      
                                     
                       
                     %>
                     <%tablo += "<tr>\n<td>Ders</td>\n"
                             + "<td>Sınıf</td>\n"
                             + "<td>Ders</td>\n"
                             + "<td>Sınıf</td>\n"
                             + "<td>Ders</td>\n"
                             + "<td>Sınıf</td>\n"
                             + "<td>Ders</td>\n"
                             + "<td>Sınıf</td>\n"
                             + "<td>Ders</td>\n"
                             + "<td>Sınıf</td>\n</tr>\n";%>
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
                     <% if (i == 4) {
                        tablo += "<tr style=\"background-color: gray;\">\n"
                                + "<td>12:00/13:00</td>\n"
                                + "<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n</tr>\n";
                     %>
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
                         <%tablo += "<tr>\n<td>"+saat[i]+"</td>\n";%>
                        <td><center><%=saat[i]%></center></td>
                  
                    <%for (int j = 0; j < 5; j++) {
                      String bolum_sorgu = "Select  akademisyenAd,akademisyenSoyad, dersAd, ders.bolum_bolumId, sinifAd,ders_dersId,sinif_sinifId,saat_saatId, gun_gunId, ders_Yil from akademisyen, ders,sinif, dersprogrami where  dersId = ders_dersId and sinifId = sinif_sinifId and"+ 
                      " saat_saatId ='"+(i+1)+"' and gun_gunId = '"+((j%5)+1)+"' and akademisyen.akademisyenNo = '"+akademisyenNo+"' and dersprogrami.akademisyenNo = '"+akademisyenNo+"' "+
                      " and dersprogrami.donem_donemId = '"+donem+"';";
                      st = conn.createStatement();
                      rs = st.executeQuery(bolum_sorgu);
                      if (rs.next()) {
                    
                    %>
                     
                          
                      
                      
                          
                        
                        <td style="height:50px"><%=rs.getString("ders_dersId")+"-"+rs.getString("dersAd")+"<br/>"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")%></td>
                        <td style="height:50px"><%=rs.getString("sinifAd")%></td>
                        <%tablo += "<td>"+rs.getString("ders_dersId")+"-"+rs.getString("dersAd")+"<br/>"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")+"</td>\n"
                                + "<td>"+rs.getString("sinifAd")+"</td>\n";%> 
                    
                   
                    <%} else {
                       tablo += "<td style=\"height:50px; width: 150px;\"></td>\n<td style=\"height:50px; width: 60px;\"></td>\n";
                      
                    %>
                    
                    <td style="width:600px ; height:50px;"></td>
                    <td style="height:50px"></td>
                    <%}
                    
                    st = null;
                    rs = null;
                    
                    }%>
                   <%tablo += "</tr>";%>
                    </tr>
                    <%}%>
                    
                <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%>   
               
            </table><hr>
            <%tablo += "</table></center>\n</div>\n</body>\n</html>";
             session.setAttribute("tablo", tablo);
            %>
            <form  action="akademisyenTablo" method="post">
                
                <input type="text" name="donem" class="gizli" value="<%=akademikYil+"_"+donemAd%>"/>
                <input type="text" name="akademisyen" class="gizli" value="<%=akademisyenAd%>"/>
                
                <button type="submit" class="btn btn-success">indir</button>    
            </form>


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
