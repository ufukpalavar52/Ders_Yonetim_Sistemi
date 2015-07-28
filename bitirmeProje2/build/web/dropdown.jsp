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
            <div class="container">
                <div class="row">
                    <div class="span12">


                        <a href="http://mf.omu.edu.tr" title="Omu Muhendislik Sayfasi"><img src="img/omu_muhendislik.jpg" style="width: 100px;height:100px;"> </a>

                        &nbsp;&nbsp;&nbsp;<a href="index.jsp"><strong style="font-size: 20px;color: #2aabd2;">Omü Mühendislik Ders Yönetim Sistemi</strong>          
                        </a>


                    </div>



                </div>
            </div>
            <br/>





            <div class="navbar navbar-default "  style="background-color: #444444;">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>




                </div>

                <div class="navbar-collapse collapse" >
                    <ul class="nav navbar-nav" >

                        <li><a href="index.jsp" style="color: white;"><strong style="color: white;">AnaSayfa</strong></a></li>
                        <li><a href="hakkinda.jsp" style="color: white;"><strong style="color: white;">Hakkımızda</strong></a></li>
                        <li><a href="contact.jsp" style="color: white;"><strong style="color: white;">İletişim</strong></a></li>
                        <li class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown" style="background-color:#444444; " ><strong style="color: white;">Sisteme Giriş</strong> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#myAkademisyan" data-toggle="modal">Akademisyen Girişi</a></li>
                                <li><a href="#myOgrenci" data-toggle="modal">Öğrenci Girişi</a></li>
                            </ul>
                        </li>

                        <li class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown" style="background-color:#444444; " ><strong style="color: white;">Planlar</strong> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="bolumPlani.jsp">Bölüm Planı</a></li>
                                <li><a href="sinifPlani.jsp" >Sınıf Planı</a></li>
                                <li><a href="ogretimPlani.jsp" >Öğretim Üyesi Planı</a></li>
                            </ul>
                        </li>


                        <li><a href="yakinIndex.jsp" style="color: white;"><strong style="color: white;float: left;">OMÜ Not Paylaşım Sistesi</strong></a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">


                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">İlkin<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Profil Ayarları</a></li>
                                <li><a href="oturumkapat.jsp">Çıkış</a></li>


                            </ul>

                        </li>

                    </ul>
                </div>

                <div class="modal fade" id="myAkademisyan" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%@include file="akademisyenLogin.jsp" %>
                            <div class="modal-footer">
                                <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Kapat</button>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="modal fade" id="myOgrenci" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%@include file="ogrenciGirisi.jsp" %>
                            <div class="modal-footer">
                                <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Kapat</button>
                            </div>
                        </div>
                    </div>

                </div>




            </div>
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
    </div>
</div>
<br/><br/><br/>


<!--Grid
       ==========-->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2 style="color: #28a4c9">Bu sayfanin Amaci</h2><hr/>

            <p>Ondokuz Mayis Universitesinin ogrencilerinin bolum notlarina ayni  portal sayfa uzerinden erismesine olanag sagliyor.</p>
        </div>

        <div class="col-md-6">
            <h2 style="color: #28a4c9">Notlara nasil Erisirim?</h2><hr>
            <p>Ogrencinin Bolumuyle ilgili notlara erismesi icin yapmasi gereken sey:Ogrenci kendi ogrenci numarasiyla sisteme giris yapib ilgili fakulteyi,bolumu,dersi secib arama yapa bilir ve indire bilir... </p>
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
