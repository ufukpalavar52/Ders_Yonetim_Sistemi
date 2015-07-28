
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.css">
    <title>Şifre Bilgisi</title>
    
        <style>
        
    </style>
</head>
<body>
    <div class="container">
            <div class="row">
                <div class="col-md-12">
    
    <%@include file="menu.jsp" %>
                </div>
            </div>
    </div>
    <br/><br/><br/>
    
<div class="container">
            <div class="row">
                
                <div class="col-md-7">

       <h2>Şifrenizi Öğrenin </h2> 
       <p>Şifrenizi eposta adresinize yollayacağız.Lütfen sistemimizde kullandığınız <strong>eposta adresini ve öğrenci numaranızı</strong> giriniz..</p>
       <hr/>
                <form class="form-horizontal" action="ogrenciSifreUnutdum.jsp" method="POST">
                    
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Öğrenci No</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="ogrenciNo" placeholder="Öğrenci No sunu giriniz..." required autofocus/>
                            
                        </div>   
                    </div>
                        <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" name="email" placeholder="Email Girin.." required autofocus/>
                            <%if (session.getAttribute("MailHata") != null) {%>
                            <p style="color: #b92c28">Lütfen sistemde kayıtlı eposta adresi giriniz.</p>
                            <%
                                session.removeAttribute("MailHata");
                            }
                            %>
                        </div>   
                    </div>
                    
                   <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-primary">Gönder</button>
                        </div>   
                    </div> 
                </form>

                </div>
            </div>
    </div>


<br/><br/><br/><br/><br/><br/><br/><br/>
    
    <%@include file="asagiMenu.jsp" %>

    
            
</body>
</html>
