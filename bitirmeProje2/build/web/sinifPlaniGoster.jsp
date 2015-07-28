
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String tablo = "<!doctype html>\n<html><head>\n<meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n "
        +"</head>\n<body>\n"; 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    
    <title>Yönetim Paneli || Sınıf Planı</title>

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
             
                    <%
                    String akademikYil="";
                    String donemAd="";
                    String sinifAd="";
                    String saat[] = {"08:15/09:00","09:15/10:00","10:15/11:00","11:15/12:00","13:00/13:45","14:00/14:45","15:00/15:45","16:00/16:45"};
                    String donem = request.getParameter("donem");
                    
                    String sinif = request.getParameter("sinif");
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
                     <%tablo += "<div style='font-family:calibri;font-size:15px;'>\n<center><h3 style=\"color: black;\">"+rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("sinifAd")+" "+"Planı </h3></center><br/>\n"; %>    
                    <h3 style="color: #2b669a;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+" Dönemi "+rs.getString("sinifAd")%> Dersliğini Planı </h3><br>
                    </center>
                    <% 
                      donemAd = rs.getString("donemAd");
                      akademikYil = rs.getString("akademikYil");
                      sinifAd = rs.getString("sinifAd");
                         
                        } %>
                    <% 
                            
                    }catch(Exception ex) {
                           out.println(ex);
                       }
                    
                    %>
                    <table class="table table-bordered table-condensed  table-hover ">
                    <%tablo +="<center><table border=\"1\" >\n"
                            + "<tr style=\"background-color: gray;\">\n<th rowspan=\"2\">Saat-Gün</th>\n"
                            + "<th>Pazartesi</th>\n"
                            + "<th>Salı</th>\n"
                            + "<th>Çarşamba</th>\n"
                            + "<th>Perşembe</th>\n"
                            + "<th>Cuma</th>\n</tr>\n";%>
                   
                    
                    
                    
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
                    <%tablo += "<tr>\n"
                            + "<td><center>Ders</center></td>\n"
                            + "<td><center>Ders</center></td>\n"
                            + "<td><center>Ders</center></td>\n"
                            + "<td><center>Ders</center></td>\n"
                            + "<td><center>Ders</center></td>\n</tr>\n";%> 
                    <tr>

                    <td><center>Ders</center></td>
                  
                    <td><center>Ders</center></td>
                    
                    <td><center>Ders</center></td>                 
                    
                    <td><center>Ders</center></td>
                    
                   <td><center>Ders</center></td>
                    

                    </tr>
                    <%for (int i = 0; i < 8; i++) { %> 
                    <% if (i == 4) {
                            tablo += "<tr style=\"background-color: gray;\">\n"
                                    + "<td>12:00/13:00</td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n</tr>\n";
                    %>
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
                        <%tablo += "<tr>\n<td>"+saat[i]+"</td>\n";%>
                  
                    <%for (int j = 0; j < 5; j++) {
                      String bolum_sorgu = "Select akademisyenAd,akademisyenSoyad, dersAd, sinif_sinifId,saat_saatId, gun_gunId,ders_dersId from akademisyen, ders,sinif, dersprogrami where  dersId = ders_dersId and sinif_sinifId = '"+sinif+"' and"+ 
                      " saat_saatId ='"+(i+1)+"' and gun_gunId = '"+((j%5)+1)+"' and akademisyen.akademisyenNo = dersprogrami.akademisyenNo "+
                      " and dersprogrami.donem_donemId = '"+donem+"' ";
                      st = conn.createStatement();
                      rs = st.executeQuery(bolum_sorgu);
                      if (rs.next()) {
                    
                    %>
                     
                          
                      
                      
                          
                        <%tablo+="<td>"+rs.getString("ders_dersId")+"-"+rs.getString("dersAd")+"<br/>"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")+"</td>\n";%>
                        <td style="width: 400px; height:50px"><%=rs.getString("ders_dersId")+"-"+rs.getString("dersAd")+"<br/>"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")%></td>
                       
                 
                    
                   
                    <%} else {%>
                    <%tablo += "<td style=\"width: 225px; height:50px\"></td>";%>
                    <td style="width: 400px; height:50px"></td>
                    
                    <%}
                    
                    st = null;
                    rs = null;
                    
                    }%>
                   
                    </tr>
                    <%tablo +="\n</tr>";%>
                    <%}%>
                    
                <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%>   
             <%tablo+="\n</table></center>\n</div>\n</body>\n</html>";
               session.setAttribute("tablo", tablo);
             %>  
            </table><hr>
            <form  action="sinifTablo" method="post">
                
                <input type="text" name="donem" class="gizli" value="<%=akademikYil+"_"+donemAd%>"/>
                <input type="text" name="sinif" class="gizli" value="<%=sinifAd%>"/>
                
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
