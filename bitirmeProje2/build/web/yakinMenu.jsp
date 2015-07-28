
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>



    <title>Omü Mühendislik</title>
<script src="dist/js/bootsrap.js" ></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span12">


            <a href="http://mf.omu.edu.tr" title="Omu Muhendislik Sayfasi"><img src="img/omu_muhendislik.jpg" style="width: 100px;height:100px;"> </a>

            &nbsp;&nbsp;&nbsp;<a href="index.jsp"><strong style="font-size: 20px;color: #2aabd2;">Omü Mühendislik Dosya Paylaşım Sistemi</strong>          
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

    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" >

            <li><a href="yakinNotAra.jsp" style="color: white;"><strong style="color: white;">Dosya Listele</strong></a></li>
            <%if (session.getAttribute("oturum") != null && session.getAttribute("yetki")!= null) {%>
            <li><a href="yakinNotSec.jsp" style="color: white;"><strong style="color: white;">Dosya Yükle</strong></a></li>
            <%}%>
            <li><a href="index.jsp" style="color: white;"><strong style="color: white;">OMÜ Ders Yönetim Sistemi</strong></a></li>


        </ul>
        <ul class="nav navbar-nav navbar-right">

            
            <li class="dropdown">
                
                <a href="" class="dropdown-toggle" data-toggle="dropdown" style="color: white; background-color: #444444;"><%=session.getAttribute("oturum")%><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <%if (session.getAttribute("yetki") == null) {%>
                    <li><a href="profilAyar.jsp">Profil Ayarları</a></li>
                    <% } else {%>
                    <li><a href="AkademisyenprofilAyar.jsp" >Profil Ayarları</a></li>
                    <%} %>
                    <li><a href="oturumKapat.jsp" onclick="return window.confirm('Oturum Kapatılsın mı?')">Çıkış</a></li>
                    

                </ul>

            </li>
                <form class="navbar-form navbar-left" role="search" action="notAransin.jsp">
                <div class="form-group">
                    <input type="text" name="notAra" class="form-control" placeholder="Dosya Ara">
                </div>
                <button type="submit" class="btn btn-default">Ara</button>
            </form>

        </ul>



    </div>



</div>




</body>
</html>
