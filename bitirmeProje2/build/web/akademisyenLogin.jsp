
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Akademisyen Login</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    </head>
    <body>



    <div class="container">
        <div class="row">
            <div class="col-md-6">

                <h2>Akademisyen Girişi </h2> <hr/>
                <form class="form-horizontal" action="./akademisyenGirisKontrol" method="post">
                    <div class="form-group">
                        <label for="akademisyenNo" class="col-sm-2 control-label">Akademisyen No</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="akademisyenNo" placeholder="Akademisyen Numaranızı Giriniz" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label" >Şifre</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="akademisyenSifre" placeholder="Şifrenizi Giriniz" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group" style="float:center;">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-primary">Giriş</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="akademisyenSifreUnutuldu.jsp">Şifremi Unuttum</a>
                        </div>   
                    </div>



                </form>
            </div>

        </div>
    </div>





</body>
</html>
