
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ana Sayfa</title>

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
<body>

    <br/>
<div class="container panel">
    <div class="row">
        <div class="col-md-12">
            <%@include file="menu.jsp" %>
        </div>
    </div>
</div>


<!--Slider-->
<div class="container panel">
    <div class="row">
        <div class="col-md-8">
            <div class="slide ">



                <div id="myCarousel" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>

                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <img style="width: 1400px;
                                 height: 400px;" src="img/1820-3.jpg"/>
                            <div class="container">
                                <div class="carousel-caption">


                                </div>

                            </div>
                        </div>



                        <div class="item">
                            <img style="width: 1400px;
                                 height: 400px;" src="img/5.jpg"/>
                            <div class="container">
                                <div class="carousel-caption">



                                </div>

                            </div>
                        </div>

                    </div>




                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>

                    </a>

                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>

                    </a>

                </div>


            </div>

        </div>


        <div class="col-md-4">
            <%@ include file="duyuru.jsp" %>
        </div>
        <br>
    </div>
</div>
<br/><br/><br/>


<!--Grid
       ==========-->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2 style="color: #28a4c9">Bu sayfanın Amacı</h2><hr/>

            <p>Ondokuz Mayıs Üniversitesinin öğrencilerinin bölüm dökümanlarının aynı sayfa üzerinden erişmesine olanak sağlıyor.</p>
        </div>

        <div class="col-md-6">
            <h2 style="color: #28a4c9">Dökümanlara nasıl Erişirim?</h2><hr>
            <p>Öğrencinin bölümüyle ilgili dökümanlara erişmesi için yapması gereken şey; Öğrenci kendi ögrenci numarası ve şifresiyle sisteme giriş yapıp ilgili dersi seçip arama yapabilir ve indire bilir... </p>
        </div>



    </div>



</div><br/><br/><br/>



<div class="container panel">
    <div class="row">

        <div class="col-md-8">
            <%@include file="bolumBilgileri.jsp"%>
        </div>


        <div class="col-md-4">
            <%@include file="sistemBilgileri.jsp" %>
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
