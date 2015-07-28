

<%@page import="com.bitirmeProje.DAO.DersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <title>Labaratuvar Programı</title>
    <style>
     .largeIcon{
    font-size: 50px;
    padding-left: 35px;
    padding-right: 35px;
}

a:hover{
    text-decoration: none;
}
.gizli {
    display: none;
}
    </style>    
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
<%@include file="adminIslem.jsp" %>
<div class="container">
        <div class="row">
            <div class="col-md-12">
               
               <h2 style="color: #269abc;">Ayarlama İşlemleri </h2><br>

       <br/><br/><br/>
    <%  String donem[] = request.getParameter("donem").split(" ");
        String donemId = donem[0];
        String ders[] = request.getParameter("ders").split(" ");
        String dersId = ders[0];
        String akademisyenNo = ders[3];
        
        String sinifId = "";%>
        
    <%
        int i ,j ,t=0;
        
        
        for(i=0; i<8; i++) {
            for (j = 0; j<5; j++) {
                if(request.getParameter("sinif"+i+""+j) != "0") {
                    t+=1;
                }
                else
                    t+=0;
                
            }
        }
        
        if(t > 0) {
        for(i=0; i<8; i++) {
            for (j = 0; j<5; j++) {
                if(request.getParameter("sinif"+i+""+j) != "0") {
                    sinifId = request.getParameter("sinif"+i+""+j);
                    String gunId = (j%5)+1+"";
                    String saatId = (i+1)+"";
                    DersDAO labProg = new DersDAO();
                    int durum = labProg.sinifKontrol(sinifId, saatId, gunId, donemId);
                    if (durum == 0) {
                        durum = labProg.DersProgrami1(dersId, sinifId, saatId, gunId, donemId, akademisyenNo);
                        if (durum == 1)
                            out.println("<p style = \"color: #c12e2a\">>>>Ders programına Kayıt tamamlandı<br/>");
                    }
                    else
                        out.println("<p style = \"color: #c12e2a\">>>>Sınıf Dolu<br/>");
                    
                }
                    
            }
        }
        } else if(t == 0){
            out.println("<p style = \"color: #c12e2a\">>>>Lütfen Sınıf seçiniz.<br/>");
        }
    
    
    %>
    <br><br><br>
    <a href="LabaratuvarDers.jsp"  class="btn btn-info"> Geri Dön</a>
    <a href="dersPrgList.jsp"  class="btn btn-info"> Ders Programına Git</a>
    
    </div>
        </div>
      </div><br/><br/>
                
       
       
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
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>
