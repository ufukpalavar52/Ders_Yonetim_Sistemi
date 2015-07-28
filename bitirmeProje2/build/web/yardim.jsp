<%-- 
    Document   : yardim
    Created on : 01.Haz.2015, 14:28:31
    Author     : İlkin Azeri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Yardım</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
    <script src="dist/js/bootsrap.js" ></script>

</head>
<body>
     <br/>
        <div class="container panel">
            <div class="row">
                <div class="col-md-12">
        <%@include file="menu.jsp" %>
                </div>
            </div>
        </div>
        
        
         <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h2>Yardım Al</h2>
                <p>Kullanım Klavuzu için <a class="bt" href="Goruntu?id=<% out.println("../bitirmeProje2/yardim/kilavuz.pdf");%>">Buraya gidin</a></p>
                
            </div>
        </div>
        </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
<script src="dist/js/jquery.min.js"></script>


</body>
</html>
