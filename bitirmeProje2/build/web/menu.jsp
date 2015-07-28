<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Omü Mühendislik</title>
    
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
    <script src="dist/js/bootsrap.js" ></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="span12">


            <a href="http://mf.omu.edu.tr" title="Omü Mühendislik Sayfası"><img src="img/omu_muhendislik.jpg" style="width: 100px;height:100px;"> </a>

            &nbsp;&nbsp;&nbsp;<a href="index.jsp" style="text-decoration: none;"><strong style="font-size: 20px;color: #2aabd2;">Omü Mühendislik Ders Yönetim Sistemi</strong>          
            </a>


        </div>



    </div>
</div>
<br/>





<div class="navbar navbar-default "  style="background-color: #444444;">
    
    <%String oturum = (String)session.getAttribute("oturum"); %>
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>

        </button>




    </div>
    
    
        <%
        
        if(session.getAttribute("oturum") != null){
           
            if (session.getAttribute("yetki") == null){
               
             
       %>
    
     <ul class="nav navbar-nav navbar-right" style="position: relative;left: 0px;">
            <li class="dropdown " style="float:right;">
                <a href="" class="dropdown-toggle" data-toggle="dropdown" style="color: white; background-color: #444444;"><%=session.getAttribute("oturum")%><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="profilAyar.jsp">Profil Ayarları</a></li>
                    <li><a href="oturumKapat.jsp" onclick="return window.confirm('Oturum Kapatılsın mı?')">Çıkış</a></li>


                </ul>

            </li>
                
     </ul>
         <%} else {%>
         <ul class="nav navbar-nav navbar-right" style="position: relative;left: 0px;">
             
            <li class="dropdown " style="float:right;">
                <a href="" class="dropdown-toggle" data-toggle="dropdown" style="color: white; background-color: #444444;"><%=session.getAttribute("oturum")%><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="AkademisyenprofilAyar.jsp">Profil Ayarları</a></li>
                    <li><a href="oturumKapat.jsp" onclick="return window.confirm('Oturum Kapatılsın mı?')">Çıkış</a></li>


                </ul>

            </li>
                <% String yetki1 = String.valueOf(session.getAttribute("yetki"));
               if(yetki1 != null)
                if (yetki1.equals("1") || yetki1.equals("2") || yetki1.equals("3")) {%>
                   
                   <li><a href="adminPaneli.jsp" style="color: white;">Admin</a></li>
              <%  } %>
                
          </ul>
                
         
        <%}}%>
                
    <div class="navbar-collapse collapse" style="float:left;">
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
            <li><a href="yardim.jsp" style="color: white;"><strong style="color: white;">Yardım</strong></a></li>
           
<%if (session.getAttribute("oturum")!=null) {%>
            <li><a href="yakinIndex.jsp" style="color: white;"><strong style="color: white;float: left;">OMÜ Dosya Paylaşım Sistemi</strong></a></li>
 <%}%>
            

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




</body>
</html>
