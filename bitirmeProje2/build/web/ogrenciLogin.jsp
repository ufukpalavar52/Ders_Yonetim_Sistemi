<%-- 
    Document   : ogrenciLogin
    Created on : 01.Mar.2015, 16:22:43
    Author     : İlkin Azeri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <title>JSP Page</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                
                <h2>Öğrenci Girişi </h2> <hr/>
                <form class="form-horizontal" action="./ogrenciGirisKontrol" method="POST">
                    <div class="form-group">
                        <label for="ogrenciNo" class="col-sm-2 control-label">Öğrenci No</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="ogrenciNo" placeholder="Öğrenci Numaranızı Giriniz" required autofocus/>
                        </div>   
                    </div> 
                    
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label" >Şifre</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="ogrenciSifre" placeholder="Şifrenizi Giriniz" required autofocus/>
                        </div>   
                    </div> 
                    
                    <div class="form-group" style="float:center;">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-primary">Giriş</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="ogrenciSifreUnutuldu.jsp">Şifremi Unuttum</a>
                        </div>   
                    </div>
                  
                </form>
            </div>
            
        </div>
    </div>



</body>
</html>
