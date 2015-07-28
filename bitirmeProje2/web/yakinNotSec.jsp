<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");
%>
<%if (session.getAttribute("yetki") != null && session.getAttribute("oturum") != null ) { %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dosya Yükleme</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="dist/js/bootstrap-filestyle.min.js"> </script>
    <script>
       $(":file").filestyle({buttonName: "btn-primary"});
    function kontrol(form){
    var dosyaIsmi = form.yol.value;
    var dosyaIsmiDuzgun = dosyaIsmi.replace(" ","");
  
    if (dosyaIsmi.length === 0) {
        alert("Lütfen dosya Girin");
        return false;
    }
  
    
  
   if (dosyaIsmiDuzgun.length < dosyaIsmi.length) {
        alert("Lütfen Dosyasinin Isminde Bosluk Olmadigini kontrol edin!");
        
        return false;
    }
    return true;
}
        </script>
</head>
<body>
    
    <!--Ana Menu-->
    <div class="container panel">
            <div class="row">
                <div class="col-md-12">
    <%@include file="yakinMenu.jsp" %>
    
                </div>
            </div>
    </div>
   <br/><br/>
   
  
      
   <div class="container">
        <div class="row">
            <div class="col-md-6">
    <h2>Sisteme Dosya Yükle:</h2><hr/>
    <label>Dosya Seçin: </label>
    
<form action="notYukle.jsp" enctype="multipart/form-data" method="POST" onsubmit="return kontrol(this);">
    
    
   <pre style="background: white;">
                <input name="yol" type="file" /> 
                
                <input  type="submit" class="btn btn-primary filestyle" value="Dosyayı Yükle"  style="float: inside" data-buttonName="btn-primary" onclick="return window.confirm('Dosya Kayıt Edilsinmi')" />
     
   
   </pre> 
</form>
    
            </div>
            <div class="col-md-4" style="position: absolute; top:375px; left: 800px;">
       <div class="alert alert-warning"> <strong>Dosya ismi Girerken Dikkat Edilmesi Gerekenler.</strong><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>1</strong>.Dosya isimlerinde boşluk olmasin!<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>2</strong>.Dosya isimlendime kalıplarına dikkat edin.<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ornek: <strong>dosya_ismi.uzanti,dosyaIsmi.uzanti</strong></div>
       </div>
       </div>
        </div>
       

<br><br><br><br><br>

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
<% } else 
       response.sendRedirect("index.jsp");
%>
