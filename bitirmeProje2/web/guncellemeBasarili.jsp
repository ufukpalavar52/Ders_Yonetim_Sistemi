

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
        <title>Yönetim Paneli</title>
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


    

    <br/><br/><br/>


    <div class="container">
        <div class="row">
            <div class="col-md-12">

             <h2>Güncelleme Başarılı</h2>
             <p>Değişiklikler Kaydedildi.

            </div> 
        </div>
    </div> <br/><br/><br/><br/>

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
