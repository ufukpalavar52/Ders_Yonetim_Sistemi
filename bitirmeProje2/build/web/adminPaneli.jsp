<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
   if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
        <title>Yönetim Paneli</title>
        <style>
            .largeIcon {
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

    <div class="container">

        <div class="row">
            <center style="color: #2aabd2;">
                <h3><strong>Ders Yönetim Paneli</strong></h3>
            </center>
        </div><br><br/>

        <div class="row">
            <div class="col-md-2" style="height: 150px; width: 150px;">

                <a style="text-decoration: none;" href="ogreteList.jsp" class="hover">
                    <img src="img/business_man_blue.png" style="width:60px;height: 60px;"/><br><br>
                    <strong> Öğretim Üyesi</strong></a>
            </div>

            <div class="col-md-2" style="height: 150px; width: 150px;">

                <a style="text-decoration: none;" href="dersList.jsp" class="hover"> <img src="img/blackboard.png" style="width:60px;height: 60px;"/><br><br>
                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Ders</strong></a>
            </div>

            <div class="col-md-2" style="height: 150px; width: 150px;">

                <a style="text-decoration: none;" href="dersAtaList.jsp" class="hover"> <img src="img/pencil.png" style="width:60px;height: 60px;"/><br><br>
                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Ders Ata</strong></a>
            </div>

            <div class="col-md-2" style="height: 150px; width: 150px;">

                <a style="text-decoration: none;" href="dersPrgList.jsp"> <img src="img/date.png" style="width:60px;height: 60px;"/><br><br>
                    <strong>Ders Programı</strong></a>
            </div>
            <div class="col-md-2" style="height: 150px; width: 150px;">

                <a style="text-decoration: none;" href="ogrenciList.jsp"> <img src="img/ogrenci.png" style="width:60px;height: 60px;"/><br><br>
                    <strong>Öğrenci İşlemleri</strong></a>
            </div>
            <div class="col-md-2" style="height: 150px; width: 150px;">

                <a style="text-decoration: none;" href="duyuruPaylas.jsp"> <img src="img/duyuru.jpg" style="width:60px;height: 60px;"/><br><br>
                    <strong>Duyuru İşlemleri</strong></a>
            </div>
            
            
            <div class="col-md-2" style="height: 150px; width: 130px;">

                <a style="text-decoration: none;" href="akademikYil.jsp"> <img src="img/akademikt.png" style="width:60px;height: 60px;"/><br><br>
                    <strong>Akademik Yıl</strong></a>
            </div>

        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>

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
<%} else {
       response.sendRedirect("akademisyenGirisi.jsp");  
}%>