

<%@page import="com.bitirmeProje.DAO.BolumBilgileriDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Öğrenci Bilgileri</title>
</head>
<body>
<div class="panel panel-danger">
  
    <div class="panel-heading" style="background-color: #333;"><strong style="color:white;">Aktif Dönem</strong></div>
    <%
        BolumBilgileriDAO bs = new BolumBilgileriDAO();
        int bolumSayi = bs.BolumSayisi();
        int akademisyenSayi = bs.AkademisyenSayisi();
        String aktifDonem = bs.AktifDonem();
        int yoneticiSayi = bs.YoneticiSayisi();
        int ogrenciSayi = bs.OgrenciSayisi();
        int toplamKullanici = ogrenciSayi + akademisyenSayi + yoneticiSayi;
        int dersSayi = bs.DersSayisi();
    %>
    
    <table class="table">
        
        <tr>
            <th>Sistem Bilgileri</th>
             
        </tr>
          
               

        <tr>
            <td>Toplam Bölüm Sayısı</td>
            
            <td><center><%=bolumSayi%></center></td>
           
            
        </tr>

        <tr>
            <td>Toplam Öğretim Üyesi</td>
            <td><center><%=akademisyenSayi%></center></td>

        </tr>
        <tr>
            <td>Toplam Öğrenci Sayısı</td>
            <td><center><%=ogrenciSayi%></center></td>
        </tr>
        <tr>
            <td>Toplam Ders Sayısı</td>
            <td><center><%=dersSayi%></center></td>
        </tr>
        <tr>
            <td>Aktif Dönem</td>
            <td><center><%=aktifDonem%></center></td>
        </tr>
        <tr>
            <td>Sistem Yönetici Sayısı</td>
            <td><center><%=yoneticiSayi%></center></td>
        </tr>
       
        
        <tr>
            <td>Toplam Kullanıcı Sayısı</td>
            <td><center><%=toplamKullanici%></center></td>
        
        </tr>
        
    </table>

</div>

</body>
</html>
