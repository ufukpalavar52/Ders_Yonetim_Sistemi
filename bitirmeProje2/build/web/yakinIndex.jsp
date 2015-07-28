<%-- 
    Document   : index
    Created on : 14.Ara.2014, 19:14:48
    Author     : İlkin Azeri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>OMÜ Muhendislik Dosya Paylaşım</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
    <script src="dist/js/bootsrap.js" ></script>



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
<%
    if (session.getAttribute("oturum") != null) {
%>
<body>
    <br/>
<div class="container panel">
    <div class="row">
        <div class="col-md-12">
            <%@include file="yakinMenu.jsp" %>
        </div>
    </div>
</div><br>


<!--Grid
       ==========-->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2 style="color: #28a4c9">Bu Sayfanın Amacı</h2><hr/>

            <p>Ondokuz Mayıs Üniversitesinin öğrencilerinin bölüm notlarına aynı  portal sayfa üzerinden erişmesine olanağı sağlıyor.</p>
        </div>

        <div class="col-md-6">
            <h2 style="color: #28a4c9">Notlara Nasıl Erişirim?</h2><hr>
            <p>Ögrencinin Bölümüyle ilgili notlara erişmesi için yapması gereken şey, Öğrenci kendi öğrenci numarasıyla sisteme giris yapıp ilgili fakulteyi, bölümü, dersi seçip arama yapabilir ve indirebilir... </p>
        </div>

        



    </div>

    <%} else {
            response.sendRedirect("index.jsp");
        }
    %>	

</div><br/><br/><br/>
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


</body>


</html>
