
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
        <title>Yönetim Paneli || Ders İşlemleri</title>
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


    <%@include file="adminIslem.jsp" %>

    <br/><br/><br/>


    <div class="container">
        <div class="row">
            <div class="col-md-12">
 
               
                <div class="panel panel-primary" >

                <div class="panel-heading" >Ders İşlemleri</div>
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td>Dersin Kodu</td>
                        <td>${ders.dersId}</td>
                    </tr>
                    <tr>
                        <td>Dersin Adı</td>
                        <td>${ders.dersAd}</td>
                    </tr>
                    <tr>
                        <td>Kredi</td>
                        <td>${ders.dersKredi}</td>
                    </tr>
                    <tr>
                        <td>Dersin Devresi</td>
                        <td>${ders.dersYil}</td>
                    </tr>
                    <tr>
                        <td>Teorik Ders Saati</td>
                        <td>${ders.teorikDersSaati} </td>
                    </tr>
                    <tr>
                        <td>Pratik Ders Saati</td>
                        <td>${ders.pratikDersSaati}</td>
                    </tr>
                    <tr>
                        <td>Lab. Ders Saati</td>
                        <td>${ders.labDersSaati}</td>
                    </tr>
                    
                    
                    

                </table>
                
            </div>
            <p>Kaydınız Başarıyla Gerçekleştirilmiştir.

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
