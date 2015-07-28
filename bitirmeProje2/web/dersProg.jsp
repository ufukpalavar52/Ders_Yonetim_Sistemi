<%@page import="com.bitirmeProje.DAO.DersDAO"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <title>Yönetim Paneli || Ders Programı İşlem</title>
    
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

       <br/><br/><br/>
       
      <%
            if(request.getParameter("ders").equals("")){
                session.setAttribute("dersHata", "1");
                response.sendRedirect("dersPrgAyar.jsp?id="+request.getParameter("id"));
            } else {
      %>          
                
                
      <div class="container">
        <div class="row">
            <div class="col-md-12">
               
               <h2 style="color: #269abc;">Ayarlama İşlemleri </h2><br>
               
                <%
        String ders = request.getParameter("ders");
        String akademisyenNo = request.getParameter("id");
        
        String str[] = ders.split(" ");
        String gun[] = {"1","2","3","4","5"};
        String saat = "";
        
        int secmeli = Integer.valueOf(str[3]);
        int j = 0, k=0;
      
        int t = 0;
        
        int durum;
        
        
        while (j < 40){
            
            if ((request.getParameter("c"+j) != null && request.getParameter("sinif"+j) != "")) {
                t = 1;
            }
            if ((request.getParameter("c"+j) != null && request.getParameter("sinif"+j) == "")) {
                t = 0;
                break;
            }
            if ((request.getParameter("c"+j) == null && request.getParameter("sinif"+j) != "")) {
                t = 0;
                break;
            }
            
            j++;
        }
    
          
        if (t == 1){ 
        for (int i = 0; i < 40; i++) {
            if (request.getParameter("c"+i) != null && request.getParameter("sinif"+i) != "") {
                
                
                    
                if (i >= 0 && i < 5 )
                    saat = request.getParameter("saat0");
                if (i >= 5 && i < 10 )
                    saat = request.getParameter("saat1");
                if (i >= 10 && i < 15 )
                    saat = request.getParameter("saat2");
                if (i >= 15 && i < 20 )
                    saat = request.getParameter("saat3");
                if (i >= 20 && i < 25 )
                    saat = request.getParameter("saat4");
                if (i >= 25 && i < 30 )
                    saat = request.getParameter("saat5");
                if (i >= 30 && i < 35 )
                    saat = request.getParameter("saat6");
                if (i >= 35 && i < 40 )
                    saat = request.getParameter("saat7");
               
                DersDAO dersProg = new DersDAO();
                
                durum = dersProg.sinifKontrol(request.getParameter("sinif"+i), saat, gun[i % 5], request.getParameter("donem"));
                if (durum == 0) {
                    durum = dersProg.akademisyenKontrol(saat, gun[i % 5],request.getParameter("donem"), akademisyenNo);
                    if (durum == 0) {
                        durum = dersProg.dersYiliKontrol(str[1], saat, gun[i % 5], request.getParameter("donem"),secmeli);
                        
                        if (durum == 0) {
                            durum = dersProg.DersProgrami(str[0], request.getParameter("sinif"+i), saat, gun[i % 5], request.getParameter("donem"), akademisyenNo);
                            if (durum == 1) { %>
                                <p style = "color: #c12e2a">>>> Ders Programına başarıyle eklendi.</p>
                          <%  }
                        }
                        else { %>
                           
                            <p style = "color: #c12e2a">>>>> Aynı devreye ait ders var</p>
                       <% }
                        
                    }
                    else { %>
                        <p style = "color: #c12e2a">>>>> Akademisyenin başka dersi var</p>
                    <%}        
                }
                else { %>
                   <p style = "color: #c12e2a">>>>>> Sınıf dolu.</p> 
                <% }
                
            }
          
            
        }
        }
        else {
            
        
                %>
                <p style = "color: #c12e2a">Sınıfı seçiniz ve ilgili yere tik atınız. </p>
         <%}%>
         <form action = "dersPrgAyar.jsp" method="post">
             <input type="text" name="id" class="gizli" value="<%=akademisyenNo%>"/>
             <button   class="btn btn-info" type="submit" value="">Geri Dön</button> 
         
             <a href="dersPrgList.jsp" METHOD="POST" class="btn btn-info"> Ders Programına Git</a>
         </form>       
                
                
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
                <%}%>

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