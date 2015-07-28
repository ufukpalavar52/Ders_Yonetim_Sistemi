<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Hakkımızda</title>

    <!-- Bootstrap core CSS -->

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
<!-- NAVBAR
================================================== -->
<body>
    <br/>
<div class="container panel">
    <div class="row">
        <div class="col-md-12">
            <%@include file="menu.jsp" %>
        </div>
    </div>
</div>


<div class="container marketing">
    <center>
        <h2>Siteyi Yapan Öğrenciler</h2><hr>
    </center><br/>
    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <center><img class="img-thumbnail" src="coderResim/Ilkin.jpg" alt="Generic placeholder image" style="width: 100px; height: 150px;"/></center>
            <center><h2>İlkin Zeynallı</h2></center>
            <center><p>Ondokuz Mayıs Üniversitesi</p></center>
            <center><p>Bilgisayar Mühendisliği Ögrencisi</p></center>
            <center><p><a class="btn btn-default" href="#" role="button">Daha Ayrıntılı Bilgi</a></p></center>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <center><img class="img-thumbnail" src="coderResim/Ufuk.jpg" alt="Generic placeholder image" style="width: 100px; height: 150px;"/></center>
            <center><h2>Ufuk Palavar</h2></center>
            <center><p>Ondokuz Mayıs Üniversitesi</p></center>
            <center><p>Bilgisayar Mühendisliği Ögrencisi</p></center>
            <center><p><a class="btn btn-default" href="#" role="button">Daha Ayrıntılı Bilgi</a></p></center>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <center><img class="img-thumbnail" src="coderResim/fatih.jpg" alt="Generic placeholder image" style="width: 100px; height: 150px;"/></center>
            <center><h2>Fatih Çelikel</h2></center>
            <center><p>Ondokuz Mayıs Üniversitesi</p></center>
            <center><p>Bilgisayar Mühendisliği Öğrencisi</p></center>
            <center><p><a class="btn btn-default" href="http://celikel.github.io" role="button">Daha Ayrıntılı Bilgi</a></p></center>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">Sistem Hakkında Bilgi. <span class="text-muted">Sistem Hakkında Bilgi.</span></h2>
            <p class="lead">Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi</p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-5">
            <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
            <h2 class="featurette-heading">Sistem Hakkında Bilgi. <span class="text-muted">Sistem Hakkında Bilgi.</span></h2>
            <p class="lead">Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi.</p>
        </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">Sistem Hakkında Bilgi. <span class="text-muted">Sistem Hakkında Bilgi..</span></h2>
            <p class="lead">Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi. Sistem Hakkında Bilgi.</p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->




</div><!-- /.container -->

<br/>

<div class="container panel">
    <div class="row">
        <hr>
        <div class="col-md-12">

            <%@include file="asagiMenu.jsp" %>
        </div>
    </div>
</div>   



<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
<script src="dist/js/jquery.min.js"></script>
</body>
</html>
