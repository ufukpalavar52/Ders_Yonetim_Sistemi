<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

   String yetki = String.valueOf(session.getAttribute("yetki"));
   if(yetki != null) 
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<%
request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Duyuru Ekle</title>
</head>
<body>
    <div class="container panel">
        <div class="row">
            <div class="col-md-12">
                <%@include file="menu.jsp" %>
            </div>
        </div>
    </div>
     <%@include file="adminIslem.jsp" %>       

    <div class="container">
        <div class="row">
             <div class="col-md-12">
                
                         
                <h2>Duyuru</h2> <hr/>
                <form class="form-horizontal" action="duyuruKaydet" method="post">
         
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Duyuru Konu Basligi</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="duyuruKonuBaslik" placeholder="Duyuru icin Baslik Girin.." required autofocus/>
                        </div>   
                    </div>  
                    
                    
                    <div class="form-group">
                        <label for="message" class="col-sm-2 control-label">Mesaj</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="6" name="duyuruMesaj" placeholder="Mesajınızı Girin.." required autofocus></textarea>
                        </div>   
                    </div> 
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-primary">Ekle</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Reset</button>
                        </div>   
                    </div> 
                </form>
                
            </div> 
        </div>
        
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>

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
<%} else {
       response.sendRedirect("index.jsp");
   } else
       response.sendRedirect("akademisyenGirisi.jsp");
%>