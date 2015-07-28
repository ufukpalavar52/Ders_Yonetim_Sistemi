<%@page import="com.bitirmeProje.model.Ders"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<%String tablo = "<!doctype html>\n<html><head>\n<meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n "
        +"</head>\n<body>\n"; 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <title>Yönetim Paneli || Ders Programı</title>

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
                    String donemAd = "";
                    String bolumAd = "";
                    String akademikYil = "";
                    String saat[] = {"08:15/09:00","09:15/10:00","10:15/11:00","11:15/12:00","13:00/13:45","14:00/14:45","15:00/15:45","16:00/16:45"};
                    String donem = request.getParameter("donem");
                    String bolum = request.getParameter("bolum");
                    String dersSinif = request.getParameter("dersSinif");
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
                     <%tablo += "<div style='margin-left:150px; font-family:calibri;font-size:15px;'>\n<center><h3 style=\"color: black;\">"+rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("bolumAd")+"/"+dersSinif+".Sınıf/Ders Programı </h3></center><br/>\n"; %>
                     <center><h3 style="color: #2b669a;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("bolumAd")+"/"+dersSinif%>.Sınıf/Ders Programı </h3></center><br>
                     <%
                     donemAd = rs.getString("donemAd");
                     bolumAd = rs.getString("bolumAd");
                     akademikYil = rs.getString("akademikYil");
                     }%>
                     
                    <%} catch(Exception ex) {
                        out.println(ex);
                    }%>
                    <table class="table table-bordered table-condensed  table-hover " >
                    <%tablo += "<center><table border=\"1\" >\n"+
                            "<tr style=\"background-color: gray;\">\n<th rowspan=\"2\">Saat-Gün</th>\n"+
                            "<th colspan=\"2\">Pazartesi</th>\n"+
                            "<th colspan=\"2\">Salı</th>\n"+
                            "<th colspan=\"2\">Çarşamba</th>\n "+
                            "<th colspan=\"2\">Perşembe</th>\n"+
                            "<th colspan=\"2\">Cuma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n</tr>\n ";
                    %>
                    
                    
                    
                    
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
                    <%tablo += "<tr>\n<td>Ders</td>\n<td>Sınıf</td>\n"+
                            "<td>Ders</td>\n<td>Sınıf</td>\n"+
                            "<td>Ders</td>\n<td>Sınıf</td>\n"+
                            "<td>Ders</td>\n<td>Sınıf</td>\n"+
                            "<td>Ders</td>\n<td>Sınıf</td>\n</tr>\n";
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
                    <%tablo += "<tr style=\"background-color: gray;\">\n<td>12:00/13:00</td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n<td></td>\n</tr>\n ";%>
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
                    <%tablo += "<tr>\n<td>"+saat[i]+"</td>\n";
                    %>
                    <tr>
                        <td><center><%=saat[i]%></center></td>
                  
                    <%for (int j = 0; j < 5; j++) {
                      String bolum_sorgu = "Select  akademisyenAd,akademisyenSoyad, dersAd, ders.bolum_bolumId, sinifAd,ders_dersId,sinif_sinifId,saat_saatId, gun_gunId, ders_Yil from akademisyen, ders,sinif, dersprogrami where  dersId = ders_dersId and sinifId = sinif_sinifId and"+ 
                      " saat_saatId ='"+(i+1)+"' and gun_gunId = '"+((j%5)+1)+"' and akademisyen.akademisyenNo = dersprogrami.akademisyenNo "+
                      " and dersprogrami.donem_donemId = '"+donem+"' and ders.bolum_bolumId =' "+bolum+"' and ders_Yil = '"+dersSinif+"' and labDersiMi != 1";
                      st = conn.createStatement();
                      rs = st.executeQuery(bolum_sorgu);
                      while (rs.next()) {
                           dersx.add(rs.getString("ders_dersId"));
                           dersx.add(rs.getString("dersAd"));
                           dersx.add(rs.getString("akademisyenAd")+" ");
                           dersx.add(rs.getString("akademisyenSoyad"));
                           sinifx.add(rs.getString("sinifAd"));
                      }
                    
                    %>
                     
                          
                      
                      
                          
                    <%tablo += "<td style=\"height:50px; width: 180px;\">\n";%> 
                    <td style="height:50px; width: 200px;">
                        <% for (int x = 0; x < dersx.size(); x++) {
                            out.println(dersx.get(x));
                            tablo += dersx.get(x)+"\n";
                            if (x % 4 == 1 ) {
                                out.println("<br/>");
                                tablo += "<br/>\n";
                        }
                            if (x % 4 == 3  && x != dersx.size()-1) {
                                out.println("/<br/>");
                                tablo += "/<br/>\n";
                        }
                        }%>
                    </td>
                    <%tablo += "</td>\n<td style\"height:50px; width: 80px;\">\n";%>
                    <td style="height:50px; width: 80px;">
                        <%
                            for (int x = 0; x < sinifx.size(); x++) {
                                out.println(sinifx.get(x));
                                tablo += sinifx.get(x)+"\n";
                                if (x != sinifx.size()-1) {
                                    out.println("/");
                                    tablo += "/\n";
                            }
                            }%>
                        
                    </td>
                    <%tablo+="</td>\n";%>
                    
                   
                    
                    
                    
                    <%
                    dersx.clear();
                    sinifx.clear();
                    st = null;
                    rs = null;
                    
                    }%>
                    <%tablo+="</tr>\n";%>
                    </tr>
                    <%}%>
                    
                <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%>   
               
            </table><hr>
            <%tablo += "</table></center></div>\n</body>\n</html>"; 
              
            %>
            <%String tablo1 = "<html>\n<body>\n<table border='1'>\n<tr>\n <td>This is my Project</td> \n</tr>\n</table>\n</body>\n</html>";
              session.setAttribute("tablo", tablo);
            %>
            <form  action="tabloPdf.jsp" method="post">
                
                <input type="text" name="donem" class="gizli" value="<%=akademikYil+"_"+donemAd%>"/>
                <input type="text" name="bolum" class="gizli" value="<%=bolumAd%>"/>
                <input type="text" name="sinif" class="gizli" value="<%=dersSinif+".sınıf"%>"/>
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
