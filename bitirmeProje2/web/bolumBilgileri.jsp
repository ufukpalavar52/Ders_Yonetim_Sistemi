
<%@page import="com.bitirmeProje.DAO.BolumBilgileriDAO"%>
<%@page import="com.bitirmeProje.model.Bolum"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
    <div class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading" style="background-color: #333;"><strong style="color:white;">Bölüm Bilgileri</strong></div>
        <%
                ArrayList <Bolum> bolum = new ArrayList();
                BolumBilgileriDAO bolumIs = new BolumBilgileriDAO();
                bolum = bolumIs.BolumBilgisi();
                int bolumId;
                
                int durum = 0;
                
                
        
        %>    
        
        <table class="table">
            <tr>
                <th><center>Bölüm</center></th>
                <th><center>Öğretim Üyesi</center></th>
                <th><center>Ders</center></th>
                <th><center>Ders Atama</center></th>
                <th><center>Ders Programı</center></th>
                <th><center>Durum</center></th>
            </tr>
            <%
                if (bolum != null) {
                    for (Bolum item: bolum) {
                       bolumId = Integer.valueOf(item.getBolumId());
                       BolumBilgileriDAO bolumd = new BolumBilgileriDAO();
                       
            %>
            <%if (bolumId == 11) {%>
              <tr>
                <td><center><%=item.getBolumAd()%></center></td>
                <td><center><%=bolumd.BolumOgrtSayisi(bolumId)%></center></td>
                <td><center></center></td>
                <td><center></center></td>
                <td><center></center></td>
                <td><center></center></td>
             </tr>
            <%} else {%>
            <tr>
                <td><center><%=item.getBolumAd()%></center></td>
                <td><center><%=bolumd.BolumOgrtSayisi(bolumId)%></center></td>
                <td><center><%=bolumd.BolumDersSayisi(bolumId)%></center></td>
                <td><center>%<%=bolumd.DersAtamaOrani(bolumId)%></center></td>
                <td><center>%<%=bolumd.DersProgramiDersSayisi(bolumId)%></center></td>
                <%if (bolumd.DersAtamaOrani(bolumId) == 100 && bolumd.DersProgramiDersSayisi(bolumId) == 100) {%>
                <td><center><img src="img/green.png" style="width:15px;height: 15px;" title="Bölüm planı hazır"/></center></td>
               <%}  else if ((bolumd.DersAtamaOrani(bolumId) + bolumd.DersProgramiDersSayisi(bolumId))/2 >= 50){%>
               <td><center><img src="img/blue.png" style="width:15px;height: 15px;" title="Bölüm planı tam hazır değil"/></center></td>
               <%}else {%>
                <td><center><img src="img/red.png" style="width:15px;height: 15px;" title="Bölüm planı hazır değil"/></center></td>
               <%}%>
            </tr>
          <%            }
                    }
             }%>
            

        </table>
    </div>
</body>
</html>
