<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "com.bitirmeProje.model.Ders" %>
<%

   String yetki = String.valueOf(session.getAttribute("yetki"));
   if(yetki != null)
        if (yetki.equals("3")) {
    
%>

<%
request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <title>Yönetim Paneli || Öğretim Üyesi Ekle</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script src="dist/js/scriptKontrol.js"></script>



</head>
<body>

    <br>
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
                
                       
                <h2 style="color: #269abc;">Dönem Ekle </h2> <hr/>
                  
                    
                <form class="form-horizontal" action="donemEkle" method="POST">
                    
                    
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Akdemik Yıl</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="yil" placeholder="Akademik Yıl Girin" required autofocus/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Dönem Ad</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="donemAd">
                                <option value="Güz">Güz</option>
                                <option value="Bahar">Bahar</option>
                            </select>
                        </div>   
                    </div>
         
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Ögretim üyesini eklemek istiyormusunuz.')">Kaydet</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Temizle</button>
                        </div>   
                    </div> 
                </form>
                
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

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery.min.js"></script>

</body>
</html>
<%} else {
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>