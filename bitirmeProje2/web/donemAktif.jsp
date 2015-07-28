<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("3")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <title>Yönetim Paneli || Öğretim Üyesi Görüntüle</title>
    
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
       
                
                
                
      <div class="container">
        <div class="row">
            <div class="col-md-9">
               
               <h2 style="color: #269abc;">Dönem Aktifleştitme </h2><br>
               <form class="form-horizontal" action="donemAktif" method="post">
               
                   
                <% 
                  ConnectionDB connect = new ConnectionDB();
                  Connection conn = connect.baglanti();
                  ResultSet rs = null;
           	  Statement st = null;
                  String bolum_sorgu;
                  String aktif;
                  if (yetki.equals("3") ) {
                      bolum_sorgu ="Select *from donem";
                      try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(bolum_sorgu);
                            %>
                    <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Dönem</label>
                   
                    <div class="col-sm-5">
                        <select class="form-control" name="donem" onchange="bilgiGoster(this.value)">
                            <option value="">Akademik Dönem Seç</option>   
                         <% while(rs.next()){ %>
                            <option value="<%=rs.getString("donemId")%>"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")%></option>
                        <% }%>    
                        </select>
                        
                    </div>   
                </div>
                <% 
                } catch(Exception ex){
                	out.println(ex);
                }
                %>
               
               <% }%>
               <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-5">
                        <button type="submit" class="btn btn-primary" onclick="return window.confirm('Aktifleştirmek İçin Eminmsiniz')">Aktifleştir</button>&nbsp;&nbsp;
                        <button type="reset" class="btn btn-default">Varsayılan</button>
                    </div>   
                </div> 
              
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